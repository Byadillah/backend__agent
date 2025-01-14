import 'package:flutter/material.dart';





// THIS IS THE MESSAGE BUBBLE LEFT

class MessageBubble extends StatelessWidget {

  String message;
  MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(0,0, 100,2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
            ),
            padding: EdgeInsets.symmetric(vertical:5 ,horizontal:10, ),
            decoration: BoxDecoration(
                color: Colors.pink.withAlpha(20),
                borderRadius: BorderRadius.only(
                  topRight:Radius.circular(20) ,
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                  children: [
                  Text(
                    '$message',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// THIS IS THE MESSAGE BUBBLE RIGHT

class MessageBubbleRight extends StatelessWidget {
  String message;

   MessageBubbleRight({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(100,0,0,2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical:5 ,horizontal:10, ),
            decoration: BoxDecoration(
                color: Colors.blue.withAlpha(20),
                borderRadius: BorderRadius.only(
                  topRight:Radius.circular(20) ,
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Column(
                children: [
                  Text(
                    '$message',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

