import 'package:flutter/material.dart';

class Pagina1 extends StatelessWidget {
  const Pagina1({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomeScreen();
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  final TextStyle titleStyle = const TextStyle(
    fontSize: 55,
    fontWeight: FontWeight.w900,
    letterSpacing: 2,
    color: Color(0xFF1A2A3A),
    height: 1.1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alejandro Aceves 6J'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('LIFE', style: titleStyle),
                    const SizedBox(width: 15),
                    Container(
                      width: 100,
                      height: 6,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A2A3A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('TOURS', style: titleStyle),
                    const SizedBox(width: 15),
                    Container(
                      width: 60,
                      height: 6,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A2A3A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 80),

            _buildCustomButton(
              text: 'Crear Cuenta',
              onPressed: () {
                //Navigator.pushNamed(context, '/tercera');
              },
            ),

            const SizedBox(height: 40),

            const Text(
              'Ya tienes cuenta?',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),

            const SizedBox(height: 15),

            _buildCustomButton(
              text: 'Iniciar Sesión',
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2E7D32),
        unselectedItemColor: Colors.black45,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: 3, // Set to 3 for Account
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 28), label: 'EXPLORAR'),
          BottomNavigationBarItem(icon: Icon(Icons.near_me_outlined, size: 28), label: 'TOURS'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline, size: 28), label: 'RESEÑAS'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle, size: 30), label: 'CUENTA'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/tours');
              break;
            case 2:
              Navigator.pushNamed(context, '/resenas');
              break;
            case 3:
              // Already on account, do nothing
              break;
          }
        },
      ),
    );
  }

  Widget _buildCustomButton({required String text, required VoidCallback onPressed}) {
    return SizedBox(
      width: 250,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFDDEEEA),
          foregroundColor: Colors.black,
          elevation: 0,
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.black12),
        ),
        child: Text(text, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
