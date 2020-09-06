import 'package:flutter/material.dart';
import 'package:hummingthread_app/message_widget.dart';

class ChatWindow extends StatefulWidget {
  final contactName, contactId;
  final Widget displayPicture;

  ChatWindow({this.contactName, this.contactId, this.displayPicture});

  @override
  _ChatWindowState createState() => _ChatWindowState();
}

class _ChatWindowState extends State<ChatWindow> {
  TextEditingController _messageBoxController = TextEditingController();

  List<Message> messageQueue = List();
  var displayPicture;

  @override
  void initState() {
    displayPicture =
        widget.displayPicture ?? CircleAvatar(child: Text(widget.contactName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(40, 47, 60, 1),
      appBar: AppBar(
          centerTitle: true,
          title: Text(this.widget.contactName),
          backgroundColor: Color.fromRGBO(8, 17, 20, 1)),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Image(
          //   fit: BoxFit.cover,
          //   image: AssetImage("assets/wallpaper.jpeg"),
          // ),
          //messages
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: messageQueue.length,
                    itemBuilder: (context, index) {
                      return messageQueue[index];
                    }),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              ],
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.01,
            left: MediaQuery.of(context).size.width * 0.02,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  color: Colors.white,
                  child: Container(
                    color: Colors.transparent,
                    constraints: BoxConstraints(
                      minHeight: 0,
                      // maxHeight: MediaQuery.of(context).size.height * 0.055,
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        top: 0,
                        bottom: 0,
                      ),
                      child: TextField(
                        controller: _messageBoxController,
                        style: TextStyle(fontSize: 17, color: Colors.black54),
                        minLines: 1,
                        maxLines: 10,
                        scrollPadding: EdgeInsets.all(10),
                        decoration: InputDecoration(
                          isDense: false,
                          contentPadding: EdgeInsets.all(0),
                          hintText: "Type a message",
                          hintStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.black26,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              color: Colors.transparent,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height / 100),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Transform.rotate(
                      angle: -.5233,
                      child: Icon(
                        Icons.send,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      int timestamp = DateTime.now().millisecondsSinceEpoch;
                      String message = _messageBoxController.text;
                      setState(() {
                        messageQueue.add(TextMessage(
                            messageContent: message,
                            timeStamp: timestamp,
                            sent: true));
                        _messageBoxController.text = "";
                      });
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
