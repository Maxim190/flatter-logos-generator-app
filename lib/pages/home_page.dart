import 'package:flutter/material.dart';
import '../words_generation/random_list_pairs_generator.dart';
import 'favorites_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isEnglish = false;
  final _suggestions = <String>{};
  final _savedSuggestions = <String>{};
  final ScrollController _controller = ScrollController();

  static const double DEFAULT_PADDING = 16.0;
  static const int GENERATE_ITEMS_COUNT = 10;
  final _listItemFont = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  final _switchFont = const TextStyle(
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Шанти Generator"),
          actions: [
            IconButton(onPressed: _pushSaved, icon: const Icon(Icons.favorite))
          ],
        ),
        body: Column(
          children: [
            Row(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(DEFAULT_PADDING, 0, 0, 0)),
              Text(
                isEnglish
                    ? "Generate russian logos"
                    : "Сгенерировать английские логотипы",
                style: _switchFont,
              ),
              Switch(value: isEnglish, onChanged: _onSwitchClicked)
            ]),
            Expanded(
                child: ListView.builder(
              controller: _controller,
              itemBuilder: (context, index) {
                if (index >= _suggestions.length) {
                  _suggestions.addAll(
                      generateRandomWordPairs(isEnglish, GENERATE_ITEMS_COUNT));
                }

                final currentSuggestionWord = _suggestions.elementAt(index);
                final inFavorites =
                    _savedSuggestions.contains(currentSuggestionWord);

                return generateListItem(
                    currentSuggestionWord,
                    inFavorites,
                    () => {
                          setState(() {
                            if (_savedSuggestions
                                .contains(currentSuggestionWord)) {
                              _savedSuggestions.remove(index);
                            } else {
                              _savedSuggestions.add(currentSuggestionWord);
                            }
                          })
                        });
              },
            ))
          ],
        ));
  }

  Widget generateListItem(
      String title, inFavorites, GestureTapCallback onTapCallback) {
    return ListTile(
      contentPadding: const EdgeInsets.all(DEFAULT_PADDING),
      title: Text(
        title,
        style: _listItemFont,
      ),
      trailing: Icon(
        inFavorites ? Icons.favorite : Icons.favorite_border,
        color: inFavorites ? Colors.red : null,
        semanticLabel: inFavorites ? 'Remove from saved' : 'Save',
      ),
      onTap: onTapCallback,
    );
  }

  void _onSwitchClicked(bool isChosen) {
    setState(() {
      isEnglish = isChosen;
      _suggestions.clear();
      _savedSuggestions.clear();
      _controller.jumpTo(0);
    });
  }

  void _pushSaved() {
    Navigator.pushNamed(context, FavoritesPage.routeName,
        arguments: Arguments(_savedSuggestions));
  }
}
