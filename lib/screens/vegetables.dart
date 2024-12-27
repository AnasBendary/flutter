import 'package:flutter/material.dart';
import '../widgets/vegetable_card.dart';
import '../utils/routes.dart';

class VegetablesScreen extends StatelessWidget {
  const VegetablesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> allItems = _getAllItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('All Categories'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: allItems.length,
        itemBuilder: (context, index) {
          return VegetableCardWidget(
            imagePath: allItems[index]['imagePath'],
            name: allItems[index]['name'],
            price: allItems[index]['price'],
            onTapCallback: () {
              Navigator.pushNamed(
                context,
                MyRoutes.vegetableDetailRoute,
                arguments: allItems[index],
              );
            },
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> _getAllItems() {
    return [
      {
        'name': 'Red Bell Pepper',
        'imagePath': 'assets/images/bell_pepper_red.png',
        'price': '500g, 3\$',
        'description': 'Sweet and crunchy red bell peppers, perfect for salads, stir-fries, or roasting.',
      },
      {
        'name': 'Carrot',
        'imagePath': 'assets/images/carrot.png',
        'price': '1kg, 2\$',
        'description': 'Crunchy and nutritious carrots, great for snacking or cooking.',
      },
      {
        'name': 'Apple',
        'imagePath': 'assets/images/apple.png',
        'price': '1kg, 3\$',
        'description': 'Fresh and juicy apples, perfect for snacking or baking.',
      },
      {
        'name': 'Banana',
        'imagePath': 'assets/images/banana.png',
        'price': '1kg, 2\$',
        'description': 'Ripe and sweet bananas, great for smoothies or as a quick snack.',
      },
      {
        'name': 'Milk',
        'imagePath': 'assets/images/milk.png',
        'price': '1L, 2\$',
        'description': 'Fresh cow\'s milk, perfect for drinking or using in recipes.',
      },
      {
        'name': 'Cheese',
        'imagePath': 'assets/images/cheese.png',
        'price': '200g, 3\$',
        'description': 'Delicious cheddar cheese, great for sandwiches or snacking.',
      },
      {
        'name': 'Chicken Breast',
        'imagePath': 'assets/images/chicken_breast.png',
        'price': '1kg, 8\$',
        'description': 'Lean chicken breast, ideal for various recipes and meal prep.',
      },
    ];
  }
}

