// lib/screens/home_screen.dart
import '../imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Juego Educativo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10.0),
              FutureBuilder(
                // Use FutureBuilder for async loading
                future: _loadGameCardData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Muestra un CircularProgressIndicator mientras carga
                    return CircularProgressIndicator();
                  } else {
                    // Muestra los GameCards una vez cargados los datos
                    return Column(
                      children: [
                        _buildGameCard(
                          context,
                          'Nivel 1 (Hasta 4 letras)',
                          'Descripción del Nivel 1...',
                          1,
                          const Color(0xFFD500F9),
                          'avatar1',
                        ),
                        _buildGameCard(
                          context,
                          'Nivel 2 (De 5 a 10 letras)',
                          'Descripción del Nivel 2...',
                          2,
                          const Color(0xFF2979FF),
                          'avatar2',
                        ),
                        _buildGameCard(
                          context,
                          'Nivel 3 (Más de 10 letras)',
                          'Descripción del Nivel 3...',
                          3,
                          const Color(0xFF64FFDA),
                          'avatar3',
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        // Agrega la barra de navegación inferior convexa
        items: const [
          TabItem(icon: Icons.home, title: 'Inicio'),
          TabItem(icon: Icons.search, title: 'Buscar'),
          TabItem(icon: Icons.person, title: 'Perfil'),
        ],
        onTap: (int index) {
          // Maneja la navegación según la pestaña seleccionada
          // Puedes implementar lógica específica aquí
        },
      ),
    );
  }

  Future<void> _loadGameCardData() async {
    // Simula la carga de datos asíncrona
    await Future.delayed(Duration(seconds: 2));
  }

  Widget _buildGameCard(BuildContext context, String title, String description,
      int level, Color backgroundColor, String avatarName) {
    return GameCard(
      title: title,
      description: description,
      level: level,
      backgroundColor: backgroundColor,
      avatarName: avatarName,
      onPressed: () => _startGame(context, level),
    );
  }

  void _startGame(BuildContext context, int level) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen(level)),
    );
  }
}
