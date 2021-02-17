import 'package:counter_app_provider/counterviewmodel.dart';
import 'package:counter_app_provider/favoriteviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CounterViewModel()),
    ChangeNotifierProvider(create: (context) => FavoriteViewModel())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var counterVM = Provider.of<CounterViewModel>(context, listen: false);
    var favoriteVM = Provider.of<FavoriteViewModel>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.horizontal_rule),
                  onPressed: () {
                    counterVM.decrement();
                  },
                ),
                Consumer<CounterViewModel>(
                  builder: (_, vm, child) {
                    return Text('counter: ${vm.counter}');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    counterVM.increment();
                  },
                )
              ],
            ),
            Consumer<FavoriteViewModel>(
              builder: (_, vm, child) {
                return IconButton(
                    icon: vm.liked ? Icon(Icons.favorite, color: Colors.red,):Icon(Icons.favorite_border), onPressed: () {
                      favoriteVM.changeFavorite();
                });
              })
          ],
        ),
      ),
    );
  }
}
