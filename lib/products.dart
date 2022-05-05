import 'package:flutter/material.dart';
import 'package:picknsteat/cart.dart';
import 'ordermenu.dart';
import 'globals.dart';

class ProductsMenu extends StatefulWidget {
  ProductsMenu(Globals globalvars, {Key key}) : super(key: key);
  Globals globalvars;


  @override
  _ProductsMenuState createState() => _ProductsMenuState();
}

class _ProductsMenuState extends State<ProductsMenu> {
  Globals globalvars;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute<void>(
                builder: (BuildContext context) => OrderMenu(globalvars)));
            },
          ),
          title: Text('Mc Donalds'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) => CartMenu()))
              },
            ),
            IconButton(icon: Icon(Icons.search), onPressed: () => {},)
          ]

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            item("bigmac", "Big Mac")

          ],
        ),
      ),

    );
  }

  Widget item(String idItem, String nameItem) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 8),
      child: Card(
          child: InkWell(
            onTap: () => addToCart(),
            child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(nameItem, style: TextStyle(fontSize: 18.0),),
                  ),
                  Spacer(),
                  Image.asset("assets/" + idItem.toString() + ".png", scale:1.7),
                ]
            ),
          )
      ),
    );
  }

  void addToCart() {

  }
}