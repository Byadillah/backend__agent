import 'dart:convert';
import 'package:http/http.dart' ;
import 'message_bubble.dart';
import 'package:flutter/material.dart';





class CustomPage extends StatefulWidget {
  const CustomPage({super.key});


  @override
  State<CustomPage> createState() => _CustomPageState();
}



class _CustomPageState extends State<CustomPage> {

  // ALL OUR ENDPOINT API ARE IN THIS SECTION

  Future<void> getData() async {
    Response response = await get(Uri.parse("http://myproject_endpoitds_IP_or_domaine"));
    final data = jsonDecode(response.body);
    print(data);
  }

  Future<void> postData(String name) async {
    final response = await post(Uri.parse('http://myproject_endpoitds_IP_or_domaine/api/user/create/'), headers: <String, String>{  //  Put your real IP or domaine
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: jsonEncode(<String, String>{
      "firstname": name ,
      "lastname" : "NPC",
    }),
    );
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      String sendValue = ' firstname: ${data['firstname']} \n lastname: ${data['lastname']}';
      record.add(MessageBubble(message: sendValue));
      return data;
    }else {
       throw Exception('Failed to create response');
    }
  }

  Future<void> postChat(String text_chat) async {
    if (_textcontroller.text.isNotEmpty) {
      final response = await post(Uri.parse('http://myproject_endpoitds_IP_or_domaine/api/user/agent/'), headers: <String, String>{   //  Put your real IP or domaine
        'Content-Type': 'application/json; charset=UTF-8',
      }, body: jsonEncode(<String, String>{
        "role": "user",
        "content" :   text_chat ,
      }),
      );
      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        String sendValue = '${data['content']} ';
        record.add(MessageBubble(message: sendValue));
        return data;
      }
    }
    else {
      throw Exception('Failed to create response');
    }
  }



  //THIS IS THE TEXT CONTROLLER AND THE SCROLL CONTROLLER
   final TextEditingController _textcontroller = TextEditingController();
   final ScrollController _scrollController = ScrollController();
  


   // THIS LIST KEEPS RECORD OF ALL THE MESSAGE
  // THAT ARE DISPLAYED ON THE SCREEN AS WE'RE NOT USING CASH
  List record = <Widget>[];



  // THIS IS THE MESSAGE BUBBLE RIGHT OR THE SENDER AS WE'RE NOT USING ID (ME)
  void printquote() {
    if (_textcontroller.text.isNotEmpty /* && (x % 2 == 0) */){
      setState(() {
        record.add(MessageBubbleRight(message: _textcontroller.text));
        _scrolldown();
      });
    }

  }

  // THIS IS THE MESSAGE LEFT OR THE MESSAGE OF THE RECEIVER  (HIM/HER)
  void printMessage() async {
    final sendValue = await postChat(_textcontroller.text);
    setState(() {
      sendValue;
      _scrolldown();
    });
  }



  // THIS FUNCTION SCROLL THE MESSAGES TO THE BOTOM
  void _scrolldown() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration( microseconds: 750), curve: Curves.bounceInOut),
    );
  }

  // THIS THE TEXT INPUT FIELD AS WELL AS THE SENDER BUTTON
  Widget _Textinput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 300,
            child: TextField(
              controller: _textcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'start typing ...',
              ),
            ),
          ),
          CircleAvatar(
            radius: 23,
            child: IconButton(
              onPressed: () {
                printMessage();
                printquote();
                _textcontroller.clear();
              },
              icon: Icon(
                Icons.send,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    ) ;
  }


// THE BODY , THE APPBAR-LIKE AND WHERE WE KEEP THE MESSAGE FLOW
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(12, 20, 0, 0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/images/tinker.jpg'),
                    radius: 30,
                  ),
                  SizedBox(width: 20,),
                  Text(
                      'Tinker Bell',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            reverse: false,
            controller: _scrollController,
            itemCount: record.length,
              itemBuilder: (context,index) => record[index]),
          ),

          _Textinput(),// TEXT INPUT
        ],
      ),
    );

  }

  
}



