import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// מחלקת GroceryItemTile היא StatelessWidget, כלומר, היא מחלקה שאינה שומרת מצב (state)
class GroceryItemTile extends StatelessWidget {
  // הגדרת משתנים סופיים (final) המייצגים את המאפיינים של הפריט
  final String itemName; // שם הפריט
  final String itemPrice; // מחיר הפריט
  final String imagePath; // נתיב התמונה של הפריט
  final color; // צבע הרקע של הפריט
  final void Function()? onPressed; // פונקציה שתופעל כאשר לוחצים על הכפתור

  // קונסטרוקטור המחלקה, שבו חובה להעביר את כל המאפיינים של הפריט
  GroceryItemTile({
    super.key, // מפתח ייחודי עבור הוווידג'ט
    required this.itemName, // חובה להעביר שם פריט
    required this.itemPrice, // חובה להעביר מחיר פריט
    required this.imagePath, // חובה להעביר נתיב לתמונה של הפריט
    required this.color, // חובה להעביר צבע רקע
    required this.onPressed, // חובה להעביר פונקציה שתופעל בלחיצה על הכפתור
  });

  // מתודת build בונה את ממשק המשתמש של הוווידג'ט
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12), // ריווח של 12 פיקסלים מסביב לוווידג'ט
      child: Container(
        // קונטיינר המשמש כתיבה לפריט
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // עיגול פינות הקונטיינר
          color: color[100], // צבע הרקע של הקונטיינר בהתאם לצבע שהועבר
        ),
        child: Column(
          // סידור הפריטים בעמודה (מלמעלה למטה)
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // מרווח שווה בין הפריטים
          crossAxisAlignment: CrossAxisAlignment.center, // מרכז את הפריטים בצורה אופקית
          children: [
            // תמונת הפריט
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0), // ריווח אופקי של 40 פיקסלים
              child: Image.asset(
                imagePath, // נתיב התמונה
                height: 64, // גובה התמונה
              ),
            ),

            // שם הפריט
            Text(
              itemName, // שם הפריט שמוצג בטקסט
              style: TextStyle(
                fontSize: 16, // גודל הגופן
              ),
            ),

            // כפתור המאפשר להוסיף את הפריט לסל
            MaterialButton(
              onPressed: onPressed, // פונקציה שתופעל בלחיצה על הכפתור
              color: color, // צבע הכפתור
              child: Text(
                '\$' + itemPrice, // מחיר הפריט שמוצג בטקסט
                style: TextStyle(
                  color: Colors.white, // צבע הטקסט
                  fontWeight: FontWeight.bold, // עובי הגופן
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
