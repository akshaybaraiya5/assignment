// models/stock_item.dart
class StockItem {
  final String name;
  final String gst;
  final String color;
  final int quantity;
  final int total;
  final bool inStock;

  StockItem({
    required this.name,
    required this.gst,
    required this.color,
    required this.quantity,
    required this.total,
    required this.inStock,
  });
}
