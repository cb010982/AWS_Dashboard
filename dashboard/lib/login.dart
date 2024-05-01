import 'package:flutter/material.dart';
import 'main.dart';
import 'User.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgroundimage.jpg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 300, 
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white), // This makes the font white
                    ),
                    style: TextStyle(color: Colors.white), // This makes the input text white
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white), // This makes the font white
                    ),
                    obscureText: true,
                    style: TextStyle(color: Colors.white), // This makes the input text white
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        for (var user in users) {
                          if (_usernameController.text == user.email && _passwordController.text == user.password) {
                            if (user.localRoute.isNotEmpty) {
                              // Open the specified custom Dart code page
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyCustomPage()),
                              );
                            } else {
                              // Open the web view (existing behavior)
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyHomePage(title: 'Dashboard', url: user.dashboardUrl)),
                              );
                            }
                            return;
                          }
                        }
                        // If no matching user was found, show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid email or password')),
                        );
                      }
                    },
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class MyCustomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the VST dashboard in an InAppWebView
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'VST Dashboard', url: 'https://vstdashboard.acumenintelligence.tech/')),
                );
              },
              child: Text('VST'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Customize button color
              ),
            ),
            SizedBox(height: 20), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to the AWS dashboard in an InAppWebView
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'AWS Dashboard', url: 'https://test.acumenintelligence.tech/aws/')),
                );
              },
              child: Text('AWS'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Customize button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}


