import 'package:flutter/material.dart';

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
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top:20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top:20),
                      child:TextFormField(
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
                          },
                        )
                    ),
                  ],
              ),
              Center(child: Text("Sign up")),
            ],
          )
        ),
    );
  }
}
