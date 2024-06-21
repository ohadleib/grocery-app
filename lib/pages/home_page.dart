import 'package:flutter/material.dart'; // ייבוא חבילת Flutter לעיצוב ממשק המשתמש
import 'package:google_fonts/google_fonts.dart'; // ייבוא חבילת Google Fonts לשימוש בגופנים של גוגל
import 'package:provider/provider.dart'; // ייבוא חבילת Provider לניהול מצב (state management)
import '../components/grocery_item_tile.dart'; // ייבוא רכיב GroceryItemTile מתוך תיקיית components
import '../model/cart_model.dart'; // ייבוא של המודל CartModel מניהול הסל בתיקייה model
import 'cart_page.dart'; // ייבוא העמוד CartPage מניהול הסל בתיקייה pages

// הגדרת מחלקה HomePage שהיא StatefulWidget, כלומר, שומרת מצב
class HomePage extends StatefulWidget {
  const HomePage({super.key}); // קונסטרוקטור המחלקה, super.key מאפשר העברת מפתח ייחודי למחלקת האב

  @override
  State<HomePage> createState() => _HomePageState(); // יצירת המצב של הוויידג'ט
}

// מחלקת המצב (State) של HomePage
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) { // מתודת build שבונה את ממשק המשתמש של הוויידג'ט
    return Scaffold( // מבנה כללי של הדף
      appBar: AppBar(
        backgroundColor: Colors.transparent, // רקע שקוף של ה-AppBar
        elevation: 0, // אין הצללה
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0), // ריווח מצד שמאל
          child: Icon(
            Icons.location_on, // אייקון של מיקום
            color: Colors.grey[700], // צבע האייקון
          ),
        ),
        title: Text(
          'Jerusalem, Israel', // כותרת ה-AppBar
          style: TextStyle(
            fontSize: 16, // גודל הגופן
            color: Colors.grey[700], // צבע הטקסט
          ),
        ),
        centerTitle: false, // הכותרת לא במרכז
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0), // ריווח מצד ימין
            child: Container(
              padding: const EdgeInsets.all(16), // ריווח פנימי של 16 פיקסלים
              decoration: BoxDecoration(
                color: Colors.grey[200], // צבע רקע אפור בהיר
                borderRadius: BorderRadius.circular(12), // עיגול פינות של 12 פיקסלים
              ),
              child: const Icon(
                Icons.person, // אייקון של משתמש
                color: Colors.grey, // צבע האייקון
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // צבע הרקע של הכפתור
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CartPage(); // מעבר לעמוד CartPage
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag), // אייקון של תיק קניות
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // יישור לשמאל
        children: [
          const SizedBox(height: 48), // רווח אנכי בגובה 48 פיקסלים

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0), // ריווח אופקי של 24 פיקסלים
            child: Text('Good morning,'),
          ),

          const SizedBox(height: 4), // רווח אנכי בגובה 4 פיקסלים

          // הצגת הודעת ברכה
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0), // ריווח אופקי של 24 פיקסלים
            child: Text(
              "Let's order fresh items for you", // הודעת ברכה
              style: GoogleFonts.notoSerif(
                fontSize: 36, // גודל הגופן
                fontWeight: FontWeight.bold, // משקל גופן מודגש
              ),
            ),
          ),

          const SizedBox(height: 24), // רווח אנכי בגובה 24 פיקסלים

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0), // ריווח אופקי של 24 פיקסלים
            child: Divider(), // קו מפריד
          ),

          const SizedBox(height: 24), // רווח אנכי בגובה 24 פיקסלים

          // קטגוריות -> תצוגת רשימה אופקית
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0), // ריווח אופקי של 24 פיקסלים
            child: Text(
              "Fresh Items", // כותרת "Fresh Items"
              style: GoogleFonts.notoSerif(
                fontSize: 18, // גודל הגופן
              ),
            ),
          ),

          // הזמנות אחרונות -> הצגת הפריטים
          Expanded( // מרחיב את הרשימה כדי למלא את כל השטח הפנוי
            child: Consumer<CartModel>( // שימוש ב-Consumer כדי להאזין לשינויים במודל CartModel
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(12), // ריווח מסביב
                  physics: const NeverScrollableScrollPhysics(), // הרשימה לא נגללת
                  itemCount: value.shopItems.length, // מספר הפריטים ברשימה
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // שני עמודות ברשת
                    childAspectRatio: 1 / 1.2, // יחס הגובה-רוחב של כל פריט
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0], // שם הפריט
                      itemPrice: value.shopItems[index][1], // מחיר הפריט
                      imagePath: value.shopItems[index][2], // נתיב התמונה של הפריט
                      color: value.shopItems[index][3], // צבע הרקע של הפריט
                      // הוספת פריט לסל כאשר לוחצים עליו
                      onPressed: () =>
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index), // הוספת הפריט לסל הקניות
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
