import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candle Shop',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Candle Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Candles to order:'),
            Text('$_counter', style: Theme.of(context).textTheme.headline4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: _incrementCounter,
                    child: const Text("Add"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        foregroundColor: MaterialStateProperty.all(Colors.white)
                    )
                ),
                const SizedBox(width: 20),
                TextButton(
                    onPressed: _purchase,
                    child: const Text("Purchase"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        foregroundColor: MaterialStateProperty.all(Colors.white)
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() => _counter++);
  }
  
  Future<void> _purchase() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          switch (_counter) {

            case 0:
              return AlertDialog(
                title: const Text("Oops!"),
                content: const Text("Add candles to purchase first"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Ok")
                  )
                ],
              );

            default:
              return AlertDialog(
                title: const Text("Congratulations!"),
                content: Text("You have purchased $_counter candles"),
                actions: [
                  TextButton(
                      onPressed: () {
                        setState(() => _counter = 0);
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok")
                  )
                ],
              );

          }
        }
    );
  }
}
