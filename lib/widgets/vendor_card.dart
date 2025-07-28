import 'package:flutter/material.dart';
import '../models/vendor.dart';

class VendorCard extends StatelessWidget {
  final Vendor vendor;

  const VendorCard({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  vendor.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text('Phone: ${vendor.phone}',
              style: TextStyle(fontSize: 13.5, color: Colors.grey[700])),
          Text('Email: ${vendor.email}',
              style: TextStyle(fontSize: 13.5, color: Colors.grey[700])),
          Text('Location: ${vendor.location}',
              style: TextStyle(fontSize: 13.5, color: Colors.grey[700])),
          Text('Contact: ${vendor.contactPerson}',
              style: TextStyle(fontSize: 13.5, color: Colors.grey[700])),
        ],
      ),
    );
  }
}
