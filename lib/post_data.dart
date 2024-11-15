class Post {
  final String username;
  final String location;
  final String date;
  final String imagePath;

  Post({
    required this.username,
    required this.location,
    required this.date,
    required this.imagePath,
  });
}

// Global list to store posts
List<Post> globalPosts = [];
