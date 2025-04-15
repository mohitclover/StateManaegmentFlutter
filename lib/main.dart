import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CounterProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (ctx) => CounterProvider(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build Function called");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      body: Center(
          child: Consumer(builder: (ctx ,_,__){
            print("Consumer pappu 4 Build Function called");
          return  Text("Value is "

            //  "${Provider.of<CounterProvider>(ctx, listen: true).getCount()}"
          "${ctx.watch<CounterProvider>().getCount()}"

          );  //Observes the event

          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Provider.of<CounterProvider>(context, listen: false).increment();
          context.read<CounterProvider>().increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Riverpod example
/*final helloProvider = Provider<String>((funs) {
  return " Hellow Mohit";
});
final counterProvider = StateProvider((ref) => 0);
class HomePageRiverPod extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dummy heading"),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, _) {
          final justText = ref.watch(helloProvider);
          final count = ref.watch(counterProvider);
          return Column(
            children: [
              Text('$justText'),
              Text('$count'),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is a utility to read a provider without listening to it
        onPressed: () => ref.read(counterProvider.notifier).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}*/
