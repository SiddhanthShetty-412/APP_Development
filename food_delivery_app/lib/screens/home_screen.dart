import "package:flutter/material.dart";
import "restraunt_screen.dart";
class HomeScreen extends StatefulWidget{
    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    final List<String> categories = [
        "Pizza",
        "Burger",
        "Biryani",
        "Drinks"
    ];
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Hi User 👋"),
                backgroundColor: Colors.orange,
            ),
            body: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    children: [
                        TextField(
                            decoration: InputDecoration(
                                labelText: "Search Food",
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(),
                            ),
                        ),
                        SizedBox(height: 20),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "Food Categories",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                    return Container(
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.orange.shade100,
                                            borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                            child: Text(categories[index]),
                                        ),
                                    );
                                },
                            ),
                        ),
                        SizedBox(height: 20),

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "Popular Resturants",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        ),
                        SizedBox(height: 10),
                        Card(
                            child: ListTile(
                                leading: Icon(Icons.store),
                                title: Text("Pizza Palace"),
                                subtitle: Text("Best Pizza in Town"),
                                trailing: Icon(Icons.arrow_forward),
                                onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context)=> RestrauntScreen()
                                        ),
                                    );
                                },
                            ),
                        ),
                    ]
                )
            )
        );
    }
}