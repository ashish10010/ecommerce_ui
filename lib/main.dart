import 'package:ecommerce_ui/cart_provider.dart';
import 'package:ecommerce_ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Just UI',
        theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle:TextStyle(
                
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),   
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )
            ),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              )
            )
        ),
        home:  const HomePage(),
      ),
    );
  }
}