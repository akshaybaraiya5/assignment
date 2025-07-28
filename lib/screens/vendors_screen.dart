import 'package:flutter/material.dart';
import '../widgets/vendor_card.dart';
import '../models/vendor.dart';

class VendorsScreen extends StatelessWidget {
  final List<Vendor> vendors = [
    Vendor(
      name: 'Tech Solutions Inc.',
      phone: '(555) 123-4567',
      email: 'ethan.harper@example.com',
      location: 'New York, NY',
      contactPerson: 'Ethan Harper',
    ),
    Vendor(
      name: 'Creative Designs Co.',
      phone: '(555) 987-6543',
      email: 'olivia.bennett@example.com',
      location: 'Los Angeles, CA',
      contactPerson: 'Olivia Bennett',
    ),
    Vendor(
      name: 'Global Supplies Ltd.',
      phone: '(555) 246-8013',
      email: 'noah.carter@example.com',
      location: 'Chicago, IL',
      contactPerson: 'Noah Carter',
    ),
    Vendor(
      name: 'Innovative Products LLC',
      phone: '(555) 135-7924',
      email: 'ava.thompson@example.com',
      location: 'Houston, TX',
      contactPerson: 'Ava Thompson',
    ),
    Vendor(
      name: 'Quality Materials Corp.',
      phone: '(555) 369-1212',
      email: 'liam.foster@example.com',
      location: 'Phoenix, AZ',
      contactPerson: 'Liam Foster',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Vendors',
          style: TextStyle(color: Colors.black),
        ),
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // ✅ Divider line below AppBar
          Container(
            height: 1,
            color: const Color(0xfff0f2f5),
          ),
          const SizedBox(height: 8),

          // ✅ Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search  vendor company...',
                prefixIcon: const Icon(Icons.search),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                filled: true,
                fillColor: Color(0xfff0f2f5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ✅ Filter Chips Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildFilterChip('Status'),
                const SizedBox(width: 8),
                _buildFilterChip('City/State'),
                const SizedBox(width: 8),
                _buildFilterChip('Vendor Type'),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // ✅ Vendor List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: vendors.length,
                itemBuilder: (context, index) {
                  return VendorCard(vendor: vendors[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xfff0f2f5),
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 12)),
          SizedBox(width: 3,),
          const Icon(Icons.keyboard_arrow_down, size: 20),
        ],
      ),
    );
  }
}
