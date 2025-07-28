// screens/stock_items_screen.dart

import 'package:assignment/screens/stock_details_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/stock_item_card.dart';
import '../models/stock_item.dart';

class StockItemsScreen extends StatefulWidget {
  @override
  _StockItemsScreenState createState() => _StockItemsScreenState();
}

class _StockItemsScreenState extends State<StockItemsScreen> {
  final List<StockItem> stockItems = [
    StockItem(
      name: 'A4 Paper',
      gst: '12.00%',
      color: 'Blue',
      quantity: 25,
      total: 1028,
      inStock: true,
    ),
    StockItem(
      name: 'Punching Machine',
      gst: '21.00%',
      color: 'White',
      quantity: 50,
      total: 1300,
      inStock: true,
    ),
    StockItem(
      name: 'Calculator',
      gst: '14.00%',
      color: 'Black',
      quantity: 75,
      total: 3999,
      inStock: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Stock Items',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // ✅ Thin grey line below AppBar
          Container(
            height: 1,
            color: const Color(0xFFE5E7EB), // light gray, matches your screenshot
          ),
          // ✅ Main list view or content
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: stockItems.length,
              itemBuilder: (context, index) {
                return StockItemCard(
                  stockItem: stockItems[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => StockDetailScreen(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
