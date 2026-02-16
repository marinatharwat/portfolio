import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List<Map<String, dynamic>> skills = [
    {'title': 'Flutter', 'icon': FontAwesomeIcons.mobileScreen},
    {'title': 'Dart', 'icon': FontAwesomeIcons.code},
    {'title': 'Firebase', 'icon': FontAwesomeIcons.fire},
    {'title': 'REST APIs', 'icon': FontAwesomeIcons.networkWired},
    {'title': 'Bloc / Cubit', 'icon': FontAwesomeIcons.layerGroup},
    {'title': 'Provider', 'icon': FontAwesomeIcons.diagramProject},
    {'title': 'GetX', 'icon': FontAwesomeIcons.bolt},
    {'title': 'SQLite', 'icon': FontAwesomeIcons.database},
    {'title': 'Clean Architecture', 'icon': FontAwesomeIcons.sitemap},
    {'title': 'Git', 'icon': FontAwesomeIcons.gitAlt},
    {'title': 'Figma', 'icon': FontAwesomeIcons.figma},
    {'title': 'Testing', 'icon': FontAwesomeIcons.vial},
    {'title': 'HTML', 'icon': FontAwesomeIcons.html5},
    {'title': 'CSS', 'icon': FontAwesomeIcons.css3Alt},
    {'title': 'JavaScript', 'icon': FontAwesomeIcons.js},
    {'title': 'Python', 'icon': FontAwesomeIcons.python},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Skills",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 5;
              if (constraints.maxWidth < 1100) crossAxisCount = 4;
              if (constraints.maxWidth < 800) crossAxisCount = 3;
              if (constraints.maxWidth < 500) crossAxisCount = 2;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skills.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.2, // 👈 صغرنا الكروت
                ),
                itemBuilder: (context, index) {
                  final skill = skills[index];
                  return ZoomIn(
                    duration:
                    Duration(milliseconds: 200 + (index * 60)),
                    child: SkillCard(skill: skill),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatefulWidget {
  final Map<String, dynamic> skill;

  const SkillCard({super.key, required this.skill});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _hovering = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() {
        _hovering = false;
        _pressed = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 200),
          scale: _pressed ? 1.05 : 1.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: _hovering ? Colors.blueGrey[700] : Colors.grey[900],
              borderRadius: BorderRadius.circular(10),
              boxShadow: _hovering || _pressed
                  ? [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ]
                  : [],
            ),
            padding: const EdgeInsets.all(8), // 👈 صغرنا padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  widget.skill['icon'] as IconData,
                  size: 22, // 👈 صغرنا الأيقونة
                  color: Colors.white,
                ),
                const SizedBox(height: 6),
                Text(
                  widget.skill['title'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11, // 👈 صغرنا الخط
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
