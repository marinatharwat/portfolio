import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/about_widget.dart';
import 'package:portfolio/contact_widget.dart';
import 'package:portfolio/project_widget.dart';
import 'package:portfolio/skills_widget.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF2E2E2E),
        textTheme: ThemeData.dark().textTheme,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Repeat animation back and forth
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _navigateToHome();
  }

  // Navigate to the Home Page after a delay
  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3)); // Display the splash screen for 3 seconds
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E2E),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: const FaIcon(
                FontAwesomeIcons.flutter,
                color: Colors.white,
                size: 80.0,
              ),
            );
          },
        ),
      ),
    );
  }
}




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final homeKey = GlobalKey();
    final skillsKey = GlobalKey();
    final projectsKey = GlobalKey();

    void scrollTo(GlobalKey key) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            HeaderSection(
              onHomeTap: () => scrollTo(homeKey),
              onSkillsTap: () => scrollTo(skillsKey),
              onProjectsTap: () => scrollTo(projectsKey),
            ),
            SectionContainer(key: homeKey, child: const AboutSection()),
            SectionContainer(key: skillsKey, child:  SkillsSection()),
            SectionContainer(key: projectsKey, child:  ProjectsSection()),
            const ContactSection(),
          ],
        ),
      ),
    );
  }
}

class SectionContainer extends StatelessWidget {
  final Widget child;
  const SectionContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: child,
    );
  }
}

class HeaderSection extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;

  const HeaderSection({super.key, required this.onHomeTap, required this.onSkillsTap, required this.onProjectsTap});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch \$url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Adjusted to center the content horizontally
        children: [
          Wrap(
            alignment: WrapAlignment.center, // Center the buttons horizontally
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 20,
            runSpacing: 10,
            children: [
              Wrap(
                spacing: 10,
                children: [
                  TextButton(onPressed: onHomeTap, child: const Text("Home", style: TextStyle(color: Colors.white))),
                  TextButton(onPressed: onSkillsTap, child: const Text("Skills", style: TextStyle(color: Colors.white))),
                  TextButton(onPressed: onProjectsTap, child: const Text("Projects", style: TextStyle(color: Colors.white))),
                ],
              ),
              Wrap(
                spacing: 10,
                children: [
                  TextButton.icon(
                    onPressed: () => _launchURL('https://github.com/marinatharwat'),
                    icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white, size: 16),
                    label: const Text('GitHub', style: TextStyle(color: Colors.white)),
                  ),
                  TextButton.icon(
                    onPressed: () => _launchURL('https://www.linkedin.com/in/marina-tharwat-005281240/'),
                    icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white, size: 16),
                    label: const Text('LinkedIn', style: TextStyle(color: Colors.white)),
                  ),
                  TextButton.icon(
                    onPressed: () => _launchURL('https://drive.google.com/file/d/14W_rxhtrIDP5mC0CvjrYP9MFECsvxJhG/view?usp=sharing'),
                    icon: const FaIcon(FontAwesomeIcons.filePdf, color: Colors.white, size: 16),
                    label: const Text('CV', style: TextStyle(color: Colors.white)),
                  ),

                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}




