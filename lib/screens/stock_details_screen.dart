import 'package:flutter/material.dart';

class StockDetailScreen extends StatefulWidget {
  const StockDetailScreen({super.key});

  @override
  State<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen> {
  int selectedItem= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.edit, color: Color(0xff007aff)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 1,
              color: const Color(0xFFE5E7EB), // subtle grey line
            ),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
               children: [
                 Text(
                   'A4 Paper',
                   style: const TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 const SizedBox(height: 16),
                 _buildDetailCard(),
                 const SizedBox(height: 20),
                 _buildTabs(),
                 const SizedBox(height: 20),
                 const Text(
                   'Stock Movement History',
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                 ),
                 const SizedBox(height: 12),
                 const _StockRow(title: 'Purchase', amount: '+100', date: '2025-07-15'),
                 const _StockRow(title: 'Sale', amount: '-50', date: '2025-07-14'),
                 const _StockRow(title: 'Transfer', amount: '+200', date: '2025-07-12'),
                 const _StockRow(title: 'Adjustment', amount: '-10', date: '2025-07-14'),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          _buildDetailRow('HSN Code', ''),
          _buildDetailRow('Inactive', '', trailing: Checkbox(value: true, onChanged: null)),
          _buildDetailRow('Product Description', 'A4 Paper'),
          _buildDetailRow('Units', 'PKT'),
          _buildDetailRow('GST Percentage', '12.00%'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Widget? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
          if (value.isNotEmpty)
            Text(value, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget _buildTabs() {
    final List<String> tabs = [
      'Stock Movement',
      'Purchase His.',
      'Stock Adju.',
      'Linked Items'
    ];



    // final isSelected = label == 'Stock Movement';
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (ctx, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index==selectedItem?Color(0xff007aff):Color(0xff667085),
            ),

            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: TextButton(
              onPressed: () {
             
               setState(() {
                 selectedItem = index; 
               });

              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(tabs[index], style: const TextStyle(fontSize: 12,color: Colors.white )),
            ),
          );
        },
      ),
    );
  }
}

class _StockRow extends StatelessWidget {
  final String title;
  final String amount;
  final String date;

  const _StockRow({
    required this.title,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(date, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
