import 'package:flutter/material.dart';

class ThemeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  const ThemeScreen({super.key, required this.onThemeChanged});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
