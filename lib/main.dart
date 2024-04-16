import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(){
  runApp(const Align(alignment: Alignment.center, child: ImagePortfolio()));
}


class ImagePortfolio extends StatefulWidget{
  const ImagePortfolio({super.key});
  State<ImagePortfolio> createState() => _ImagePortfolio();
}


class _ImagePortfolio extends State<ImagePortfolio>{

  List<String> cats = [
  'https://images.freeimages.com/images/large-previews/b1a/the-sad-kitten-1484446.jpg',
  'https://images.freeimages.com/images/large-previews/833/crazy-cat-1252130.jpg',
  'https://images.freeimages.com/images/large-previews/1f8/cat-1369943.jpg',
  'https://images.freeimages.com/images/large-previews/67f/critter-cat-1382005.jpg',
  'https://images.freeimages.com/images/large-previews/bd1/cat-1404368.jpg'
  ];

  int index =0;

  void _prevCat() {
    setState(() {
      index = (index-1) % cats.length;
    
    });
  }
  void _nextCat() {
    setState(() {
      index = (index+1) % cats.length;
    
    });
  }
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.ltr,
      
      children: [
        ShowCats(cats: cats, index: index,),
        const SizedBox(
          height: 50,
        ),

         Row( 
           mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.ltr,
          children: [
        
          SelectCats(onchanged: _prevCat,buttonText: "<"),
          const SizedBox(
          width: 50,
        ),
        SelectCats(onchanged: _nextCat,buttonText: ">"),
          ]
        )
      ],
    );
  }
}


class ShowCats extends StatelessWidget {
  final List<String> cats;
  final int index;

  const ShowCats({Key? key, required this.cats, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
  cats[index],
  width: 350, 
  height: 450, 
  fit: BoxFit.cover
);
  }
}


class SelectCats extends StatelessWidget {
  final Function onchanged;
   final String buttonText;

  const SelectCats({super.key, required this.onchanged, required this.buttonText});

  void _handleTap() {
    onchanged();
  }
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
         width: 110, 
        height: 80,
        decoration: BoxDecoration(color: const Color.fromARGB(250,163, 217, 255), borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Text(
        buttonText,
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.black, fontSize: 80, height: 1.0),
      )
      ),
    );
  }
}

