import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailC = TextEditingController();
  String? warnaKesukaan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: Column(
          children: [
            const Text("Silahkan isi form di bawah"),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: emailC,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              value: warnaKesukaan,
              icon: const Icon(Icons.menu),
              underline: Container(
                height: 2,
                color: Colors.black54,
              ),
              items: const [
                DropdownMenuItem<String>(
                  value: "Merah",
                  child: Text("Merah"),
                ),
                DropdownMenuItem<String>(
                  value: "Hijau",
                  child: Text("Hijau"),
                ),
                DropdownMenuItem<String>(
                  value: "Kuning",
                  child: Text("Kuning"),
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  warnaKesukaan = newValue;
                });
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Check Data"))
          ],
        ),
      ),
    );
  }
}
