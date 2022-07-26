import 'package:english_words/english_words.dart' as english_generator;
import 'package:russian_words/russian_words.dart' as russian_generator;

Iterable<String> generateRandomWordPairs(bool isEnglish, int pairsAmount) {
  if (isEnglish) {
    return english_generator
        .generateWordPairs()
        .take(pairsAmount)
        .map((value) => value.asPascalCase);
  } else {
    return russian_generator
        .generateWordPairs()
        .take(pairsAmount)
        .map((value) => value.asPascalCase);
  }
}
