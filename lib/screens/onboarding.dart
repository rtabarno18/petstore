import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .60,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Image.asset('assets/landing.png', fit: BoxFit.cover),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 255, 255, 255)),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .55),
              height: MediaQuery.of(context).size.height * .45,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset('assets/scroll-circles.png')],
                    ),
                    Text(
                      'Your One-Stop Pet Shop Experience!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: const Color(0xFF141415),
                          fontWeight: FontWeight.bold,
                          fontSize: 27),
                    ),
                    Text(
                      'Connect with 5-star pet caregivers near you who offer boarding, walking, house sitting or day care.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: const Color(0xFFA1A1A1),
                          fontWeight: FontWeight.normal,
                          fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/shop');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xFFE8BE13),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text('Get Started',
                            style: GoogleFonts.poppins(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
