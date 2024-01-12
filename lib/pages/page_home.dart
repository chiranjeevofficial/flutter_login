import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  moveToLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, MyRoute.dashboardRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Center(
            child: Text("Namaste! Coder",
              style: TextStyle(color: Colors.white)
            )
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Material(
              color: Colors.white,
              child: Column(children: [
                const SizedBox(height: 20),
                Text(
                  "Welcome in Developer Mall",
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
                Image.asset("assets/images/account.png"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              // prefixIcon: Icon(Icons.account_circle),
                              labelText: "Username",
                              hintText: "Enter username",
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
                            obscureText: true,
                            decoration: const InputDecoration(
                              // prefixIcon: Icon(Icons.password),
                              labelText: "Password",
                              hintText: "Enter password",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              } else if (value.length < 6) {
                                return "Password length should be atleast 6";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () => moveToLogin(context),
                                child: Container(
                                  width: 130,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Text("Login",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                              ),
                              InkWell(
                                onTap: () => {
                                  Navigator.pushNamed(context, MyRoute.signupRoute),
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.indigo,
                                      width: 2,
                                    ),
                                  ),
                                  width: 130,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 20
                                    )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                )
              ]),
            ),
          ),
        ));
  }
}
