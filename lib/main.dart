import 'package:ai_chatboat/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light; // Default to light theme

  @override
  void initState() {
    super.initState();
    _loadTheme(); // Load the saved theme on app startup
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isDark =
        prefs.getBool('isDarkTheme') ?? false; // Default to light theme
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _saveTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', isDark);
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: 'Flutter Demo',
        theme: _lightTheme(), // Light theme
        darkTheme: _darkTheme(), // Dark theme
        themeMode: _themeMode,
        debugShowCheckedModeBanner: false, // Current theme mode
        home: SplashScreen(
          onThemeChanged: (isDark) {
            setState(() {
              _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
            });
            _saveTheme(isDark); // Save the selected theme
          },
        ),
      ),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
        primaryColorLight: Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.white, elevation: 0),
        fontFamily: "Outfit",
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white));
  }

  ThemeData _darkTheme() {
    return ThemeData(
        primaryColorDark: Colors.black,
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.black, elevation: 0),
        fontFamily: "Outfit",
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
        appBarTheme: AppBarTheme(backgroundColor: Colors.black));
  }
}
