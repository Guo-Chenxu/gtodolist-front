import 'package:intl/intl.dart';

class TaskCreateReq {
  String? title;
  String? content;
  int? status;

  TaskCreateReq({this.title, this.content, this.status});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'title': title,
      'content': content,
      'status': status,
    };
    return map;
  }
}

class TaskUpdateReq {
  int? id;
  String? title;
  String? content;
  int? status;

  TaskUpdateReq({this.id, this.title, this.content, this.status});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'title': title,
      'content': content,
      'status': status,
    };
    return map;
  }
}

class TaskDeleteReq {
  int? id;

  TaskDeleteReq({this.id});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
    };
    return map;
  }
}

class TaskListResp {
  int? total;
  List<Task>? item;

  TaskListResp({this.total, this.item});

  TaskListResp.fromJson(Map<String, dynamic> json) {
    total = json['total'];

    var list = json['item'] as List;
    List<Task> itemList = list.map((i) => Task.fromJson(i)).toList();
    item = itemList;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'total': total,
      'item': item,
    };
    return map;
  }
}

class Task {
  int? id;
  String? title;
  String? content;
  int? status;
  String? createAt;

  Task({this.id, this.title, this.content, this.status, this.createAt});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    status = json['status'];
    createAt = DateFormat('yyyy-MM-dd hh:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(json['create_at'] * 1000))
        .toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'status': status,
      'create_at': createAt,
    };
  }
}
