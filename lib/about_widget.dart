import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: isSmallScreen
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BounceInDown(
            duration: const Duration(milliseconds: 1200),
            child: _profileImage(radius: 120),
          ),
          const SizedBox(height: 30),
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: _aboutContent(isSmallScreen),
          ),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: FadeInLeft(
              duration: const Duration(milliseconds: 800),
              child: _aboutContent(isSmallScreen),
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 1,
            child: BounceInRight(
              duration: const Duration(milliseconds: 1200),
              child: _profileImage(radius: 200),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileImage({required double radius}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.greenAccent.shade400,
            Colors.blueAccent.shade200,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent.withOpacity(0.6),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(6),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage("assets/images/rena.jpeg"),
      ),
    );
  }

  Widget _aboutContent(bool isSmallScreen) {
    return Column(
      crossAxisAlignment:
      isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "Hello! I’m Marina Tharwat",
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Flutter Developer with hands-on experience in building scalable mobile and web applications. I specialize in writing clean, maintainable code using modern architecture principles.",
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        const SizedBox(height: 15),

        /// Skills Highlights
        Text(
          "• Flutter (Android, iOS & Web)",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        Text(
          "• State Management (BLoC, Cubit, Provider, GetX)",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        Text(
          "• RESTful APIs & Firebase Integration",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        Text(
          "• Clean Architecture & SOLID Principles",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        Text(
          "• Local Storage & SQLite",
          style: GoogleFonts.poppins(fontSize: 15),
        ),

        const SizedBox(height: 30),

        /// Focus Section
        Text(
          "What I Focus On",
          style: GoogleFonts.poppins(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "I build high-performance, user-friendly applications with strong attention to scalability and code quality. I collaborate closely with backend and UI/UX teams to deliver reliable and impactful digital products.",
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.start,
          style: GoogleFonts.poppins(fontSize: 15),
        ),
      ],
    );
  }
}
