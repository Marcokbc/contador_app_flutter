import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpity => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFCFF7FF),
        appBar: AppBar(
          backgroundColor: Color(0xFF054D5C),
          title: Text('CONTROLE DE ENTRADA'),
        ),
        drawer: Drawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              child: Image.asset('assets/images/vendedor.png'),
            ),
            Text(
              isFull ? 'Lotado' : 'Pode entrar!',
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpity ? null : decrement,
                  style: TextButton.styleFrom(
                      backgroundColor: isEmpity ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24))),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24))),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

