import 'package:flutter/material.dart';
import 'package:menu_kantin/ui/menu_page.dart';
import 'package:menu_kantin/ui/login.dart';
import 'package:menu_kantin/ui/account.dart';
import 'package:menu_kantin/helpers/user_info.dart';
import 'package:menu_kantin/models/user_info_data.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<UserInfoData>(
        future: loadUserInfo(),
        builder: (BuildContext context, AsyncSnapshot<UserInfoData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final userInfo = snapshot.data!;
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(userInfo.username ?? 'Username'),
                  accountEmail: Text(userInfo.userID ?? 'User ID'),
                ),
                ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text("Menu"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text("Akun"),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => AccountPage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout_rounded),
                  title: Text("Keluar"),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                            (Route<dynamic> route) => false);
                  },
                )
                // Add more sidebar items here
              ],
            );
          }
        },
      ),
    );
  }

  Future<UserInfoData> loadUserInfo() async {
    final userInfo = UserInfo();
    final token = await userInfo.getToken();
    final userID = await userInfo.getuserID();
    final username = await userInfo.getusername();
    return UserInfoData(token: token, userID: userID, username: username);
  }
}