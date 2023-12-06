// lib/widgets/game_card.dart
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String title;
  final String description;
  final int level;
  final Color backgroundColor;
  final String avatarName;
  final VoidCallback onPressed;

  const GameCard({
    super.key,
    required this.title,
    required this.description,
    required this.level,
    required this.backgroundColor,
    required this.avatarName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      color: backgroundColor,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/$avatarName.jpg',
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              description,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              'Jugar',
              style: TextStyle(color: const Color.fromARGB(255, 211, 44, 44)),
            ),
          ),
        ],
      ),
    );
  }
}
