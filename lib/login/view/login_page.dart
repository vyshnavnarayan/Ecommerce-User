import 'package:ecommerce_user/index/view/index_page.dart';
import 'package:ecommerce_user/signup/view/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool check1 = false;
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade200,
              Colors.blueAccent
            ],
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Text('Welcome Back!',style: TextStyle(
                            color: Colors.white))
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(padding: EdgeInsets.all(100)),
                      Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "This field can't be empty";
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email,color: Colors.white,),
                          filled: true,
                          fillColor: Colors.blue.shade200,
                          hintText: 'Enter your Email',
                          hintStyle: TextStyle(color: Colors.white60)
                          //  border: OutlineInputBorder(
                          //    borderRadius: BorderRadius.circular(10),
                          //  )
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return "This field can't be empty";
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.key,color: Colors.white,
                          ),
                          filled: true,
                          fillColor: Colors.blue.shade200,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white60)
                          //  border: OutlineInputBorder(
                          //    borderRadius: BorderRadius.circular(10),
                          //  )
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {}, child: Text('Forgot Password',style: TextStyle(color: Colors.white),)),
                        ],
                      ),
                      CheckboxListTile(checkColor: Colors.white,activeColor: Colors.transparent,value: check1,controlAffinity: ListTileControlAffinity.leading ,onChanged: (bool? value) {
                        setState((){
                          check1 = value!;
                        });
                      },
                      title: Text('Remember me',style: TextStyle(fontSize: 13,color: Colors.white),),),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                           try {
                  final auth = FirebaseAuth.instance;
                  final userRefferance =await auth.signInWithEmailAndPassword(
                    email: _emailController.text, password: _passwordController.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => IndexPage(),));
                            
                          }catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Invalid Email or Password')));
                };},
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              // color: Colors.indigoAccent.shade200
                            ),
                          ),
                        ),
                      ), SizedBox(height: 15,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sign in with',style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      SizedBox(height: 15,),
                 SizedBox(
                  height: 50,
                  child: SocialLoginButton(
              buttonType: SocialLoginButtonType.google,
              onPressed: () {},
            ),
                )
                    ],
                  ),
                ),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account ?",style: TextStyle(color: Colors.white),),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
