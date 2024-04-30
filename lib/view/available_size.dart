import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvailableSize extends StatefulWidget {
  final String size;
  const AvailableSize({Key? key, required this.size}) : super(key: key);

  @override
  State<AvailableSize> createState() => _AvailableSizeState();
}

class _AvailableSizeState extends State<AvailableSize> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
         color: isSelected ? Colors.red : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.red)
        ),
        child: Text(widget.size, style: TextStyle(fontWeight: FontWeight.w900,color: isSelected ? Colors.white : Colors.red ),),
      ),
    );
  }
}
