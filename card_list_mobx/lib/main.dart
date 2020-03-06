import 'package:card_list_mobx/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


import 'controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       Provider<Controller>(
         create: (_) => Controller(),
         dispose: (_, controller) => controller.dispose(),
       )
      ],
      //create: (BuildContext context) {},
      child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final controller = Controller();


  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<Controller>(context);
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Observer(
          builder: (_) {
            return Text(controller.isValid 
         ? 'Formulário Validado'
         : 'Formulário Não Validado');
        },
        ),
        ), 
       body: BodyWidget(),
    );   
  }
}
