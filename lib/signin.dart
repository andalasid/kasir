import 'package:flutter/material.dart';
import 'package:kasir/signup.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Color warnaTema = Colors.pink;
  double lengkung = 10;
  Color warnaSecondTema = Colors.red;
  bool isSecured = true;
  double ukuranIcon = 25;

  Widget toggleSecurity() {
    return IconButton(
      color: warnaTema,
      icon: Icon(isSecured ? Icons.visibility_off : Icons.visibility),
      onPressed: () {
        setState(
          () {
            isSecured = !isSecured;
          },
        );
      },
    );
  }

  void customSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.close, color: Colors.green),
          const SizedBox(width: 10),
          Text(message),
        ],
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blueGrey,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'SIGN IN FORM',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: warnaTema),
                    borderRadius: BorderRadius.circular(lengkung),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: warnaSecondTema,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(lengkung),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    size: ukuranIcon,
                    color: warnaTema,
                  ),
                  labelText: "Email"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: isSecured,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: warnaTema),
                    borderRadius: BorderRadius.circular(lengkung),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: warnaSecondTema,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(lengkung),
                  ),
                  prefixIcon: Icon(
                    Icons.key,
                    size: ukuranIcon,
                    color: warnaTema,
                  ),
                  suffixIcon: toggleSecurity(),
                  labelText: "Password"),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Lupa Email/Password'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.isEmpty) {
                  customSnackBar(context, 'Kolom Email Tidak Boleh Kosong');
                } else if (passwordController.text.isEmpty) {
                  customSnackBar(context, 'Kolom Password Tidak Boleh Kosong');
                } else {
                  debugPrint('Email: ${emailController.text}');
                  debugPrint('Password: ${passwordController.text}');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: warnaTema,
                fixedSize: const Size(1000, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(lengkung),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                );
              },
              child: const Text('Daftar Disini Jika Belum Punya Akun'),
            )
          ],
        ),
      ),
    );
  }
}
