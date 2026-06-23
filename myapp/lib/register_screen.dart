import "package:flutter/material.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
    final formKey = GlobalKey<FormState>();

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void register() {
        if (formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registration Successful")),
        );
        }
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
                appBar: AppBar(title: Text("Register Screen")),
                
                body:Center(
                    child: Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width:2),
                            borderRadius: BorderRadius.circular(20),
                        ),
                        height: 300,
                        width: 500,
                        child: Form(
                            key: formKey,
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                        labelText: "Username",  
                                    ),
                                    validator: (value) {
                                        if (value!.isEmpty) {
                                            return 'Please enter your username';
                                        }
                                        return null;
                                    },
                                ),
                                SizedBox(height: 16.0),
                                TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        labelText: "Email",
                                    ),
                                    validator: (value) {
                                        if (value!.isEmpty) {
                                            return 'Please enter your email';
                                        }
                                        if (!value.contains('@')) {
                                            return 'Email must have @';
                                        }
                                        if (!value.contains('.')) {
                                            return 'Email must have .';
                                        }
                                        if (value.endsWith('.')) {
                                            return 'Email must not end with .';
                                        }
                                        return null;
                                    },
                                ),
                                SizedBox(height: 16.0),
                                TextFormField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        labelText: "Password",
                                    ),
                                    validator: (value) {
                                        if (value!.isEmpty || value.length < 6) {
                                            return 'Please enter your password (at least 6 characters)';
                                        }
                                        if (!RegExp(r'[a-z]').hasMatch(value)) {
                                            return 'Password must have at least one lowercase letter';
                                        }
                                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                            return 'Password must have at least one uppercase letter';
                                        }
                                        if (!RegExp(r'[0-9]').hasMatch(value)) {
                                            return 'Password must have at least one number';
                                        }
                                        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                                            return 'Password must have at least one special character';
                                        }
                                        return null;
                                    }
                                ),
                                SizedBox(height: 16.0),
                                ElevatedButton(
                                    onPressed: () {
                                        register();
                                    },
                                    child: Text("Register"),
                                ),
                                
                            ],
                        ),
                        ),
                        
                    ),
                ),
            );
    }
}