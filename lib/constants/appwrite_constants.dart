class AppwriteConstants {
  static const String endPoint = 'http://localhost:80/v1';
  static const String projectId = '64d87be6854474e86bb8';
  static const String databaseId = '64d87ecb03e4c99a7853';
  static const String imagesBucketId = '64ec4ce141a0e23ede68';

  // COLLECTIONS
  static const String usersCollection = '64db913e82cc011ee2a9';
  static const String tweetsCollection = '64e9ee798fe726f67e6a';
  static const String notificationsCollection = '64f31aef73e8455cb003';

  // IMAGE LINK
  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucketId/files/$imageId/view?project=$projectId&mode=admin';
}
