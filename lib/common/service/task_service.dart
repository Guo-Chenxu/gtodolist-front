import 'package:gtodolist/common/http/http_requests.dart';
import 'package:gtodolist/common/http/request_apis.dart';
import 'package:gtodolist/common/models/common_resp.dart';
import 'package:gtodolist/common/models/task_model.dart';

class TaskService {
  Future<CommonResp?> create(String title, String content) async {
    Map<String, dynamic> resp = await HttpRequest.formPost(
        RequestApi.baseUrl + RequestApi.taskCreate,
        params:
            TaskCreateReq(title: title, content: content, status: 0).toJson());
    return CommonResp.fromJson(resp);
  }

  Future<CommonResp?> list() async {
    Map<String, dynamic> resp =
        await HttpRequest.pathGet(RequestApi.baseUrl + RequestApi.taskList);
    return CommonResp.fromJson(resp);
  }

  Future<CommonResp?> update(int id, String title, String content) async {
    Map<String, dynamic> resp = await HttpRequest.formPost(
        RequestApi.baseUrl + RequestApi.taskUpdate,
        params: TaskUpdateReq(id: id, title: title, content: content, status: 0)
            .toJson());
    return CommonResp.fromJson(resp);
  }

  Future<CommonResp?> delete(int id) async {
    Map<String, dynamic> resp = await HttpRequest.formPost(
      RequestApi.baseUrl + RequestApi.taskDelete,
      params: TaskDeleteReq(id: id).toJson(),
    );
    return CommonResp.fromJson(resp);
  }
}
