import 'package:flutter/material.dart';

class Skill {
  const Skill({
    required this.name,
    required this.level,
    required this.category,
    required this.icon,
  });

  final String name;
  final double level;
  final String category;
  final IconData icon;
}
