class StringHelper {
  /// Capitalized the all the first word in the sentence
  static String toTitleCase(String word) {
    final List<String> wordSplitted = word.split(' ');
    List<String> returnWord = [];
    for (String s in wordSplitted) {
      returnWord.add(s[0].toUpperCase() + s.substring(1));
    }
    return returnWord.join(' ').trim();
  }

  /// Capitalize word
  static String capitalize({required String word}) {
    return word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : word;
  }

  /// Decapitalize word
  static String decapitalize({required String word}) {
    return word.isNotEmpty ? word[0].toLowerCase() + word.substring(1) : word;
  }
}
