import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  const Custom_Button({super.key, this.onTap,  this.isLoading = false });
 final  void Function()? onTap;
 final bool isLoading ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue
        ),
        child: isLoading ? const Center(child:
        SizedBox(
          height: 25,width: 25,
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        )):
        const  Center(
          child: Text("Add",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

