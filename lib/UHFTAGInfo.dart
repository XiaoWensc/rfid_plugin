class UHFTAGInfo {
  List<int>? epcBytes;
  String? pc;
  String? epc;
  String? tid;
  String? user;
  String? rssi;
  String? ant;
  String? reserved;
  int? remain = -1;
  int? index = -1;
  int? count;

  UHFTAGInfo(this.epcBytes, this.pc, this.epc, this.tid, this.user, this.rssi,
      this.ant, this.reserved, this.remain, this.index, this.count);

  UHFTAGInfo.fromJson(Map<String, dynamic> json) {
    epcBytes = json['epcBytes'];
    pc = json['pc'];
    epc = json['epc'];
    tid = json['tid'];
    user = json['user'];
    rssi = json['rssi'];
    ant = json['ant'];
    reserved = json['reserved'];
    remain = json['remain'];
    index = json['index'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() => {
        "epcBytes": epcBytes,
        "pc": pc,
        "epc": epc,
        "tid": tid,
        "user": user,
        "rssi": rssi,
        "ant": ant,
        "reserved": reserved,
        "remain": remain,
        "index": index,
        "count": count,
      };
}
