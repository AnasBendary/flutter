import 'package:flutter/material.dart';
import '../widgets/vegetable_card.dart';
import '../utils/routes.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  const CategoryScreen({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = _getCategoryItems(categoryName);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
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
        itemCount: items.length,
        itemBuilder: (context, index) {
          return VegetableCardWidget(
            imagePath: items[index]['imagePath'],
            name: items[index]['name'],
            price: items[index]['price'],
            onTapCallback: () {
              Navigator.pushNamed(
                context,
                MyRoutes.vegetableDetailRoute,
                arguments: items[index],
              );
            },
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> _getCategoryItems(String category) {
    switch (category.toLowerCase()) {
      case 'fruits':
        return [
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
          // Add more fruit items here
        ];
      case 'vegetables':
        return [
          {
            'name': 'Red Bell Pepper',
            'imagePath': 'assets/images/bell_pepper_red.png',
            'price': '1kg, 4\$',
            'description': 'Sweet and crunchy red bell peppers, perfect for salads, stir-fries, or roasting.',
          },
          {
            'name': 'Carrot',
            'imagePath': 'assets/images/carrots.png',
            'price': '1kg, 2\$',
            'description': 'Crunchy and nutritious carrots, great for snacking or cooking.',
          },
          // Add more vegetable items here
        ];
      case 'dairy':
        return [
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
          // Add more dairy items here
        ];
      case 'meat':
        return [
          {
            'name': 'Premium Lamb Cuts',
            'imagePath': 'assets/images/lamb_meat.png',
            'price': '500g, 10\$',
            'description': 'High-quality, tender lamb cuts, perfect for grilling, roasting, or slow-cooking.',
          },
          {
            'name': 'Chicken Breast',
            'imagePath': 'assets/images/chicken_breast.png',
            'price': '1kg, 8\$',
            'description': 'Lean chicken breast, ideal for various recipes and meal prep.',
          },
          // Add more meat items here
        ];
      default:
        return [];
    }
  }
}

