import 'package:flutter/material.dart';
import 'home_page.dart';

class OrderMenu extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picknseat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('Order'),
          actions: [
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () => {},),
            IconButton(icon: Icon(Icons.search), onPressed: () => {},)
          ]

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            shopCard(1, "McDonald's"),
            shopCard(2, "Burger King"),
            shopCard(1, "McDonald's"),
            shopCard(2, "Burger King"),
            shopCard(1, "McDonald's"),
            shopCard(2, "Burger King"),

          ],
        ),
      ),

    );
  }

  Widget shopCard(int idShop, String txt) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 8),
      child: Card(
          child: InkWell(
            onTap: goToShop,
            child: Row(
                children: [
                  Image.asset("assets/" + idShop.toString() + ".png", scale:1.7),
                  Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(txt, style: TextStyle(fontSize: 18.0),),
                          Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Text("Fast food", style: TextStyle(fontSize: 14.0, color: Colors.grey),),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Row(
                                children: [
                                  Icon(Icons.star, size: 14,),
                                  Text('4.3')
                                ],
                              )
                          )
                        ],
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: Icon(Icons.arrow_forward_ios)
                  )
                ]
            ),
          )
      ),
    );
  }

  void goToShop() {
    Navigator.pushReplacement(context, MaterialPageRoute<void>(
        builder: (BuildContext context) => MyHomePage()));
  }
}
