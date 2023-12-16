import 'dart:io';

import 'iterable_helpers.dart';
import 'string_helper.dart';

enum FileSizeSuffix { b, kb, mb, gb }

enum FileType { image, pdf, word, excel, powerpoint, other }

class FileHelpers {
  static String? getFileExtension(String? filePath) {
    if (StringHelper.isNotNullOrEmpty(filePath)) {
      final pathSplitted = filePath!.split('.');
      if (IterableHelpers.isNotNullOrEmpty(pathSplitted)) {
        return pathSplitted.last;
      }
    }

    return null;
  }

  static double convertFileSize(num rawSize,
      {FileSizeSuffix suffix = FileSizeSuffix.mb}) {
    switch (suffix) {
      case FileSizeSuffix.b:
        return rawSize.toDouble();
      case FileSizeSuffix.kb:
        return rawSize / 1024;
      case FileSizeSuffix.mb:
        return rawSize / (1024 * 1024);
      case FileSizeSuffix.gb:
        return rawSize / (1024 * 1024 * 1024);
    }
  }

  static double getFileSize(String path,
      {FileSizeSuffix suffix = FileSizeSuffix.mb}) {
    final rawSize = File(path).lengthSync();
    return convertFileSize(rawSize);
  }

  static FileType getFileType(String? filePath) {
    const imageFormats = ['jpg', 'jpeg', 'png', 'raw', 'bmp', 'tif', 'tiff'];
    const pdfFormat = ['pdf'];
    const wordFormat = ['doc', 'docx', 'docm'];
    const excelFormat = ['xls', 'xlsx', 'xlsm'];
    const powerpointFormat = ['ppt', 'pptx', 'pptm'];

    if (StringHelper.isNotNullOrEmpty(filePath)) {
      final ext = getFileExtension(filePath!);

      if (imageFormats.contains(ext)) {
        return FileType.image;
      } else if (pdfFormat.contains(ext)) {
        return FileType.pdf;
      } else if (wordFormat.contains(ext)) {
        return FileType.word;
      } else if (excelFormat.contains(ext)) {
        return FileType.excel;
      } else if (powerpointFormat.contains(ext)) {
        return FileType.powerpoint;
      }
    }
    return FileType.other;
  }

  static bool isLimitedCapacity(double capacity,
      {double limitedCapacity = 10.0}) {
    if (capacity > 0 && capacity < limitedCapacity) return true;
    return false;
  }
}
