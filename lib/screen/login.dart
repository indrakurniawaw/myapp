import 'package:flutter/material.dart';
import '../service/service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoggedIn = false;

  Future<void> _login() async {
    await Service().login(username, password, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3862424495.
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      username = val;
                    });
                  },
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(fontSize: 14.0)),
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(fontSize: 14.0)),
                )),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 11, 238, 208)),
                onPressed: () {
                  _login();
                },
                child: const Text('Login'),
              ),
            )
          ],
        ),
      )),
    );
  }
}
