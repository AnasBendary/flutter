import 'package:flutter/material.dart';
import '../widgets/vegetable_card.dart';
import '../utils/routes.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> bestSellingItems = _getBestSellingItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('Best Selling'),
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
        itemCount: bestSellingItems.length,
        itemBuilder: (context, index) {
          return VegetableCardWidget(
            imagePath: bestSellingItems[index]['imagePath'],
            name: bestSellingItems[index]['name'],
            price: bestSellingItems[index]['price'],
            onTapCallback: () {
              Navigator.pushNamed(
                context,
                MyRoutes.vegetableDetailRoute,
                arguments: bestSellingItems[index],
              );
            },
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> _getBestSellingItems() {
    return [
      {
        'name': 'Red Bell Pepper',
        'imagePath': 'assets/images/bell_pepper_red.png',
        'price': '500g, 3\$',
        'description': 'Sweet and crunchy red bell peppers, perfect for salads, stir-fries, or roasting.',
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
    ];
  }
}

