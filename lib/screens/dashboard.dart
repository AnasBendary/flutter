import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/routes.dart';
import '../widgets/vegetable_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, MyRoutes.profileRoute),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, MyRoutes.profileRoute),
                          child: Image.asset(
                            "assets/images/user.png",
                            scale: 3.6,
                          ),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, MyRoutes.profileRoute),
                          child: Text(
                            "Anas Gomaa",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 16),
            if (ModalRoute.of(context)?.settings.name == MyRoutes.dashboardRoute)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF3F5F7),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Category",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xff979899),
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding: EdgeInsets.all(16),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: Color(0xff23AA49),
                      ),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                "assets/images/banner.png",
                scale: 4.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _seeAllView(context, "Categories", MyRoutes.vegetablesRoute),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      _categoriesView(context, "assets/images/fruits.png", "Fruits"),
                      _categoriesView(context, "assets/images/vegetables.png", "Vegetables"),
                      _categoriesView(context, "assets/images/diary.png", "Dairy"),
                      _categoriesView(context, "assets/images/meat.png", "Meat")
                    ],
                  ),
                  SizedBox(height: 32),
                  _seeAllView(context, "Best Selling", MyRoutes.bestSellingRoute),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: VegetableCardWidget(
                          imagePath: "assets/images/bell_pepper_red.png",
                          name: "Red Bell Pepper",
                          price: "500g, 3\$",
                          onTapCallback: () {
                            Navigator.pushNamed(context, MyRoutes.vegetableDetailRoute, arguments: {
                              'name': 'Red Bell Pepper',
                              'imagePath': 'assets/images/bell_pepper_red.png',
                              'price': '500g, 3\$',
                              'description': 'Sweet and crunchy red bell peppers, perfect for salads, stir-fries, or roasting.',
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _seeAllView(BuildContext context, String name, String route) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: Text(
            "See All",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff23AA49),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _categoriesView(BuildContext context, String imagePath, String catName) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, MyRoutes.categoryRoute, arguments: catName);
        },
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xffF3F5F7),
              radius: 32,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  imagePath,
                  scale: 4.0,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              catName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

