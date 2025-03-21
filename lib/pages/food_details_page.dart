import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/components/MyButton.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/theme/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // quntity
  int quantityCount = 0;

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void decrementQuantity() {
    setState(() {
      quantityCount--;
    });
  }

  void addToCart() {
    print(quantityCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ListView(
                children: [
                  Image.asset(widget.food.imagePath, height: 200),

                  const SizedBox(height: 25),

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[800]),

                      const SizedBox(width: 5),

                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 25),

                  // desc
                  Text(
                    'Description',
                    style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    '연어초밥은 부드럽고 기름진 연어를 얇게 썰어 초밥(샤리) 위에 올린 일본식 초밥(스시)입니다. 신선한 연어 특유의 감칠맛과 초밥의 새콤달콤한 밥이 조화를 이루며, 대표적인 초밥 메뉴 중 하나로 많은 사랑을 받고 있습니다.',
                    style: TextStyle(color: Colors.grey[600]),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
          Container(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.food.price}원',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              shape: BoxShape.circle,
                            ),

                            child: IconButton(
                              onPressed: decrementQuantity,
                              icon: Icon(Icons.remove, color: Colors.white),
                            ),
                          ),

                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              shape: BoxShape.circle,
                            ),

                            child: IconButton(
                              onPressed: incrementQuantity,
                              icon: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Mybutton(text: 'Add to Cart', onTap: addToCart),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
