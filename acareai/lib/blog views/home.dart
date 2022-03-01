import 'package:acareai/blog%20views/blogView.dart';
import 'package:acareai/blog%20views/create_blog.dart';
import 'package:acareai/services/crud.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

CrudMethods crudMethods = new CrudMethods();
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
                              return BlogsTile(
                                authorName: streamSnapshot.data.docs[index].data()['authorName'],
                                title: streamSnapshot.data.docs[index].data()["title"],
                                description:
                                    streamSnapshot.data.docs[index].data()['desc'],
                                imgUrl:
                                   streamSnapshot.data.docs[index].data()['imgUrl'],
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
    crudMethods.getData().then((result) {
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
        backgroundColor:Colors.black54 ,
        elevation: 0.0,
      
      ),
      body:  Container
      (
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
               Navigator.push(context, MaterialPageRoute(builder:(context) =>CreateBlog() ));
             } ,
            child: Icon(Icons.add),
          )
        ],),
      ),
      
    );
  }
}
class BlogsTile extends StatefulWidget {
  String imgUrl, title, description, authorName;
  BlogsTile(
      {@required this.imgUrl,
      @required this.title,
      @required this.description,
      @required this.authorName});

  @override
  _BlogsTileState createState() => _BlogsTileState();
}

class _BlogsTileState extends State<BlogsTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
       Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlogView(
                  title: widget.title,
                  imgUrl: widget.imgUrl,
                  authorName: widget.authorName,
                  description: widget.description,
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
                imageUrl: widget.imgUrl,
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
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(widget.authorName)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
