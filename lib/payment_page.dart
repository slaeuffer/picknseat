import 'package:flutter/material.dart';



class MyPaymentPage extends StatefulWidget {
  const MyPaymentPage({Key key}) : super(key: key);

  @override
  State<MyPaymentPage> createState() => _MyPaymentPageState();
}

class _MyPaymentPageState extends State<MyPaymentPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController cartnumberController = TextEditingController();
  TextEditingController CVVController = TextEditingController();
  TextEditingController ExpiryDateController = TextEditingController();
  int _value=1;
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('Payment Information'),
      ),
      body: Column(
        children: [
          Column(
              children: [
                ListTile(
                  title: Text('VISA'),
                  leading: Radio(
                    value: 1,
                    groupValue:_value ,
                    onChanged: (int value) {
                      setState(() {
                        _value = value;
                      });
                    },

                  ),
                ),
                ListTile(
                  title: Text('MASTER CARD'),
                  leading: Radio(
                    value: 2,
                    groupValue:_value ,
                    onChanged: (int value) {
                      setState(() {
                        _value = value;
                      });
                    },

                  ),
                )

              ]
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Text('Card Information', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),),

          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 20),
            child: TextFormField(
              controller: userController,
              decoration: InputDecoration(
                labelText: 'Full name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Text('Card number', style: TextStyle( fontSize: 15,),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 20),
            child: TextFormField(
              controller: cartnumberController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '1234 1234 1234 1234',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Text('CVV', style: TextStyle( fontSize: 15,),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 20),
            child: TextFormField(
              controller: CVVController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '123',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Text('Expiry Date', style: TextStyle( fontSize: 15,),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 20),
            child: TextFormField(
              controller: ExpiryDateController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '12/34 ',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 10),
              child: ElevatedButton(
                child: Text("Confirm"),
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          MyPaymentPage()));
                },
              )
          ),
        ],
      ),
    );
  }
}
