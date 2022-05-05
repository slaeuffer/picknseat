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
        child: SingleChildScrollView(
            child: Column(
              children: [
                for (var cartitem in widget.globalvars.cart_list) Container(child: displayItem(cartitem), height: 130),
                //Spacer(),
                Container(
                  height:50,
                  child: TextButton(
                    child: const Text('Payment Details'),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.blue,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) => MyPaymentPage()));
                    },
                  ),
                ),
                Container(
                  height:50,
                  child: TextButton(
                    child: const Text('Order', style: TextStyle(fontSize: 20)),
                    onPressed: () {},
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

  Widget displayItem(Item item) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 8),
      child: Card(
          child: InkWell(
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
}
