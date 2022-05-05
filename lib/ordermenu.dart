import 'package:flutter/material.dart';
import 'main.dart';
import 'products.dart';
import 'globals.dart';
import 'package:badges/badges.dart';
import 'cart.dart';
import 'class/Shop.dart';
import 'class/Item.dart';

class OrderMenue extends StatefulWidget {

  @override
  State<OrderMenue> createState() => _OrderMenueState();

  Globals globalvars;
  OrderMenue(this.globalvars);
}

class _OrderMenueState extends State<OrderMenue> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Order'),
            actions: [
              Badge(
                position: BadgePosition.topEnd(top:5, end: 5),
                badgeColor: Colors.deepPurple,
                badgeContent: Text((widget.globalvars ?? new Globals()).cart_count.toString(), style: TextStyle(color: Colors.white)),
                child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () async {
                  await Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) => CartMenu(widget.globalvars)));
                  setState(() {});
                },),
              ),
              IconButton(icon: Icon(Icons.search), onPressed: () => {},)
            ]

        ),
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
                    child: Image.asset("assets/default-avatar.png",)
                  ),
                ),
              ),
              ListTile(
                title: const Text('Log off'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) => SignIn()));
                },
              ),
            ],
          )
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [for (var i = 0; i < widget.globalvars.shops.length; i++) shopCard(widget.globalvars.shops[i])],
          ),
        ),

    );
  }
  
  Widget shopCard(Shop shop) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 8),
        child: Card(
            child: InkWell(
              onTap: () => goToShop(shop),
              child: Row(
                  children: [
                    Image.asset(shop.picturePath, scale:1.7),
                    Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(shop.nameShop, style: TextStyle(fontSize: 18.0),),
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

  void goToShop(Shop shop) {
    Navigator.pushReplacement(context, MaterialPageRoute<void>(
        builder: (BuildContext context) => ProductsMenu(widget.globalvars, shop)));
  }
}
