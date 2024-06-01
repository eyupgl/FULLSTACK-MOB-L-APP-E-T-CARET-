import 'package:flutter/material.dart';
import 'package:untitled1/components/my_button.dart';
import 'package:untitled1/components/my_textfield.dart';
import 'package:untitled1/services/auth/auth_service.dart';


class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final  emailController=  TextEditingController();
  final  passwordController=  TextEditingController();
  //login method

  void login() async{
    //get instance of auth service
    final _authService =AuthService();

    //try sign in
    try{
      await _authService.singInWithEmailPassword(
          emailController.text,
          passwordController.text,
      );
    }
    //display any errors
    catch(e){
      showDialog(
          context: context,
          builder: (context) =>AlertDialog(
            title: Text(e.toString()),
          ),
      );
    }
  }
  //forget password
  void forgotPw(){
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
         backgroundColor: Theme.of(context).colorScheme.background,
          title:const Text("Şifremi unuttum."),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
                Icons.lock_open_rounded,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),
            //mesaj
            Text(
              "Gurme Fırın Uygulaması",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            //email
            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
            ),

            const SizedBox(height: 10),

            //password
            MyTextField(
              controller: passwordController,
              hintText: "Şifre",
              obscureText: true,
            ),

            const SizedBox(height: 10),
            //giriş butonu
            MyButton(
              text: "Giriş Yap",
                onTap: login,
            ),
            const SizedBox(height: 25),

            //not a remember
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Üye Değil misin?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap:widget.onTap,
                  child: Text(
                      "Üye ol..",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight:FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


