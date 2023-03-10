import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListCard extends StatefulWidget {
  final String string;

  const ListCard({
    Key? key,
    required this.string,
  }) : super(key: key);

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  bool isDone = true;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        //gesture detaector
        onTap: () {
          setState(() {
            isDone = !isDone;
          });
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        trailing: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(900),
              color: isDone ? Colors.blueGrey.withOpacity(0.2) : Colors.amber,
            ),
            child: isDone
                ? const Icon(
                    Icons.check_box_outline_blank,
                  )
                : const Icon(Icons.check)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              DateFormat.yMMMMd().format(DateTime.now()),
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.string,
              style: TextStyle(
                  color: isDone
                      ? const Color.fromARGB(255, 0, 25, 46)
                      : const Color.fromARGB(255, 0, 25, 46).withOpacity(0.5),
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  decorationStyle: TextDecorationStyle.solid,
                  decoration: isDone
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            ),
            const SizedBox(
              height: 4,
            ),
            Chip(
              label: Text(
                isDone ? 'Pending' : 'Completed',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: isDone
                  ? const Color.fromARGB(255, 23, 192, 161)
                  : Colors.amber,
            )
          ],
        ),
        tileColor: isDone ? Colors.greenAccent : Colors.amberAccent,
      ),
    );
  }
}
