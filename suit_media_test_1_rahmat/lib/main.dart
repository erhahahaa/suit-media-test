import 'package:flutter/material.dart';
import 'package:suit_media_test_1_rahmat/screen/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suitmedia Test 1 | Rahmat Hidayatullah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            color: Colors.green,
          ),
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontFamily: 'Poppins',
          ),
          titleMedium: TextStyle(
            fontFamily: 'Poppins',
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Poppins',
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xFF2B637B),
            ),
            foregroundColor: MaterialStateProperty.all(
              const Color(0xFFFFFFFF),
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          fillColor: const Color(0xFFFFFFFF),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFFE5E5E5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFFE5E5E5),
            ),
          ),
        ),
      ),
      home: const FirstScreen(),
    );
  }
}
