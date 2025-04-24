import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String duration;
  final VoidCallback onTap; // ✅ Added onTap

  const WorkoutCard({
    super.key,
    required this.title,
    required this.duration,
    required this.onTap, // ✅ Ensure it is required
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 18)),
        subtitle: Text(duration,
            style: const TextStyle(color: Colors.white54, fontSize: 14)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54),
        onTap: onTap, // ✅ Now it will work!
      ),
    );
  }
}
