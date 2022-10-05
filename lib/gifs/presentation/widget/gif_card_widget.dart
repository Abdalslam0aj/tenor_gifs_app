import 'package:flutter/material.dart';
import 'package:tenor_gif_app/gifs/data/model/gif_data.dart';

class GifCardWiget extends StatelessWidget {
  final GifData gifData;
  const GifCardWiget({Key? key, required this.gifData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),          
          boxShadow: [
            BoxShadow(
                color: Colors.grey[200]!,
                spreadRadius: 0.5,
                blurRadius: 0.5,),
          ],),
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                  image: DecorationImage(
                      image: NetworkImage(gifData.media!.first.nanogif!.url!),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 7),
            child: Text('${gifData.contentDescription}', style: const TextStyle(fontWeight: FontWeight.w600),),
          )
        ],
      ),
    );
  }
}
