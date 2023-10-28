import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srchout_assignment/screens/dashboard.dart';
import 'package:srchout_assignment/screens/map.dart';
import 'package:srchout_assignment/screens/settings.dart';
import 'package:srchout_assignment/screens/wallet.dart';
import 'package:srchout_assignment/utils/routes/route_generator.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Assignment',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),

          useMaterial3: true,
        ),
        home: const MyHomePage(),
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIdx = 0;
  List<Widget> pages = [
    const DashboardPage(),
    const MapPage(),
    const WalletPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
          body: pages[_selectedIdx],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _selectedIdx,
            onTap: (idx) => setState(() {
              _selectedIdx = idx;
            }),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/home.png'), label: "Home"),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/map_marker.png'),
                  label: "Map"),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/card_wallet.png'),
                  label: "Wallet"),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/settings.png'),
                  label: "Settings"),
            ],
          ),
        );
      
  }
}
