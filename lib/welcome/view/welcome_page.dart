import 'package:ecommerce_user/login/view/login_page.dart';
import 'package:ecommerce_user/signup/view/signup_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: 
        SafeArea(
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Hello There!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "You never get a second chance to make a great first impression",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.grey[700], fontSize: 15),
                          ),
                        ],
                      ),
                      Image.asset('assets/image/ecommerce.png'),
                      // Container(
                      //   height: 100,
                      //   decoration: BoxDecoration(
                      //     // color: Colors.blueAccent,
                      //       image: DecorationImage(
                      //           image: AssetImage('assets/image/ecommerce.png'))),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Container(
                          child: Column(
                            children: [
                              MaterialButton(
                                elevation: 20,
                                minWidth: double.infinity,
                                height: 60,
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                                },
                                color: Colors.indigoAccent[400],
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(40)),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white70),
                                ),
                              ),
                              SizedBox(height: 10,),
                              MaterialButton(
                                elevation: 30,
                                minWidth: double.infinity,
                                height: 60,
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                                },
                                color: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                child: Text(
                                  "Sign UP",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]))),
      
    );
  }
}
