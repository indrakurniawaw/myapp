import 'package:flutter/material.dart';
import '../../service/service.dart';

class MenuHome extends StatefulWidget {
  const MenuHome({super.key});

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

// Suggested code may be subject to a license. Learn more: ~LicenseLog:1694421346.
class _MenuHomeState extends State<MenuHome> {
  List<Map<String, dynamic>> menu = [];

  Future<void> _getMenu() async {
    try {
      Map<String, dynamic> datas = await Service().getMenu();
      setState(() {
        menu = List<Map<String, dynamic>>.from(datas['data']);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      child: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text('Menu '),
                // Text('Menu '),
                // Text('Menu '),
              ])),
    )));
  }
}
