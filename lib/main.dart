import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[300],
        title: Text("Load Json App",style: TextStyle(
            color: Colors.green
        ),),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/package.json'),
            builder: (context,snapshot){
              // Decode json
              var mydata =json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: mydata==null ? 0 : mydata.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Name:${mydata[index]['name']}"),
                          Text("Age:${mydata[index]['age']}"),
                          Text("Height:${mydata[index]['height']}"),
                          Text("Hair Color:${mydata[index]['hair_color']}"),
                          Text("Gender:${mydata[index]['gender']}"),
                        ],
                      ),
                    );
                  }
              );
            },
          ),
        ),
      ),
    );
  }
}


