import 'package:flutter/material.dart';

class PaginaTours extends StatelessWidget {
  const PaginaTours({super.key});

  @override
  Widget build(BuildContext context) {
    return const ToursHomePage();
  }
}

class ToursHomePage extends StatelessWidget {
  const ToursHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Alejandro Aceves 6J',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeroSection(),
              const SizedBox(height: 25),
              const Text(
                'Podría interesarte',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detalle');
                },
                child: _buildCityCard(
                  cityName: 'Barcelona',
                  imageUrl: 'https://images.unsplash.com/photo-1583422409516-2895a77efded?q=80&w=400&auto=format&fit=crop',
                  activities: [
                    'La cocina de Barcelona de cerca',
                    'Espectáculos de flamenco y tapas',
                    'Tours guiados por la Sagrada...',
                  ],
                ),
              ),
              const SizedBox(height: 15),
              _buildCityCard(
                cityName: 'Tokio',
                imageUrl: 'https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?q=80&w=400&auto=format&fit=crop',
                activities: [
                  'Tradición y cultura del sumo',
                  'Monte Fuji con un guía privado',
                  'Prueba las delicias de mariscos...',
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2E7D32),
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
              // Already on tours, do nothing
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
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=800&auto=format&fit=crop'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Reserva Cosas que hacer aprobadas por los viajeros',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar por destino',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCityCard({
    required String cityName,
    required String imageUrl,
    required List<String> activities,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 5,
                right: 5,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border, size: 16, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                ...activities.map((activity) => Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Text(
                        activity,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
