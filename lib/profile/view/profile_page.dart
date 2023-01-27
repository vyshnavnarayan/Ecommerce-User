import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: 
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(backgroundImage: NetworkImage('https://static.toiimg.com/photo/80482428.cms?imgsize=99038'),),
                Text('User name'),
                Text('Email id')
              ],
            ),
              
            ),
            SizedBox(height: 20,),
           ListTile(title: Text('Your Orders'),trailing: Icon(Icons.navigate_next),),
           ListTile(title: Text('Shipping Address'),trailing: Icon(Icons.navigate_next),),
           ListTile(title: Text('Accounts'),trailing: Icon(Icons.navigate_next),),
           ListTile(title: Text('Gift Cards & Vouchers'),trailing: Icon(Icons.navigate_next),),
           ListTile(title: Text('Settings'),trailing: Icon(Icons.navigate_next),),
           ListTile(title: Text('Help & Support'),trailing: Icon(Icons.navigate_next),),
          ElevatedButton(onPressed: () {
            
          }, child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}