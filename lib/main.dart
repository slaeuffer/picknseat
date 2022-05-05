import 'package:flutter/material.dart';
import 'ordermenu.dart';
import 'globals.dart';
import 'class/Item.dart';
import 'class/Shop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picknseat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
    );

  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Globals globalvars = new Globals();
    globalvars.cart_count = 0;
    globalvars.cart_list = [];
    Item bigmac = Item('1', 'Big Mac', 'assets/bigmac.png', '1', '5€');
    Item woop = Item('2', 'Double Whooper', 'assets/double_whopper.png', '1', '5€');




    Shop mcdo = Shop('1', 'Mc Donalds', 'assets/1.png', [bigmac]);
    Shop bk = Shop('2', 'Burger King', 'assets/2.png', [bigmac, woop]);
    Shop kfc = Shop('3', 'KFC', 'assets/3.png', [woop]);
    Shop starb = Shop('4', 'Starbucks', 'assets/4.png', [bigmac]);
    globalvars.shops.add(mcdo);
    globalvars.shops.add(bk);
    globalvars.shops.add(kfc);
    globalvars.shops.add(starb);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: Text('Welcome'),
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text:"Sign in"),
                  Tab(text:"Sign up"),
                ]
              )
          ),
          body: TabBarView(
            children: [
              Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top:20),
                      child: TextFormField(
                        controller: userController,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top:20),
                      child:TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 50, right: 50, top:10),
                        child: ElevatedButton(
                          child: Text("Sign in"),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute<void>(
                                builder: (BuildContext context) => OrderMenue(globalvars)));
                          },
                        )
                    ),
                  ],
              ),
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top:20),
                  child: TextFormField(
                    controller: userController,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top:20),
                  child:TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top:20),
                  child:TextFormField(
                    controller: password2Controller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 50, right: 50, top:10),
                    child: ElevatedButton(
                      child: Text("Sign in"),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) => OrderMenue(globalvars)));
                        },
                    ),
                ),
              ],)
            ],
          )
        ),
    );
  }
}
