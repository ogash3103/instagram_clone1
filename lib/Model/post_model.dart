class Post {
  String? img_post;
  String? caption;
  Post(this.img_post, this.caption);

  Post.fromJsom(Map<String , dynamic> json):
      img_post = json["img_post"],
      caption = json["caption"];

      Map<String , dynamic> toJson() => {
      'img_post': img_post,
      'caption' : caption,
    };
}


