
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String path = "lib/src/pages/login/signup1.dart";

  const LoginScreen({key});
  Widget _buildPageContent(BuildContext context) {

    
    return Container(
      color: Colors.blue.shade100,
      child: ListView(
        children: <Widget>[
          
          const SizedBox(
            height: 30.0,
          ),
          const CircleAvatar(
            maxRadius: 100,
            backgroundColor: Colors.transparent,
           backgroundImage: AssetImage('assets/img/car.jpg')
          ),
          const SizedBox(
            height: 30.0,
          ),
          _buildLoginForm(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FloatingActionButton(
                mini: true,
                onPressed: () {
                //  Navigator.pop(context);
                 Navigator.of(context).pushReplacementNamed('/fit');
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.arrow_back),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _buildLoginForm(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          ClipPath(
            
            child: Container(
              height: 300,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 90.0,
                  ),
                  
                      
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                    
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        style: const TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                            hintText: "Enter your Email",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: const Icon(
                              Icons.email,
                              color: Colors.blue,
                            )),
                      )),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                    child: Divider(
                      color: Colors.blue.shade400,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        style: const TextStyle(color: Colors.blue),
                          obscureText: true,
                        decoration: InputDecoration(
                            hintText: "password",
                            hintStyle: TextStyle(color: Colors.blue.shade200),
                            border: InputBorder.none,
                            icon: const Icon(
                              Icons.lock,
                              color: Colors.blue,
                            )),
                      )),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                    child: Divider(
                      color: Colors.blue.shade400,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.blue.shade600,
                child: const Icon(Icons.person),
              ),
            ],
          ),
          SizedBox(
            height: 420,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                         Navigator.of(context).pushReplacementNamed('/fit');
                },
                child: const Text("Sign Up", style: TextStyle(color: Colors.white70)),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: _buildPageContent(context),
    );
  }
}