import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Container(
      height: _height *0.20,
      width: _width *0.10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , index)=> Stack(
              alignment: Alignment.bottomRight,
              children:<Widget> [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://i.pinimg.com/originals/46/0d/7e/460d7ee3275caf883306c71f719d5f0d.jpg",
                        ),
                      )
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                ),
                index == 0 ?Positioned(
                  right:  10,
                  child: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 10,
                    child: Icon(Icons.add,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ) : Container()

              ],
            )
        ),
      ),
    );
  }
}
