import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// this is the little house where all the functionality we add lives
/*
  /   \
  |*  |
*/
// Hunter helped me a little with helping me figure out what I needed to have in here
class _MyHomePageState extends State<MyHomePage> {

  void calculateTip() {
    setState(() {
      if(greatService == true){
        tipPercent = 0.2;
      }
      else{
        tipPercent = 0.15;
      }
      billAmount = double.parse(billInput.text);
      tip = billAmount  * tipPercent;
      billWithTip = billAmount + tip;
    });
  }
  // this seems like a fine spot for variables amirite Tom
  final billInput = TextEditingController();
  bool greatService = true;
  double tipPercent = 0;
  double billAmount = 0;
  double tip = 0;
  double billWithTip = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tip Calculator Poquette'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // this wasn't working earlier and now it is so who knows what I did differently
          SizedBox(
            width: 200,
            child: TextField(
              controller: billInput,
              decoration: new InputDecoration(labelText: "Enter bill amount"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ]
            ), // Only numbers can be entered
          ),
            SizedBox(height: 15),
        Switch(
          value: greatService,
          activeColor: Colors.blue,
          onChanged: (bool value) {
            setState(() {
              greatService = value;
            });
          },
        ),
            Text(
              'Great Service?',
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                calculateTip();
              },
              child: Text("Calculate Tip"),
            ),
            SizedBox(height: 25),
            Text(
              'Total Tip: ' + tip.toStringAsFixed(2),
            ),
            Text(
              'Total Bill with Tip: ' + billWithTip.toStringAsFixed(2),
            ),
          ],
        ),
      ),
    );
  }
}
