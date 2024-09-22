import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_icon_seatrch.dart';

class Custom_appBar extends StatelessWidget {
  const Custom_appBar({super.key, required this.title, required this.icon, this.onPressed});
final String title ;
final IconData icon ;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const  EdgeInsets.only(top: 50.0),
      child: Row(
        children: [
          Text(title, style:const  TextStyle(
            fontSize: 25,
          ),),
          const Spacer(),
          custom_icon_seatrch(icon: icon,
          onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

