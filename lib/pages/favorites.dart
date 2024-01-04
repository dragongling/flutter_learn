import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    if (favorites.isEmpty) {
      return Center(child: Text('No favorites added yet'));
    }

    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: SizedBox(
            width: 300,
            child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                            '${favorites[index].first}${favorites[index].second}',
                            textAlign: TextAlign.center),
                      ),
                      IconButton(
                          onPressed: () {
                            appState.removeAt(index);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                )),
          ),
        );
      },
      itemCount: favorites.length,
    );
  }
}