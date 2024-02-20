import 'dart:async';
import 'package:flutter_offline/flutter_offline.dart';
// import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculator_screen.dart';
import 'drawer_navigation.dart';
import 'theme_provider.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int currentindex=0;
//   final screens=[const Home_Screen(),const Call_Calculator(),const About_Screen()];
//   List<String> screentitle=['Home','Calculator','About'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.blueGrey,
//         title:  Text(
//           screentitle[currentindex],
//           // 'Home',
//             style: const TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white)),

//                 actions: [
//           IconButton(
//             onPressed: () {
//               context.read<ThemeStateProvider>().setDarkTheme();
//             },
//             icon:
//                 context.select((ThemeStateProvider theme) => theme.isDarkTheme)
//                     ? const Icon(Icons.dark_mode_outlined)
//                     : const Icon(Icons.light_mode_outlined),
//           ),
//         ],
//       ),
//       drawer: NavBar(),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.red,
//         type: BottomNavigationBarType.shifting,
//         fixedColor: Colors.black,//if it is shifting
//         iconSize: 30,
//         currentIndex: currentindex,
//         landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
//         onTap: (value) {
//   setState(() {
//     currentindex = value;
//   });

//   // Add logic to navigate to the Calculator screen
//   if (currentindex == 1) {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => Call_Calculator()));
//   }
// },

//         items: const[
//         BottomNavigationBarItem(backgroundColor: Colors.blueGrey, icon: Icon(Icons.home),label: 'Home'),
//         BottomNavigationBarItem(backgroundColor: Colors.blueGrey, icon: Icon(Icons.calculate),label: 'Calculator'),
//         BottomNavigationBarItem(backgroundColor: Colors.blueGrey, icon: Icon(Icons.info),label: 'About'),
//       ]),
//       body: IndexedStack(index: currentindex,children: screens,)
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    // getConnectivity();
    super.initState();
  }

  // getConnectivity() =>
  //     subscription = Connectivity().onConnectivityChanged.listen(
  //       (ConnectivityResult result) async {
  //         isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //         if (!isDeviceConnected && isAlertSet == false) {
  //           showDialogBox();
  //           setState(() => isAlertSet = true);
  //         }
  //       },
  //     );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  int _selectedIndex = 0;
  final List<Widget> _screens = [
    ScreenOne(),
    CalculatorScreen(),
    ScreenThree(),
  ];

  // List of titles for the AppBar based on the tab index
  final List<String> _appBarTitles = ['Home', 'Calculator', 'About'];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]), // Dynamic title
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeStateProvider>().setDarkTheme();
            },
            icon:
                context.select((ThemeStateProvider theme) => theme.isDarkTheme)
                    ? const Icon(Icons.dark_mode_outlined)
                    : const Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
      drawer: DrawerNavigation(
        onItemSelected: _onTabSelected,
        selectedIndex: _selectedIndex, // Pass the selected index
        context: context, // Pass the context
      ),
    );
  }

  // showDialogBox() => showCupertinoDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //         title: const Text('No Connection'),
  //         content: const Text('Please check your internet connectivity'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () async {
  //               Navigator.pop(context, 'Cancel');
  //               setState(() => isAlertSet = false);
  //               // isDeviceConnected =
  //               //     await InternetConnectionChecker().hasConnection;
  //               if (!isDeviceConnected && isAlertSet == false) {
  //                 showDialogBox();
  //                 setState(() => isAlertSet = true);
  //               }
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            'Hello, and welcome to My App! We are thrilled to have you here. Dive into a world of possibilities and explore the incredible features that await you. Feel free to make yourself at home and enjoy the journey!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            'Explore the endless possibilities with our innovative app, designed to simplify your daily tasks and enhance your digital experience. From intuitive features to seamless navigation, we strive to deliver a user-centric platform that adapts to your needs.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
