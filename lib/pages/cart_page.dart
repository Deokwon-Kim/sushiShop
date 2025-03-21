import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/MyButton.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder:
          (context, value, child) => Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              title: Text('장바구니'),
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      final Food food = value.cart[index];

                      final String foodName = food.name;
                      final String foodPrice = food.price;

                      return Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: ListTile(
                          title: Text(
                            foodName,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '$foodPrice원',
                            style: TextStyle(color: Colors.grey[200]),
                          ),
                          trailing: IconButton(
                            onPressed: () => removeFromCart(food, context),
                            icon: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // 결제 버튼
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Mybutton(text: '결제하기', onTap: () {}),
                ),
              ],
            ),
          ),
    );
  }
}
