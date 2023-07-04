import 'package:flutter/material.dart';
import 'package:menu_kantin/helpers/user_info.dart';
import 'package:menu_kantin/widget/sidebar.dart';


class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String? token;
  String? userID;
  String? username;

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    final userInfo = UserInfo();
    token = await userInfo.getToken();
    userID = await userInfo.getuserID();
    username = await userInfo.getusername();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text('Account Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              // Add your profile picture here
              backgroundImage: AssetImage('assets/profile_picture.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              username ?? '',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Nama: $token',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'User ID: $userID',
              style: const TextStyle(fontSize: 18),
            ),
            // Display other user information here
          ],
        ),
      ),
    );
  }
}