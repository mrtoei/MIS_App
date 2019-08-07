
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;


import 'package:mis_app/models/url.dart';
void main() =>runApp(Gallery());

class Gallery extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GalleryState();
  }
}

class GalleryState extends State<Gallery>{
  Url url = Url();
  List data;
  Future<String> getGallery() async{
    http.Response response = await http.get(
        Uri.encodeFull(url.gallery_url),
        headers: {'Accept':'application/json'}
    );
    data = json.decode(response.body);
    setState(() {
      data.toString();
    });
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGallery();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              elevation: 0,
              margin: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: "${data[index]['path_original']}",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                             ),
                        ),
                      ),
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Container(
                    alignment: Alignment(-1, 0),
                    padding: EdgeInsets.all(8),
                    child: Text(
                        '${data[index]['title']}',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment(1, 0),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Author :  ${data[index]['author']}',
                      style: TextStyle(
                          fontStyle: FontStyle.italic
                      ),
                    ),
                  )
                ],
              )
            );
          }
      ),
    );
  }
  
}