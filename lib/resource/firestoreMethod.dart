import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_flutter/models/posts.dart';
import 'package:instagram_flutter/resource/storage_firebase.dart';
import 'package:uuid/uuid.dart';

class FIrebaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String username,
    Uint8List? file,
    String? uid,
    String description,
    String profileImg,
  ) async {
    String res = "Some Error";

    try {
      String photoUrl =
          await StorageMethods().uploadImageToStore("posts", file!, true);
      String postId = const Uuid().v1();
      Posts post = Posts(
        description: description,
        uid: uid!,
        username: username,
        postId: postId,
        datePosted: DateTime.now(),
        postUrl: photoUrl,
        profImg: profileImg,
        likes: [],
      );
      _firestore.collection("posts").doc(postId).set(
            post.toJson(),
          );
      res = "success";
      return res;
    } catch (err) {
      res = err.toString();
      return res;
    }
  }
}
