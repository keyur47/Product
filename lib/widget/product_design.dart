import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product/utils/size_utils.dart';


Widget productDesign({
  String? title,
  String? category,
  String? count,
  String? image,
  double? price,
  double? rate,
}) {
  return Card(
    child: Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CachedNetworkImage(
                imageUrl: "$image",
                height: SizeUtils.horizontalBlockSize * 50,
                width: SizeUtils.horizontalBlockSize * 47,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return SizedBox(
                    width: SizeUtils.horizontalBlockSize * 44,
                    height: SizeUtils.horizontalBlockSize * 43,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.transparent,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return SizedBox(
                    width: SizeUtils.horizontalBlockSize * 44,
                    height: SizeUtils.horizontalBlockSize * 43,
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: SizeUtils.horizontalBlockSize * 2,
                left:  SizeUtils.horizontalBlockSize * 3,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("$rate"),
                        SizedBox(
                          width: SizeUtils.horizontalBlockSize * 1,
                        ),
                        Text("$count"),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: SizeUtils.horizontalBlockSize * 2,
            bottom: SizeUtils.horizontalBlockSize * 2,
            left: SizeUtils.horizontalBlockSize * 2,
            right: SizeUtils.horizontalBlockSize * 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "$title",
                      maxLines: 1,
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border,
                  ),
                ],
              ),
              Text(
                "$category",
                maxLines: 1,
              ),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 1.3,
              ),
              Text(
                "$price",
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
