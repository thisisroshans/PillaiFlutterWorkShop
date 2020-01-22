class DelhiRecords {
  String indexName;
  String title;
  String desc;
  String orgType;
  List<String> org;
  List<String> sector;
  String source;
  String catalogUuid;
  String visualizable;
  String active;
  int created;
  int updated;
  String updatedDate;
  TargetBucket targetBucket;
  List<Field> field;
  String message;
  String version;
  String status;
  int total;
  int count;
  String limit;
  String offset;
  List<Records> records;

  DelhiRecords(
      {this.indexName,
      this.title,
      this.desc,
      this.orgType,
      this.org,
      this.sector,
      this.source,
      this.catalogUuid,
      this.visualizable,
      this.active,
      this.created,
      this.updated,
      this.updatedDate,
      this.targetBucket,
      this.field,
      this.message,
      this.version,
      this.status,
      this.total,
      this.count,
      this.limit,
      this.offset,
      this.records});

  DelhiRecords.fromJson(Map<String, dynamic> json) {
    indexName = json['index_name'];
    title = json['title'];
    desc = json['desc'];
    orgType = json['org_type'];
    org = json['org'].cast<String>();
    sector = json['sector'].cast<String>();
    source = json['source'];
    catalogUuid = json['catalog_uuid'];
    visualizable = json['visualizable'];
    active = json['active'];
    created = json['created'];
    updated = json['updated'];
    updatedDate = json['updated_date'];
    targetBucket = json['target_bucket'] != null
        ? new TargetBucket.fromJson(json['target_bucket'])
        : null;
    if (json['field'] != null) {
      field = new List<Field>();
      json['field'].forEach((v) {
        field.add(new Field.fromJson(v));
      });
    }
    message = json['message'];
    version = json['version'];
    status = json['status'];
    total = json['total'];
    count = json['count'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['records'] != null) {
      records = new List<Records>();
      json['records'].forEach((v) {
        records.add(new Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index_name'] = this.indexName;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['org_type'] = this.orgType;
    data['org'] = this.org;
    data['sector'] = this.sector;
    data['source'] = this.source;
    data['catalog_uuid'] = this.catalogUuid;
    data['visualizable'] = this.visualizable;
    data['active'] = this.active;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['updated_date'] = this.updatedDate;
    if (this.targetBucket != null) {
      data['target_bucket'] = this.targetBucket.toJson();
    }
    if (this.field != null) {
      data['field'] = this.field.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['version'] = this.version;
    data['status'] = this.status;
    data['total'] = this.total;
    data['count'] = this.count;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    if (this.records != null) {
      data['records'] = this.records.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TargetBucket {
  String index;
  String type;
  String field;

  TargetBucket({this.index, this.type, this.field});

  TargetBucket.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    type = json['type'];
    field = json['field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['type'] = this.type;
    data['field'] = this.field;
    return data;
  }
}

class Field {
  String id;
  String name;
  String type;

  Field({this.id, this.name, this.type});

  Field.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}

class Records {
  String cityName;
  String zoneName;
  String wardName;
  int numberOfPoles;
  int noOfPolesOfLedBulbs;
  int noOfPolesWithConventionalNonLedLights;
  double totalLengthOfRoadsInKm;
  int numberOfStreetLightsPolesPerKmOfRoad;
  int totalNoOfStreets;
  int noOfStreetsWithAdequateStreetLightingFacilties;

  Records(
      {this.cityName,
      this.zoneName,
      this.wardName,
      this.numberOfPoles,
      this.noOfPolesOfLedBulbs,
      this.noOfPolesWithConventionalNonLedLights,
      this.totalLengthOfRoadsInKm,
      this.numberOfStreetLightsPolesPerKmOfRoad,
      this.totalNoOfStreets,
      this.noOfStreetsWithAdequateStreetLightingFacilties});

  Records.fromJson(Map<String, dynamic> json) {
    cityName = json['city_name'];
    zoneName = json['zone_name'];
    wardName = json['ward_name'];
    numberOfPoles = json['number_of_poles'];
    noOfPolesOfLedBulbs = json['no_of_poles_of_led_bulbs'];
    noOfPolesWithConventionalNonLedLights =
        json['no_of_poles_with_conventional_non_led_lights'];
    totalLengthOfRoadsInKm = json['total_length_of_roads_in_km_'];
    numberOfStreetLightsPolesPerKmOfRoad =
        json['number_of_street_lights_poles_per_km_of_road'];
    totalNoOfStreets = json['total_no_of_streets'];
    noOfStreetsWithAdequateStreetLightingFacilties =
        json['no_of_streets_with_adequate_street_lighting_facilties'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_name'] = this.cityName;
    data['zone_name'] = this.zoneName;
    data['ward_name'] = this.wardName;
    data['number_of_poles'] = this.numberOfPoles;
    data['no_of_poles_of_led_bulbs'] = this.noOfPolesOfLedBulbs;
    data['no_of_poles_with_conventional_non_led_lights'] =
        this.noOfPolesWithConventionalNonLedLights;
    data['total_length_of_roads_in_km_'] = this.totalLengthOfRoadsInKm;
    data['number_of_street_lights_poles_per_km_of_road'] =
        this.numberOfStreetLightsPolesPerKmOfRoad;
    data['total_no_of_streets'] = this.totalNoOfStreets;
    data['no_of_streets_with_adequate_street_lighting_facilties'] =
        this.noOfStreetsWithAdequateStreetLightingFacilties;
    return data;
  }
}
