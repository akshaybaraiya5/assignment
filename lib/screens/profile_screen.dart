import 'package:assignment/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            color: const Color(0xfff0f2f5),
          ),
          const SizedBox(height: 24),

          // Profile Image and Info
          Center(
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Ethan Carter',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'ethan.carter@example.com',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  '+1 (555) 123-4567',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Action Rows
          _ProfileAction(title: 'Edit Profile', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>EditProfileScreen()));
          }),

          _ProfileAction(title: 'Logout', onTap: () {}),
        ],
      ),
    );
  }
}

// Reusable Row Widget
class _ProfileAction extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _ProfileAction({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
