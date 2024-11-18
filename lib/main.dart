import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'kehadiran_provider.dart';
import 'pages/home_page.dart';
import 'pages/riwayat_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => KehadiranProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monitoring Kehadiran Siswa',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pilihIndex = 0;

  static final List<Widget> _pages = [
    HomePage(),
    RiwayatPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _pilihIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pilihIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pilihIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Pencatatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
        ],
      ),
    );
  }
}
