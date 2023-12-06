// lib/screens/game_screen.dart
import '../imports.dart';

class GameScreen extends StatefulWidget {
  final int level;

  const GameScreen(this.level, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _currentLevel = 1;
  String _currentWord = '';
  double _score = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _currentLevel = widget.level;
    _loadWord();
  }

  Future<void> _loadWord() async {
    // Simula la carga de datos asíncrona
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _currentWord = WordBank.getRandomWord(_currentLevel);
      _isLoading = false;
    });
  }

  void _nextWord() {
    if (_score >= 100) {
      _showGameEndDialog('¡Felicidades! Has completado el juego.');
      _score = 0;
      _isLoading = true;
      _loadWord();
    } else {
      setState(() {
        _score += 10;

        if (_score > 100) {
          _score = 100;
        }

        _loadWord();
      });
    }
  }

  void _showGameEndDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Fin del Juego'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
              ),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nivel $_currentLevel',
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue, size: 40.0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.blue, size: 30.0),
            onPressed: () {},
          ),
        ],
        backgroundColor: const Color(0xFFBBDEFB),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo2.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/avatar$_currentLevel.jpg'),
                        radius: 40.0,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CircularPercentIndicator(
                    radius: 120.0,
                    lineWidth: 15.0,
                    percent: _score / 100,
                    center: Text(
                      '${_score.toInt()}%',
                      style: TextStyle(
                          fontSize: 80.0,
                          color: Color.fromARGB(255, 194, 207, 20)),
                    ),
                    progressColor:
                        _score < 70 ? Color(0xFF448AFF) : Color(0xFF7E57C2),
                    backgroundColor: Colors.white,
                    circularStrokeCap: CircularStrokeCap.butt,
                  ),
                  SizedBox(height: 20), // Aumenté el espacio hacia abajo
                  _isLoading
                      ? CircularProgressIndicator() // Muestra el spinner mientras se carga
                      : WordDisplay(_currentWord,
                          fontSize: 80.0), // Aumenté el tamaño del texto
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _nextWord,
                    child: Text(
                      'Siguiente Palabra',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
