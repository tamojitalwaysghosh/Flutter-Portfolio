import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/services/theme_provider.dart';
import 'package:portfolio/views/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    //wrap the MyApp() inside ChangeNotifierProvider of type ThemProvider
    ChangeNotifierProvider<ThemeProvider>(
      //in create property return the instance of ThemeProvider
      //here call the initialize method using cascade operator to get the currentTheme
      create: (_) => ThemeProvider()..initialize(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          title: 'Tamojit Ghosh',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color.fromARGB(255, 50, 49, 49),
          ),
          //use ThemeData.light().copywith() to override the default values. Same for dark
          themeMode: provider.themeMode, //access the getter from ThemeProvider
          home: HomePage(),
        );
      },
    );
  }
}
