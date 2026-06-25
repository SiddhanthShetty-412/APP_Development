import "package:flutter/material.dart";
import "food_screen.dart";
class RestrauntScreen extends StatefulWidget {
    @override
    State<RestrauntScreen> createState()=> _RestrauntScreenState();
}

class _RestrauntScreenState extends State<RestrauntScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Pizza Palace"),
            ),
            body: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    children: [
                        Container(
                            height: 180,
                            color: Colors.orange.shade100,
                            child: Center(
                                child: Text(
                                    "Resturant Image",
                                    style: TextStyle(fontSize: 20),
                                ),
                            ),
                        ),

                        SizedBox(height: 20),

                        ListTile(
                            title: Text("Veg Pizza"),
                            subtitle: Text("₹250"),
                            trailing: Icon(Icons.arrow_forward),
                            onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FoodScreen(),
                                    ),
                                );
                            },
                        ),
                    ],
                ),
            ),
        );
    }
}