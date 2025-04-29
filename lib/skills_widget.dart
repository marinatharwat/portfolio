import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List<Map<String, dynamic>> skills = [
    {'title': 'Flutter', 'icon': FontAwesomeIcons.mobileAlt},
    {'title': 'Java', 'icon': FontAwesomeIcons.java},
    {'title': 'Python', 'icon': FontAwesomeIcons.python},
    {'title': 'HTML', 'icon': FontAwesomeIcons.html5},
    {'title': 'CSS', 'icon': FontAwesomeIcons.css3Alt},
    {'title': 'JavaScript', 'icon': FontAwesomeIcons.js},
    {'title': 'Firebase', 'icon': FontAwesomeIcons.fire},
    {'title': 'figma', 'icon': FontAwesomeIcons.figma},

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
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 4;
              if (constraints.maxWidth < 900) crossAxisCount = 3;
              if (constraints.maxWidth < 600) crossAxisCount = 2;
              if (constraints.maxWidth < 400) crossAxisCount = 1;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skills.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final skill = skills[index];
                  return ZoomIn(
                    duration: Duration(milliseconds: 300 + (index * 100)),
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
          scale: _pressed ? 1.08 : 1.0, // 👈 التكبير عند الضغط
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: _hovering ? Colors.blueGrey[700] : Colors.grey[850],
              borderRadius: BorderRadius.circular(12),
              boxShadow: _hovering || _pressed
                  ? [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ]
                  : [],
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  widget.skill['icon'] as IconData,
                  size: 28,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.skill['title'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
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

