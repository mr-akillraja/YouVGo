// import 'package:flutter/material.dart';

// class PostPage extends StatelessWidget {
//   final List<Map<String, dynamic>> posts;

//   const PostPage({required this.posts});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('Your Posts'),
//       ),
//       body: ListView.builder(
//         itemCount: posts.length,
//         itemBuilder: (context, index) {
//           final post = posts[index];
//           return Card(
//             color: Colors.grey[850],
//             margin: const EdgeInsets.all(10),
//             child: ListTile(
//               title: Text(
//                 post['destination'],
//                 style: TextStyle(color: Colors.white),
//               ),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Date: ${post['date']}',
//                     style: TextStyle(color: Colors.white70),
//                   ),
//                   if (post['transport'] != null && post['transport'].isNotEmpty)
//                     Text(
//                       'Transport: ${post['transport']}',
//                       style: TextStyle(color: Colors.white70),
//                     ),
//                   if (post['gender'] != null && post['gender'].isNotEmpty)
//                     Text(
//                       'Gender: ${post['gender']}',
//                       style: TextStyle(color: Colors.white70),
//                     ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
