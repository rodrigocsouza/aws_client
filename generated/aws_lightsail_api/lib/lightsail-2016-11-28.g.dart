// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lightsail-2016-11-28.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOn _$AddOnFromJson(Map<String, dynamic> json) {
  return AddOn(
    name: json['name'] as String,
    nextSnapshotTimeOfDay: json['nextSnapshotTimeOfDay'] as String,
    snapshotTimeOfDay: json['snapshotTimeOfDay'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$AddOnRequestToJson(AddOnRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('addOnType', _$AddOnTypeEnumMap[instance.addOnType]);
  writeNotNull(
      'autoSnapshotAddOnRequest', instance.autoSnapshotAddOnRequest?.toJson());
  return val;
}

const _$AddOnTypeEnumMap = {
  AddOnType.autoSnapshot: 'AutoSnapshot',
};

Alarm _$AlarmFromJson(Map<String, dynamic> json) {
  return Alarm(
    arn: json['arn'] as String,
    comparisonOperator: _$enumDecodeNullable(
        _$ComparisonOperatorEnumMap, json['comparisonOperator']),
    contactProtocols:
        (json['contactProtocols'] as List)?.map((e) => e as String)?.toList(),
    createdAt: unixTimestampFromJson(json['createdAt']),
    datapointsToAlarm: json['datapointsToAlarm'] as int,
    evaluationPeriods: json['evaluationPeriods'] as int,
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    metricName: _$enumDecodeNullable(_$MetricNameEnumMap, json['metricName']),
    monitoredResourceInfo: json['monitoredResourceInfo'] == null
        ? null
        : MonitoredResourceInfo.fromJson(
            json['monitoredResourceInfo'] as Map<String, dynamic>),
    name: json['name'] as String,
    notificationEnabled: json['notificationEnabled'] as bool,
    notificationTriggers: (json['notificationTriggers'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    period: json['period'] as int,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    state: _$enumDecodeNullable(_$AlarmStateEnumMap, json['state']),
    statistic:
        _$enumDecodeNullable(_$MetricStatisticEnumMap, json['statistic']),
    supportCode: json['supportCode'] as String,
    threshold: (json['threshold'] as num)?.toDouble(),
    treatMissingData: _$enumDecodeNullable(
        _$TreatMissingDataEnumMap, json['treatMissingData']),
    unit: _$enumDecodeNullable(_$MetricUnitEnumMap, json['unit']),
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ComparisonOperatorEnumMap = {
  ComparisonOperator.greaterThanOrEqualToThreshold:
      'GreaterThanOrEqualToThreshold',
  ComparisonOperator.greaterThanThreshold: 'GreaterThanThreshold',
  ComparisonOperator.lessThanThreshold: 'LessThanThreshold',
  ComparisonOperator.lessThanOrEqualToThreshold: 'LessThanOrEqualToThreshold',
};

const _$MetricNameEnumMap = {
  MetricName.cPUUtilization: 'CPUUtilization',
  MetricName.networkIn: 'NetworkIn',
  MetricName.networkOut: 'NetworkOut',
  MetricName.statusCheckFailed: 'StatusCheckFailed',
  MetricName.statusCheckFailedInstance: 'StatusCheckFailed_Instance',
  MetricName.statusCheckFailedSystem: 'StatusCheckFailed_System',
  MetricName.clientTLSNegotiationErrorCount: 'ClientTLSNegotiationErrorCount',
  MetricName.healthyHostCount: 'HealthyHostCount',
  MetricName.unhealthyHostCount: 'UnhealthyHostCount',
  MetricName.hTTPCodeLb_4xxCount: 'HTTPCode_LB_4XX_Count',
  MetricName.hTTPCodeLb_5xxCount: 'HTTPCode_LB_5XX_Count',
  MetricName.hTTPCodeInstance_2xxCount: 'HTTPCode_Instance_2XX_Count',
  MetricName.hTTPCodeInstance_3xxCount: 'HTTPCode_Instance_3XX_Count',
  MetricName.hTTPCodeInstance_4xxCount: 'HTTPCode_Instance_4XX_Count',
  MetricName.hTTPCodeInstance_5xxCount: 'HTTPCode_Instance_5XX_Count',
  MetricName.instanceResponseTime: 'InstanceResponseTime',
  MetricName.rejectedConnectionCount: 'RejectedConnectionCount',
  MetricName.requestCount: 'RequestCount',
  MetricName.databaseConnections: 'DatabaseConnections',
  MetricName.diskQueueDepth: 'DiskQueueDepth',
  MetricName.freeStorageSpace: 'FreeStorageSpace',
  MetricName.networkReceiveThroughput: 'NetworkReceiveThroughput',
  MetricName.networkTransmitThroughput: 'NetworkTransmitThroughput',
};

const _$ResourceTypeEnumMap = {
  ResourceType.instance: 'Instance',
  ResourceType.staticIp: 'StaticIp',
  ResourceType.keyPair: 'KeyPair',
  ResourceType.instanceSnapshot: 'InstanceSnapshot',
  ResourceType.domain: 'Domain',
  ResourceType.peeredVpc: 'PeeredVpc',
  ResourceType.loadBalancer: 'LoadBalancer',
  ResourceType.loadBalancerTlsCertificate: 'LoadBalancerTlsCertificate',
  ResourceType.disk: 'Disk',
  ResourceType.diskSnapshot: 'DiskSnapshot',
  ResourceType.relationalDatabase: 'RelationalDatabase',
  ResourceType.relationalDatabaseSnapshot: 'RelationalDatabaseSnapshot',
  ResourceType.exportSnapshotRecord: 'ExportSnapshotRecord',
  ResourceType.cloudFormationStackRecord: 'CloudFormationStackRecord',
  ResourceType.alarm: 'Alarm',
  ResourceType.contactMethod: 'ContactMethod',
};

const _$AlarmStateEnumMap = {
  AlarmState.ok: 'OK',
  AlarmState.alarm: 'ALARM',
  AlarmState.insufficientData: 'INSUFFICIENT_DATA',
};

const _$MetricStatisticEnumMap = {
  MetricStatistic.minimum: 'Minimum',
  MetricStatistic.maximum: 'Maximum',
  MetricStatistic.sum: 'Sum',
  MetricStatistic.average: 'Average',
  MetricStatistic.sampleCount: 'SampleCount',
};

const _$TreatMissingDataEnumMap = {
  TreatMissingData.breaching: 'breaching',
  TreatMissingData.notBreaching: 'notBreaching',
  TreatMissingData.ignore: 'ignore',
  TreatMissingData.missing: 'missing',
};

const _$MetricUnitEnumMap = {
  MetricUnit.seconds: 'Seconds',
  MetricUnit.microseconds: 'Microseconds',
  MetricUnit.milliseconds: 'Milliseconds',
  MetricUnit.bytes: 'Bytes',
  MetricUnit.kilobytes: 'Kilobytes',
  MetricUnit.megabytes: 'Megabytes',
  MetricUnit.gigabytes: 'Gigabytes',
  MetricUnit.terabytes: 'Terabytes',
  MetricUnit.bits: 'Bits',
  MetricUnit.kilobits: 'Kilobits',
  MetricUnit.megabits: 'Megabits',
  MetricUnit.gigabits: 'Gigabits',
  MetricUnit.terabits: 'Terabits',
  MetricUnit.percent: 'Percent',
  MetricUnit.count: 'Count',
  MetricUnit.bytesSecond: 'Bytes/Second',
  MetricUnit.kilobytesSecond: 'Kilobytes/Second',
  MetricUnit.megabytesSecond: 'Megabytes/Second',
  MetricUnit.gigabytesSecond: 'Gigabytes/Second',
  MetricUnit.terabytesSecond: 'Terabytes/Second',
  MetricUnit.bitsSecond: 'Bits/Second',
  MetricUnit.kilobitsSecond: 'Kilobits/Second',
  MetricUnit.megabitsSecond: 'Megabits/Second',
  MetricUnit.gigabitsSecond: 'Gigabits/Second',
  MetricUnit.terabitsSecond: 'Terabits/Second',
  MetricUnit.countSecond: 'Count/Second',
  MetricUnit.none: 'None',
};

AllocateStaticIpResult _$AllocateStaticIpResultFromJson(
    Map<String, dynamic> json) {
  return AllocateStaticIpResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AttachDiskResult _$AttachDiskResultFromJson(Map<String, dynamic> json) {
  return AttachDiskResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AttachInstancesToLoadBalancerResult
    _$AttachInstancesToLoadBalancerResultFromJson(Map<String, dynamic> json) {
  return AttachInstancesToLoadBalancerResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AttachLoadBalancerTlsCertificateResult
    _$AttachLoadBalancerTlsCertificateResultFromJson(
        Map<String, dynamic> json) {
  return AttachLoadBalancerTlsCertificateResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AttachStaticIpResult _$AttachStaticIpResultFromJson(Map<String, dynamic> json) {
  return AttachStaticIpResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

AttachedDisk _$AttachedDiskFromJson(Map<String, dynamic> json) {
  return AttachedDisk(
    path: json['path'] as String,
    sizeInGb: json['sizeInGb'] as int,
  );
}

Map<String, dynamic> _$AutoSnapshotAddOnRequestToJson(
    AutoSnapshotAddOnRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('snapshotTimeOfDay', instance.snapshotTimeOfDay);
  return val;
}

AutoSnapshotDetails _$AutoSnapshotDetailsFromJson(Map<String, dynamic> json) {
  return AutoSnapshotDetails(
    createdAt: unixTimestampFromJson(json['createdAt']),
    date: json['date'] as String,
    fromAttachedDisks: (json['fromAttachedDisks'] as List)
        ?.map((e) =>
            e == null ? null : AttachedDisk.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: _$enumDecodeNullable(_$AutoSnapshotStatusEnumMap, json['status']),
  );
}

const _$AutoSnapshotStatusEnumMap = {
  AutoSnapshotStatus.success: 'Success',
  AutoSnapshotStatus.failed: 'Failed',
  AutoSnapshotStatus.inProgress: 'InProgress',
  AutoSnapshotStatus.notFound: 'NotFound',
};

AvailabilityZone _$AvailabilityZoneFromJson(Map<String, dynamic> json) {
  return AvailabilityZone(
    state: json['state'] as String,
    zoneName: json['zoneName'] as String,
  );
}

Blueprint _$BlueprintFromJson(Map<String, dynamic> json) {
  return Blueprint(
    blueprintId: json['blueprintId'] as String,
    description: json['description'] as String,
    group: json['group'] as String,
    isActive: json['isActive'] as bool,
    licenseUrl: json['licenseUrl'] as String,
    minPower: json['minPower'] as int,
    name: json['name'] as String,
    platform: _$enumDecodeNullable(_$InstancePlatformEnumMap, json['platform']),
    productUrl: json['productUrl'] as String,
    type: _$enumDecodeNullable(_$BlueprintTypeEnumMap, json['type']),
    version: json['version'] as String,
    versionCode: json['versionCode'] as String,
  );
}

const _$InstancePlatformEnumMap = {
  InstancePlatform.linuxUnix: 'LINUX_UNIX',
  InstancePlatform.windows: 'WINDOWS',
};

const _$BlueprintTypeEnumMap = {
  BlueprintType.os: 'os',
  BlueprintType.app: 'app',
};

Bundle _$BundleFromJson(Map<String, dynamic> json) {
  return Bundle(
    bundleId: json['bundleId'] as String,
    cpuCount: json['cpuCount'] as int,
    diskSizeInGb: json['diskSizeInGb'] as int,
    instanceType: json['instanceType'] as String,
    isActive: json['isActive'] as bool,
    name: json['name'] as String,
    power: json['power'] as int,
    price: (json['price'] as num)?.toDouble(),
    ramSizeInGb: (json['ramSizeInGb'] as num)?.toDouble(),
    supportedPlatforms:
        (json['supportedPlatforms'] as List)?.map((e) => e as String)?.toList(),
    transferPerMonthInGb: json['transferPerMonthInGb'] as int,
  );
}

CloseInstancePublicPortsResult _$CloseInstancePublicPortsResultFromJson(
    Map<String, dynamic> json) {
  return CloseInstancePublicPortsResult(
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
  );
}

CloudFormationStackRecord _$CloudFormationStackRecordFromJson(
    Map<String, dynamic> json) {
  return CloudFormationStackRecord(
    arn: json['arn'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    destinationInfo: json['destinationInfo'] == null
        ? null
        : DestinationInfo.fromJson(
            json['destinationInfo'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    sourceInfo: (json['sourceInfo'] as List)
        ?.map((e) => e == null
            ? null
            : CloudFormationStackRecordSourceInfo.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    state: _$enumDecodeNullable(_$RecordStateEnumMap, json['state']),
  );
}

const _$RecordStateEnumMap = {
  RecordState.started: 'Started',
  RecordState.succeeded: 'Succeeded',
  RecordState.failed: 'Failed',
};

CloudFormationStackRecordSourceInfo
    _$CloudFormationStackRecordSourceInfoFromJson(Map<String, dynamic> json) {
  return CloudFormationStackRecordSourceInfo(
    arn: json['arn'] as String,
    name: json['name'] as String,
    resourceType: _$enumDecodeNullable(
        _$CloudFormationStackRecordSourceTypeEnumMap, json['resourceType']),
  );
}

const _$CloudFormationStackRecordSourceTypeEnumMap = {
  CloudFormationStackRecordSourceType.exportSnapshotRecord:
      'ExportSnapshotRecord',
};

ContactMethod _$ContactMethodFromJson(Map<String, dynamic> json) {
  return ContactMethod(
    arn: json['arn'] as String,
    contactEndpoint: json['contactEndpoint'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    protocol: _$enumDecodeNullable(_$ContactProtocolEnumMap, json['protocol']),
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    status: _$enumDecodeNullable(_$ContactMethodStatusEnumMap, json['status']),
    supportCode: json['supportCode'] as String,
  );
}

const _$ContactProtocolEnumMap = {
  ContactProtocol.email: 'Email',
  ContactProtocol.sms: 'SMS',
};

const _$ContactMethodStatusEnumMap = {
  ContactMethodStatus.pendingVerification: 'PendingVerification',
  ContactMethodStatus.valid: 'Valid',
  ContactMethodStatus.invalid: 'Invalid',
};

CopySnapshotResult _$CopySnapshotResultFromJson(Map<String, dynamic> json) {
  return CopySnapshotResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateCloudFormationStackResult _$CreateCloudFormationStackResultFromJson(
    Map<String, dynamic> json) {
  return CreateCloudFormationStackResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateContactMethodResult _$CreateContactMethodResultFromJson(
    Map<String, dynamic> json) {
  return CreateContactMethodResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateDiskFromSnapshotResult _$CreateDiskFromSnapshotResultFromJson(
    Map<String, dynamic> json) {
  return CreateDiskFromSnapshotResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateDiskResult _$CreateDiskResultFromJson(Map<String, dynamic> json) {
  return CreateDiskResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateDiskSnapshotResult _$CreateDiskSnapshotResultFromJson(
    Map<String, dynamic> json) {
  return CreateDiskSnapshotResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateDomainEntryResult _$CreateDomainEntryResultFromJson(
    Map<String, dynamic> json) {
  return CreateDomainEntryResult(
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
  );
}

CreateDomainResult _$CreateDomainResultFromJson(Map<String, dynamic> json) {
  return CreateDomainResult(
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
  );
}

CreateInstanceSnapshotResult _$CreateInstanceSnapshotResultFromJson(
    Map<String, dynamic> json) {
  return CreateInstanceSnapshotResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateInstancesFromSnapshotResult _$CreateInstancesFromSnapshotResultFromJson(
    Map<String, dynamic> json) {
  return CreateInstancesFromSnapshotResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateInstancesResult _$CreateInstancesResultFromJson(
    Map<String, dynamic> json) {
  return CreateInstancesResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateKeyPairResult _$CreateKeyPairResultFromJson(Map<String, dynamic> json) {
  return CreateKeyPairResult(
    keyPair: json['keyPair'] == null
        ? null
        : KeyPair.fromJson(json['keyPair'] as Map<String, dynamic>),
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
    privateKeyBase64: json['privateKeyBase64'] as String,
    publicKeyBase64: json['publicKeyBase64'] as String,
  );
}

CreateLoadBalancerResult _$CreateLoadBalancerResultFromJson(
    Map<String, dynamic> json) {
  return CreateLoadBalancerResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateLoadBalancerTlsCertificateResult
    _$CreateLoadBalancerTlsCertificateResultFromJson(
        Map<String, dynamic> json) {
  return CreateLoadBalancerTlsCertificateResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateRelationalDatabaseFromSnapshotResult
    _$CreateRelationalDatabaseFromSnapshotResultFromJson(
        Map<String, dynamic> json) {
  return CreateRelationalDatabaseFromSnapshotResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateRelationalDatabaseResult _$CreateRelationalDatabaseResultFromJson(
    Map<String, dynamic> json) {
  return CreateRelationalDatabaseResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CreateRelationalDatabaseSnapshotResult
    _$CreateRelationalDatabaseSnapshotResultFromJson(
        Map<String, dynamic> json) {
  return CreateRelationalDatabaseSnapshotResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteAlarmResult _$DeleteAlarmResultFromJson(Map<String, dynamic> json) {
  return DeleteAlarmResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteAutoSnapshotResult _$DeleteAutoSnapshotResultFromJson(
    Map<String, dynamic> json) {
  return DeleteAutoSnapshotResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteContactMethodResult _$DeleteContactMethodResultFromJson(
    Map<String, dynamic> json) {
  return DeleteContactMethodResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteDiskResult _$DeleteDiskResultFromJson(Map<String, dynamic> json) {
  return DeleteDiskResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteDiskSnapshotResult _$DeleteDiskSnapshotResultFromJson(
    Map<String, dynamic> json) {
  return DeleteDiskSnapshotResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteDomainEntryResult _$DeleteDomainEntryResultFromJson(
    Map<String, dynamic> json) {
  return DeleteDomainEntryResult(
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
  );
}

DeleteDomainResult _$DeleteDomainResultFromJson(Map<String, dynamic> json) {
  return DeleteDomainResult(
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
  );
}

DeleteInstanceResult _$DeleteInstanceResultFromJson(Map<String, dynamic> json) {
  return DeleteInstanceResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteInstanceSnapshotResult _$DeleteInstanceSnapshotResultFromJson(
    Map<String, dynamic> json) {
  return DeleteInstanceSnapshotResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteKeyPairResult _$DeleteKeyPairResultFromJson(Map<String, dynamic> json) {
  return DeleteKeyPairResult(
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
  );
}

DeleteKnownHostKeysResult _$DeleteKnownHostKeysResultFromJson(
    Map<String, dynamic> json) {
  return DeleteKnownHostKeysResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteLoadBalancerResult _$DeleteLoadBalancerResultFromJson(
    Map<String, dynamic> json) {
  return DeleteLoadBalancerResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteLoadBalancerTlsCertificateResult
    _$DeleteLoadBalancerTlsCertificateResultFromJson(
        Map<String, dynamic> json) {
  return DeleteLoadBalancerTlsCertificateResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteRelationalDatabaseResult _$DeleteRelationalDatabaseResultFromJson(
    Map<String, dynamic> json) {
  return DeleteRelationalDatabaseResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DeleteRelationalDatabaseSnapshotResult
    _$DeleteRelationalDatabaseSnapshotResultFromJson(
        Map<String, dynamic> json) {
  return DeleteRelationalDatabaseSnapshotResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DestinationInfo _$DestinationInfoFromJson(Map<String, dynamic> json) {
  return DestinationInfo(
    id: json['id'] as String,
    service: json['service'] as String,
  );
}

DetachDiskResult _$DetachDiskResultFromJson(Map<String, dynamic> json) {
  return DetachDiskResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DetachInstancesFromLoadBalancerResult
    _$DetachInstancesFromLoadBalancerResultFromJson(Map<String, dynamic> json) {
  return DetachInstancesFromLoadBalancerResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DetachStaticIpResult _$DetachStaticIpResultFromJson(Map<String, dynamic> json) {
  return DetachStaticIpResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DisableAddOnResult _$DisableAddOnResultFromJson(Map<String, dynamic> json) {
  return DisableAddOnResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Disk _$DiskFromJson(Map<String, dynamic> json) {
  return Disk(
    addOns: (json['addOns'] as List)
        ?.map(
            (e) => e == null ? null : AddOn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    arn: json['arn'] as String,
    attachedTo: json['attachedTo'] as String,
    attachmentState: json['attachmentState'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    gbInUse: json['gbInUse'] as int,
    iops: json['iops'] as int,
    isAttached: json['isAttached'] as bool,
    isSystemDisk: json['isSystemDisk'] as bool,
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    path: json['path'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    sizeInGb: json['sizeInGb'] as int,
    state: _$enumDecodeNullable(_$DiskStateEnumMap, json['state']),
    supportCode: json['supportCode'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$DiskStateEnumMap = {
  DiskState.pending: 'pending',
  DiskState.error: 'error',
  DiskState.available: 'available',
  DiskState.inUse: 'in-use',
  DiskState.unknown: 'unknown',
};

DiskInfo _$DiskInfoFromJson(Map<String, dynamic> json) {
  return DiskInfo(
    isSystemDisk: json['isSystemDisk'] as bool,
    name: json['name'] as String,
    path: json['path'] as String,
    sizeInGb: json['sizeInGb'] as int,
  );
}

Map<String, dynamic> _$DiskMapToJson(DiskMap instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('newDiskName', instance.newDiskName);
  writeNotNull('originalDiskPath', instance.originalDiskPath);
  return val;
}

DiskSnapshot _$DiskSnapshotFromJson(Map<String, dynamic> json) {
  return DiskSnapshot(
    arn: json['arn'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    fromDiskArn: json['fromDiskArn'] as String,
    fromDiskName: json['fromDiskName'] as String,
    fromInstanceArn: json['fromInstanceArn'] as String,
    fromInstanceName: json['fromInstanceName'] as String,
    isFromAutoSnapshot: json['isFromAutoSnapshot'] as bool,
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    progress: json['progress'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    sizeInGb: json['sizeInGb'] as int,
    state: _$enumDecodeNullable(_$DiskSnapshotStateEnumMap, json['state']),
    supportCode: json['supportCode'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$DiskSnapshotStateEnumMap = {
  DiskSnapshotState.pending: 'pending',
  DiskSnapshotState.completed: 'completed',
  DiskSnapshotState.error: 'error',
  DiskSnapshotState.unknown: 'unknown',
};

DiskSnapshotInfo _$DiskSnapshotInfoFromJson(Map<String, dynamic> json) {
  return DiskSnapshotInfo(
    sizeInGb: json['sizeInGb'] as int,
  );
}

Domain _$DomainFromJson(Map<String, dynamic> json) {
  return Domain(
    arn: json['arn'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    domainEntries: (json['domainEntries'] as List)
        ?.map((e) =>
            e == null ? null : DomainEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    supportCode: json['supportCode'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DomainEntry _$DomainEntryFromJson(Map<String, dynamic> json) {
  return DomainEntry(
    id: json['id'] as String,
    isAlias: json['isAlias'] as bool,
    name: json['name'] as String,
    options: (json['options'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    target: json['target'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$DomainEntryToJson(DomainEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('isAlias', instance.isAlias);
  writeNotNull('name', instance.name);
  writeNotNull('options', instance.options);
  writeNotNull('target', instance.target);
  writeNotNull('type', instance.type);
  return val;
}

DownloadDefaultKeyPairResult _$DownloadDefaultKeyPairResultFromJson(
    Map<String, dynamic> json) {
  return DownloadDefaultKeyPairResult(
    privateKeyBase64: json['privateKeyBase64'] as String,
    publicKeyBase64: json['publicKeyBase64'] as String,
  );
}

EnableAddOnResult _$EnableAddOnResultFromJson(Map<String, dynamic> json) {
  return EnableAddOnResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ExportSnapshotRecord _$ExportSnapshotRecordFromJson(Map<String, dynamic> json) {
  return ExportSnapshotRecord(
    arn: json['arn'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    destinationInfo: json['destinationInfo'] == null
        ? null
        : DestinationInfo.fromJson(
            json['destinationInfo'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    sourceInfo: json['sourceInfo'] == null
        ? null
        : ExportSnapshotRecordSourceInfo.fromJson(
            json['sourceInfo'] as Map<String, dynamic>),
    state: _$enumDecodeNullable(_$RecordStateEnumMap, json['state']),
  );
}

ExportSnapshotRecordSourceInfo _$ExportSnapshotRecordSourceInfoFromJson(
    Map<String, dynamic> json) {
  return ExportSnapshotRecordSourceInfo(
    arn: json['arn'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    diskSnapshotInfo: json['diskSnapshotInfo'] == null
        ? null
        : DiskSnapshotInfo.fromJson(
            json['diskSnapshotInfo'] as Map<String, dynamic>),
    fromResourceArn: json['fromResourceArn'] as String,
    fromResourceName: json['fromResourceName'] as String,
    instanceSnapshotInfo: json['instanceSnapshotInfo'] == null
        ? null
        : InstanceSnapshotInfo.fromJson(
            json['instanceSnapshotInfo'] as Map<String, dynamic>),
    name: json['name'] as String,
    resourceType: _$enumDecodeNullable(
        _$ExportSnapshotRecordSourceTypeEnumMap, json['resourceType']),
  );
}

const _$ExportSnapshotRecordSourceTypeEnumMap = {
  ExportSnapshotRecordSourceType.instanceSnapshot: 'InstanceSnapshot',
  ExportSnapshotRecordSourceType.diskSnapshot: 'DiskSnapshot',
};

ExportSnapshotResult _$ExportSnapshotResultFromJson(Map<String, dynamic> json) {
  return ExportSnapshotResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetActiveNamesResult _$GetActiveNamesResultFromJson(Map<String, dynamic> json) {
  return GetActiveNamesResult(
    activeNames:
        (json['activeNames'] as List)?.map((e) => e as String)?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetAlarmsResult _$GetAlarmsResultFromJson(Map<String, dynamic> json) {
  return GetAlarmsResult(
    alarms: (json['alarms'] as List)
        ?.map(
            (e) => e == null ? null : Alarm.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetAutoSnapshotsResult _$GetAutoSnapshotsResultFromJson(
    Map<String, dynamic> json) {
  return GetAutoSnapshotsResult(
    autoSnapshots: (json['autoSnapshots'] as List)
        ?.map((e) => e == null
            ? null
            : AutoSnapshotDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    resourceName: json['resourceName'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
  );
}

GetBlueprintsResult _$GetBlueprintsResultFromJson(Map<String, dynamic> json) {
  return GetBlueprintsResult(
    blueprints: (json['blueprints'] as List)
        ?.map((e) =>
            e == null ? null : Blueprint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetBundlesResult _$GetBundlesResultFromJson(Map<String, dynamic> json) {
  return GetBundlesResult(
    bundles: (json['bundles'] as List)
        ?.map((e) =>
            e == null ? null : Bundle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetCloudFormationStackRecordsResult
    _$GetCloudFormationStackRecordsResultFromJson(Map<String, dynamic> json) {
  return GetCloudFormationStackRecordsResult(
    cloudFormationStackRecords: (json['cloudFormationStackRecords'] as List)
        ?.map((e) => e == null
            ? null
            : CloudFormationStackRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetContactMethodsResult _$GetContactMethodsResultFromJson(
    Map<String, dynamic> json) {
  return GetContactMethodsResult(
    contactMethods: (json['contactMethods'] as List)
        ?.map((e) => e == null
            ? null
            : ContactMethod.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetDiskResult _$GetDiskResultFromJson(Map<String, dynamic> json) {
  return GetDiskResult(
    disk: json['disk'] == null
        ? null
        : Disk.fromJson(json['disk'] as Map<String, dynamic>),
  );
}

GetDiskSnapshotResult _$GetDiskSnapshotResultFromJson(
    Map<String, dynamic> json) {
  return GetDiskSnapshotResult(
    diskSnapshot: json['diskSnapshot'] == null
        ? null
        : DiskSnapshot.fromJson(json['diskSnapshot'] as Map<String, dynamic>),
  );
}

GetDiskSnapshotsResult _$GetDiskSnapshotsResultFromJson(
    Map<String, dynamic> json) {
  return GetDiskSnapshotsResult(
    diskSnapshots: (json['diskSnapshots'] as List)
        ?.map((e) =>
            e == null ? null : DiskSnapshot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetDisksResult _$GetDisksResultFromJson(Map<String, dynamic> json) {
  return GetDisksResult(
    disks: (json['disks'] as List)
        ?.map(
            (e) => e == null ? null : Disk.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetDomainResult _$GetDomainResultFromJson(Map<String, dynamic> json) {
  return GetDomainResult(
    domain: json['domain'] == null
        ? null
        : Domain.fromJson(json['domain'] as Map<String, dynamic>),
  );
}

GetDomainsResult _$GetDomainsResultFromJson(Map<String, dynamic> json) {
  return GetDomainsResult(
    domains: (json['domains'] as List)
        ?.map((e) =>
            e == null ? null : Domain.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetExportSnapshotRecordsResult _$GetExportSnapshotRecordsResultFromJson(
    Map<String, dynamic> json) {
  return GetExportSnapshotRecordsResult(
    exportSnapshotRecords: (json['exportSnapshotRecords'] as List)
        ?.map((e) => e == null
            ? null
            : ExportSnapshotRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetInstanceAccessDetailsResult _$GetInstanceAccessDetailsResultFromJson(
    Map<String, dynamic> json) {
  return GetInstanceAccessDetailsResult(
    accessDetails: json['accessDetails'] == null
        ? null
        : InstanceAccessDetails.fromJson(
            json['accessDetails'] as Map<String, dynamic>),
  );
}

GetInstanceMetricDataResult _$GetInstanceMetricDataResultFromJson(
    Map<String, dynamic> json) {
  return GetInstanceMetricDataResult(
    metricData: (json['metricData'] as List)
        ?.map((e) => e == null
            ? null
            : MetricDatapoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    metricName:
        _$enumDecodeNullable(_$InstanceMetricNameEnumMap, json['metricName']),
  );
}

const _$InstanceMetricNameEnumMap = {
  InstanceMetricName.cPUUtilization: 'CPUUtilization',
  InstanceMetricName.networkIn: 'NetworkIn',
  InstanceMetricName.networkOut: 'NetworkOut',
  InstanceMetricName.statusCheckFailed: 'StatusCheckFailed',
  InstanceMetricName.statusCheckFailedInstance: 'StatusCheckFailed_Instance',
  InstanceMetricName.statusCheckFailedSystem: 'StatusCheckFailed_System',
};

GetInstancePortStatesResult _$GetInstancePortStatesResultFromJson(
    Map<String, dynamic> json) {
  return GetInstancePortStatesResult(
    portStates: (json['portStates'] as List)
        ?.map((e) => e == null
            ? null
            : InstancePortState.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetInstanceResult _$GetInstanceResultFromJson(Map<String, dynamic> json) {
  return GetInstanceResult(
    instance: json['instance'] == null
        ? null
        : Instance.fromJson(json['instance'] as Map<String, dynamic>),
  );
}

GetInstanceSnapshotResult _$GetInstanceSnapshotResultFromJson(
    Map<String, dynamic> json) {
  return GetInstanceSnapshotResult(
    instanceSnapshot: json['instanceSnapshot'] == null
        ? null
        : InstanceSnapshot.fromJson(
            json['instanceSnapshot'] as Map<String, dynamic>),
  );
}

GetInstanceSnapshotsResult _$GetInstanceSnapshotsResultFromJson(
    Map<String, dynamic> json) {
  return GetInstanceSnapshotsResult(
    instanceSnapshots: (json['instanceSnapshots'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceSnapshot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetInstanceStateResult _$GetInstanceStateResultFromJson(
    Map<String, dynamic> json) {
  return GetInstanceStateResult(
    state: json['state'] == null
        ? null
        : InstanceState.fromJson(json['state'] as Map<String, dynamic>),
  );
}

GetInstancesResult _$GetInstancesResultFromJson(Map<String, dynamic> json) {
  return GetInstancesResult(
    instances: (json['instances'] as List)
        ?.map((e) =>
            e == null ? null : Instance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetKeyPairResult _$GetKeyPairResultFromJson(Map<String, dynamic> json) {
  return GetKeyPairResult(
    keyPair: json['keyPair'] == null
        ? null
        : KeyPair.fromJson(json['keyPair'] as Map<String, dynamic>),
  );
}

GetKeyPairsResult _$GetKeyPairsResultFromJson(Map<String, dynamic> json) {
  return GetKeyPairsResult(
    keyPairs: (json['keyPairs'] as List)
        ?.map((e) =>
            e == null ? null : KeyPair.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetLoadBalancerMetricDataResult _$GetLoadBalancerMetricDataResultFromJson(
    Map<String, dynamic> json) {
  return GetLoadBalancerMetricDataResult(
    metricData: (json['metricData'] as List)
        ?.map((e) => e == null
            ? null
            : MetricDatapoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    metricName: _$enumDecodeNullable(
        _$LoadBalancerMetricNameEnumMap, json['metricName']),
  );
}

const _$LoadBalancerMetricNameEnumMap = {
  LoadBalancerMetricName.clientTLSNegotiationErrorCount:
      'ClientTLSNegotiationErrorCount',
  LoadBalancerMetricName.healthyHostCount: 'HealthyHostCount',
  LoadBalancerMetricName.unhealthyHostCount: 'UnhealthyHostCount',
  LoadBalancerMetricName.hTTPCodeLb_4xxCount: 'HTTPCode_LB_4XX_Count',
  LoadBalancerMetricName.hTTPCodeLb_5xxCount: 'HTTPCode_LB_5XX_Count',
  LoadBalancerMetricName.hTTPCodeInstance_2xxCount:
      'HTTPCode_Instance_2XX_Count',
  LoadBalancerMetricName.hTTPCodeInstance_3xxCount:
      'HTTPCode_Instance_3XX_Count',
  LoadBalancerMetricName.hTTPCodeInstance_4xxCount:
      'HTTPCode_Instance_4XX_Count',
  LoadBalancerMetricName.hTTPCodeInstance_5xxCount:
      'HTTPCode_Instance_5XX_Count',
  LoadBalancerMetricName.instanceResponseTime: 'InstanceResponseTime',
  LoadBalancerMetricName.rejectedConnectionCount: 'RejectedConnectionCount',
  LoadBalancerMetricName.requestCount: 'RequestCount',
};

GetLoadBalancerResult _$GetLoadBalancerResultFromJson(
    Map<String, dynamic> json) {
  return GetLoadBalancerResult(
    loadBalancer: json['loadBalancer'] == null
        ? null
        : LoadBalancer.fromJson(json['loadBalancer'] as Map<String, dynamic>),
  );
}

GetLoadBalancerTlsCertificatesResult
    _$GetLoadBalancerTlsCertificatesResultFromJson(Map<String, dynamic> json) {
  return GetLoadBalancerTlsCertificatesResult(
    tlsCertificates: (json['tlsCertificates'] as List)
        ?.map((e) => e == null
            ? null
            : LoadBalancerTlsCertificate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetLoadBalancersResult _$GetLoadBalancersResultFromJson(
    Map<String, dynamic> json) {
  return GetLoadBalancersResult(
    loadBalancers: (json['loadBalancers'] as List)
        ?.map((e) =>
            e == null ? null : LoadBalancer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetOperationResult _$GetOperationResultFromJson(Map<String, dynamic> json) {
  return GetOperationResult(
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
  );
}

GetOperationsForResourceResult _$GetOperationsForResourceResultFromJson(
    Map<String, dynamic> json) {
  return GetOperationsForResourceResult(
    nextPageCount: json['nextPageCount'] as String,
    nextPageToken: json['nextPageToken'] as String,
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetOperationsResult _$GetOperationsResultFromJson(Map<String, dynamic> json) {
  return GetOperationsResult(
    nextPageToken: json['nextPageToken'] as String,
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetRegionsResult _$GetRegionsResultFromJson(Map<String, dynamic> json) {
  return GetRegionsResult(
    regions: (json['regions'] as List)
        ?.map((e) =>
            e == null ? null : Region.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetRelationalDatabaseBlueprintsResult
    _$GetRelationalDatabaseBlueprintsResultFromJson(Map<String, dynamic> json) {
  return GetRelationalDatabaseBlueprintsResult(
    blueprints: (json['blueprints'] as List)
        ?.map((e) => e == null
            ? null
            : RelationalDatabaseBlueprint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetRelationalDatabaseBundlesResult _$GetRelationalDatabaseBundlesResultFromJson(
    Map<String, dynamic> json) {
  return GetRelationalDatabaseBundlesResult(
    bundles: (json['bundles'] as List)
        ?.map((e) => e == null
            ? null
            : RelationalDatabaseBundle.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextPageToken: json['nextPageToken'] as String,
  );
}

GetRelationalDatabaseEventsResult _$GetRelationalDatabaseEventsResultFromJson(
    Map<String, dynamic> json) {
  return GetRelationalDatabaseEventsResult(
    nextPageToken: json['nextPageToken'] as String,
    relationalDatabaseEvents: (json['relationalDatabaseEvents'] as List)
        ?.map((e) => e == null
            ? null
            : RelationalDatabaseEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetRelationalDatabaseLogEventsResult
    _$GetRelationalDatabaseLogEventsResultFromJson(Map<String, dynamic> json) {
  return GetRelationalDatabaseLogEventsResult(
    nextBackwardToken: json['nextBackwardToken'] as String,
    nextForwardToken: json['nextForwardToken'] as String,
    resourceLogEvents: (json['resourceLogEvents'] as List)
        ?.map((e) =>
            e == null ? null : LogEvent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetRelationalDatabaseLogStreamsResult
    _$GetRelationalDatabaseLogStreamsResultFromJson(Map<String, dynamic> json) {
  return GetRelationalDatabaseLogStreamsResult(
    logStreams: (json['logStreams'] as List)?.map((e) => e as String)?.toList(),
  );
}

GetRelationalDatabaseMasterUserPasswordResult
    _$GetRelationalDatabaseMasterUserPasswordResultFromJson(
        Map<String, dynamic> json) {
  return GetRelationalDatabaseMasterUserPasswordResult(
    createdAt: unixTimestampFromJson(json['createdAt']),
    masterUserPassword: json['masterUserPassword'] as String,
  );
}

GetRelationalDatabaseMetricDataResult
    _$GetRelationalDatabaseMetricDataResultFromJson(Map<String, dynamic> json) {
  return GetRelationalDatabaseMetricDataResult(
    metricData: (json['metricData'] as List)
        ?.map((e) => e == null
            ? null
            : MetricDatapoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    metricName: _$enumDecodeNullable(
        _$RelationalDatabaseMetricNameEnumMap, json['metricName']),
  );
}

const _$RelationalDatabaseMetricNameEnumMap = {
  RelationalDatabaseMetricName.cPUUtilization: 'CPUUtilization',
  RelationalDatabaseMetricName.databaseConnections: 'DatabaseConnections',
  RelationalDatabaseMetricName.diskQueueDepth: 'DiskQueueDepth',
  RelationalDatabaseMetricName.freeStorageSpace: 'FreeStorageSpace',
  RelationalDatabaseMetricName.networkReceiveThroughput:
      'NetworkReceiveThroughput',
  RelationalDatabaseMetricName.networkTransmitThroughput:
      'NetworkTransmitThroughput',
};

GetRelationalDatabaseParametersResult
    _$GetRelationalDatabaseParametersResultFromJson(Map<String, dynamic> json) {
  return GetRelationalDatabaseParametersResult(
    nextPageToken: json['nextPageToken'] as String,
    parameters: (json['parameters'] as List)
        ?.map((e) => e == null
            ? null
            : RelationalDatabaseParameter.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetRelationalDatabaseResult _$GetRelationalDatabaseResultFromJson(
    Map<String, dynamic> json) {
  return GetRelationalDatabaseResult(
    relationalDatabase: json['relationalDatabase'] == null
        ? null
        : RelationalDatabase.fromJson(
            json['relationalDatabase'] as Map<String, dynamic>),
  );
}

GetRelationalDatabaseSnapshotResult
    _$GetRelationalDatabaseSnapshotResultFromJson(Map<String, dynamic> json) {
  return GetRelationalDatabaseSnapshotResult(
    relationalDatabaseSnapshot: json['relationalDatabaseSnapshot'] == null
        ? null
        : RelationalDatabaseSnapshot.fromJson(
            json['relationalDatabaseSnapshot'] as Map<String, dynamic>),
  );
}

GetRelationalDatabaseSnapshotsResult
    _$GetRelationalDatabaseSnapshotsResultFromJson(Map<String, dynamic> json) {
  return GetRelationalDatabaseSnapshotsResult(
    nextPageToken: json['nextPageToken'] as String,
    relationalDatabaseSnapshots: (json['relationalDatabaseSnapshots'] as List)
        ?.map((e) => e == null
            ? null
            : RelationalDatabaseSnapshot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetRelationalDatabasesResult _$GetRelationalDatabasesResultFromJson(
    Map<String, dynamic> json) {
  return GetRelationalDatabasesResult(
    nextPageToken: json['nextPageToken'] as String,
    relationalDatabases: (json['relationalDatabases'] as List)
        ?.map((e) => e == null
            ? null
            : RelationalDatabase.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetStaticIpResult _$GetStaticIpResultFromJson(Map<String, dynamic> json) {
  return GetStaticIpResult(
    staticIp: json['staticIp'] == null
        ? null
        : StaticIp.fromJson(json['staticIp'] as Map<String, dynamic>),
  );
}

GetStaticIpsResult _$GetStaticIpsResultFromJson(Map<String, dynamic> json) {
  return GetStaticIpsResult(
    nextPageToken: json['nextPageToken'] as String,
    staticIps: (json['staticIps'] as List)
        ?.map((e) =>
            e == null ? null : StaticIp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

HostKeyAttributes _$HostKeyAttributesFromJson(Map<String, dynamic> json) {
  return HostKeyAttributes(
    algorithm: json['algorithm'] as String,
    fingerprintSHA1: json['fingerprintSHA1'] as String,
    fingerprintSHA256: json['fingerprintSHA256'] as String,
    notValidAfter: unixTimestampFromJson(json['notValidAfter']),
    notValidBefore: unixTimestampFromJson(json['notValidBefore']),
    publicKey: json['publicKey'] as String,
    witnessedAt: unixTimestampFromJson(json['witnessedAt']),
  );
}

ImportKeyPairResult _$ImportKeyPairResultFromJson(Map<String, dynamic> json) {
  return ImportKeyPairResult(
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
  );
}

Instance _$InstanceFromJson(Map<String, dynamic> json) {
  return Instance(
    addOns: (json['addOns'] as List)
        ?.map(
            (e) => e == null ? null : AddOn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    arn: json['arn'] as String,
    blueprintId: json['blueprintId'] as String,
    blueprintName: json['blueprintName'] as String,
    bundleId: json['bundleId'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    hardware: json['hardware'] == null
        ? null
        : InstanceHardware.fromJson(json['hardware'] as Map<String, dynamic>),
    ipv6Address: json['ipv6Address'] as String,
    isStaticIp: json['isStaticIp'] as bool,
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    networking: json['networking'] == null
        ? null
        : InstanceNetworking.fromJson(
            json['networking'] as Map<String, dynamic>),
    privateIpAddress: json['privateIpAddress'] as String,
    publicIpAddress: json['publicIpAddress'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    sshKeyName: json['sshKeyName'] as String,
    state: json['state'] == null
        ? null
        : InstanceState.fromJson(json['state'] as Map<String, dynamic>),
    supportCode: json['supportCode'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    username: json['username'] as String,
  );
}

InstanceAccessDetails _$InstanceAccessDetailsFromJson(
    Map<String, dynamic> json) {
  return InstanceAccessDetails(
    certKey: json['certKey'] as String,
    expiresAt: unixTimestampFromJson(json['expiresAt']),
    hostKeys: (json['hostKeys'] as List)
        ?.map((e) => e == null
            ? null
            : HostKeyAttributes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    instanceName: json['instanceName'] as String,
    ipAddress: json['ipAddress'] as String,
    password: json['password'] as String,
    passwordData: json['passwordData'] == null
        ? null
        : PasswordData.fromJson(json['passwordData'] as Map<String, dynamic>),
    privateKey: json['privateKey'] as String,
    protocol:
        _$enumDecodeNullable(_$InstanceAccessProtocolEnumMap, json['protocol']),
    username: json['username'] as String,
  );
}

const _$InstanceAccessProtocolEnumMap = {
  InstanceAccessProtocol.ssh: 'ssh',
  InstanceAccessProtocol.rdp: 'rdp',
};

Map<String, dynamic> _$InstanceEntryToJson(InstanceEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('availabilityZone', instance.availabilityZone);
  writeNotNull('instanceType', instance.instanceType);
  writeNotNull(
      'portInfoSource', _$PortInfoSourceTypeEnumMap[instance.portInfoSource]);
  writeNotNull('sourceName', instance.sourceName);
  writeNotNull('userData', instance.userData);
  return val;
}

const _$PortInfoSourceTypeEnumMap = {
  PortInfoSourceType.$default: 'DEFAULT',
  PortInfoSourceType.instance: 'INSTANCE',
  PortInfoSourceType.none: 'NONE',
  PortInfoSourceType.closed: 'CLOSED',
};

InstanceHardware _$InstanceHardwareFromJson(Map<String, dynamic> json) {
  return InstanceHardware(
    cpuCount: json['cpuCount'] as int,
    disks: (json['disks'] as List)
        ?.map(
            (e) => e == null ? null : Disk.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ramSizeInGb: (json['ramSizeInGb'] as num)?.toDouble(),
  );
}

InstanceHealthSummary _$InstanceHealthSummaryFromJson(
    Map<String, dynamic> json) {
  return InstanceHealthSummary(
    instanceHealth: _$enumDecodeNullable(
        _$InstanceHealthStateEnumMap, json['instanceHealth']),
    instanceHealthReason: _$enumDecodeNullable(
        _$InstanceHealthReasonEnumMap, json['instanceHealthReason']),
    instanceName: json['instanceName'] as String,
  );
}

const _$InstanceHealthStateEnumMap = {
  InstanceHealthState.initial: 'initial',
  InstanceHealthState.healthy: 'healthy',
  InstanceHealthState.unhealthy: 'unhealthy',
  InstanceHealthState.unused: 'unused',
  InstanceHealthState.draining: 'draining',
  InstanceHealthState.unavailable: 'unavailable',
};

const _$InstanceHealthReasonEnumMap = {
  InstanceHealthReason.lbRegistrationInProgress: 'Lb.RegistrationInProgress',
  InstanceHealthReason.lbInitialHealthChecking: 'Lb.InitialHealthChecking',
  InstanceHealthReason.lbInternalError: 'Lb.InternalError',
  InstanceHealthReason.instanceResponseCodeMismatch:
      'Instance.ResponseCodeMismatch',
  InstanceHealthReason.instanceTimeout: 'Instance.Timeout',
  InstanceHealthReason.instanceFailedHealthChecks:
      'Instance.FailedHealthChecks',
  InstanceHealthReason.instanceNotRegistered: 'Instance.NotRegistered',
  InstanceHealthReason.instanceNotInUse: 'Instance.NotInUse',
  InstanceHealthReason.instanceDeregistrationInProgress:
      'Instance.DeregistrationInProgress',
  InstanceHealthReason.instanceInvalidState: 'Instance.InvalidState',
  InstanceHealthReason.instanceIpUnusable: 'Instance.IpUnusable',
};

InstanceNetworking _$InstanceNetworkingFromJson(Map<String, dynamic> json) {
  return InstanceNetworking(
    monthlyTransfer: json['monthlyTransfer'] == null
        ? null
        : MonthlyTransfer.fromJson(
            json['monthlyTransfer'] as Map<String, dynamic>),
    ports: (json['ports'] as List)
        ?.map((e) => e == null
            ? null
            : InstancePortInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

InstancePortInfo _$InstancePortInfoFromJson(Map<String, dynamic> json) {
  return InstancePortInfo(
    accessDirection:
        _$enumDecodeNullable(_$AccessDirectionEnumMap, json['accessDirection']),
    accessFrom: json['accessFrom'] as String,
    accessType:
        _$enumDecodeNullable(_$PortAccessTypeEnumMap, json['accessType']),
    commonName: json['commonName'] as String,
    fromPort: json['fromPort'] as int,
    protocol: _$enumDecodeNullable(_$NetworkProtocolEnumMap, json['protocol']),
    toPort: json['toPort'] as int,
  );
}

const _$AccessDirectionEnumMap = {
  AccessDirection.inbound: 'inbound',
  AccessDirection.outbound: 'outbound',
};

const _$PortAccessTypeEnumMap = {
  PortAccessType.public: 'Public',
  PortAccessType.private: 'Private',
};

const _$NetworkProtocolEnumMap = {
  NetworkProtocol.tcp: 'tcp',
  NetworkProtocol.all: 'all',
  NetworkProtocol.udp: 'udp',
};

InstancePortState _$InstancePortStateFromJson(Map<String, dynamic> json) {
  return InstancePortState(
    fromPort: json['fromPort'] as int,
    protocol: _$enumDecodeNullable(_$NetworkProtocolEnumMap, json['protocol']),
    state: _$enumDecodeNullable(_$PortStateEnumMap, json['state']),
    toPort: json['toPort'] as int,
  );
}

const _$PortStateEnumMap = {
  PortState.open: 'open',
  PortState.closed: 'closed',
};

InstanceSnapshot _$InstanceSnapshotFromJson(Map<String, dynamic> json) {
  return InstanceSnapshot(
    arn: json['arn'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    fromAttachedDisks: (json['fromAttachedDisks'] as List)
        ?.map(
            (e) => e == null ? null : Disk.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    fromBlueprintId: json['fromBlueprintId'] as String,
    fromBundleId: json['fromBundleId'] as String,
    fromInstanceArn: json['fromInstanceArn'] as String,
    fromInstanceName: json['fromInstanceName'] as String,
    isFromAutoSnapshot: json['isFromAutoSnapshot'] as bool,
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    progress: json['progress'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    sizeInGb: json['sizeInGb'] as int,
    state: _$enumDecodeNullable(_$InstanceSnapshotStateEnumMap, json['state']),
    supportCode: json['supportCode'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$InstanceSnapshotStateEnumMap = {
  InstanceSnapshotState.pending: 'pending',
  InstanceSnapshotState.error: 'error',
  InstanceSnapshotState.available: 'available',
};

InstanceSnapshotInfo _$InstanceSnapshotInfoFromJson(Map<String, dynamic> json) {
  return InstanceSnapshotInfo(
    fromBlueprintId: json['fromBlueprintId'] as String,
    fromBundleId: json['fromBundleId'] as String,
    fromDiskInfo: (json['fromDiskInfo'] as List)
        ?.map((e) =>
            e == null ? null : DiskInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

InstanceState _$InstanceStateFromJson(Map<String, dynamic> json) {
  return InstanceState(
    code: json['code'] as int,
    name: json['name'] as String,
  );
}

IsVpcPeeredResult _$IsVpcPeeredResultFromJson(Map<String, dynamic> json) {
  return IsVpcPeeredResult(
    isPeered: json['isPeered'] as bool,
  );
}

KeyPair _$KeyPairFromJson(Map<String, dynamic> json) {
  return KeyPair(
    arn: json['arn'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    fingerprint: json['fingerprint'] as String,
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    supportCode: json['supportCode'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LoadBalancer _$LoadBalancerFromJson(Map<String, dynamic> json) {
  return LoadBalancer(
    arn: json['arn'] as String,
    configurationOptions:
        (json['configurationOptions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    createdAt: unixTimestampFromJson(json['createdAt']),
    dnsName: json['dnsName'] as String,
    healthCheckPath: json['healthCheckPath'] as String,
    instanceHealthSummary: (json['instanceHealthSummary'] as List)
        ?.map((e) => e == null
            ? null
            : InstanceHealthSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    instancePort: json['instancePort'] as int,
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    protocol:
        _$enumDecodeNullable(_$LoadBalancerProtocolEnumMap, json['protocol']),
    publicPorts: (json['publicPorts'] as List)?.map((e) => e as int)?.toList(),
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    state: _$enumDecodeNullable(_$LoadBalancerStateEnumMap, json['state']),
    supportCode: json['supportCode'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tlsCertificateSummaries: (json['tlsCertificateSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : LoadBalancerTlsCertificateSummary.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$LoadBalancerProtocolEnumMap = {
  LoadBalancerProtocol.httpHttps: 'HTTP_HTTPS',
  LoadBalancerProtocol.http: 'HTTP',
};

const _$LoadBalancerStateEnumMap = {
  LoadBalancerState.active: 'active',
  LoadBalancerState.provisioning: 'provisioning',
  LoadBalancerState.activeImpaired: 'active_impaired',
  LoadBalancerState.failed: 'failed',
  LoadBalancerState.unknown: 'unknown',
};

LoadBalancerTlsCertificate _$LoadBalancerTlsCertificateFromJson(
    Map<String, dynamic> json) {
  return LoadBalancerTlsCertificate(
    arn: json['arn'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    domainName: json['domainName'] as String,
    domainValidationRecords: (json['domainValidationRecords'] as List)
        ?.map((e) => e == null
            ? null
            : LoadBalancerTlsCertificateDomainValidationRecord.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    failureReason: _$enumDecodeNullable(
        _$LoadBalancerTlsCertificateFailureReasonEnumMap,
        json['failureReason']),
    isAttached: json['isAttached'] as bool,
    issuedAt: unixTimestampFromJson(json['issuedAt']),
    issuer: json['issuer'] as String,
    keyAlgorithm: json['keyAlgorithm'] as String,
    loadBalancerName: json['loadBalancerName'] as String,
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    notAfter: unixTimestampFromJson(json['notAfter']),
    notBefore: unixTimestampFromJson(json['notBefore']),
    renewalSummary: json['renewalSummary'] == null
        ? null
        : LoadBalancerTlsCertificateRenewalSummary.fromJson(
            json['renewalSummary'] as Map<String, dynamic>),
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    revocationReason: _$enumDecodeNullable(
        _$LoadBalancerTlsCertificateRevocationReasonEnumMap,
        json['revocationReason']),
    revokedAt: unixTimestampFromJson(json['revokedAt']),
    serial: json['serial'] as String,
    signatureAlgorithm: json['signatureAlgorithm'] as String,
    status: _$enumDecodeNullable(
        _$LoadBalancerTlsCertificateStatusEnumMap, json['status']),
    subject: json['subject'] as String,
    subjectAlternativeNames: (json['subjectAlternativeNames'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    supportCode: json['supportCode'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

const _$LoadBalancerTlsCertificateFailureReasonEnumMap = {
  LoadBalancerTlsCertificateFailureReason.noAvailableContacts:
      'NO_AVAILABLE_CONTACTS',
  LoadBalancerTlsCertificateFailureReason.additionalVerificationRequired:
      'ADDITIONAL_VERIFICATION_REQUIRED',
  LoadBalancerTlsCertificateFailureReason.domainNotAllowed:
      'DOMAIN_NOT_ALLOWED',
  LoadBalancerTlsCertificateFailureReason.invalidPublicDomain:
      'INVALID_PUBLIC_DOMAIN',
  LoadBalancerTlsCertificateFailureReason.other: 'OTHER',
};

const _$LoadBalancerTlsCertificateRevocationReasonEnumMap = {
  LoadBalancerTlsCertificateRevocationReason.unspecified: 'UNSPECIFIED',
  LoadBalancerTlsCertificateRevocationReason.keyCompromise: 'KEY_COMPROMISE',
  LoadBalancerTlsCertificateRevocationReason.caCompromise: 'CA_COMPROMISE',
  LoadBalancerTlsCertificateRevocationReason.affiliationChanged:
      'AFFILIATION_CHANGED',
  LoadBalancerTlsCertificateRevocationReason.superceded: 'SUPERCEDED',
  LoadBalancerTlsCertificateRevocationReason.cessationOfOperation:
      'CESSATION_OF_OPERATION',
  LoadBalancerTlsCertificateRevocationReason.certificateHold:
      'CERTIFICATE_HOLD',
  LoadBalancerTlsCertificateRevocationReason.removeFromCrl: 'REMOVE_FROM_CRL',
  LoadBalancerTlsCertificateRevocationReason.privilegeWithdrawn:
      'PRIVILEGE_WITHDRAWN',
  LoadBalancerTlsCertificateRevocationReason.aACompromise: 'A_A_COMPROMISE',
};

const _$LoadBalancerTlsCertificateStatusEnumMap = {
  LoadBalancerTlsCertificateStatus.pendingValidation: 'PENDING_VALIDATION',
  LoadBalancerTlsCertificateStatus.issued: 'ISSUED',
  LoadBalancerTlsCertificateStatus.inactive: 'INACTIVE',
  LoadBalancerTlsCertificateStatus.expired: 'EXPIRED',
  LoadBalancerTlsCertificateStatus.validationTimedOut: 'VALIDATION_TIMED_OUT',
  LoadBalancerTlsCertificateStatus.revoked: 'REVOKED',
  LoadBalancerTlsCertificateStatus.failed: 'FAILED',
  LoadBalancerTlsCertificateStatus.unknown: 'UNKNOWN',
};

LoadBalancerTlsCertificateDomainValidationOption
    _$LoadBalancerTlsCertificateDomainValidationOptionFromJson(
        Map<String, dynamic> json) {
  return LoadBalancerTlsCertificateDomainValidationOption(
    domainName: json['domainName'] as String,
    validationStatus: _$enumDecodeNullable(
        _$LoadBalancerTlsCertificateDomainStatusEnumMap,
        json['validationStatus']),
  );
}

const _$LoadBalancerTlsCertificateDomainStatusEnumMap = {
  LoadBalancerTlsCertificateDomainStatus.pendingValidation:
      'PENDING_VALIDATION',
  LoadBalancerTlsCertificateDomainStatus.failed: 'FAILED',
  LoadBalancerTlsCertificateDomainStatus.success: 'SUCCESS',
};

LoadBalancerTlsCertificateDomainValidationRecord
    _$LoadBalancerTlsCertificateDomainValidationRecordFromJson(
        Map<String, dynamic> json) {
  return LoadBalancerTlsCertificateDomainValidationRecord(
    domainName: json['domainName'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    validationStatus: _$enumDecodeNullable(
        _$LoadBalancerTlsCertificateDomainStatusEnumMap,
        json['validationStatus']),
    value: json['value'] as String,
  );
}

LoadBalancerTlsCertificateRenewalSummary
    _$LoadBalancerTlsCertificateRenewalSummaryFromJson(
        Map<String, dynamic> json) {
  return LoadBalancerTlsCertificateRenewalSummary(
    domainValidationOptions: (json['domainValidationOptions'] as List)
        ?.map((e) => e == null
            ? null
            : LoadBalancerTlsCertificateDomainValidationOption.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    renewalStatus: _$enumDecodeNullable(
        _$LoadBalancerTlsCertificateRenewalStatusEnumMap,
        json['renewalStatus']),
  );
}

const _$LoadBalancerTlsCertificateRenewalStatusEnumMap = {
  LoadBalancerTlsCertificateRenewalStatus.pendingAutoRenewal:
      'PENDING_AUTO_RENEWAL',
  LoadBalancerTlsCertificateRenewalStatus.pendingValidation:
      'PENDING_VALIDATION',
  LoadBalancerTlsCertificateRenewalStatus.success: 'SUCCESS',
  LoadBalancerTlsCertificateRenewalStatus.failed: 'FAILED',
};

LoadBalancerTlsCertificateSummary _$LoadBalancerTlsCertificateSummaryFromJson(
    Map<String, dynamic> json) {
  return LoadBalancerTlsCertificateSummary(
    isAttached: json['isAttached'] as bool,
    name: json['name'] as String,
  );
}

LogEvent _$LogEventFromJson(Map<String, dynamic> json) {
  return LogEvent(
    createdAt: unixTimestampFromJson(json['createdAt']),
    message: json['message'] as String,
  );
}

MetricDatapoint _$MetricDatapointFromJson(Map<String, dynamic> json) {
  return MetricDatapoint(
    average: (json['average'] as num)?.toDouble(),
    maximum: (json['maximum'] as num)?.toDouble(),
    minimum: (json['minimum'] as num)?.toDouble(),
    sampleCount: (json['sampleCount'] as num)?.toDouble(),
    sum: (json['sum'] as num)?.toDouble(),
    timestamp: unixTimestampFromJson(json['timestamp']),
    unit: _$enumDecodeNullable(_$MetricUnitEnumMap, json['unit']),
  );
}

MonitoredResourceInfo _$MonitoredResourceInfoFromJson(
    Map<String, dynamic> json) {
  return MonitoredResourceInfo(
    arn: json['arn'] as String,
    name: json['name'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
  );
}

MonthlyTransfer _$MonthlyTransferFromJson(Map<String, dynamic> json) {
  return MonthlyTransfer(
    gbPerMonthAllocated: json['gbPerMonthAllocated'] as int,
  );
}

OpenInstancePublicPortsResult _$OpenInstancePublicPortsResultFromJson(
    Map<String, dynamic> json) {
  return OpenInstancePublicPortsResult(
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
  );
}

Operation _$OperationFromJson(Map<String, dynamic> json) {
  return Operation(
    createdAt: unixTimestampFromJson(json['createdAt']),
    errorCode: json['errorCode'] as String,
    errorDetails: json['errorDetails'] as String,
    id: json['id'] as String,
    isTerminal: json['isTerminal'] as bool,
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    operationDetails: json['operationDetails'] as String,
    operationType:
        _$enumDecodeNullable(_$OperationTypeEnumMap, json['operationType']),
    resourceName: json['resourceName'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    status: _$enumDecodeNullable(_$OperationStatusEnumMap, json['status']),
    statusChangedAt: unixTimestampFromJson(json['statusChangedAt']),
  );
}

const _$OperationTypeEnumMap = {
  OperationType.deleteKnownHostKeys: 'DeleteKnownHostKeys',
  OperationType.deleteInstance: 'DeleteInstance',
  OperationType.createInstance: 'CreateInstance',
  OperationType.stopInstance: 'StopInstance',
  OperationType.startInstance: 'StartInstance',
  OperationType.rebootInstance: 'RebootInstance',
  OperationType.openInstancePublicPorts: 'OpenInstancePublicPorts',
  OperationType.putInstancePublicPorts: 'PutInstancePublicPorts',
  OperationType.closeInstancePublicPorts: 'CloseInstancePublicPorts',
  OperationType.allocateStaticIp: 'AllocateStaticIp',
  OperationType.releaseStaticIp: 'ReleaseStaticIp',
  OperationType.attachStaticIp: 'AttachStaticIp',
  OperationType.detachStaticIp: 'DetachStaticIp',
  OperationType.updateDomainEntry: 'UpdateDomainEntry',
  OperationType.deleteDomainEntry: 'DeleteDomainEntry',
  OperationType.createDomain: 'CreateDomain',
  OperationType.deleteDomain: 'DeleteDomain',
  OperationType.createInstanceSnapshot: 'CreateInstanceSnapshot',
  OperationType.deleteInstanceSnapshot: 'DeleteInstanceSnapshot',
  OperationType.createInstancesFromSnapshot: 'CreateInstancesFromSnapshot',
  OperationType.createLoadBalancer: 'CreateLoadBalancer',
  OperationType.deleteLoadBalancer: 'DeleteLoadBalancer',
  OperationType.attachInstancesToLoadBalancer: 'AttachInstancesToLoadBalancer',
  OperationType.detachInstancesFromLoadBalancer:
      'DetachInstancesFromLoadBalancer',
  OperationType.updateLoadBalancerAttribute: 'UpdateLoadBalancerAttribute',
  OperationType.createLoadBalancerTlsCertificate:
      'CreateLoadBalancerTlsCertificate',
  OperationType.deleteLoadBalancerTlsCertificate:
      'DeleteLoadBalancerTlsCertificate',
  OperationType.attachLoadBalancerTlsCertificate:
      'AttachLoadBalancerTlsCertificate',
  OperationType.createDisk: 'CreateDisk',
  OperationType.deleteDisk: 'DeleteDisk',
  OperationType.attachDisk: 'AttachDisk',
  OperationType.detachDisk: 'DetachDisk',
  OperationType.createDiskSnapshot: 'CreateDiskSnapshot',
  OperationType.deleteDiskSnapshot: 'DeleteDiskSnapshot',
  OperationType.createDiskFromSnapshot: 'CreateDiskFromSnapshot',
  OperationType.createRelationalDatabase: 'CreateRelationalDatabase',
  OperationType.updateRelationalDatabase: 'UpdateRelationalDatabase',
  OperationType.deleteRelationalDatabase: 'DeleteRelationalDatabase',
  OperationType.createRelationalDatabaseFromSnapshot:
      'CreateRelationalDatabaseFromSnapshot',
  OperationType.createRelationalDatabaseSnapshot:
      'CreateRelationalDatabaseSnapshot',
  OperationType.deleteRelationalDatabaseSnapshot:
      'DeleteRelationalDatabaseSnapshot',
  OperationType.updateRelationalDatabaseParameters:
      'UpdateRelationalDatabaseParameters',
  OperationType.startRelationalDatabase: 'StartRelationalDatabase',
  OperationType.rebootRelationalDatabase: 'RebootRelationalDatabase',
  OperationType.stopRelationalDatabase: 'StopRelationalDatabase',
  OperationType.enableAddOn: 'EnableAddOn',
  OperationType.disableAddOn: 'DisableAddOn',
  OperationType.putAlarm: 'PutAlarm',
  OperationType.getAlarms: 'GetAlarms',
  OperationType.deleteAlarm: 'DeleteAlarm',
  OperationType.testAlarm: 'TestAlarm',
  OperationType.createContactMethod: 'CreateContactMethod',
  OperationType.getContactMethods: 'GetContactMethods',
  OperationType.sendContactMethodVerification: 'SendContactMethodVerification',
  OperationType.deleteContactMethod: 'DeleteContactMethod',
};

const _$OperationStatusEnumMap = {
  OperationStatus.notStarted: 'NotStarted',
  OperationStatus.started: 'Started',
  OperationStatus.failed: 'Failed',
  OperationStatus.completed: 'Completed',
  OperationStatus.succeeded: 'Succeeded',
};

PasswordData _$PasswordDataFromJson(Map<String, dynamic> json) {
  return PasswordData(
    ciphertext: json['ciphertext'] as String,
    keyPairName: json['keyPairName'] as String,
  );
}

PeerVpcResult _$PeerVpcResultFromJson(Map<String, dynamic> json) {
  return PeerVpcResult(
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
  );
}

PendingMaintenanceAction _$PendingMaintenanceActionFromJson(
    Map<String, dynamic> json) {
  return PendingMaintenanceAction(
    action: json['action'] as String,
    currentApplyDate: unixTimestampFromJson(json['currentApplyDate']),
    description: json['description'] as String,
  );
}

PendingModifiedRelationalDatabaseValues
    _$PendingModifiedRelationalDatabaseValuesFromJson(
        Map<String, dynamic> json) {
  return PendingModifiedRelationalDatabaseValues(
    backupRetentionEnabled: json['backupRetentionEnabled'] as bool,
    engineVersion: json['engineVersion'] as String,
    masterUserPassword: json['masterUserPassword'] as String,
  );
}

Map<String, dynamic> _$PortInfoToJson(PortInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fromPort', instance.fromPort);
  writeNotNull('protocol', _$NetworkProtocolEnumMap[instance.protocol]);
  writeNotNull('toPort', instance.toPort);
  return val;
}

PutAlarmResult _$PutAlarmResultFromJson(Map<String, dynamic> json) {
  return PutAlarmResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PutInstancePublicPortsResult _$PutInstancePublicPortsResultFromJson(
    Map<String, dynamic> json) {
  return PutInstancePublicPortsResult(
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
  );
}

RebootInstanceResult _$RebootInstanceResultFromJson(Map<String, dynamic> json) {
  return RebootInstanceResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RebootRelationalDatabaseResult _$RebootRelationalDatabaseResultFromJson(
    Map<String, dynamic> json) {
  return RebootRelationalDatabaseResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Region _$RegionFromJson(Map<String, dynamic> json) {
  return Region(
    availabilityZones: (json['availabilityZones'] as List)
        ?.map((e) => e == null
            ? null
            : AvailabilityZone.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    continentCode: json['continentCode'] as String,
    description: json['description'] as String,
    displayName: json['displayName'] as String,
    name: _$enumDecodeNullable(_$RegionNameEnumMap, json['name']),
    relationalDatabaseAvailabilityZones:
        (json['relationalDatabaseAvailabilityZones'] as List)
            ?.map((e) => e == null
                ? null
                : AvailabilityZone.fromJson(e as Map<String, dynamic>))
            ?.toList(),
  );
}

const _$RegionNameEnumMap = {
  RegionName.usEast_1: 'us-east-1',
  RegionName.usEast_2: 'us-east-2',
  RegionName.usWest_1: 'us-west-1',
  RegionName.usWest_2: 'us-west-2',
  RegionName.euWest_1: 'eu-west-1',
  RegionName.euWest_2: 'eu-west-2',
  RegionName.euWest_3: 'eu-west-3',
  RegionName.euCentral_1: 'eu-central-1',
  RegionName.caCentral_1: 'ca-central-1',
  RegionName.apSouth_1: 'ap-south-1',
  RegionName.apSoutheast_1: 'ap-southeast-1',
  RegionName.apSoutheast_2: 'ap-southeast-2',
  RegionName.apNortheast_1: 'ap-northeast-1',
  RegionName.apNortheast_2: 'ap-northeast-2',
};

RelationalDatabase _$RelationalDatabaseFromJson(Map<String, dynamic> json) {
  return RelationalDatabase(
    arn: json['arn'] as String,
    backupRetentionEnabled: json['backupRetentionEnabled'] as bool,
    caCertificateIdentifier: json['caCertificateIdentifier'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    engine: json['engine'] as String,
    engineVersion: json['engineVersion'] as String,
    hardware: json['hardware'] == null
        ? null
        : RelationalDatabaseHardware.fromJson(
            json['hardware'] as Map<String, dynamic>),
    latestRestorableTime: unixTimestampFromJson(json['latestRestorableTime']),
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    masterDatabaseName: json['masterDatabaseName'] as String,
    masterEndpoint: json['masterEndpoint'] == null
        ? null
        : RelationalDatabaseEndpoint.fromJson(
            json['masterEndpoint'] as Map<String, dynamic>),
    masterUsername: json['masterUsername'] as String,
    name: json['name'] as String,
    parameterApplyStatus: json['parameterApplyStatus'] as String,
    pendingMaintenanceActions: (json['pendingMaintenanceActions'] as List)
        ?.map((e) => e == null
            ? null
            : PendingMaintenanceAction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pendingModifiedValues: json['pendingModifiedValues'] == null
        ? null
        : PendingModifiedRelationalDatabaseValues.fromJson(
            json['pendingModifiedValues'] as Map<String, dynamic>),
    preferredBackupWindow: json['preferredBackupWindow'] as String,
    preferredMaintenanceWindow: json['preferredMaintenanceWindow'] as String,
    publiclyAccessible: json['publiclyAccessible'] as bool,
    relationalDatabaseBlueprintId:
        json['relationalDatabaseBlueprintId'] as String,
    relationalDatabaseBundleId: json['relationalDatabaseBundleId'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    secondaryAvailabilityZone: json['secondaryAvailabilityZone'] as String,
    state: json['state'] as String,
    supportCode: json['supportCode'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

RelationalDatabaseBlueprint _$RelationalDatabaseBlueprintFromJson(
    Map<String, dynamic> json) {
  return RelationalDatabaseBlueprint(
    blueprintId: json['blueprintId'] as String,
    engine:
        _$enumDecodeNullable(_$RelationalDatabaseEngineEnumMap, json['engine']),
    engineDescription: json['engineDescription'] as String,
    engineVersion: json['engineVersion'] as String,
    engineVersionDescription: json['engineVersionDescription'] as String,
    isEngineDefault: json['isEngineDefault'] as bool,
  );
}

const _$RelationalDatabaseEngineEnumMap = {
  RelationalDatabaseEngine.mysql: 'mysql',
};

RelationalDatabaseBundle _$RelationalDatabaseBundleFromJson(
    Map<String, dynamic> json) {
  return RelationalDatabaseBundle(
    bundleId: json['bundleId'] as String,
    cpuCount: json['cpuCount'] as int,
    diskSizeInGb: json['diskSizeInGb'] as int,
    isActive: json['isActive'] as bool,
    isEncrypted: json['isEncrypted'] as bool,
    name: json['name'] as String,
    price: (json['price'] as num)?.toDouble(),
    ramSizeInGb: (json['ramSizeInGb'] as num)?.toDouble(),
    transferPerMonthInGb: json['transferPerMonthInGb'] as int,
  );
}

RelationalDatabaseEndpoint _$RelationalDatabaseEndpointFromJson(
    Map<String, dynamic> json) {
  return RelationalDatabaseEndpoint(
    address: json['address'] as String,
    port: json['port'] as int,
  );
}

RelationalDatabaseEvent _$RelationalDatabaseEventFromJson(
    Map<String, dynamic> json) {
  return RelationalDatabaseEvent(
    createdAt: unixTimestampFromJson(json['createdAt']),
    eventCategories:
        (json['eventCategories'] as List)?.map((e) => e as String)?.toList(),
    message: json['message'] as String,
    resource: json['resource'] as String,
  );
}

RelationalDatabaseHardware _$RelationalDatabaseHardwareFromJson(
    Map<String, dynamic> json) {
  return RelationalDatabaseHardware(
    cpuCount: json['cpuCount'] as int,
    diskSizeInGb: json['diskSizeInGb'] as int,
    ramSizeInGb: (json['ramSizeInGb'] as num)?.toDouble(),
  );
}

RelationalDatabaseParameter _$RelationalDatabaseParameterFromJson(
    Map<String, dynamic> json) {
  return RelationalDatabaseParameter(
    allowedValues: json['allowedValues'] as String,
    applyMethod: json['applyMethod'] as String,
    applyType: json['applyType'] as String,
    dataType: json['dataType'] as String,
    description: json['description'] as String,
    isModifiable: json['isModifiable'] as bool,
    parameterName: json['parameterName'] as String,
    parameterValue: json['parameterValue'] as String,
  );
}

Map<String, dynamic> _$RelationalDatabaseParameterToJson(
    RelationalDatabaseParameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allowedValues', instance.allowedValues);
  writeNotNull('applyMethod', instance.applyMethod);
  writeNotNull('applyType', instance.applyType);
  writeNotNull('dataType', instance.dataType);
  writeNotNull('description', instance.description);
  writeNotNull('isModifiable', instance.isModifiable);
  writeNotNull('parameterName', instance.parameterName);
  writeNotNull('parameterValue', instance.parameterValue);
  return val;
}

RelationalDatabaseSnapshot _$RelationalDatabaseSnapshotFromJson(
    Map<String, dynamic> json) {
  return RelationalDatabaseSnapshot(
    arn: json['arn'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    engine: json['engine'] as String,
    engineVersion: json['engineVersion'] as String,
    fromRelationalDatabaseArn: json['fromRelationalDatabaseArn'] as String,
    fromRelationalDatabaseBlueprintId:
        json['fromRelationalDatabaseBlueprintId'] as String,
    fromRelationalDatabaseBundleId:
        json['fromRelationalDatabaseBundleId'] as String,
    fromRelationalDatabaseName: json['fromRelationalDatabaseName'] as String,
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    sizeInGb: json['sizeInGb'] as int,
    state: json['state'] as String,
    supportCode: json['supportCode'] as String,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ReleaseStaticIpResult _$ReleaseStaticIpResultFromJson(
    Map<String, dynamic> json) {
  return ReleaseStaticIpResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ResourceLocation _$ResourceLocationFromJson(Map<String, dynamic> json) {
  return ResourceLocation(
    availabilityZone: json['availabilityZone'] as String,
    regionName: _$enumDecodeNullable(_$RegionNameEnumMap, json['regionName']),
  );
}

SendContactMethodVerificationResult
    _$SendContactMethodVerificationResultFromJson(Map<String, dynamic> json) {
  return SendContactMethodVerificationResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StartInstanceResult _$StartInstanceResultFromJson(Map<String, dynamic> json) {
  return StartInstanceResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StartRelationalDatabaseResult _$StartRelationalDatabaseResultFromJson(
    Map<String, dynamic> json) {
  return StartRelationalDatabaseResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StaticIp _$StaticIpFromJson(Map<String, dynamic> json) {
  return StaticIp(
    arn: json['arn'] as String,
    attachedTo: json['attachedTo'] as String,
    createdAt: unixTimestampFromJson(json['createdAt']),
    ipAddress: json['ipAddress'] as String,
    isAttached: json['isAttached'] as bool,
    location: json['location'] == null
        ? null
        : ResourceLocation.fromJson(json['location'] as Map<String, dynamic>),
    name: json['name'] as String,
    resourceType:
        _$enumDecodeNullable(_$ResourceTypeEnumMap, json['resourceType']),
    supportCode: json['supportCode'] as String,
  );
}

StopInstanceResult _$StopInstanceResultFromJson(Map<String, dynamic> json) {
  return StopInstanceResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

StopRelationalDatabaseResult _$StopRelationalDatabaseResultFromJson(
    Map<String, dynamic> json) {
  return StopRelationalDatabaseResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

TagResourceResult _$TagResourceResultFromJson(Map<String, dynamic> json) {
  return TagResourceResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

TestAlarmResult _$TestAlarmResultFromJson(Map<String, dynamic> json) {
  return TestAlarmResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UnpeerVpcResult _$UnpeerVpcResultFromJson(Map<String, dynamic> json) {
  return UnpeerVpcResult(
    operation: json['operation'] == null
        ? null
        : Operation.fromJson(json['operation'] as Map<String, dynamic>),
  );
}

UntagResourceResult _$UntagResourceResultFromJson(Map<String, dynamic> json) {
  return UntagResourceResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UpdateDomainEntryResult _$UpdateDomainEntryResultFromJson(
    Map<String, dynamic> json) {
  return UpdateDomainEntryResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UpdateLoadBalancerAttributeResult _$UpdateLoadBalancerAttributeResultFromJson(
    Map<String, dynamic> json) {
  return UpdateLoadBalancerAttributeResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UpdateRelationalDatabaseParametersResult
    _$UpdateRelationalDatabaseParametersResultFromJson(
        Map<String, dynamic> json) {
  return UpdateRelationalDatabaseParametersResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UpdateRelationalDatabaseResult _$UpdateRelationalDatabaseResultFromJson(
    Map<String, dynamic> json) {
  return UpdateRelationalDatabaseResult(
    operations: (json['operations'] as List)
        ?.map((e) =>
            e == null ? null : Operation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
