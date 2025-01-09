import 'package:flutter/material.dart';
import 'package:test_app/screens/future_builder.dart';
import 'package:test_app/screens/stream_builder.dart';
import 'package:test_app/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1702887161995-d8e4e4e95aec?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            fit: BoxFit.cover,
            color: Colors.black.withAlpha(170),
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            // validator: (value) {}, // for validation
                            controller: _usernameController,
                            keyboardType: TextInputType
                                .emailAddress, // for email type keyboard pop up
                            decoration: const InputDecoration(
                              hintText: "Enter your username",
                              labelText: "Username",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType
                                .text, // for text/normal type keyboard pop up
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "Enter your password",
                              labelText: "Password",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Constants.prefs.setBool("loggedIn", true);
                              // formKey.currentState?.validate(); // for validation
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const HomePage()));
                              Navigator.pushReplacementNamed(context, HomePageSB.routeName);
                            },
                            child: const Text("Login"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
