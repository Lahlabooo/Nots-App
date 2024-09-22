import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class custom_icon_seatrch extends StatelessWidget {
  const custom_icon_seatrch({super.key, required this.icon, this.onPressed});
final IconData icon ;
 final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 43,
      width: 43,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.08),
        borderRadius:  BorderRadius.circular(16),
      ),
      child:  IconButton(

        color: Colors.white, onPressed:  onPressed,
        icon: Icon(icon),
      ),

    );
  }
}