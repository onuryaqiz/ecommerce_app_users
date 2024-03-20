import 'package:ecommerce_app_users/consts/app_colors.dart';
import 'package:ecommerce_app_users/consts/theme_data.dart';
import 'package:ecommerce_app_users/providers/theme_provider.dart';
import 'package:ecommerce_app_users/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        })
      ],
      
        child: Consumer<ThemeProvider>( //Consumer widget sayesinde tema arasındaki değişkliği dinamik hale getirdik.
        builder: (context,themeProvider,child){

        
        return   MaterialApp(
            title: 'eCommerce App',
            theme: Styles.themeData(isDarkTheme:themeProvider.getIsDarkTheme, context: context), //Uygulama ana ekrana tema değişikliği
              home: const HomeScreen(),
            );
          }
        ),
  
      );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
