import 'package:flutter/material.dart';
import 'package:untitled1/services/auth/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final  emailController=  TextEditingController();
  final  passwordController=  TextEditingController();
  final  confirmPasswordController= TextEditingController();

  //register method
  void register() async {
  //get auth service
    final _authService =AuthService();

    //check if passwords match -> create user
  if (passwordController.text == confirmPasswordController.text){
    //try creating user
    try{
      await _authService.singUpWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    }

    //display any errors
    catch(e){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

    //if passwords don't match -> show error
  else{
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Şifre eşleşmiyor"),
      ),
    );
  }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(height: 25),
                //mesaj
                Text(
                  "Size hesap oluşturalım",
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

                //password kontrol
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Şifre tekrar",
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                //sing up butonu
                MyButton(
                  text: "Üye Ol ",
                  onTap: register,
                ),
                const SizedBox(height: 25),

                //already have a account? Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Zaten bir hesabınız var mı?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap:widget.onTap,
                      child: Text(
                        "Şimdi giriş yap",
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
        ),
      ),
    );
  }
}
