import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetBoxDetail extends StatelessWidget {
  final String text1;
  final String text2;
  const PetBoxDetail({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: MediaQuery.sizeOf(context).width * .25,
        decoration: BoxDecoration(
            color: const Color(0x1A98FF98),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              text2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFE8BE13)),
            )
          ],
        ),
      ),
    );
  }
}
