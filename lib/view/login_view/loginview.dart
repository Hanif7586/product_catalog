import 'package:flutter/material.dart';
import 'package:product_catalog/widget/bottomnavigation.dart';
import 'package:product_catalog/widget/color.dart';
import 'package:product_catalog/widget/custombutton.dart';
import 'package:provider/provider.dart';
import 'loginprovider.dart';


class Loginview extends StatefulWidget {
  @override
  _LoginviewState createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isUsernameValid = false;

  @override
  void initState() {
    super.initState();
    usernameController.addListener(() {
      setState(() {
        isUsernameValid = usernameController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'username',
                    hintText: 'username',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.black38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White border color
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White border color on focus
                      borderRadius: BorderRadius.circular(3),
                    ),
                    suffixIcon: isUsernameValid
                        ? Icon(Icons.check_circle, color: Colors.green)
                        : null, // Show the icon if valid
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'password',
                    hintText: 'password',
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.black38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White border color
                      borderRadius: BorderRadius.circular(3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White border color on focus
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                loginProvider.isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    final username = usernameController.text.trim();
                    final password = passwordController.text.trim();
                    loginProvider.login(username, password).then((success) {
                      if (success) {
                        // Navigate to HomeView on successful login
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Bottomnavigation()),
                        );
                      } else {
                        // Show an error message if login fails
                        setState(() {});
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                if (loginProvider.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      loginProvider.errorMessage!,
                      style: TextStyle(color: secondaryColor),
                    ),
                  ),
                if (loginProvider.userData != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Welcome, ${loginProvider.userData!['username']}',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
              ],
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    'Or Login with social account',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custombutton(image: Image.asset('assets/facebook.png')),
                    Custombutton(image: Image.asset('assets/google.png')),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}