import "package:flutter/material.dart";

class CartScreen extends StatefulWidget {
    @override
    State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("My Screen"),
            ),
            body: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                    children: [
                        ListTile(
                            title: Text("Veg Pizza"),
                            subtitle: Text("₹250"),
                            trailing: Text("x1"),
                        ),
                        Divider(),
                        SizedBox(height: 20),

                        Text(
                            "Total: ₹250",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        SizedBox(height: 20),

                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Check out"),
                        )
                    ],
                ),
            ),
        );
    }
}