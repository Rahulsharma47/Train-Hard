import 'package:flutter/material.dart';
import 'package:train_hard/Splashscreen.dart';
//import 'logIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home.dart';
import 'package:train_hard/firebase_options.dart';
import 'progress.dart';
import 'bmi.dart';
import 'nav.dart';
import 'drawer.dart'; // This should contain your MenuScreen class

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.grey,
          onSecondary: Colors.white,
          background: Colors.black,
          onBackground: Colors.white,
          surface: Colors.grey,
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: SplashScreen(),
      routes: {
        '/main': (context) => MainScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      MyHomePage(
        scaffoldKey: scaffoldKey,
        toggleDrawer: () => scaffoldKey.currentState?.openEndDrawer(),
      ),
      ProgressScreen(),
      BMIScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
        child: MenuScreen(), // Assuming MenuScreen is imported from drawer.dart
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}