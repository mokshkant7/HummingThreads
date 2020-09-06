import 'package:flutter/material.dart';
import 'package:hummingthread_app/message.dart';

class TextMessage extends Message {
  final String messageContent;

  TextMessage({this.messageContent, int timeStamp, bool sent})
      : super(timeStamp: timeStamp, sent: sent);

  String printableTime() {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(this.timeStamp);
    String printable = time.hour.toString() + ":" + time.minute.toString();
    return printable;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment:
          this.sent ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(20),
            ),
          ),
          elevation: 2,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .75,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: Stack(
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          child: Text(
                            this.messageContent,
                            // softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 15,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.red
                                  : Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 6),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: printableTime(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 40,
                                    color: Colors.blueAccent),
                              ),
                            ),
                            Container(child: RecievedReadNotifier())
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RecievedReadNotifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Positioned(
            child: Icon(
          Icons.check,
          color: Colors.black45,
        )),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Icon(
            Icons.check,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
