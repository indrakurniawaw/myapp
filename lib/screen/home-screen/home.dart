import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';
import '../../service/service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../home-screen/menu.dart';

// Suggested code may be subject to a license. Learn more: ~LicenseLog:377904592.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> datas = {};

  Future<void> _getProfiles() async {
    try {
      Map<String, dynamic> profile = await Service().getProfile();
      setState(() {
        datas = profile;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Selamat Datang,',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          '${datas['name']}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shift',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5, top: 5, bottom: 5),
                    child: FaIcon(FontAwesomeIcons.calendar,
                        color: Colors.white, size: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                    child: Text(
                      // ignore: unnecessary_string_interpolations
                      '${DateTime.now().toMoment().format('DD/MM/YYYY')}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 150,
                  child: TextButton.icon(
                      iconAlignment: IconAlignment.start,
                      icon: const FaIcon(FontAwesomeIcons.arrowRight,
                          color: Colors.black, size: 16),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Atur border radius
                        ),
                      ),
                      onPressed: () {},
                      label: const Text('Masuk')),
                ),
                SizedBox(
                    width: 150,
                    child: TextButton.icon(
                        iconAlignment: IconAlignment.start,
                        icon: const FaIcon(FontAwesomeIcons.arrowLeft,
                            color: Colors.black, size: 16),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // Atur border radius
                          ),
                        ),
                        onPressed: () {},
                        label: const Text('Keluar')))
              ]),
              const Expanded(child: MenuHome())
            ],
          ),
        )
      ]),
    ));
  }
}
