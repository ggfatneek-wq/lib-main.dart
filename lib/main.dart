import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MissionCounter(),
      child: MaterialApp(
        home: MissionScreen(),
      ),
    ),
  );
}

class MissionCounter extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  // LIVE CHANGE 1: Add the reset method here.
}

class MissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mission Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MissionCounter>(
              builder: (context, counter, child) {
                return Text(
                  'Completed missions: ${counter.count}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<MissionCounter>().increment();
              },
              child: Text('Complete Mission'),
            ),

            // LIVE CHANGE 2: Add the reset button here.
          ],
        ),
      ),
    );
  }
}
