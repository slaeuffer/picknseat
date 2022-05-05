import 'package:flutter/material.dart';
import 'payment_page.dart';

class CartMenu extends StatefulWidget {
  const CartMenu({Key key}) : super(key: key);

  @override
  _CartMenuState createState() => _CartMenuState();
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
        child: Column(
          children: [
            Spacer(),
            TextButton(
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
            TextButton(
              child: const Text('Order', style: TextStyle(fontSize: 20)),
              onPressed: () {},
            ),
          ],
        )
      ),

    );;
  }
}
