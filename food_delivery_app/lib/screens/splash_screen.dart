import "package:flutter/material.dart";
import "home_screen.dart";

class SplashScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.orange[100],
            body: Center(
                child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange[200],
                        boxShadow: [
                            BoxShadow(
                                color: Colors.orange.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                            ),
                        ],
                    ),
                    height: 400,
                    width: 300,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text(
                                "Food Delivery App",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                            SizedBox(height: 10),
                            Image.asset(
                                "assets/images/logo_fixed.png",
                                height: 200,
                            ),
                            SizedBox(height: 10),
                            Text(
                                "Take your food delivery experience to the next level with our app!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context)=> HomeScreen()
                                        ),
                                    );
                                },
                                child: Text(
                                    "Get Started",
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}