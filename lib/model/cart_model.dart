import 'package:flutter/material.dart';

// מחלקת CartModel יורשת מ-ChangeNotifier כדי להודיע למאזינים על שינויים במצב
class CartModel extends ChangeNotifier {
  // רשימת פריטים למכירה, שמכילה רשימה של שם פריט, מחיר פריט, נתיב לתמונה, וצבע
  final List _shopItems = const [
    ["Avocado", "4.00", "lib/images/avocado.png", Colors.green],
    ["Banana", "2.50", "lib/images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "lib/images/chicken.png", Colors.brown],
    ["Water", "1.00", "lib/images/water.png", Colors.blue],
  ];

  // רשימת פריטים בסל הקניות
  final List _cartItems = [];

  // מקבל את רשימת הפריטים בסל הקניות
  List get cartItems => _cartItems;

  // מקבל את רשימת הפריטים למכירה
  List get shopItems => _shopItems;

  // פונקציה להוספת פריט לסל הקניות לפי אינדקס הפריט
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]); // הוספת פריט לסל
    notifyListeners(); // הודעה לכל המאזינים שהמצב השתנה
  }

  // פונקציה להסרת פריט מסל הקניות לפי אינדקס הפריט
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index); // הסרת פריט מהסל
    notifyListeners(); // הודעה לכל המאזינים שהמצב השתנה
  }

  // פונקציה לחישוב המחיר הכולל של הפריטים בסל
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]); // חישוב המחיר הכולל
    }
    return totalPrice.toStringAsFixed(2); // החזרת המחיר הכולל בפורמט עם שתי ספרות אחרי הנקודה
  }
}
