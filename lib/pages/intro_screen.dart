import 'package:flutter/material.dart'; // ייבוא חבילת Flutter לעיצוב ממשק המשתמש
import 'package:google_fonts/google_fonts.dart'; // ייבוא חבילת Google Fonts לשימוש בגופנים של גוגל
import 'home_page.dart'; // ייבוא העמוד HomePage

// הגדרת מחלקה IntroScreen שהיא StatelessWidget, כלומר, אינה שומרת מצב
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key}); // קונסטרוקטור המחלקה, super.key מאפשר העברת מפתח ייחודי למחלקת האב

  @override
  Widget build(BuildContext context) { // מתודת build שבונה את ממשק המשתמש של הוויידג'ט
    return Scaffold( // מבנה כללי של הדף
      backgroundColor: Colors.grey[50], // צבע הרקע של המסך
      body: SafeArea( // יוצר אזור בטוח שאינו חופף לאלמנטים של המערכת כמו סטטוס בר
        child: Column( // סידור רכיבים אחד מעל השני
          children: [
            Padding( // ריווח מסביב לרכיב הפנימי
              padding: const EdgeInsets.only(
                left: 100.0, // ריווח של 100 פיקסלים מצד שמאל
                right: 100.0, // ריווח של 100 פיקסלים מצד ימין
                top: 120, // ריווח של 120 פיקסלים מלמעלה
                bottom: 20, // ריווח של 20 פיקסלים מלמטה
              ),
              child: Image.asset('lib/images/avocado.png'), // הצגת תמונה מהנתיב הנתון
            ),

            Padding( // ריווח מסביב לטקסט
              padding: const EdgeInsets.all(28.0), // ריווח של 28 פיקסלים מכל צד
              child: Text(
                'We deliver groceries at your doorstep', // טקסט ההודעה
                textAlign: TextAlign.center, // מרכז את הטקסט
                style: GoogleFonts.notoSerif( // עיצוב הטקסט באמצעות גופן של גוגל
                    fontSize: 36, // גודל הגופן 36
                    fontWeight: FontWeight.bold), // משקל הגופן מודגש
              ),
            ),

            Text( // הצגת הודעה נוספת
              'Fresh items everyday', // טקסט ההודעה
              textAlign: TextAlign.center, // מרכז את הטקסט
              style: TextStyle(
                fontSize: 16, // גודל הגופן 16
                color: Colors.grey[700], // צבע הטקסט אפור כהה
              ),
            ),

            const SizedBox(height: 24), // רווח אנכי בגובה 24 פיקסלים

            const Spacer(), // ממלא את המקום הריק בין הפריטים

            GestureDetector( // רכיב שמזהה לחיצות
              onTap: () => Navigator.pushReplacement( // בעת לחיצה עוברים למסך הבית ומחליפים את המסך הנוכחי
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomePage(); // מעבר למסך הבית
                  },
                ),
              ),
              child: Container( // קונטיינר שמכיל את הכפתור
                padding: const EdgeInsets.all(24), // ריווח פנימי של 24 פיקסלים
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), // עיגול פינות הכפתור
                  color: const Color.fromARGB(255, 112, 91, 222), // צבע הכפתור
                ),
                child: const Text( // טקסט הכפתור
                  "Get Started", // טקסט הכפתור
                  style: TextStyle(
                    color: Colors.white, // צבע הטקסט לבן
                    fontSize: 16, // גודל הגופן 16
                  ),
                ),
              ),
            ),

            const Spacer(), // ממלא את המקום הריק בין הפריטים
          ],
        ),
      ),
    );
  }
}
