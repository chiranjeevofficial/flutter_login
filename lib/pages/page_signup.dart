import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  late String newPassword, repeatPassword;

  checkPassword() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, MyRoute.dashboardRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.teal, // Change color to your desired color
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Center(
            child: Text("Sign Up", style: TextStyle(color: Colors.white))),
        leadingWidth: 60,
        actions: [Container(width: 60)],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset("assets/images/profile.png"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Username",
                        hintText: "Enter username",
                        labelStyle: TextStyle(color: Colors.teal),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                            width: 2,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        } else if (value.length < 5) {
                          return "Username must contain 5 character";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          newPassword = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: "New Password",
                        hintText: "Enter password",
                        labelStyle: TextStyle(color: Colors.teal),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                            width: 2,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        } else if (newPassword != repeatPassword) {
                          return "Password doesn't Matched";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          repeatPassword = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: "Confirm Password",
                        hintText: "Repeat password",
                        labelStyle: TextStyle(color: Colors.teal),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                            width: 2,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        } else if (newPassword != repeatPassword) {
                          return "Password doesn't Matched";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => checkPassword(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 130,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text("Sign Up",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
