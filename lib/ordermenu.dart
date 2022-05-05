import 'package:flutter/material.dart';
import 'package:picknsteat/profile.dart';
import 'main.dart';
import 'products.dart';
import 'globals.dart';
import 'package:badges/badges.dart';
import 'cart.dart';

class OrderMenu extends StatelessWidget {
  OrderMenu(Globals glovalvars);
  Globals globalvars;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picknseat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderMenue(globalvars),
    );
  }
}

class OrderMenue extends StatefulWidget {
  OrderMenue(Globals globalvars, {Key key}) : super(key: key);
  Globals globalvars;

  @override
  State<OrderMenue> createState() => _OrderMenueState();
}

class _OrderMenueState extends State<OrderMenue> {
  Globals globalvars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order'), actions: [
        Badge(
          position: BadgePosition.topEnd(top: 5, end: 5),
          badgeColor: Colors.deepPurple,
          badgeContent: Text(
              (globalvars ?? new Globals()).cart_count.toString(),
              style: TextStyle(color: Colors.white)),
          child: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => CartMenu()))
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => {},
        )
      ]),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: CircleAvatar(
              radius: 16,
              child: ClipRRect(
                  child: Image.asset(
                "assets/default-avatar.png",
              )),
            ),
          ),
          ListTile(
            title: const Text('Log off'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => SignIn()));
            },
          ),
          ListTile(
            title: const Text('My Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => Profile()));
            },
          ),
        ],
      )),
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
        child: Row(children: [
          Image.asset("assets/" + idShop.toString() + ".png", scale: 1.7),
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txt,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      "Fast food",
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 14,
                          ),
                          Text('4.3')
                        ],
                      ))
                ],
              )),
          Padding(
              padding: EdgeInsets.only(left: 100),
              child: Icon(Icons.arrow_forward_ios))
        ]),
      )),
    );
  }

  void goToShop() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => ProductsMenu(globalvars)));
  }
}
