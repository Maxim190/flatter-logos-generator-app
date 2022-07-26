import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = '/favoritesPage';

  @override
  Widget build(BuildContext context) {
    final Arguments args =
        ModalRoute.of(context)?.settings.arguments as Arguments;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Saved Suggestions'),
        ),
        body: ListView.builder(
            itemCount: args.favoritesWords.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(args.favoritesWords.elementAt(index)),
              );
            }));
  }
}

class Arguments {
  final Set<String> favoritesWords;

  Arguments(this.favoritesWords);
}
