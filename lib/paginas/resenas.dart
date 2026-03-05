import 'package:flutter/material.dart';

class EscribirOpinionScreen extends StatefulWidget {
  const EscribirOpinionScreen({super.key});

  @override
  State<EscribirOpinionScreen> createState() => _EscribirOpinionScreenState();
}

class _EscribirOpinionScreenState extends State<EscribirOpinionScreen> {
  late final TextEditingController _opinionController;

  @override
  void initState() {
    super.initState();
    _opinionController = TextEditingController();
  }

  @override
  void dispose() {
    _opinionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Alejandro Aceves 6J',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "Escribe una opinion \n",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35)),
                    // --- TEXTFIELD SUPERIOR ---
                    _buildOpinionTextField(),

                    const SizedBox(height: 35),

                    // --- ICONO CENTRAL ---
                    const Center(
                      child: Column(
                        children: [
                          Icon(Icons.chat_bubble_outline,
                              size: 85, color: Color(0xFF2E7D32)),
                          SizedBox(height: 10),
                          Text(
                            'Coméntanos',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2E7D32)),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 45),

                    // --- FILA: TEXTO GRANDE + IMAGEN ---
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 300, // Matching the image height
                            decoration: BoxDecoration(
                              color: const Color(0xFF2E7D32), // Green background
                              borderRadius: BorderRadius.circular(12), // Matching image's border radius
                            ),
                            alignment: Alignment.center, // Center the text within the container
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: const Text(
                              'Queremos que escribas una opinión sobre nosotros',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                                color: Colors.white, // Changed text color for better contrast on green background
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=400', // Placeholder URL for image, updated to allowed URL
                              fit: BoxFit.cover,
                              height: 300,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // --- PREGUNTA FINAL (Ahora abajo del bloque anterior) ---
                    const Center(
                      // Wrapped the Text widget in a Center widget
                      child: Text(
                        'Porque, ¿A quién más podríamos pedirle consejos de viaje?',
                        textAlign: TextAlign.center, // Added textAlign to ensure text itself aligns if it wraps
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xFF2E7D32),
              unselectedItemColor: Colors.black45,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              currentIndex: 2, // Set to 2 for Reseñas
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
                    // Already on reseña, do nothing
                    break;
                  case 3:
                    Navigator.pushNamed(context, '/bienvenida');
                    break;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpinionTextField() {
    return TextField(
      controller: _opinionController,
      decoration: InputDecoration(
        hintText: 'Escribir una opinión',
        hintStyle: const TextStyle(fontSize: 17, color: Colors.black54),
        filled: true,
        fillColor: const Color(0xFFDDEEEA),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black12, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black12, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xFF2E7D32), width: 2.0), // Slightly thicker border on focus
        ),
        suffixIcon: const Icon(Icons.add, color: Colors.black87, size: 28),
      ),
      style: const TextStyle(fontSize: 17, color: Colors.black),
      maxLines: 1, // Restrict to a single line for a button-like appearance
    );
  }
}
