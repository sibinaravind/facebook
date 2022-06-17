import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/Widgets/profile_avatar.dart';
import 'package:facebook/config/palette.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../data/data.dart';
import '../Models/models.dart';

class PostContainer extends StatelessWidget {
  final int index;

  const PostContainer({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PostHeader(
                    index: index,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(posts[index].caption),
                  posts[index].imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6,
                        )
                ]),
          ),
          posts[index].imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: posts[index].imageUrl),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(index: index),
          )
        ],
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  final int index;

  const _PostStats({Key key, @required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Palette.facebookblue, shape: BoxShape.circle),
                child: const Icon(
                  Icons.thumb_up,
                  size: 10.0,
                  color: Colors.white,
                )),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                '${posts[index].likes} ',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${posts[index].comments} Comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              '${posts[index].shares} Shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const Divider(),
            Row(children: [
              _PostButton(
                  icon: Icon(
                    MdiIcons.thumbDownOutline,
                    color: Colors.grey[600],
                    size: 20.0,
                  ),
                  label: 'Like',
                  onTap: () => print('Like')),
              _PostButton(
                  icon: Icon(
                    MdiIcons.comment,
                    color: Colors.grey[600],
                    size: 20.0,
                  ),
                  label: 'Comment',
                  onTap: () => print('Comment')),
              _PostButton(
                  icon: Icon(
                    MdiIcons.shareOutline,
                    color: Colors.grey[600],
                    size: 20.0,
                  ),
                  label: 'sHARE',
                  onTap: () => print('sHARE')),
            ])
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final int index;

  const PostHeader({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ProfileAvatar(imageUrl: posts[index].user.imageUrl),
      const SizedBox(
        width: 8.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              posts[index].user.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Row(children: [
              Text(
                '${posts[index].timeAgo}.',
                style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
              ),
              Icon(
                Icons.public,
                color: Colors.grey[600],
                size: 12.0,
              )
            ])
          ],
        ),
      ),
      IconButton(
          onPressed: () => print('More'), icon: const Icon(Icons.more_horiz))
    ]);
  }
}
