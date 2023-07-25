import 'package:flutter/material.dart';

import 'chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {

  List imgs = [
    "doctor.png",
    "doctor.png",
    "doctor.png",
    "doctor.png",
  ];

  List doctorName = [
    "Dr. Chidubem",
    "Dr. Kosi",
    "Dr. Favour",
    "Dr. Precious",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Messages",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Icon(Icons.search,color:  Color(0xff6985e8),
                )
              ],
            ),
          ),),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Active Now",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 10,
                    )
                  ]
                ),
                child: Stack(
                  textDirection: TextDirection.rtl,
                  children: [
                    Center(child: Container(
                      height: 65,
                      width: 65,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset("assets/images/${imgs[index]}",
                        fit: BoxFit.cover,),
                      ),
                    ),),
                    Container(
                      margin: EdgeInsets.all(4),
                      padding: EdgeInsets.all(4),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Recent Chat",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                minVerticalPadding: 15,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    "assets/images/${imgs[index]}"
                  ),
                ),
                title: Text(
                  doctorName[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                subtitle: Text("Hello Doctor, are you there?",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54
                  ),
                ),
                trailing: Text("02:00",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
