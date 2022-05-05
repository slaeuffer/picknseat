import 'package:flutter/material.dart';
import 'package:picknsteat/cart.dart';
import 'ordermenu.dart';
import 'package:badges/badges.dart';
import 'globals.dart';
import 'class/Item.dart';
import 'class/Shop.dart';

class ProductsMenu extends StatefulWidget {

  @override
  _ProductsMenuState createState() => _ProductsMenuState();

  Globals globalvars;
  Shop current_shop;
  ProductsMenu(this.globalvars, this.current_shop);
}


class _ProductsMenuState extends State<ProductsMenu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute<void>(
                builder: (BuildContext context) => OrderMenue(widget.globalvars)));
            },
          ),
          title: Text(widget.current_shop.nameShop),
          actions: [
            Badge(
              position: BadgePosition.topEnd(top:5, end: 5),
              badgeColor: Colors.deepPurple,
              badgeContent: Text((widget.globalvars ?? new Globals()).cart_count.toString(), style: TextStyle(color: Colors.white)),
              child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () => {
                Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) => CartMenu(widget.globalvars)))
              },),
            ),
            IconButton(icon: Icon(Icons.search), onPressed: () => {},)
          ]

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [for (var i = 0; i < widget.current_shop.listItem.length; i++) item(widget.current_shop.listItem[i])]
        ),
      ),

    );
  }

  Widget item(Item item) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 8),
      child: Card(
          child: InkWell(
            onTap: () => addToCart(item),
            child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(item.nameItem, style: TextStyle(fontSize: 18.0),),
                  ),
                  Spacer(),
                  Image.asset(item.picturePath, scale:1.7),
                ]
            ),
          )
      ),
    );
  }

  void addToCart(Item item) {
      setState(() {
        widget.globalvars.cart_count += 1;
        widget.globalvars.cart_list.add(item);
      });
  }
}