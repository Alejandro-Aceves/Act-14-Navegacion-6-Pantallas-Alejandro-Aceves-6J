import 'package:flutter/material.dart';
import 'package:myapp/paginas/bienvenida.dart';
import 'package:myapp/paginas/login.dart';
import 'package:myapp/paginas/home.dart';
import 'package:myapp/paginas/detail.dart';
import 'package:myapp/paginas/resenas.dart';
import 'package:myapp/paginas/tours.dart';

void main() {
  runApp(const MiAppAceves());
}

class MiAppAceves extends StatelessWidget {
  const MiAppAceves({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Aceves Alejandro',
      // Ruta inicial
      initialRoute: '/home',
      // Definición de las rutas
      routes: {
        '/bienvenida': (context) => const Pagina1(),
        '/login': (context) => const Pagina2(),
        '/resenas': (context) => const EscribirOpinionScreen(),
        '/home': (context) => const HomePage(),
        '/tours': (context) => const ToursHomePage(),
        '/detalle': (context) => const DetailTourScreen(),
      },
    );
  }
}
