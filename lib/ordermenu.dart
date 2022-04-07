import 'package:flutter/material.dart';

class OrderMenu extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picknseat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrderMenue(),
    );
  }
}

class OrderMenue extends StatefulWidget {
  const OrderMenue({Key key}) : super(key: key);

  @override
  State<OrderMenue> createState() => _OrderMenueState();
}

class _OrderMenueState extends State<OrderMenue> {

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
    );
  }
}
