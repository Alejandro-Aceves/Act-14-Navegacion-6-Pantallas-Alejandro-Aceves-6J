import 'package:flutter/material.dart';

class DetailTourScreen extends StatelessWidget {
  const DetailTourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Alejandro Aceves Cazares',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // Imagen superior con manejo de errores para DartPad
          Image.network(
            'https://images.unsplash.com/photo-1583422409516-2895a77efded?q=80&w=800&auto=format&fit=crop',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            // Si la imagen falla en DartPad, muestra este contenedor gris
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 250,
                color: const Color(0xFFE0E0E0),
                child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
              );
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Barcelona',
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Descubre la joya del Mediterráneo. Una ciudad donde la arquitectura de Gaudí se funde con la historia y playas vibrantes.',
                    style: TextStyle(fontSize: 18, color: Colors.black87, height: 1.4),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Actividades',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  
                  // Etiquetas de actividades (Chips)
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _buildActivityChip('Sagrada Familia'),
                      _buildActivityChip('Parque Güell'),
                      _buildActivityChip('Ruta de Tapas'),
                      _buildActivityChip('Museo Picasso'),
                    ],
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Botón Reservar al final del contenido
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDDEEEA),
                          foregroundColor: Colors.black,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('RESERVAR', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          
          // Barra de navegación inferior
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF1A2A3A),
            unselectedItemColor: Colors.black45,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: 1, // Set to 1 for Tours
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
                  Navigator.pushNamed(context, '/bienvenida');
                  break;
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActivityChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFDDEEEA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }
}
