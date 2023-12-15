class ChartCompletionResponse {
  String? id;
  String? object;
  String? created;
  String? model;
  String? usage;
  String? choice;

  ChartCompletionResponse(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.usage,
      this.choice});

  ChartCompletionResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    usage = json['usage'];
    choice = json['choice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['created'] = created;
    data['model'] = model;
    data['usage'] = usage;
    data['choice'] = choice;
    return data;
  }
}
