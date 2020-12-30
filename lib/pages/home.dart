import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui/pages/contents.dart';
import 'package:instagram_ui/pages/data.dart';
import 'package:instagram_ui/pages/models.dart';
import 'package:instagram_ui/pages/people.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Models> job = new List<Models>();
  List<People> individual = new List<People>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    job = getModels();
    individual = getPeople();
  }



  @override
  Widget build(BuildContext context) {
    // final _width = MediaQuery.of(context).size.width;
    // final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text("Instagram",
          style: TextStyle(
            fontSize: 54,
            fontFamily: 'Billy Argel Fonts',
            fontWeight: FontWeight.w500,
            color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,10.0,0),
                child: Image(
                  image: AssetImage('assets/sent2.png',),
                  height: 23,
                  width: 23,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(

            child: Column(
              children: [
                Container(
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                    itemCount: job.length,
                      itemBuilder: (context, index)
                      {
                      return StoryTile(
                        imageUrl: job[index].imageUrl,
                      );
                      }
                  ),
                ),
                Divider(
                  height: 25,
                  thickness: 0.5,
                ),
                Container(
                  child: ListView.builder(
                    itemCount: individual.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context , index){
                      return Container(
                        child: Column(
                          children: [
                            BodyTile(
                              imageUrl: individual[index].imageUrl,
                              names: individual[index].names,
                            ),
                          ],
                        ),
                      );
                      }
                  ),
                ),
                // index == 0 ?Positioned(
                //   right:  10,
                //   child: CircleAvatar(
                //     backgroundColor: Colors.blueAccent,
                //     radius: 10,
                //     child: Icon(Icons.add,
                //       size: 15,
                //       color: Colors.white,
                //     ),
                //   ),
                // ) : Container()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0,5,0,5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage('assets/home.png',),
              height: 23,
              width: 23,
              color: Colors.black,
            ),
            Image(
              image: AssetImage('assets/search.png',),
              height: 23,
              width: 23,
              color: Colors.black,
            ),
            Image(
              image: AssetImage('assets/reels.png',),
              height: 23,
              width: 23,
              color: Colors.black,
            ),
            Image(
              image: AssetImage('assets/heart.png',),
              height: 23,
              width: 23,
              color: Colors.black,
            ),
            Image(
              image: AssetImage('assets/profile.png',),
              height: 23,
              width: 23,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
class StoryTile extends StatelessWidget {
  final imageUrl;
  StoryTile({this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      width: 70,
    height: 70,
    decoration: BoxDecoration(
      border: Border.all(
        color: Color(0xFFeb3461),
      ),
      shape: BoxShape.circle,
      image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(imageUrl,)
      )
    ),

        // child: Container(
        //   child: Icon(
        //     Icons.add_circle_outline,
        //     color: Colors.blueAccent,
        //   ),
        //   height: MediaQuery.of(context).size.width - 220,
        //   width: MediaQuery.of(context).size.width - 220,
        // ),
    );
  }
}

class BodyTile extends StatelessWidget {
  final String imageUrl,names;
  BodyTile({this.imageUrl,this.names});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:6),
      child: Column(
        children: <Widget>[
          Row(

            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFeb3461),
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://i.pinimg.com/originals/46/0d/7e/460d7ee3275caf883306c71f719d5f0d.jpg",
                        ),
                    )
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Text(names,
                style:TextStyle(
                  fontWeight: FontWeight.bold
                ) ,
              ),
              SizedBox(
                width: 260,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      image: AssetImage('assets/menuvertical.png',),
                      height: 23,
                      width: 23,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],

          ),
          SizedBox(
            height: 8,
          ),
          Column(
            children: [
              Image.network(imageUrl,
                fit: BoxFit.cover,
              )
            ],
          ),
          SizedBox(height: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/heart.png',),
                      height: 23,
                      width: 23,
                      color: Colors.black,
                    ),
                    //Icon(Icons.favorite_border),
                    SizedBox(width: 12,),
                    Image(
                      image: AssetImage('assets/comment.png',),
                      height: 23,
                      width: 23,
                      color: Colors.black,
                    ),
                    SizedBox(width: 12,),
                    Image(
                      image: AssetImage('assets/sent2.png',),
                      height: 23,
                      width: 23,
                      color: Colors.black,
                    ),
                  ],

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      image: AssetImage('assets/bookmark.png',),
                      height: 23,
                      width: 23,
                      color: Colors.black,
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 7.0, 0, 3.0 ),
              child: Row(
                children: [
                  Text('Liked by'),
                  SizedBox(width: 1,),
                  Text('_Seun Hassan',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 2,),
                  Text('and'),
                  SizedBox(width: 1,),
                  Text(' 1,234,567 others',style: TextStyle(fontWeight: FontWeight.bold),)

                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 8),
              child: Row(
                children: [
                  Text( 'View all 198,587 comments',
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 0, 3.0),
              child: Row(
                children: [
                  Text('adeojr',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 3,),
                  Text('0 por!!!!!!! ',),
                  SizedBox(width: 2,),
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}

