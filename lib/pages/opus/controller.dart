import 'package:get/get.dart';
import 'package:pilipala/http/read.dart';
import 'package:pilipala/models/read/opus.dart';

class OpusController extends GetxController {
  late String url;
  late String title;
  late String id;
  late String articleType;
  Rx<OpusDataModel> opusData = OpusDataModel().obs;

  @override
  void onInit() {
    super.onInit();
    title = Get.parameters['title']!;
    id = Get.parameters['id']!;
    articleType = Get.parameters['articleType']!;
    if (articleType == 'opus') {
      url = 'https://www.bilibili.com/opus/$id';
    }
  }

  Future fetchOpusData() async {
    var res = await ReadHttp.parseArticleOpus(id: id);
    if (res['status']) {
      opusData.value = res['data'];
    }
    return res;
  }
}