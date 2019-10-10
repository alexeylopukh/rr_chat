import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rr_chat/message.dart';

const NAME = 'Dave Rubin';
const LOGIN = '@DaveRubin';
const DATE = '08 jun, 2019';
const GRAY_COLOR = Color(0xff999999);
const BACKGROUND_COLOR = Color(0xffF8F8F8);
const MY_MESSAGE_BACKGROUND_COLOR = Color(0xffDDDDDD);
const MY_MESSAGE_TEXT_COLOR = Color(0xff3B3B3B);
const RED_COLOR = Color(0xffC1272D);
const TIME_TEXT_COLOR = Color(0xffCCCCCC);
const TEXT_FIELD_COLOR = Color(0xffF1F1F1);
const MESSAGE_RADIUS = Radius.circular(6);

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatScreenState();
  }
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();

    textController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Column(
        children: <Widget>[messages(), inputPanel()],
      ),
    );
  }

  Widget appbar() {
    return PreferredSize(
      preferredSize: Size(null, 50),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: TIME_TEXT_COLOR, width: 1)
            )
          ),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                color: GRAY_COLOR,
                onPressed: () {},
              ),
              CircleAvatar(
                child: FlutterLogo(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(NAME),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(LOGIN),
                        )
                      ],
                    ),
                    Text(DATE)
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.more_vert),
                color: GRAY_COLOR,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget messages() {
    final messages = getExampleMessageList();
    return Expanded(
      child: Container(
        color: BACKGROUND_COLOR,
        child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: messages[index].isMyMessage
                      ? myMessageItem(messages[index])
                      : interlocutorMessageItem(messages[index]));
            }),
      ),
    );
  }

  Widget myMessageItem(Message message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: MY_MESSAGE_BACKGROUND_COLOR,
              borderRadius: BorderRadius.only(
                  topLeft: MESSAGE_RADIUS,
                  bottomLeft: MESSAGE_RADIUS,
                  topRight: MESSAGE_RADIUS)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              message.text,
              style: TextStyle(color: MY_MESSAGE_TEXT_COLOR),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2, right: 2),
          child: Text(DateFormat('Hm').format(message.time),
              style: TextStyle(color: TIME_TEXT_COLOR, fontSize: 12)),
        )
      ],
    );
  }

  Widget interlocutorMessageItem(Message message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: RED_COLOR,
              borderRadius: BorderRadius.only(
                  topLeft: MESSAGE_RADIUS,
                  topRight: MESSAGE_RADIUS,
                  bottomRight: MESSAGE_RADIUS)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2, left: 2),
          child: Text(DateFormat('Hm').format(message.time),
              style: TextStyle(color: TIME_TEXT_COLOR, fontSize: 12)),
        )
      ],
    );
  }

  Widget inputPanel() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
        border: Border(
            top: BorderSide(color: MY_MESSAGE_BACKGROUND_COLOR, width: 1))
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.photo_library,
              color: RED_COLOR,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: TEXT_FIELD_COLOR,
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: TextFormField(
                    controller: textController,
                    maxLines: 2,
                    minLines: 1,
                    cursorColor: RED_COLOR,
                    decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: textController.text.length > 0
                                ? RED_COLOR
                                : GRAY_COLOR,
                          ),
                          onPressed: () {
                            textController.text = "";
                            setState(() {});
                          },
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Message> getExampleMessageList() {
    final list = List<Message>();
    list.add(
      Message(
          text: "Hey Dave! Great show. I took some photos from your event",
          time: DateTime.parse("2019-10-10 16:27:00"),
          isMyMessage: true),
    );
    list.add(
      Message(
          text: "Thank you",
          time: DateTime.parse("2019-10-10 16:27:00"),
          isMyMessage: false),
    );
    list.add(
      Message(
          text: "Please, see photos below",
          time: DateTime.parse("2019-10-10 16:27:00"),
          isMyMessage: true),
    );

    list.add(
      Message(
          text: "Oh, great. Cool pictures",
          time: DateTime.parse("2019-10-10 16:27:00"),
          isMyMessage: false),
    );
    return list;
  }
}
