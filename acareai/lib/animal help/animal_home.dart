import 'package:acareai/animal%20help/animalblog.dart';
import 'package:acareai/animal%20help/help.dart';
import 'package:acareai/services/animalcrud.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimalHome extends StatefulWidget {
  const AnimalHome({ Key key }) : super(key: key);

  @override
  _AnimalHomeState createState() => _AnimalHomeState();
}

class _AnimalHomeState extends State<AnimalHome> {
 
 AnimalCrudMethods animalcrudMethods = new AnimalCrudMethods();
ScrollController _controller = new ScrollController();

Stream blogsStream;

  // ignore: non_constant_identifier_names
  Widget BlogsList() {
    return SingleChildScrollView(
          child: Container (
        child: blogsStream != null
            ? Column(
                children: <Widget>[
                  StreamBuilder(
                    stream: blogsStream,
                    builder: (context, streamSnapshot) {
                        if (streamSnapshot.data == null) {
                  return CircularProgressIndicator();
                }
                      return 
                      SingleChildScrollView(
                                              child: ListView.builder(
                             //physics: const AlwaysScrollableScrollPhysics()
                            padding: EdgeInsets.symmetric(horizontal: 16),
                             controller: _controller,
                            itemCount: streamSnapshot.data.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return BlogtileA(
                                name: streamSnapshot.data.docs[index].data()['name'],
                                phone: streamSnapshot.data.docs[index].data()["phone"],
                                description:
                                    streamSnapshot.data.docs[index].data()['desc'],
                                img:
                                   streamSnapshot.data.docs[index].data()['img'],
                              );
                            }),
                      );
                    },
                  )
                ],
              )
            : Container(
               
              ),
      ),
    );
  }

  @override
  void initState() {
    animalcrudMethods.getData().then((result) {
      setState(() {
        blogsStream = result;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
          Text("A",style: TextStyle(
            fontSize: 22,
            color: Colors.white70
          ),
          ),
          Text("Care", style: TextStyle(fontSize: 22, color: Colors.blue),)
        ],
        ),
        backgroundColor:Colors.transparent ,
        elevation: 0.0,
      
      ),
      body: Container(
        decoration: BoxDecoration(
                image: DecorationImage(
              alignment: Alignment.topCenter,
                  image: NetworkImage('https://p4.wallpaperbetter.com/wallpaper/568/845/216/dark-blue-blur-gradation-wallpaper-preview.jpg'),
                  fit: BoxFit.cover,
                  ),
              ),
        child: SingleChildScrollView(child: BlogsList())),
      floatingActionButton:Container(
        padding:EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
           FloatingActionButton(
             onPressed:(){
               Navigator.push(context, MaterialPageRoute(builder:(context) =>Help() ));
             } ,
            child: Icon(Icons.add),
          )
        ],),
      ),
      
    );
  }
}

class BlogtileA extends StatefulWidget {

  String img, phone, description, name;
   BlogtileA(
     {@required this.img,
      @required this.phone,
      @required this.description,
      @required this.name}
   );
  @override
  _BlogtileAState createState() => _BlogtileAState();
}

class _BlogtileAState extends State<BlogtileA> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: (){
       Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AnimalBlog(
                  phone: widget.phone,
                  img: widget.img,
                  description: widget.description,
                  name: widget.name,
                )));
     },

          child: Container(
         margin: EdgeInsets.only(bottom: 16),
        height: 150,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: widget.img,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.black45.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.phone,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(widget.name)
                ],
              ),
            )
          ],
        ),

        
      ),
    );
  }
}