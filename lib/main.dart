import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rr_chat/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
    ));
    return MaterialApp(
      title: 'Test messanger',
      home: ChatScreen(),
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key}) : super(key: key);
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  TextEditingController textController;
//  IOWebSocketChannel ws;
//  List<String> messages;
//
//  @override
//  void initState() {
//    super.initState();
//    textController = TextEditingController();
//    messages = List();
//    socketConnect();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//      ),
//      body: Column(
//        children: <Widget>[
//          Expanded(
//            child: ListView.builder(
//                itemCount: messages.length,
//                itemBuilder: (context, index) {
//                  return Padding(
//                    padding: EdgeInsets.all(20),
//                    child: Text(messages[index]),
//                  );
//                })
//          ),
//          Padding(
//            padding: EdgeInsets.only(left: 15),
//            child: Row(
//              children: <Widget>[
//                Flexible(
//                  child: TextField(
//                    controller: textController,
//                  ),
//                ),
//                IconButton(
//                  icon: Icon(Icons.send),
//                  onPressed: () {
//                    if (ws != null) {
//                      ws.sink.add(textController.text);
//                    }
//                  },
//                )
//              ],
//            ),
//          )
//        ],
//      )
//    );
//  }
//
//  socketConnect() async {
//    if (ws == null) {
//      ws = IOWebSocketChannel.connect("ws://192.168.100.23:3210");
//    }
//
//    ws.stream.listen((message){
//      addMessage(message);
//    });
//  }
//
//  addMessage(String message) {
//    messages.add(message);
//    setState(() {});
//  }
//}
