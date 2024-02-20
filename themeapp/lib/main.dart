// import 'dart:js';

import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
//import 'package:github/screens/welcome_screen.dart';
// import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';
import 'package:themeapp/welcome_screen.dart';
import 'theme_provider.dart';
import 'Home_Page.dart';
import 'theme_config.dart';

// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/widgets.dart';
// import 'package:github/utils.dart';
// import 'package:network_info_plus/network_info_plus.dart';
// void main() {
//   runApp(const MyApp());
//   DependencyInjection.init();
// }

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeStateProvider(),
        child: const MyApp(),
      ),
    );
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//    @override
//   void didChangeDependencies() {
//     context.read<ThemeStateProvider>().getDarkTheme();
//     super.didChangeDependencies();
//   }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    context.read<ThemeStateProvider>().getDarkTheme();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(
      child: Consumer<ThemeStateProvider>(builder: (context, theme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeConfig.lightTheme,
          darkTheme: ThemeConfig.darkTheme,
          themeMode: theme.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
          home: WelcomeScreen(),
        );
      }),
    );
  }
}

  // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeStateProvider>(builder: (context, theme, child) {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeConfig.lightTheme,
//         darkTheme: ThemeConfig.darkTheme,
//         themeMode: theme.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
//         home: Home(),
//       );
//     });
//   }
// }

