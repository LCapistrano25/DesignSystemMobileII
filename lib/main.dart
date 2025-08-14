import 'package:flutter/material.dart';
import 'package:mobile_07_08/Components/ActionButton/action_button.dart';
import 'package:mobile_07_08/Components/ActionButton/action_button_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget  {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements  ActionButtonDelegate {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    var viewModel = ActionButtonViewModel(
      size: ActionButtonSize.medium,
      style: ActionButtonStyle.primary,
      text: 'Increment',
    );

    var button = ActionButton.instantiate(
        viewModel: viewModel,
    );

    button.delegate = this;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
            floatingActionButton: button);
  }
  
  @override
  void onClick(ActionButtonViewModel viewModel) {
    print("Clicado");
  }
}
