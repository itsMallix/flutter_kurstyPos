import 'package:flutter_krustypos/core/core.dart';
import 'package:flutter_krustypos/presentation/home/models/product_category.dart';

class ProductModel {
  final String image;
  final String name;
  final ProductCategory category;
  final int price;
  final int stock;

  ProductModel({
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
  });

  String get priceFormat => price.currencyFormatRp;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.image == image &&
        other.name == name &&
        other.category == category &&
        other.price == price &&
        other.stock == stock;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        name.hashCode ^
        category.hashCode ^
        price.hashCode ^
        stock.hashCode;
  }
}

List<ProductModel> searchResults = [];
final List<ProductModel> products = [
  ProductModel(
    image: Assets.images.menu1.path,
    name: 'Express Bowl Ayam Rica',
    category: ProductCategory.food,
    price: 32000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu2.path,
    name: 'Crispy Black Pepper Sauce',
    category: ProductCategory.food,
    price: 36000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu3.path,
    name: 'Mie Ayam Teriyaki',
    category: ProductCategory.food,
    price: 33000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu4.path,
    name: 'Nasi Ayam Teriyaki',
    category: ProductCategory.food,
    price: 21000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu5.path,
    name: ' Katsu Teriyaki Saos',
    category: ProductCategory.food,
    price: 40000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu6.path,
    name: 'Sapo Tahu Ayam',
    category: ProductCategory.food,
    price: 41000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu7.path,
    name: ' Sapo Tahu Sapi',
    category: ProductCategory.food,
    price: 44000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu8.path,
    name: 'Chicken Cordon Bleu',
    category: ProductCategory.food,
    price: 45000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu10.path,
    name: 'Fish & Chips ',
    category: ProductCategory.food,
    price: 35000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu11.path,
    name: 'Bihun Ayam',
    category: ProductCategory.food,
    price: 39000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu12.path,
    name: 'Bihun Goreng Ayam',
    category: ProductCategory.food,
    price: 38000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu13.path,
    name: 'Nasi Goreng Special',
    category: ProductCategory.food,
    price: 35000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu14.path,
    name: 'Nasi Cap Cay',
    category: ProductCategory.food,
    price: 40000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.drink1.path,
    name: 'Teh Tarik',
    category: ProductCategory.drink,
    price: 20000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.drink2.path,
    name: 'Thai Tea',
    category: ProductCategory.drink,
    price: 22000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.drink3.path,
    name: 'Jus Melon',
    category: ProductCategory.drink,
    price: 25000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.drink4.path,
    name: 'Jus Stawberry',
    category: ProductCategory.drink,
    price: 24000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.drink5.path,
    name: 'Air Mineral Botol',
    category: ProductCategory.drink,
    price: 6000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.drink6.path,
    name: 'Jus Alpukat',
    category: ProductCategory.drink,
    price: 25000,
    stock: 10,
  ),
  ProductModel(
    image: Assets.images.menu14.path,
    name: 'Caramel Candy Blend',
    category: ProductCategory.drink,
    price: 30000,
    stock: 10,
  ),
];
