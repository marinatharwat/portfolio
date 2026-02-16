import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Haystageeb App',
      'description': 'Social Flutter app with admin dashboard.',
      'image': 'assets/images/haystageeb.png',
      'links': [
        {
          'icon': 'googlePlay',
          'url': 'https://play.google.com/store/apps/details?id=com.inheritance_of_nations.hayastageeb',
        },
        {
          'icon': 'appStoreIos',
          'url': 'https://apps.apple.com/eg/app/%D9%87%D9%8A%D8%B3%D8%AA%D8%AC%D9%8A%D8%A8/id6751189796',
        },
      ],
    },
    {
      'title': 'Haystageeb Dashboard',
      'description': 'Web panel to manage Haystageeb app content.',
      'image': 'assets/images/haystageeb.png',
      'links': [],
    },
    {
      'title': 'Hany Nagib App',
      'description': 'App for sermons and spiritual media.',
      'image': 'assets/images/hany.png',
      'links': [
        {
          'icon': 'googlePlay',
          'url': 'https://play.google.com/store/apps/details?id=com.mina_magid.h_n_flutter.dev',
        },
        {
          'icon': 'appStoreIos',
          'url': 'https://apps.apple.com/eg/app/%D8%B3%D8%B1-%D8%A7%D9%84%D8%A5%D9%86%D8%AC%D9%8A%D9%84-%D9%84%D9%84%D8%AE%D8%A7%D8%AF%D9%85-%D9%87%D8%A7%D9%86%D9%8A-%D9%86%D8%AC%D9%8A%D8%A8/id6744336487',
        },
      ],
    },
    {
      'title': 'Hany Nagib Dashboard',
      'description': 'Admin panel to manage app content.',
      'image': 'assets/images/hanydach.png',
      'links': [],
    },
    {
      'title': 'One Source Sales',
      'description': 'Inventory and sales management system.',
      'image': 'assets/images/aboutig.png',
      'links': [],
    },
    {
      'title': 'Elre7la Dashboard',
      'description': 'Dashboard for lesson prep and attendance.',
      'image': 'assets/images/elre7la.png',
      'links': [],
    },
    {
      'title': 'Benshty Ava Antoni',
      'description': 'Interactive digital art gallery website.',
      'image': 'assets/images/benshty.jpg',
      'links': [
        {
          'icon': 'website',
          'url': 'https://benshty-web-app.web.app/home',
        },
      ],
    },
    {
      'title': 'Tasko App',
      'description': 'Task management graduation project.',
      'image': 'assets/images/tasko.png',
      'links': [
        {
          'icon': 'github',
          'url': 'https://github.com/marinatharwat/Tasko',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Projects",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 4;
              double childAspectRatio = 0.75;

              if (constraints.maxWidth < 1200) {
                crossAxisCount = 3;
                childAspectRatio = 0.8;
              }
              if (constraints.maxWidth < 1000) {
                crossAxisCount = 2;
                childAspectRatio = 0.9;
              }
              if (constraints.maxWidth < 600) {
                crossAxisCount = 1;
                childAspectRatio = 1.2;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: childAspectRatio,
                ),
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return ZoomIn(
                    duration: Duration(milliseconds: 200 + (index * 100)),
                    child: ProjectCard(
                      title: project['title'],
                      description: project['description'],
                      imagePath: project['image'],
                      links: List<Map<String, String>>.from(
                          project['links'] as List),
                    ),
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

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<Map<String, String>> links;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.links,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Cannot open link')));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = 120; // أصغر على الويب

    if (screenWidth < 1000 && screenWidth >= 600) {
      imageHeight = 150; // Tablet
    } else if (screenWidth < 600) {
      imageHeight = 200; // Mobile
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: _hovering ? Colors.blueGrey[700] : Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: _hovering ? 10 : 5, // ظل أخف على Web
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // الصورة تاخد نسبة من الكارد بدل رقم ثابت
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    children: widget.links.map((link) {
                      return IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: FaIcon(
                          _getIcon(link['icon']!),
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: () => _launchUrl(link['url']!),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}

IconData _getIcon(String name) {
  switch (name) {
    case 'github':
      return FontAwesomeIcons.github;
    case 'googlePlay':
      return FontAwesomeIcons.googlePlay;
    case 'appStoreIos':
      return FontAwesomeIcons.apple;
    case 'website':
      return FontAwesomeIcons.globe;
    default:
      return FontAwesomeIcons.link;
  }
}


