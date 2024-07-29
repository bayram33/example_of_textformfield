import "package:flutter/material.dart";
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _id;
  String? _email;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        // autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  hintText: "1",
                  labelText: "Id Number",
                ),
                autofocus: true,
                onSaved: (newValue) {
                  _id = newValue;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "The value of Id is not be empty";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                // controller: TextEditingController(text: "sbayram@gmail.com"),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  labelText: "email",
                  hintText: "salmanbayramm33@gmail.com",
                ),
                validator: (value) {
                  if (!EmailValidator.validate(value!)) {
                    return "Enter the valid email";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  _email = newValue!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    String result = " id : $_id \n mail : $_email ";
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          result,
                          style: const TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.amber.shade100,
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.login),
                label: const Text("Register"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
