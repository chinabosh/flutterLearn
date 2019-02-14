import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      debugShowCheckedModeBanner: false,
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      onTap:() {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new SecondPage(text: pair.asPascalCase)
            )
        );
      }
    );
  }

}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

//界面跳转
class SecondPage extends StatelessWidget {
  final text;

  SecondPage ({Key key, @required this.text}):super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text(text),
        ),
      )
    );
  }

}
