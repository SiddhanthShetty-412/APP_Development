import "package:flutter/material.dart";

class FoodScreen extends StatefulWidget {
    @override
    State<FoodScreen> createState()=> _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
    @override 
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Veg Pizza"),
            ),
            body: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    children: [
                        Container(
                            height: 200,
                            color: Colors.orange.shade100,
                            child: Center(
                                child: Text(
                                    "Food Image",
                                    style: TextStyle(fontSize: 20),
                                ),
                            ),
                        ),

                        SizedBox(height: 20),

                        Text(
                            "Veg Pizza",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                            ),
                        ),

                        Text(
                            "250",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.green,
                            ),
                        ),
                        SizedBox(height: 30),

                        ElevatedButton(
                            onPressed: () {
                                
                            },
                            child: Text("Add To Cart"),
                        ),
                    ],
                ),
            ),
        );
    }
}