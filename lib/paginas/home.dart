import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alejandro Aceves 6J'),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      '¿Estás Aburrido?',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A2A3A),
                      ),
                    ),
                    const Text(
                      'Encuentra esto y más',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: [
                        _buildCategoryCard('Cultura', 'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?q=80&w=500'),
                        _buildCategoryCard('Agua', 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=500'),
                        _buildCategoryCard('Al aire libre', 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?q=80&w=500'),
                        _buildCategoryCard('Comida', 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=500'),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Comprueba nuestra\nvariedad de\nactividades.',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A2A3A),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            _buildBottomNav(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          shadows: [Shadow(blurRadius: 4, color: Colors.black)],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      height: 85,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(context, Icons.search, 'EXPLORAR', '/home', isActive: true),
          _navItem(context, Icons.near_me_outlined, 'TOURS', '/tours'),
          _navItem(context, Icons.chat_bubble_outline, 'RESEÑAS', '/resenas'),
          _navItem(context, Icons.account_circle_outlined, 'CUENTA', '/bienvenida'),
        ],
      ),
    );
  }

  Widget _navItem(BuildContext context, IconData icon, String label, String route, {bool isActive = false}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isActive ? const Color(0xFF2E7D32) : Colors.black45, size: 30),
          Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: isActive ? const Color(0xFF2E7D32) : Colors.black45)),
        ],
      ),
    );
  }
}
