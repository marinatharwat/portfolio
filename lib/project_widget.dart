import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart'; // للتأثيرات الحركية

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Tasko App',
      'description':
      'A task management and follow-up system that enables team leaders to assign tasks to members, track their progress',
      'image': 'assets/images/tasko.png',
      'links': [
        {'icon': 'github', 'url': 'https://github.com/marinatharwat/Tasko'},
      ],
    },
    {
      'title': 'Haystageeb App',
      'description':
      'A social mobile app where users can write and share prayers, interact with others, and keep track of events and fasting dates.',
      'image': 'assets/images/haystageeb.png',
      'links': [
        {'icon': 'googlePlay', 'url': ''},
        {'icon': 'appStoreIos', 'url': ''},
      ],
    },
    {
      'title': 'Haystageeb Dashboard',
      'description':
      'Admin web panel to manage posts in the Haystageeb app, including adding, editing, deleting, accepting, and rejecting user submissions.',
      'image': 'assets/images/haystageeb.png',
      'links': [],
    },
    {
      'title': 'Elre7la Dashboard',
      'description':
      'A web-based system for Sunday school teachers to prepare lessons, manage attendance, and organize groups efficiently.',
      'image': 'assets/images/elre7la.png',
      'links': [],
    },
    {
      'title': 'Benshty Ava Antoni',
      'description':
      'A digital gallery that showcases stunning artworks with interactive and engaging UI design.',
      'image': 'assets/images/benshty.jpg',
      'links': [
        {
          'icon': 'website',
          'url': 'https://benshty-web-app.web.app/home',
        },
      ],
    },
    {
      'title': 'Hany Nagib App',
      'description':
      'A mobile app featuring sermons, articles, Bible verses, and prayers by preacher Hany Nagib, offering spiritual guidance and content.',
      'image': 'assets/images/hany.png',
      'links': [
        {
          'icon': 'googlePlay',
          'url': 'https://play.google.com/store/apps/details?id=com.mina_magid.h_n_flutter.dev&pcampaignid=web_share'
        },
        {'icon': 'appStoreIos', 'url': ''},
      ],
    },
    {
      'title': 'Hany Nagib Dashboard',
      'description':
      'Admin dashboard to manage the content of the Hany Nagib app including adding, editing, and deleting media and articles.',
      'image': 'assets/images/hanydach.png',
      'links': [],
    },
    {
      'title': 'One Source Sales',
      'description':
      'An inventory and sales management app for AbuTig Tobacco Factory, allowing users to manage orders, customers, and stock efficiently.',
      'image': 'assets/images/aboutig.png',
      'links': [],
    },
    {
      'title': 'Tic-Tac-Toe Game',
      'description': 'A fun and simple tic-tac-toe game with attractive UI.',
      'image': 'assets/images/xo.png',
      'links': [
        {
          'icon': 'github',
          'url': 'https://github.com/marinatharwat/tic_tac_toe'
        },
      ],
    },
    {
      'title': 'Advanced Calculator',
      'description':
      'A calculator app that performs basic and advanced operations including %, factorial, sin, cos, tan, and square root.',
      'image': 'assets/images/calculator.png',
      'links': [
        {
          'icon': 'github',
          'url': 'https://github.com/marinatharwat/calculator'
        },
      ],
    },
    {
      'title': 'Todo App',
      'description': 'An intuitive todo app to help users manage their tasks efficiently.',
      'image': 'assets/images/todo.png',
      'links': [
        {'icon': 'github', 'url': 'https://github.com/marinatharwat/ToDo'},
      ],
    },
    {
      'title': 'News API App',
      'description':
      'An app that displays news articles using a simple JSON-based API with access to current and historical news from various sources.',
      'image': 'assets/images/news.png',
      'links': [
        {'icon': 'github', 'url': 'https://github.com/marinatharwat/NewsApp'},
      ],
    },
    {
      'title': 'Movie App',
      'description':
      'A movie database app that provides information such as titles, overviews, and release dates of various films.',
      'image': 'assets/images/movies.png',
      'links': [
        {'icon': 'github', 'url': 'https://github.com/engyelgohary/movies_app'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 320,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return ZoomIn(
                    duration: Duration(milliseconds: 300 + (index * 100)),
                    child: ProjectCard(
                      title: project['title'],
                      description: project['description'],
                      imagePath: project['image'],
                      links: List<Map<String, String>>.from(project['links'] as List),
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
  bool _pressed = false;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        widget.imagePath,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: widget.links.map((link) {
                    return IconButton(
                      icon: FaIcon(
                        IconDataSolid(link['icon']!),
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => _launchUrl(link['url']!),
                      tooltip: link['url'],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

IconData IconDataSolid(String name) {
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
