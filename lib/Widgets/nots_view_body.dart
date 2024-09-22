import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_appBar.dart';
import 'nots_item_list.dart';

class nots_view_body extends StatelessWidget {
  const nots_view_body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal:25),
      child: Column(
        children: [
          Custom_appBar(title: 'Notes', icon: Icons.search,),
          nots_item_list (),
        ],
      ),
    );
  }
}

