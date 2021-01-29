// import 'package:flutter/material.dart';

// class Rating extends StatelessWidget {
//   final int starCount;
//   final double rating;
//   final Color color;

//   Rating({this.starCount, this.rating, this.color});

//   Widget buildStar(BuildContext context, int i) {
//     Icon icon;
//     if(i >= rating) {
//       icon = Icon(Icons.star_border,
//       color: Theme.of(context).buttonColor
//       );
//     } 
//     else if (i > rating - 1 && i < rating) {
//       icon = Icon(
//         Icons.star_half,
//         color: color ?? Theme.of(context).primaryColor,
//       );
//     } else {
//       icon = Icon(
//         Icons.star,
//         color: color ?? Theme.of(context).primaryColor,
//       );
//     }
//     return Container (
//       child: icon);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         List.generate(starCount, (i) => buildStar(context, i))
//       ],
//     );
//   }
// }