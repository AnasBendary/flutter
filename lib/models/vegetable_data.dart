class VegetableItemModel {
  final String imagePath;
  final String name;
  final String price;
  final String category;

  VegetableItemModel({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.category,
  });

  static final vegetableItemList = [
    VegetableItemModel(
      imagePath: "assets/images/pepper_red.png",
      name: "Bell Pepper Red",
      price: "1kg, 6\$",
      category: "Vegetables",
    ),
    VegetableItemModel(
      imagePath: "assets/images/carrots.png",
      name: "Organic Carrots",
      price: "1kg, 4\$",
      category: "Vegetables",
    ),
    VegetableItemModel(
      imagePath: "assets/images/apple.png",
      name: "Red Apple",
      price: "1kg, 5\$",
      category: "Fruits",
    ),
    VegetableItemModel(
      imagePath: "assets/images/banana.png",
      name: "Banana",
      price: "1kg, 3\$",
      category: "Fruits",
    ),
    VegetableItemModel(
      imagePath: "assets/images/milk.png",
      name: "Fresh Milk",
      price: "1L, 2\$",
      category: "Dairy",
    ),
    VegetableItemModel(
      imagePath: "assets/images/cheese.png",
      name: "Cheddar Cheese",
      price: "200g, 3\$",
      category: "Dairy",
    ),
    VegetableItemModel(
      imagePath: "assets/images/chicken_breast.png",
      name: "Chicken Breast",
      price: "1kg, 8\$",
      category: "Meat",
    ),
  ];
}

