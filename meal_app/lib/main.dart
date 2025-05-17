import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/tabs.dart';
//import 'package:meal_app/screens/meals.dart';
//import 'package:meal_app/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData.dark(
  useMaterial3: true,
  //colorScheme: ColorScheme.fromSeed(
  //seedColor: const Color.fromARGB(255, 131, 57, 0),
  //),
  //textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  return runApp(const ProviderScope(child: MealApp()));
}

// Future<bool> _onBackPressed() {
//   return showDialog(context: context, builder: (){
//     return AlertDialog(
//       title: Text('Do you really want to exit app?'),
//       actions: [
//         FlatButton(child: Text('No'),onPressed: (){
//           return Navigator.pop(context,false),
//         }),
//         FlatButton(child: Text('Yes'),onPressed: (){
//           return Navigator.pop(context,true),
//         }),
//       ],
//     )
//   });
// }

class MealApp extends StatelessWidget {
  const MealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
