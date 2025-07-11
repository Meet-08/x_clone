class PostEntity {
  final String id;
  final String userId;
  final String username;
  final String content;
  final DateTime createdAt;
  final int likesCount;
  final int commentsCount;
  final int repostsCount;
  final String? imageUrls;

  PostEntity({
    required this.id,
    required this.userId,
    required this.username,
    required this.content,
    required this.createdAt,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.repostsCount = 0,
    this.imageUrls,
  });
}
