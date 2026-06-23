import "package:flutter/material.dart";
import "register_screen.dart";
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful")),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login Screen")),
        body:Center(
          child: Container(
            padding:EdgeInsets.all(16.0),
            margin: EdgeInsets.all(16.0),
            height: 300,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
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
                      return 'Please enter username';
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
                          return 'Please enter your password';
                        }
                        if (!RegExp(r'[a-z]').hasMatch(value)) {
                          return 'Password must have at least one lowercase letter';
                        }
                        if (!RegExp(r'[A-Z]').hasMatch(value)){
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
                      login();
                  },
                  child: Text("Login"),
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> RegisterScreen()
                      ),
                    );
                  },
                  child: Text("Don't have an account? Register"),
                ),
              ],
            ),
            ),
            
          ),
        ),
      );
  }
}