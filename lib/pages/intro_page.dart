import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/MyButton.dart';
import 'package:sushi/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 35),
            // shop 이름
            Text(
              'SUSHI MAN',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),

            // 이미지
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('lib/images/salmon_egg.png'),
            ),
            const SizedBox(height: 25),

            // title
            Text(
              'THE TASTE OF JAPANESE FOOD',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            // subtitle
            Text(
              'Feel the taste of the most popular Japanese food from anywhere and anytime',
              style: TextStyle(color: Colors.grey[200], height: 2),
            ),

            const SizedBox(height: 25),

            // 버튼
            Mybutton(
              text: 'Get Started',
              onTap: () {
                Navigator.pushNamed(context, '/menu');
              },
            ),
          ],
        ),
      ),
    );
  }
}
