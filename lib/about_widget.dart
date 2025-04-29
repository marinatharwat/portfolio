import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

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
            child: Container(
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
              padding: const EdgeInsets.all(5),
              child: const CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage("assets/images/marina.jpeg"),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: _aboutContent(),
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
              child: _aboutContent(),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 1,
            child: BounceInRight(
              duration: const Duration(milliseconds: 1200),
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
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
                padding: const EdgeInsets.all(5),
                child: const CircleAvatar(
                  radius: 200,
                  backgroundImage: AssetImage("assets/images/rena.jpeg"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _aboutContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello! I’m Marina Tharwat",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "I seek challenging opportunities where I can fully use my skills for success.",
          style: GoogleFonts.poppins(),
        ),
        const SizedBox(height: 5),
        Text(
          "• I hold a degree in Information Technology from EELU - Assiut.",
          style: GoogleFonts.poppins(),
        ),
        Text(
          "• The only thing that makes me feel happy is coding.",
          style: GoogleFonts.poppins(),
        ),
        Text(
          "• I always try to discover the best technologies and use them to satisfy clients.",
          style: GoogleFonts.poppins(),
        ),
        const SizedBox(height: 20),
        Text(
          "Flutter Development",
          style: GoogleFonts.poppins(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "I'm developing android, ios and web applications using Flutter platform.",
          style: GoogleFonts.poppins(),
        ),
        const SizedBox(height: 20),
        Text(
          "UI/UX Design",
          style: GoogleFonts.poppins(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "I design intuitive user interfaces with a focus on user experience using modern design tools.",
          style: GoogleFonts.poppins(),
        ),
        const SizedBox(height: 20),
        Text(
          "Testing & QA",
          style: GoogleFonts.poppins(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "I write and execute test cases and ensure app quality using manual testing methods.",
          style: GoogleFonts.poppins(),
        ),
      ],
    );
  }
}
