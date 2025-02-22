abstract class Product {
  final int id;
  final String title;
  final num price;
  final int quantity;
  final num total;
  final num discountPercentage;
  final num discountTotal;
  final String productImage;

  Product({required this.id, required this.title, required this.price, required this.quantity, required this.total, required this.discountPercentage, required this.discountTotal, required this.productImage});
  
}