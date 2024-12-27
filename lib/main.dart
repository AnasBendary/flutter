import 'package:flutter/material.dart';
import 'package:flutter_catalog/screens/cart.dart';
import 'package:flutter_catalog/screens/vegetables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/dashboard.dart';
import 'screens/splash.dart';
import 'screens/vegetable_detail.dart';
import 'screens/welcome.dart';
import 'utils/routes.dart';
import 'screens/login.dart';
import 'screens/profile.dart';
import 'screens/category.dart';
import 'screens/best_selling.dart';
import 'package:provider/provider.dart';
import 'models/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Grocery App",
        theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
        initialRoute: "/",
        routes: {
          "/": (context) => SplashScreen(),
          MyRoutes.welcomeRoute: (context) => WelcomeScreen(),
          MyRoutes.loginRoute: (context) => LoginScreen(),
          MyRoutes.dashboardRoute: (context) => DashboardScreen(),
          MyRoutes.vegetablesRoute: (context) => VegetablesScreen(),
          MyRoutes.vegetableDetailRoute: (context) => VegetableDetailScreen(),
          MyRoutes.cartRoute: (context) => CartScreen(),
          MyRoutes.profileRoute: (context) => ProfileScreen(),
          MyRoutes.categoryRoute: (context) => CategoryScreen(
                categoryName:
                    ModalRoute.of(context)!.settings.arguments as String,
              ),
          MyRoutes.bestSellingRoute: (context) => BestSellingScreen(),
        },
      ),
    );
  }
}
