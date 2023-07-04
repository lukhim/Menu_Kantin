import 'package:menu_kantin/helpers/user_info.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    if (username == 'lukman' && password == '12345') {
      await UserInfo().setToken("Lukmanul Hakim");
      await UserInfo().setuserID("19210866");
      await UserInfo().setusername("lukman");
      isLogin = true;

    } else if (username == 'admin' && password == 'admin') {
      await UserInfo().setToken("admin");
      await UserInfo().setuserID("1");
      await UserInfo().setusername("admin");
      isLogin = true;
    }
    return isLogin;
  }
}


