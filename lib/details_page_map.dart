// import 'package:flutter/material.dart';

// class DetailsPage extends StatelessWidget {
//   final String name;
//   final double rating;
//   final String image;

//   const DetailsPage({
//     Key? key,
//     required this.name,
//     required this.rating,
//     required this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text(name),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: Image.asset(
//               image,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Icon(Icons.star, color: Colors.yellow),
//                     SizedBox(width: 8),
//                     Text(
//                       rating.toString(),
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
