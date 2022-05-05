import 'package:flutter/material.dart';
import 'payment_page.dart';
import 'class/Shop.dart';
import 'class/Item.dart';
import 'globals.dart';

class CartMenu extends StatefulWidget {
  @override
  _CartMenuState createState() => _CartMenuState();

  Globals globalvars;
  CartMenu(this.globalvars);

}

class _CartMenuState extends State<CartMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Cart'),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () => {},)
          ]

      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: [
            SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < widget.globalvars.cart_list.length; i++) Container(child: displayItem(widget.globalvars.cart_list[i], i), height: 130),
                  ],
                )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  child: const Text('Order', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    setState(() {});
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) => MyPaymentPage()));
                  },
                ),
              )
            )
          ],
        )
      ),
    );
  }

  Widget displayItem(Item item, int nbItem) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 8),
      child: Card(
          child: InkWell(
            child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => {this.setState(() {
                        widget.globalvars.cart_list.removeAt(nbItem);
                        widget.globalvars.cart_count -= 1;
                        })
                      }
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
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
}
