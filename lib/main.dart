import 'package:flutter/material.dart';
import 'ordermenu.dart';

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
                    Center(child: Text("//Sign in")),
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
                                builder: (BuildContext context) => OrderMenu()));
                          },
                        )
                    ),
                  ],
              ),
              Column(children: [
                Center(child: Text("//Sign up")),
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
                            builder: (BuildContext context) => OrderMenu()));
                        },
                    ),
                ),
              ],)
            ],
          )
        ),
    );
  }

  void login() {

  }
}
