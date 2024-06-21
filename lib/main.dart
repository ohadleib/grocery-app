import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/cart_model.dart';
import 'pages/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

// הפונקציה הראשית שמפעילה את האפליקציה
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // יצירת אובייקט של CartModel שמודיע על שינויים בנתונים שלו
      create: (context) => CartModel(),
      child: const MaterialApp(
        // הסרת הבאנר של מצב דיבוג
        debugShowCheckedModeBanner: false,
        // מסך הבית של האפליקציה יהיה IntroScreen
        home: IntroScreen(),
      ),
    );
  }
}