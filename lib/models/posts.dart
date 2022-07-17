import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Posts {
  final String description;
  final String uid;

  final String username;
  final String postId;
  final datePosted;
  final String postUrl;
  final String profImg;
  final likes;

  const Posts({
    required this.description,
    required this.uid,

    required this.username,
    required this.postId,
    required this.datePosted,
    required this.postUrl,
    required this.profImg,
    required this.likes,
  });
  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "username": username,

        "datePosted": datePosted,
        "postId": postId,
        "profImg": profImg,
        "likes": likes,
        "postUrl": postUrl
      };

  static Posts formSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Posts(
      description: snapshot['description'],
      uid: snapshot['uid'],
      username: snapshot['username'],
      datePosted: snapshot['datePosted'],
      postId: snapshot['postId'],
      profImg: snapshot['profImg'],
      likes: snapshot['likes'],
      postUrl: snapshot['postUrl'],
    );
  }
}
