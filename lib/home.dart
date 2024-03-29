import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_todo/newnote.dart';
import 'package:intl/intl.dart';
import 'list_card.dart';

class Home extends StatefulWidget {
  final List<String> stringList;
  const Home({super.key, required this.stringList});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 25, 46),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 64,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Task.ly',
                style: GoogleFonts.eastSeaDokdo(
                    textStyle: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 40,
                        height: 1,
                        fontWeight: FontWeight.bold)),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(
                    left: 4, right: 12, top: 4, bottom: 4),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(90)),
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 16,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            NetworkImage('https://i.pravatar.cc/300'),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Derrick',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 0, 25, 46),
        ),

        //body here

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24)),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //added a little change to format the date... thats why i added the intl package 🙂
                      Text(
                        'Today is ${DateFormat.yMMMMd().format(DateTime.now())}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                                text: 'You have',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 20)),
                            TextSpan(
                              text: widget.stringList.length == 1
                                  ? ' ${widget.stringList.length} task'
                                  : ' ${widget.stringList.length} tasks',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                                text: ' to complete',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 20)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'All tasks',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      height: 1,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  //here is the little change that i made 🙂
                  itemCount: widget.stringList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    //here is the little change that i made 🙂
                    return Dismissible(
                      key: Key(widget.stringList[index]),
                      onDismissed: (direction) async {
                        setState(() {
                          widget.stringList.removeAt(index);
                        });
                      },
                      child: ListCard(
                        string: widget.stringList[index],
                        // stringList: [stringList[index]],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),

        //floating action button
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const NewNote())));
          },
          child: const Icon(
            Icons.add,
            size: 32,
            color: Color.fromARGB(255, 0, 25, 46),
          ),
        ));
  }
}
