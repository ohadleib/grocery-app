import 'package:flutter/material.dart'; // ייבוא חבילת Flutter לעיצוב ממשק המשתמש
import 'package:google_fonts/google_fonts.dart'; // ייבוא חבילת Google Fonts לשימוש בגופנים של גוגל
import 'package:provider/provider.dart'; // ייבוא חבילת Provider לניהול מצב (state management)

import '../model/cart_model.dart'; // ייבוא של המודל CartModel מניהול הסל בתיקייה model

class CartPage extends StatelessWidget { // הגדרת מחלקה CartPage שהיא StatelessWidget, כלומר, אינה שומרת מצב
  const CartPage({super.key}); // קונסטרוקטור המחלקה, super.key מאפשר העברת מפתח ייחודי למחלקת האב

  @override
  Widget build(BuildContext context) { // מתודת build שבונה את ממשק המשתמש של הוויידג'ט
    return Scaffold( // מחזירה Scaffold שמכיל את מבנה העמוד
      appBar: AppBar( // AppBar של העמוד
        backgroundColor: Colors.transparent, // רקע שקוף של ה-AppBar
        elevation: 0, // ללא הצללה של ה-AppBar
        iconTheme: IconThemeData(
          color: Colors.grey[800], // צבע האייקונים ב-AppBar
        ),
      ),
      body: Consumer<CartModel>( // גוף העמוד (body) שמכיל את תוכן הסל
        builder: (context, value, child) { // builder הוא פונקציה שמקבלת את הקונטקסט, את המודל ואת ה-child ובונה את הממשק בהתאם למצב
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start, // יישור לשמאל
            children: [
              Padding( // כותרת העמוד "My Cart"
                padding: EdgeInsets.symmetric(horizontal: 24.0), // ריווח אופקי של 24 פיקסלים
                child: Text(
                  "My Cart",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36, // גודל גופן 36
                    fontWeight: FontWeight.bold, // משקל גופן מודגש
                  ),
                ),
              ),

              Expanded( // רשימת הפריטים בסל
                child: Padding( // מרחיב את הרשימה כך שתמלא את כל השטח הפנוי
                  padding: const EdgeInsets.all(12.0), // ריווח מסביב לרשימה
                  child: ListView.builder(
                    itemCount: value.cartItems.length, // מספר הפריטים בסל
                    padding: EdgeInsets.all(12), // ריווח מסביב לכל פריט ברשימה
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0), // ריווח מסביב לכל פריט
                        child: Container(
                          decoration: BoxDecoration( // קונטיינר שמכיל כל פריט ברשימה
                            color: Colors.grey[200], // צבע רקע אפור בהיר
                            borderRadius: BorderRadius.circular(8), // עיגול פינות של 8 פיקסלים
                          ),
                          child: ListTile( // כל פריט ברשימה מוצג כ-ListTile
                            leading: Image.asset(
                              value.cartItems[index][2], // תמונת הפריט
                              height: 36, // גובה התמונה
                            ),
                            title: Text(
                              value.cartItems[index][0], // שם הפריט
                              style: const TextStyle(fontSize: 18), // גודל גופן של 18
                            ),
                            subtitle: Text(
                              '\$' + value.cartItems[index][1], // מחיר הפריט
                              style: const TextStyle(fontSize: 12), // גודל גופן של 12
                            ),
                            trailing: IconButton( // כפתור להסרת פריט מהסל
                              icon: const Icon(Icons.cancel), // אייקון של X
                              onPressed: () => Provider.of<CartModel>(context, listen: false).removeItemFromCart(index), // הסרת הפריט מהסל
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              Padding( // סך הכול + כפתור תשלום
                padding: const EdgeInsets.all(36.0), // ריווח מסביב
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), // עיגול פינות של 8 פיקסלים
                    color: Colors.green, // צבע רקע ירוק
                  ),
                  padding: const EdgeInsets.all(24), // ריווח פנימי של 24 פיקסלים
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // מרווח שווה בין הפריטים
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // יישור לשמאל
                        children: [
                          Text(
                            'Total Price', // כותרת "Total Price"
                            style: TextStyle(color: Colors.green[200]), // צבע טקסט ירוק בהיר
                          ),
                          const SizedBox(height: 8), // רווח אנכי של 8 פיקסלים
                          Text( // הצגת הסכום הכולל
                            '\$${value.calculateTotal()}', // חישוב הסכום הכולל
                            style: const TextStyle(
                              fontSize: 18, // גודל גופן של 18
                              fontWeight: FontWeight.bold, // משקל גופן מודגש
                              color: Colors.white, // צבע טקסט לבן
                            ),
                          ),
                        ],
                      ),
                      Container( // כפתור תשלום
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade200), // גבול בצבע ירוק בהיר
                          borderRadius: BorderRadius.circular(28), // עיגול פינות של 28 פיקסלים
                        ),
                        padding: const EdgeInsets.all(12), // ריווח פנימי של 12 פיקסלים
                        child: const Row(
                          children: [
                            Text(
                              'Pay Now', // טקסט הכפתור "Pay Now"
                              style: TextStyle(color: Colors.white), // צבע טקסט לבן
                            ),
                            Icon(
                              Icons.arrow_forward_ios, // אייקון חץ ימינה
                              size: 16, // גודל האייקון
                              color: Colors.white, // צבע האייקון לבן
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
