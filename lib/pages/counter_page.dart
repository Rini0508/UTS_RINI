import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterController>();
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${counter.count}', style: const TextStyle(fontSize: 48)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: counter.decrement, icon: const Icon(Icons.remove)),
                IconButton(onPressed: counter.increment, icon: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
