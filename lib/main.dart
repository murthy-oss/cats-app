import 'package:cats_app/detailedfact.dart';
import 'package:cats_app/methods/fetchdata.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Cats app'),
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
  List<String>result=[];
@override
  void initState() {
    // TODO: implement initState
  fetchCatFacts();
    super.initState();
  }
  
  Future<void> fetchCatFacts() async {
    try {
     
      List<String> fetchedData = await fetchDataMethod();
      setState(() {
        result = fetchedData;
        
      });
        

      print("yufegyjes$result");
    } catch (e) {
     print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
       initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
         title: Text(widget.title),
           bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  text: '1',
                  
                ),
                Tab(
                  text: '2',
                ),
                Tab(
                 text: '3',
                ),
                Tab(
                 text: '4', 
                )
              ],
            ),
        ),
        
        body: TabBarView(
          
          children:[
            Text("tab1"),
            Text("tab2"),
           ListView.builder(
             itemCount: result.length,
             itemBuilder:(context, index) {
               return Center(
                child: GestureDetector
                (
                  onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: 
                    (context)=>Detailedfact(result[index])))
                    ;
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(result[index]),
                  )) );
             },),
            Text("tab4"),
            
          ]
        ),
        ),
    );
  }
}
