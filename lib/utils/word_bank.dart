import 'dart:math';

class WordBank {
  static final List<String> _words = [
    'gato',
    'perro',
    'sol',
    'flor',
    'libro',
    'mesa',
    'ratón',
    'pez',
    'luz',
    'lago',
    'sol',
    'olla',
    'pan',
    'puerta',
    'agua',
    'computadora',
    'elefante',
    'dinosaurio',
    'manzana',
    'banana',
    'bicicleta',
    'helado',
    'camión',
    'pájaro',
    'mariposa',
    'tigre',
    'león',
    'jirafa',
    'robot',
    'montaña',
    'arcoiris',
    'helicóptero',
    'paraguas',
    'teléfonos',
    'Mariposas',
    'Orangutanes',
    'telescopios',
    'elefantes',
    'dinosaurios',
    'computación',
    'Cocodrilos',
    'complejidad',
    'abecedario',
    'plutonianos',
    'cartucheras',
    'complejidad ',
    'exploracion',
    'innovaciones',
    'biodiversidad',
    'herramientas',
    'contaminacion'
  ];

  static Set<String> _selectedWords = {};

  static String getRandomWord(int level) {
    List<String> filteredWords = _words.where((word) {
      if (_selectedWords.contains(word)) {
        return false; // Evitar palabras ya seleccionadas
      }

      if (level == 1) {
        return word.length <= 4;
      } else if (level == 2) {
        return word.length > 4 && word.length < 10;
      } else {
        return word.length >= 10;
      }
    }).toList();

    if (filteredWords.isEmpty) {
      _resetSelectedWords(); // Reiniciar _selectedWords si no hay más palabras disponibles
      filteredWords = _words.where((word) {
        // Restablecer las palabras disponibles
        if (_selectedWords.contains(word)) {
          return false; // Evitar palabras ya seleccionadas
        }

        if (level == 1) {
          return word.length <= 4;
        } else if (level == 2) {
          return word.length > 4 && word.length < 10;
        } else {
          return word.length >= 10;
        }
      }).toList();
    }

    final random = Random();
    String selectedWord = filteredWords[random.nextInt(filteredWords.length)];

    _selectedWords
        .add(selectedWord); // Agregar la palabra seleccionada al conjunto

    return selectedWord;
  }

  static void _resetSelectedWords() {
    _selectedWords.clear(); // Reiniciar el conjunto de palabras seleccionadas
  }
}
