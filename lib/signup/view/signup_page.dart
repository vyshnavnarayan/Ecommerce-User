
import 'package:ecommerce_user/login/view/login_page.dart';
import 'package:ecommerce_user/signup/repository/signup_repo.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPaswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blueAccent],
          ),
        ),
        child: 
        SingleChildScrollView(
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(35),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Name',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.blue.shade200,
                            hintText: 'Enter your Name',
                            hintStyle: TextStyle(color: Colors.white60)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Phone No',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _phoneNoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.blue.shade200,
                            hintText: 'Enter your Phone number',
                            hintStyle: TextStyle(color: Colors.white60)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.blue.shade200,
                            hintText: 'Enter your Email',
                            hintStyle: TextStyle(color: Colors.white60)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.blue.shade200,
                            hintText: 'Enter your Password',
                            hintStyle: TextStyle(color: Colors.white60)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: _confirmPaswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                            filled: true,
                            fillColor: Colors.blue.shade200,
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(color: Colors.white60)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()){
                             await UserSignup().createUser(_emailController.text, _passwordController.text, _nameController.text, _phoneNoController.text, context);
                            };
                          },
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              // color: Colors.indigoAccent.shade200
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Alraedy have an Account ?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
