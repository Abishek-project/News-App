import 'dart:io';

import 'package:flutter/material.dart';

class AppTypography {
  static TextStyle boldCallout = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'sfprotext');

  static TextStyle regularCallout = TextStyle(
      fontSize: Platform.isIOS ? 16 : 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'sfprotext');

  static TextStyle boldCaption01 = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'sfprotext');

  static TextStyle regularCaption01 = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'sfprotext');

  static TextStyle regularCaption02 = const TextStyle(
      fontSize: 11, fontWeight: FontWeight.w400, fontFamily: 'sfprotext');

  static TextStyle boldTitle01 = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.w700, fontFamily: 'sfprodisplay');

  static TextStyle boldTitle02 = TextStyle(
      fontSize: Platform.isIOS ? 22 : 22,
      fontWeight: FontWeight.w700,
      fontFamily: 'sfprodisplay');

  static TextStyle boldTitle03 = const TextStyle(
      fontSize: 22, fontWeight: FontWeight.w600, fontFamily: 'sfprodisplay');

  static TextStyle boldBodyAndHeadline = TextStyle(
      fontSize: Platform.isIOS ? 17 : 17,
      fontWeight: FontWeight.w600,
      fontFamily: 'sfprotext');

  static TextStyle boldBodySubHeadline = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w800, fontFamily: 'sfprotext');

  static TextStyle regularSubHeadline = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'sfprotext');

  static TextStyle regularBody = TextStyle(
      fontSize: Platform.isIOS ? 17 : 17,
      fontWeight: FontWeight.w400,
      fontFamily: 'sfprotext');

  static TextStyle boldFootNote01 = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w600, fontFamily: 'sfprotext');

  static TextStyle regularFootNote01 = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w400, fontFamily: 'sfprotext');

  static TextStyle regularFootNote02 = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w500, fontFamily: 'sfprotext');
  static TextStyle regularFootNote03 = const TextStyle(
      fontSize: 10, fontWeight: FontWeight.w500, fontFamily: 'sfprotext');
  static TextStyle regularFootNote04 = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'sfprotext');
  static TextStyle addNewMessage = const TextStyle(
      fontSize: 27, fontWeight: FontWeight.w500, fontFamily: 'sfprotext');
  static TextStyle messageTime = const TextStyle(
    fontSize: 13,
    fontFamily: 'sfprotext',
  );
  static TextStyle newMessage = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'sfprotext',
  );
}
