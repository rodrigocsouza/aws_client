// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'dynamodb-2012-08-10.g.dart';

/// Amazon DynamoDB is a fully managed NoSQL database service that provides fast
/// and predictable performance with seamless scalability. DynamoDB lets you
/// offload the administrative burdens of operating and scaling a distributed
/// database, so that you don't have to worry about hardware provisioning, setup
/// and configuration, replication, software patching, or cluster scaling.
class DynamoDB {
  final _s.JsonProtocol _protocol;
  DynamoDB({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'dynamodb',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// The <code>BatchGetItem</code> operation returns the attributes of one or
  /// more items from one or more tables. You identify requested items by
  /// primary key.
  ///
  /// A single operation can retrieve up to 16 MB of data, which can contain as
  /// many as 100 items. <code>BatchGetItem</code> returns a partial result if
  /// the response size limit is exceeded, the table's provisioned throughput is
  /// exceeded, or an internal processing failure occurs. If a partial result is
  /// returned, the operation returns a value for <code>UnprocessedKeys</code>.
  /// You can use this value to retry the operation starting with the next item
  /// to get.
  /// <important>
  /// If you request more than 100 items, <code>BatchGetItem</code> returns a
  /// <code>ValidationException</code> with the message "Too many items
  /// requested for the BatchGetItem call."
  /// </important>
  /// For example, if you ask to retrieve 100 items, but each individual item is
  /// 300 KB in size, the system returns 52 items (so as not to exceed the 16 MB
  /// limit). It also returns an appropriate <code>UnprocessedKeys</code> value
  /// so you can get the next page of results. If desired, your application can
  /// include its own logic to assemble the pages of results into one dataset.
  ///
  /// If <i>none</i> of the items can be processed due to insufficient
  /// provisioned throughput on all of the tables in the request, then
  /// <code>BatchGetItem</code> returns a
  /// <code>ProvisionedThroughputExceededException</code>. If <i>at least
  /// one</i> of the items is successfully processed, then
  /// <code>BatchGetItem</code> completes successfully, while returning the keys
  /// of the unread items in <code>UnprocessedKeys</code>.
  /// <important>
  /// If DynamoDB returns any unprocessed items, you should retry the batch
  /// operation on those items. However, <i>we strongly recommend that you use
  /// an exponential backoff algorithm</i>. If you retry the batch operation
  /// immediately, the underlying read or write requests can still fail due to
  /// throttling on the individual tables. If you delay the batch operation
  /// using exponential backoff, the individual requests in the batch are much
  /// more likely to succeed.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ErrorHandling.html#BatchOperations">Batch
  /// Operations and Error Handling</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  /// </important>
  /// By default, <code>BatchGetItem</code> performs eventually consistent reads
  /// on every table in the request. If you want strongly consistent reads
  /// instead, you can set <code>ConsistentRead</code> to <code>true</code> for
  /// any or all tables.
  ///
  /// In order to minimize response latency, <code>BatchGetItem</code> retrieves
  /// items in parallel.
  ///
  /// When designing your application, keep in mind that DynamoDB does not
  /// return items in any particular order. To help parse the response by item,
  /// include the primary key values for the items in your request in the
  /// <code>ProjectionExpression</code> parameter.
  ///
  /// If a requested item does not exist, it is not returned in the result.
  /// Requests for nonexistent items consume the minimum read capacity units
  /// according to the type of read. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#CapacityUnitCalculations">Working
  /// with Tables</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [requestItems] :
  /// A map of one or more table names and, for each table, a map that describes
  /// one or more items to retrieve from that table. Each table name can be used
  /// only once per <code>BatchGetItem</code> request.
  ///
  /// Each element in the map of items to retrieve consists of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ConsistentRead</code> - If <code>true</code>, a strongly consistent
  /// read is used; if <code>false</code> (the default), an eventually
  /// consistent read is used.
  /// </li>
  /// <li>
  /// <code>ExpressionAttributeNames</code> - One or more substitution tokens
  /// for attribute names in the <code>ProjectionExpression</code> parameter.
  /// The following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information about expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>Keys</code> - An array of primary key attribute values that define
  /// specific items in the table. For each primary key, you must provide
  /// <i>all</i> of the key attributes. For example, with a simple primary key,
  /// you only need to provide the partition key value. For a composite key, you
  /// must provide <i>both</i> the partition key value and the sort key value.
  /// </li>
  /// <li>
  /// <code>ProjectionExpression</code> - A string that identifies one or more
  /// attributes to retrieve from the table. These attributes can include
  /// scalars, sets, or elements of a JSON document. The attributes in the
  /// expression must be separated by commas.
  ///
  /// If no attribute names are specified, then all attributes are returned. If
  /// any of the requested attributes are not found, they do not appear in the
  /// result.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>AttributesToGet</code> - This is a legacy parameter. Use
  /// <code>ProjectionExpression</code> instead. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html">AttributesToGet</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  /// </li>
  /// </ul>
  Future<BatchGetItemOutput> batchGetItem({
    @_s.required Map<String, KeysAndAttributes> requestItems,
    ReturnConsumedCapacity returnConsumedCapacity,
  }) async {
    ArgumentError.checkNotNull(requestItems, 'requestItems');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.BatchGetItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RequestItems': requestItems,
        'ReturnConsumedCapacity': returnConsumedCapacity?.toValue(),
      },
    );

    return BatchGetItemOutput.fromJson(jsonResponse.body);
  }

  /// The <code>BatchWriteItem</code> operation puts or deletes multiple items
  /// in one or more tables. A single call to <code>BatchWriteItem</code> can
  /// write up to 16 MB of data, which can comprise as many as 25 put or delete
  /// requests. Individual items to be written can be as large as 400 KB.
  /// <note>
  /// <code>BatchWriteItem</code> cannot update items. To update items, use the
  /// <code>UpdateItem</code> action.
  /// </note>
  /// The individual <code>PutItem</code> and <code>DeleteItem</code> operations
  /// specified in <code>BatchWriteItem</code> are atomic; however
  /// <code>BatchWriteItem</code> as a whole is not. If any requested operations
  /// fail because the table's provisioned throughput is exceeded or an internal
  /// processing failure occurs, the failed operations are returned in the
  /// <code>UnprocessedItems</code> response parameter. You can investigate and
  /// optionally resend the requests. Typically, you would call
  /// <code>BatchWriteItem</code> in a loop. Each iteration would check for
  /// unprocessed items and submit a new <code>BatchWriteItem</code> request
  /// with those unprocessed items until all items have been processed.
  ///
  /// If <i>none</i> of the items can be processed due to insufficient
  /// provisioned throughput on all of the tables in the request, then
  /// <code>BatchWriteItem</code> returns a
  /// <code>ProvisionedThroughputExceededException</code>.
  /// <important>
  /// If DynamoDB returns any unprocessed items, you should retry the batch
  /// operation on those items. However, <i>we strongly recommend that you use
  /// an exponential backoff algorithm</i>. If you retry the batch operation
  /// immediately, the underlying read or write requests can still fail due to
  /// throttling on the individual tables. If you delay the batch operation
  /// using exponential backoff, the individual requests in the batch are much
  /// more likely to succeed.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ErrorHandling.html#Programming.Errors.BatchOperations">Batch
  /// Operations and Error Handling</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  /// </important>
  /// With <code>BatchWriteItem</code>, you can efficiently write or delete
  /// large amounts of data, such as from Amazon EMR, or copy data from another
  /// database into DynamoDB. In order to improve performance with these
  /// large-scale operations, <code>BatchWriteItem</code> does not behave in the
  /// same way as individual <code>PutItem</code> and <code>DeleteItem</code>
  /// calls would. For example, you cannot specify conditions on individual put
  /// and delete requests, and <code>BatchWriteItem</code> does not return
  /// deleted items in the response.
  ///
  /// If you use a programming language that supports concurrency, you can use
  /// threads to write items in parallel. Your application must include the
  /// necessary logic to manage the threads. With languages that don't support
  /// threading, you must update or delete the specified items one at a time. In
  /// both situations, <code>BatchWriteItem</code> performs the specified put
  /// and delete operations in parallel, giving you the power of the thread pool
  /// approach without having to introduce complexity into your application.
  ///
  /// Parallel processing reduces latency, but each specified put and delete
  /// request consumes the same number of write capacity units whether it is
  /// processed in parallel or not. Delete operations on nonexistent items
  /// consume one write capacity unit.
  ///
  /// If one or more of the following is true, DynamoDB rejects the entire batch
  /// write operation:
  ///
  /// <ul>
  /// <li>
  /// One or more tables specified in the <code>BatchWriteItem</code> request
  /// does not exist.
  /// </li>
  /// <li>
  /// Primary key attributes specified on an item in the request do not match
  /// those in the corresponding table's primary key schema.
  /// </li>
  /// <li>
  /// You try to perform multiple operations on the same item in the same
  /// <code>BatchWriteItem</code> request. For example, you cannot put and
  /// delete the same item in the same <code>BatchWriteItem</code> request.
  /// </li>
  /// <li>
  /// Your request contains at least two items with identical hash and range
  /// keys (which essentially is two put operations).
  /// </li>
  /// <li>
  /// There are more than 25 requests in the batch.
  /// </li>
  /// <li>
  /// Any individual item in a batch exceeds 400 KB.
  /// </li>
  /// <li>
  /// The total request size exceeds 16 MB.
  /// </li>
  /// </ul>
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ItemCollectionSizeLimitExceededException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [requestItems] :
  /// A map of one or more table names and, for each table, a list of operations
  /// to be performed (<code>DeleteRequest</code> or <code>PutRequest</code>).
  /// Each element in the map consists of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>DeleteRequest</code> - Perform a <code>DeleteItem</code> operation
  /// on the specified item. The item to be deleted is identified by a
  /// <code>Key</code> subelement:
  ///
  /// <ul>
  /// <li>
  /// <code>Key</code> - A map of primary key attribute values that uniquely
  /// identify the item. Each entry in this map consists of an attribute name
  /// and an attribute value. For each primary key, you must provide <i>all</i>
  /// of the key attributes. For example, with a simple primary key, you only
  /// need to provide a value for the partition key. For a composite primary
  /// key, you must provide values for <i>both</i> the partition key and the
  /// sort key.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>PutRequest</code> - Perform a <code>PutItem</code> operation on the
  /// specified item. The item to be put is identified by an <code>Item</code>
  /// subelement:
  ///
  /// <ul>
  /// <li>
  /// <code>Item</code> - A map of attributes and their values. Each entry in
  /// this map consists of an attribute name and an attribute value. Attribute
  /// values must not be null; string and binary type attributes must have
  /// lengths greater than zero; and set type attributes must not be empty.
  /// Requests that contain empty values are rejected with a
  /// <code>ValidationException</code> exception.
  ///
  /// If you specify any attributes that are part of an index key, then the data
  /// types for those attributes must match those of the schema in the table's
  /// attribute definition.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [returnItemCollectionMetrics] :
  /// Determines whether item collection metrics are returned. If set to
  /// <code>SIZE</code>, the response includes statistics about item
  /// collections, if any, that were modified during the operation are returned
  /// in the response. If set to <code>NONE</code> (the default), no statistics
  /// are returned.
  Future<BatchWriteItemOutput> batchWriteItem({
    @_s.required Map<String, List<WriteRequest>> requestItems,
    ReturnConsumedCapacity returnConsumedCapacity,
    ReturnItemCollectionMetrics returnItemCollectionMetrics,
  }) async {
    ArgumentError.checkNotNull(requestItems, 'requestItems');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.BatchWriteItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RequestItems': requestItems,
        'ReturnConsumedCapacity': returnConsumedCapacity?.toValue(),
        'ReturnItemCollectionMetrics': returnItemCollectionMetrics?.toValue(),
      },
    );

    return BatchWriteItemOutput.fromJson(jsonResponse.body);
  }

  /// Creates a backup for an existing table.
  ///
  /// Each time you create an on-demand backup, the entire table data is backed
  /// up. There is no limit to the number of on-demand backups that can be
  /// taken.
  ///
  /// When you create an on-demand backup, a time marker of the request is
  /// cataloged, and the backup is created asynchronously, by applying all
  /// changes until the time of the request to the last full table snapshot.
  /// Backup requests are processed instantaneously and become available for
  /// restore within minutes.
  ///
  /// You can call <code>CreateBackup</code> at a maximum rate of 50 times per
  /// second.
  ///
  /// All backups in DynamoDB work without consuming any provisioned throughput
  /// on the table.
  ///
  /// If you submit a backup request on 2018-12-14 at 14:25:00, the backup is
  /// guaranteed to contain all data committed to the table up to 14:24:00, and
  /// data committed after 14:26:00 will not be. The backup might contain data
  /// modifications made between 14:24:00 and 14:26:00. On-demand backup does
  /// not support causal consistency.
  ///
  /// Along with data, the following are also included on the backups:
  ///
  /// <ul>
  /// <li>
  /// Global secondary indexes (GSIs)
  /// </li>
  /// <li>
  /// Local secondary indexes (LSIs)
  /// </li>
  /// <li>
  /// Streams
  /// </li>
  /// <li>
  /// Provisioned read and write capacity
  /// </li>
  /// </ul>
  ///
  /// May throw [TableNotFoundException].
  /// May throw [TableInUseException].
  /// May throw [ContinuousBackupsUnavailableException].
  /// May throw [BackupInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupName] :
  /// Specified name for the backup.
  ///
  /// Parameter [tableName] :
  /// The name of the table.
  Future<CreateBackupOutput> createBackup({
    @_s.required String backupName,
    @_s.required String tableName,
  }) async {
    ArgumentError.checkNotNull(backupName, 'backupName');
    _s.validateStringLength(
      'backupName',
      backupName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'backupName',
      backupName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.CreateBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupName': backupName,
        'TableName': tableName,
      },
    );

    return CreateBackupOutput.fromJson(jsonResponse.body);
  }

  /// Creates a global table from an existing table. A global table creates a
  /// replication relationship between two or more DynamoDB tables with the same
  /// table name in the provided Regions.
  /// <note>
  /// This method only applies to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.V1.html">Version
  /// 2017.11.29</a> of global tables.
  /// </note>
  /// If you want to add a new replica table to a global table, each of the
  /// following conditions must be true:
  ///
  /// <ul>
  /// <li>
  /// The table must have the same primary key as all of the other replicas.
  /// </li>
  /// <li>
  /// The table must have the same name as all of the other replicas.
  /// </li>
  /// <li>
  /// The table must have DynamoDB Streams enabled, with the stream containing
  /// both the new and the old images of the item.
  /// </li>
  /// <li>
  /// None of the replica tables in the global table can contain any data.
  /// </li>
  /// </ul>
  /// If global secondary indexes are specified, then the following conditions
  /// must also be met:
  ///
  /// <ul>
  /// <li>
  /// The global secondary indexes must have the same name.
  /// </li>
  /// <li>
  /// The global secondary indexes must have the same hash key and sort key (if
  /// present).
  /// </li>
  /// </ul> <important>
  /// Write capacity settings should be set consistently across your replica
  /// tables and secondary indexes. DynamoDB strongly recommends enabling auto
  /// scaling to manage the write capacity settings for all of your global
  /// tables replicas and indexes.
  ///
  /// If you prefer to manage write capacity settings manually, you should
  /// provision equal replicated write capacity units to your replica tables.
  /// You should also provision equal replicated write capacity units to
  /// matching secondary indexes across your global table.
  /// </important>
  ///
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  /// May throw [GlobalTableAlreadyExistsException].
  /// May throw [TableNotFoundException].
  ///
  /// Parameter [globalTableName] :
  /// The global table name.
  ///
  /// Parameter [replicationGroup] :
  /// The Regions where the global table needs to be created.
  Future<CreateGlobalTableOutput> createGlobalTable({
    @_s.required String globalTableName,
    @_s.required List<Replica> replicationGroup,
  }) async {
    ArgumentError.checkNotNull(globalTableName, 'globalTableName');
    _s.validateStringLength(
      'globalTableName',
      globalTableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'globalTableName',
      globalTableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(replicationGroup, 'replicationGroup');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.CreateGlobalTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GlobalTableName': globalTableName,
        'ReplicationGroup': replicationGroup,
      },
    );

    return CreateGlobalTableOutput.fromJson(jsonResponse.body);
  }

  /// The <code>CreateTable</code> operation adds a new table to your account.
  /// In an AWS account, table names must be unique within each Region. That is,
  /// you can have two tables with same name if you create the tables in
  /// different Regions.
  ///
  /// <code>CreateTable</code> is an asynchronous operation. Upon receiving a
  /// <code>CreateTable</code> request, DynamoDB immediately returns a response
  /// with a <code>TableStatus</code> of <code>CREATING</code>. After the table
  /// is created, DynamoDB sets the <code>TableStatus</code> to
  /// <code>ACTIVE</code>. You can perform read and write operations only on an
  /// <code>ACTIVE</code> table.
  ///
  /// You can optionally define secondary indexes on the new table, as part of
  /// the <code>CreateTable</code> operation. If you want to create multiple
  /// tables with secondary indexes on them, you must create the tables
  /// sequentially. Only one table with secondary indexes can be in the
  /// <code>CREATING</code> state at any given time.
  ///
  /// You can use the <code>DescribeTable</code> action to check the table
  /// status.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [attributeDefinitions] :
  /// An array of attributes that describe the key schema for the table and
  /// indexes.
  ///
  /// Parameter [keySchema] :
  /// Specifies the attributes that make up the primary key for a table or an
  /// index. The attributes in <code>KeySchema</code> must also be defined in
  /// the <code>AttributeDefinitions</code> array. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html">Data
  /// Model</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Each <code>KeySchemaElement</code> in the array is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>AttributeName</code> - The name of this key attribute.
  /// </li>
  /// <li>
  /// <code>KeyType</code> - The role that the key attribute will assume:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>.
  /// The term "hash attribute" derives from the DynamoDB usage of an internal
  /// hash function to evenly distribute data items across partitions, based on
  /// their partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  /// For a simple primary key (partition key), you must provide exactly one
  /// element with a <code>KeyType</code> of <code>HASH</code>.
  ///
  /// For a composite primary key (partition key and sort key), you must provide
  /// exactly two elements, in this order: The first element must have a
  /// <code>KeyType</code> of <code>HASH</code>, and the second element must
  /// have a <code>KeyType</code> of <code>RANGE</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#WorkingWithTables.primary.key">Working
  /// with Tables</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [tableName] :
  /// The name of the table to create.
  ///
  /// Parameter [billingMode] :
  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. This setting can be changed later.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONED</code> - We recommend using <code>PROVISIONED</code> for
  /// predictable workloads. <code>PROVISIONED</code> sets the billing mode to
  /// <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html#HowItWorks.ProvisionedThroughput.Manual">Provisioned
  /// Mode</a>.
  /// </li>
  /// <li>
  /// <code>PAY_PER_REQUEST</code> - We recommend using
  /// <code>PAY_PER_REQUEST</code> for unpredictable workloads.
  /// <code>PAY_PER_REQUEST</code> sets the billing mode to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html#HowItWorks.OnDemand">On-Demand
  /// Mode</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [globalSecondaryIndexes] :
  /// One or more global secondary indexes (the maximum is 20) to be created on
  /// the table. Each global secondary index in the array includes the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>IndexName</code> - The name of the global secondary index. Must be
  /// unique only for this table.
  /// <p/> </li>
  /// <li>
  /// <code>KeySchema</code> - Specifies the key schema for the global secondary
  /// index.
  /// </li>
  /// <li>
  /// <code>Projection</code> - Specifies attributes that are copied (projected)
  /// from the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  /// Each attribute specification is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>ProjectionType</code> - One of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the index and primary keys are projected
  /// into the index.
  /// </li>
  /// <li>
  /// <code>INCLUDE</code> - Only the specified table attributes are projected
  /// into the index. The list of projected attributes is in
  /// <code>NonKeyAttributes</code>.
  /// </li>
  /// <li>
  /// <code>ALL</code> - All of the table attributes are projected into the
  /// index.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NonKeyAttributes</code> - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of
  /// attributes provided in <code>NonKeyAttributes</code>, summed across all of
  /// the secondary indexes, must not exceed 100. If you project the same
  /// attribute into two different indexes, this counts as two distinct
  /// attributes when determining the total.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ProvisionedThroughput</code> - The provisioned throughput settings
  /// for the global secondary index, consisting of read and write capacity
  /// units.
  /// </li>
  /// </ul>
  ///
  /// Parameter [localSecondaryIndexes] :
  /// One or more local secondary indexes (the maximum is 5) to be created on
  /// the table. Each index is scoped to a given partition key value. There is a
  /// 10 GB size limit per partition key value; otherwise, the size of a local
  /// secondary index is unconstrained.
  ///
  /// Each local secondary index in the array includes the following:
  ///
  /// <ul>
  /// <li>
  /// <code>IndexName</code> - The name of the local secondary index. Must be
  /// unique only for this table.
  /// <p/> </li>
  /// <li>
  /// <code>KeySchema</code> - Specifies the key schema for the local secondary
  /// index. The key schema must begin with the same partition key as the table.
  /// </li>
  /// <li>
  /// <code>Projection</code> - Specifies attributes that are copied (projected)
  /// from the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected.
  /// Each attribute specification is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>ProjectionType</code> - One of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the index and primary keys are projected
  /// into the index.
  /// </li>
  /// <li>
  /// <code>INCLUDE</code> - Only the specified table attributes are projected
  /// into the index. The list of projected attributes is in
  /// <code>NonKeyAttributes</code>.
  /// </li>
  /// <li>
  /// <code>ALL</code> - All of the table attributes are projected into the
  /// index.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NonKeyAttributes</code> - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of
  /// attributes provided in <code>NonKeyAttributes</code>, summed across all of
  /// the secondary indexes, must not exceed 100. If you project the same
  /// attribute into two different indexes, this counts as two distinct
  /// attributes when determining the total.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [provisionedThroughput] :
  /// Represents the provisioned throughput settings for a specified table or
  /// index. The settings can be modified using the <code>UpdateTable</code>
  /// operation.
  ///
  /// If you set BillingMode as <code>PROVISIONED</code>, you must specify this
  /// property. If you set BillingMode as <code>PAY_PER_REQUEST</code>, you
  /// cannot specify this property.
  ///
  /// For current minimum and maximum provisioned throughput values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [sSESpecification] :
  /// Represents the settings used to enable server-side encryption.
  ///
  /// Parameter [streamSpecification] :
  /// The settings for DynamoDB Streams on the table. These settings consist of:
  ///
  /// <ul>
  /// <li>
  /// <code>StreamEnabled</code> - Indicates whether DynamoDB Streams is to be
  /// enabled (true) or disabled (false).
  /// </li>
  /// <li>
  /// <code>StreamViewType</code> - When an item in the table is modified,
  /// <code>StreamViewType</code> determines what information is written to the
  /// table's stream. Valid values for <code>StreamViewType</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the key attributes of the modified item are
  /// written to the stream.
  /// </li>
  /// <li>
  /// <code>NEW_IMAGE</code> - The entire item, as it appears after it was
  /// modified, is written to the stream.
  /// </li>
  /// <li>
  /// <code>OLD_IMAGE</code> - The entire item, as it appeared before it was
  /// modified, is written to the stream.
  /// </li>
  /// <li>
  /// <code>NEW_AND_OLD_IMAGES</code> - Both the new and the old item images of
  /// the item are written to the stream.
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs to label the table. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html">Tagging
  /// for DynamoDB</a>.
  Future<CreateTableOutput> createTable({
    @_s.required List<AttributeDefinition> attributeDefinitions,
    @_s.required List<KeySchemaElement> keySchema,
    @_s.required String tableName,
    BillingMode billingMode,
    List<GlobalSecondaryIndex> globalSecondaryIndexes,
    List<LocalSecondaryIndex> localSecondaryIndexes,
    ProvisionedThroughput provisionedThroughput,
    SSESpecification sSESpecification,
    StreamSpecification streamSpecification,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(attributeDefinitions, 'attributeDefinitions');
    ArgumentError.checkNotNull(keySchema, 'keySchema');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.CreateTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AttributeDefinitions': attributeDefinitions,
        'KeySchema': keySchema,
        'TableName': tableName,
        'BillingMode': billingMode?.toValue(),
        'GlobalSecondaryIndexes': globalSecondaryIndexes,
        'LocalSecondaryIndexes': localSecondaryIndexes,
        'ProvisionedThroughput': provisionedThroughput,
        'SSESpecification': sSESpecification,
        'StreamSpecification': streamSpecification,
        'Tags': tags,
      },
    );

    return CreateTableOutput.fromJson(jsonResponse.body);
  }

  /// Deletes an existing backup of a table.
  ///
  /// You can call <code>DeleteBackup</code> at a maximum rate of 10 times per
  /// second.
  ///
  /// May throw [BackupNotFoundException].
  /// May throw [BackupInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupArn] :
  /// The ARN associated with the backup.
  Future<DeleteBackupOutput> deleteBackup({
    @_s.required String backupArn,
  }) async {
    ArgumentError.checkNotNull(backupArn, 'backupArn');
    _s.validateStringLength(
      'backupArn',
      backupArn,
      37,
      1024,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DeleteBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupArn': backupArn,
      },
    );

    return DeleteBackupOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a single item in a table by primary key. You can perform a
  /// conditional delete operation that deletes the item if it exists, or if it
  /// has an expected attribute value.
  ///
  /// In addition to deleting an item, you can also return the item's attribute
  /// values in the same operation, using the <code>ReturnValues</code>
  /// parameter.
  ///
  /// Unless you specify conditions, the <code>DeleteItem</code> is an
  /// idempotent operation; running it multiple times on the same item or
  /// attribute does <i>not</i> result in an error response.
  ///
  /// Conditional deletes are useful for deleting items only if specific
  /// conditions are met. If those conditions are met, DynamoDB performs the
  /// delete. Otherwise, the item is not deleted.
  ///
  /// May throw [ConditionalCheckFailedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ItemCollectionSizeLimitExceededException].
  /// May throw [TransactionConflictException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [key] :
  /// A map of attribute names to <code>AttributeValue</code> objects,
  /// representing the primary key of the item to delete.
  ///
  /// For the primary key, you must provide all of the attributes. For example,
  /// with a simple primary key, you only need to provide a value for the
  /// partition key. For a composite primary key, you must provide values for
  /// both the partition key and the sort key.
  ///
  /// Parameter [tableName] :
  /// The name of the table from which to delete the item.
  ///
  /// Parameter [conditionExpression] :
  /// A condition that must be satisfied in order for a conditional
  /// <code>DeleteItem</code> to succeed.
  ///
  /// An expression can contain any of the following:
  ///
  /// <ul>
  /// <li>
  /// Functions: <code>attribute_exists | attribute_not_exists | attribute_type
  /// | contains | begins_with | size</code>
  ///
  /// These function names are case-sensitive.
  /// </li>
  /// <li>
  /// Comparison operators: <code>= | &lt;&gt; | &lt; | &gt; | &lt;= | &gt;= |
  /// BETWEEN | IN </code>
  /// </li>
  /// <li>
  /// Logical operators: <code>AND | OR | NOT</code>
  /// </li>
  /// </ul>
  /// For more information about condition expressions, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [conditionalOperator] :
  /// This is a legacy parameter. Use <code>ConditionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expected] :
  /// This is a legacy parameter. Use <code>ConditionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html">Expected</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeNames] :
  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information on expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeValues] :
  /// One or more values that can be substituted in an expression.
  ///
  /// Use the <b>:</b> (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the <i>ProductStatus</i> attribute was one of the following:
  ///
  /// <code>Available | Backordered | Discontinued</code>
  ///
  /// You would first need to specify <code>ExpressionAttributeValues</code> as
  /// follows:
  ///
  /// <code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }</code>
  ///
  /// You could then use these values in an expression, such as this:
  ///
  /// <code>ProductStatus IN (:avail, :back, :disc)</code>
  ///
  /// For more information on expression attribute values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [returnItemCollectionMetrics] :
  /// Determines whether item collection metrics are returned. If set to
  /// <code>SIZE</code>, the response includes statistics about item
  /// collections, if any, that were modified during the operation are returned
  /// in the response. If set to <code>NONE</code> (the default), no statistics
  /// are returned.
  ///
  /// Parameter [returnValues] :
  /// Use <code>ReturnValues</code> if you want to get the item attributes as
  /// they appeared before they were deleted. For <code>DeleteItem</code>, the
  /// valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - If <code>ReturnValues</code> is not specified, or if
  /// its value is <code>NONE</code>, then nothing is returned. (This setting is
  /// the default for <code>ReturnValues</code>.)
  /// </li>
  /// <li>
  /// <code>ALL_OLD</code> - The content of the old item is returned.
  /// </li>
  /// </ul> <note>
  /// The <code>ReturnValues</code> parameter is used by several DynamoDB
  /// operations; however, <code>DeleteItem</code> does not recognize any values
  /// other than <code>NONE</code> or <code>ALL_OLD</code>.
  /// </note>
  Future<DeleteItemOutput> deleteItem({
    @_s.required Map<String, AttributeValue> key,
    @_s.required String tableName,
    String conditionExpression,
    ConditionalOperator conditionalOperator,
    Map<String, ExpectedAttributeValue> expected,
    Map<String, String> expressionAttributeNames,
    Map<String, AttributeValue> expressionAttributeValues,
    ReturnConsumedCapacity returnConsumedCapacity,
    ReturnItemCollectionMetrics returnItemCollectionMetrics,
    ReturnValue returnValues,
  }) async {
    ArgumentError.checkNotNull(key, 'key');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DeleteItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Key': key,
        'TableName': tableName,
        'ConditionExpression': conditionExpression,
        'ConditionalOperator': conditionalOperator?.toValue(),
        'Expected': expected,
        'ExpressionAttributeNames': expressionAttributeNames,
        'ExpressionAttributeValues': expressionAttributeValues,
        'ReturnConsumedCapacity': returnConsumedCapacity?.toValue(),
        'ReturnItemCollectionMetrics': returnItemCollectionMetrics?.toValue(),
        'ReturnValues': returnValues?.toValue(),
      },
    );

    return DeleteItemOutput.fromJson(jsonResponse.body);
  }

  /// The <code>DeleteTable</code> operation deletes a table and all of its
  /// items. After a <code>DeleteTable</code> request, the specified table is in
  /// the <code>DELETING</code> state until DynamoDB completes the deletion. If
  /// the table is in the <code>ACTIVE</code> state, you can delete it. If a
  /// table is in <code>CREATING</code> or <code>UPDATING</code> states, then
  /// DynamoDB returns a <code>ResourceInUseException</code>. If the specified
  /// table does not exist, DynamoDB returns a
  /// <code>ResourceNotFoundException</code>. If table is already in the
  /// <code>DELETING</code> state, no error is returned.
  /// <note>
  /// DynamoDB might continue to accept data read and write operations, such as
  /// <code>GetItem</code> and <code>PutItem</code>, on a table in the
  /// <code>DELETING</code> state until the table deletion is complete.
  /// </note>
  /// When you delete a table, any indexes on that table are also deleted.
  ///
  /// If you have DynamoDB Streams enabled on the table, then the corresponding
  /// stream on that table goes into the <code>DISABLED</code> state, and the
  /// stream is automatically deleted after 24 hours.
  ///
  /// Use the <code>DescribeTable</code> action to check the status of the
  /// table.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table to delete.
  Future<DeleteTableOutput> deleteTable({
    @_s.required String tableName,
  }) async {
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DeleteTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
      },
    );

    return DeleteTableOutput.fromJson(jsonResponse.body);
  }

  /// Describes an existing backup of a table.
  ///
  /// You can call <code>DescribeBackup</code> at a maximum rate of 10 times per
  /// second.
  ///
  /// May throw [BackupNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupArn] :
  /// The Amazon Resource Name (ARN) associated with the backup.
  Future<DescribeBackupOutput> describeBackup({
    @_s.required String backupArn,
  }) async {
    ArgumentError.checkNotNull(backupArn, 'backupArn');
    _s.validateStringLength(
      'backupArn',
      backupArn,
      37,
      1024,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupArn': backupArn,
      },
    );

    return DescribeBackupOutput.fromJson(jsonResponse.body);
  }

  /// Checks the status of continuous backups and point in time recovery on the
  /// specified table. Continuous backups are <code>ENABLED</code> on all tables
  /// at table creation. If point in time recovery is enabled,
  /// <code>PointInTimeRecoveryStatus</code> will be set to ENABLED.
  ///
  /// After continuous backups and point in time recovery are enabled, you can
  /// restore to any point in time within
  /// <code>EarliestRestorableDateTime</code> and
  /// <code>LatestRestorableDateTime</code>.
  ///
  /// <code>LatestRestorableDateTime</code> is typically 5 minutes before the
  /// current time. You can restore your table to any point in time during the
  /// last 35 days.
  ///
  /// You can call <code>DescribeContinuousBackups</code> at a maximum rate of
  /// 10 times per second.
  ///
  /// May throw [TableNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// Name of the table for which the customer wants to check the continuous
  /// backups and point in time recovery settings.
  Future<DescribeContinuousBackupsOutput> describeContinuousBackups({
    @_s.required String tableName,
  }) async {
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeContinuousBackups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
      },
    );

    return DescribeContinuousBackupsOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about contributor insights, for a given table or
  /// global secondary index.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table to describe.
  ///
  /// Parameter [indexName] :
  /// The name of the global secondary index to describe, if applicable.
  Future<DescribeContributorInsightsOutput> describeContributorInsights({
    @_s.required String tableName,
    String indexName,
  }) async {
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'indexName',
      indexName,
      3,
      255,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeContributorInsights'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
        'IndexName': indexName,
      },
    );

    return DescribeContributorInsightsOutput.fromJson(jsonResponse.body);
  }

  /// Returns the regional endpoint information.
  Future<DescribeEndpointsResponse> describeEndpoints() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeEndpointsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified global table.
  /// <note>
  /// This method only applies to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.V1.html">Version
  /// 2017.11.29</a> of global tables.
  /// </note>
  ///
  /// May throw [InternalServerError].
  /// May throw [GlobalTableNotFoundException].
  ///
  /// Parameter [globalTableName] :
  /// The name of the global table.
  Future<DescribeGlobalTableOutput> describeGlobalTable({
    @_s.required String globalTableName,
  }) async {
    ArgumentError.checkNotNull(globalTableName, 'globalTableName');
    _s.validateStringLength(
      'globalTableName',
      globalTableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'globalTableName',
      globalTableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeGlobalTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GlobalTableName': globalTableName,
      },
    );

    return DescribeGlobalTableOutput.fromJson(jsonResponse.body);
  }

  /// Describes Region-specific settings for a global table.
  /// <note>
  /// This method only applies to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.V1.html">Version
  /// 2017.11.29</a> of global tables.
  /// </note>
  ///
  /// May throw [GlobalTableNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [globalTableName] :
  /// The name of the global table to describe.
  Future<DescribeGlobalTableSettingsOutput> describeGlobalTableSettings({
    @_s.required String globalTableName,
  }) async {
    ArgumentError.checkNotNull(globalTableName, 'globalTableName');
    _s.validateStringLength(
      'globalTableName',
      globalTableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'globalTableName',
      globalTableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeGlobalTableSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GlobalTableName': globalTableName,
      },
    );

    return DescribeGlobalTableSettingsOutput.fromJson(jsonResponse.body);
  }

  /// Returns the current provisioned-capacity limits for your AWS account in a
  /// Region, both for the Region as a whole and for any one DynamoDB table that
  /// you create there.
  ///
  /// When you establish an AWS account, the account has initial limits on the
  /// maximum read capacity units and write capacity units that you can
  /// provision across all of your DynamoDB tables in a given Region. Also,
  /// there are per-table limits that apply when you create a table there. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a>
  /// page in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Although you can increase these limits by filing a case at <a
  /// href="https://console.aws.amazon.com/support/home#/">AWS Support
  /// Center</a>, obtaining the increase is not instantaneous. The
  /// <code>DescribeLimits</code> action lets you write code to compare the
  /// capacity you are currently using to those limits imposed by your account
  /// so that you have enough time to apply for an increase before you hit a
  /// limit.
  ///
  /// For example, you could use one of the AWS SDKs to do the following:
  /// <ol>
  /// <li>
  /// Call <code>DescribeLimits</code> for a particular Region to obtain your
  /// current account limits on provisioned capacity there.
  /// </li>
  /// <li>
  /// Create a variable to hold the aggregate read capacity units provisioned
  /// for all your tables in that Region, and one to hold the aggregate write
  /// capacity units. Zero them both.
  /// </li>
  /// <li>
  /// Call <code>ListTables</code> to obtain a list of all your DynamoDB tables.
  /// </li>
  /// <li>
  /// For each table name listed by <code>ListTables</code>, do the following:
  ///
  /// <ul>
  /// <li>
  /// Call <code>DescribeTable</code> with the table name.
  /// </li>
  /// <li>
  /// Use the data returned by <code>DescribeTable</code> to add the read
  /// capacity units and write capacity units provisioned for the table itself
  /// to your variables.
  /// </li>
  /// <li>
  /// If the table has one or more global secondary indexes (GSIs), loop over
  /// these GSIs and add their provisioned capacity values to your variables as
  /// well.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Report the account limits for that Region returned by
  /// <code>DescribeLimits</code>, along with the total current provisioned
  /// capacity levels you have calculated.
  /// </li> </ol>
  /// This will let you see whether you are getting close to your account-level
  /// limits.
  ///
  /// The per-table limits apply only when you are creating a new table. They
  /// restrict the sum of the provisioned capacity of the new table itself and
  /// all its global secondary indexes.
  ///
  /// For existing tables and their GSIs, DynamoDB doesn't let you increase
  /// provisioned capacity extremely rapidly. But the only upper limit that
  /// applies is that the aggregate provisioned capacity over all your tables
  /// and GSIs cannot exceed either of the per-account limits.
  /// <note>
  /// <code>DescribeLimits</code> should only be called periodically. You can
  /// expect throttling errors if you call it more than once in a minute.
  /// </note>
  /// The <code>DescribeLimits</code> Request element has no content.
  ///
  /// May throw [InternalServerError].
  Future<DescribeLimitsOutput> describeLimits() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeLimits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeLimitsOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about the table, including the current status of the
  /// table, when it was created, the primary key schema, and any indexes on the
  /// table.
  /// <note>
  /// If you issue a <code>DescribeTable</code> request immediately after a
  /// <code>CreateTable</code> request, DynamoDB might return a
  /// <code>ResourceNotFoundException</code>. This is because
  /// <code>DescribeTable</code> uses an eventually consistent query, and the
  /// metadata for your table might not be available at that moment. Wait for a
  /// few seconds, and then try the <code>DescribeTable</code> request again.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table to describe.
  Future<DescribeTableOutput> describeTable({
    @_s.required String tableName,
  }) async {
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
      },
    );

    return DescribeTableOutput.fromJson(jsonResponse.body);
  }

  /// Describes auto scaling settings across replicas of the global table at
  /// once.
  /// <note>
  /// This method only applies to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.V2.html">Version
  /// 2019.11.21</a> of global tables.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table.
  Future<DescribeTableReplicaAutoScalingOutput>
      describeTableReplicaAutoScaling({
    @_s.required String tableName,
  }) async {
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeTableReplicaAutoScaling'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
      },
    );

    return DescribeTableReplicaAutoScalingOutput.fromJson(jsonResponse.body);
  }

  /// Gives a description of the Time to Live (TTL) status on the specified
  /// table.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table to be described.
  Future<DescribeTimeToLiveOutput> describeTimeToLive({
    @_s.required String tableName,
  }) async {
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.DescribeTimeToLive'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
      },
    );

    return DescribeTimeToLiveOutput.fromJson(jsonResponse.body);
  }

  /// The <code>GetItem</code> operation returns a set of attributes for the
  /// item with the given primary key. If there is no matching item,
  /// <code>GetItem</code> does not return any data and there will be no
  /// <code>Item</code> element in the response.
  ///
  /// <code>GetItem</code> provides an eventually consistent read by default. If
  /// your application requires a strongly consistent read, set
  /// <code>ConsistentRead</code> to <code>true</code>. Although a strongly
  /// consistent read might take more time than an eventually consistent read,
  /// it always returns the last updated value.
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [key] :
  /// A map of attribute names to <code>AttributeValue</code> objects,
  /// representing the primary key of the item to retrieve.
  ///
  /// For the primary key, you must provide all of the attributes. For example,
  /// with a simple primary key, you only need to provide a value for the
  /// partition key. For a composite primary key, you must provide values for
  /// both the partition key and the sort key.
  ///
  /// Parameter [tableName] :
  /// The name of the table containing the requested item.
  ///
  /// Parameter [attributesToGet] :
  /// This is a legacy parameter. Use <code>ProjectionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html">AttributesToGet</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [consistentRead] :
  /// Determines the read consistency model: If set to <code>true</code>, then
  /// the operation uses strongly consistent reads; otherwise, the operation
  /// uses eventually consistent reads.
  ///
  /// Parameter [expressionAttributeNames] :
  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information on expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [projectionExpression] :
  /// A string that identifies one or more attributes to retrieve from the
  /// table. These attributes can include scalars, sets, or elements of a JSON
  /// document. The attributes in the expression must be separated by commas.
  ///
  /// If no attribute names are specified, then all attributes are returned. If
  /// any of the requested attributes are not found, they do not appear in the
  /// result.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  Future<GetItemOutput> getItem({
    @_s.required Map<String, AttributeValue> key,
    @_s.required String tableName,
    List<String> attributesToGet,
    bool consistentRead,
    Map<String, String> expressionAttributeNames,
    String projectionExpression,
    ReturnConsumedCapacity returnConsumedCapacity,
  }) async {
    ArgumentError.checkNotNull(key, 'key');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.GetItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Key': key,
        'TableName': tableName,
        'AttributesToGet': attributesToGet,
        'ConsistentRead': consistentRead,
        'ExpressionAttributeNames': expressionAttributeNames,
        'ProjectionExpression': projectionExpression,
        'ReturnConsumedCapacity': returnConsumedCapacity?.toValue(),
      },
    );

    return GetItemOutput.fromJson(jsonResponse.body);
  }

  /// List backups associated with an AWS account. To list backups for a given
  /// table, specify <code>TableName</code>. <code>ListBackups</code> returns a
  /// paginated list of results with at most 1 MB worth of items in a page. You
  /// can also specify a limit for the maximum number of entries to be returned
  /// in a page.
  ///
  /// In the request, start time is inclusive, but end time is exclusive. Note
  /// that these limits are for the time at which the original backup was
  /// requested.
  ///
  /// You can call <code>ListBackups</code> a maximum of five times per second.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupType] :
  /// The backups from the table specified by <code>BackupType</code> are
  /// listed.
  ///
  /// Where <code>BackupType</code> can be:
  ///
  /// <ul>
  /// <li>
  /// <code>USER</code> - On-demand backup created by you.
  /// </li>
  /// <li>
  /// <code>SYSTEM</code> - On-demand backup automatically created by DynamoDB.
  /// </li>
  /// <li>
  /// <code>ALL</code> - All types of on-demand backups (USER and SYSTEM).
  /// </li>
  /// </ul>
  ///
  /// Parameter [exclusiveStartBackupArn] :
  /// <code>LastEvaluatedBackupArn</code> is the Amazon Resource Name (ARN) of
  /// the backup last evaluated when the current page of results was returned,
  /// inclusive of the current page of results. This value may be specified as
  /// the <code>ExclusiveStartBackupArn</code> of a new <code>ListBackups</code>
  /// operation in order to fetch the next page of results.
  ///
  /// Parameter [limit] :
  /// Maximum number of backups to return at once.
  ///
  /// Parameter [tableName] :
  /// The backups from the table specified by <code>TableName</code> are listed.
  ///
  /// Parameter [timeRangeLowerBound] :
  /// Only backups created after this time are listed.
  /// <code>TimeRangeLowerBound</code> is inclusive.
  ///
  /// Parameter [timeRangeUpperBound] :
  /// Only backups created before this time are listed.
  /// <code>TimeRangeUpperBound</code> is exclusive.
  Future<ListBackupsOutput> listBackups({
    BackupTypeFilter backupType,
    String exclusiveStartBackupArn,
    int limit,
    String tableName,
    DateTime timeRangeLowerBound,
    DateTime timeRangeUpperBound,
  }) async {
    _s.validateStringLength(
      'exclusiveStartBackupArn',
      exclusiveStartBackupArn,
      37,
      1024,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ListBackups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupType': backupType?.toValue(),
        'ExclusiveStartBackupArn': exclusiveStartBackupArn,
        'Limit': limit,
        'TableName': tableName,
        'TimeRangeLowerBound': timeRangeLowerBound,
        'TimeRangeUpperBound': timeRangeUpperBound,
      },
    );

    return ListBackupsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of ContributorInsightsSummary for a table and all its
  /// global secondary indexes.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// A token to for the desired page, if there is one.
  ///
  /// Parameter [tableName] :
  /// The name of the table.
  Future<ListContributorInsightsOutput> listContributorInsights({
    int maxResults,
    String nextToken,
    String tableName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ListContributorInsights'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'TableName': tableName,
      },
    );

    return ListContributorInsightsOutput.fromJson(jsonResponse.body);
  }

  /// Lists all global tables that have a replica in the specified Region.
  /// <note>
  /// This method only applies to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.V1.html">Version
  /// 2017.11.29</a> of global tables.
  /// </note>
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [exclusiveStartGlobalTableName] :
  /// The first global table name that this operation will evaluate.
  ///
  /// Parameter [limit] :
  /// The maximum number of table names to return, if the parameter is not
  /// specified DynamoDB defaults to 100.
  ///
  /// If the number of global tables DynamoDB finds reaches this limit, it stops
  /// the operation and returns the table names collected up to that point, with
  /// a table name in the <code>LastEvaluatedGlobalTableName</code> to apply in
  /// a subsequent operation to the <code>ExclusiveStartGlobalTableName</code>
  /// parameter.
  ///
  /// Parameter [regionName] :
  /// Lists the global tables in a specific Region.
  Future<ListGlobalTablesOutput> listGlobalTables({
    String exclusiveStartGlobalTableName,
    int limit,
    String regionName,
  }) async {
    _s.validateStringLength(
      'exclusiveStartGlobalTableName',
      exclusiveStartGlobalTableName,
      3,
      255,
    );
    _s.validateStringPattern(
      'exclusiveStartGlobalTableName',
      exclusiveStartGlobalTableName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ListGlobalTables'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExclusiveStartGlobalTableName': exclusiveStartGlobalTableName,
        'Limit': limit,
        'RegionName': regionName,
      },
    );

    return ListGlobalTablesOutput.fromJson(jsonResponse.body);
  }

  /// Returns an array of table names associated with the current account and
  /// endpoint. The output from <code>ListTables</code> is paginated, with each
  /// page returning a maximum of 100 table names.
  ///
  /// May throw [InternalServerError].
  ///
  /// Parameter [exclusiveStartTableName] :
  /// The first table name that this operation will evaluate. Use the value that
  /// was returned for <code>LastEvaluatedTableName</code> in a previous
  /// operation, so that you can obtain the next page of results.
  ///
  /// Parameter [limit] :
  /// A maximum number of table names to return. If this parameter is not
  /// specified, the limit is 100.
  Future<ListTablesOutput> listTables({
    String exclusiveStartTableName,
    int limit,
  }) async {
    _s.validateStringLength(
      'exclusiveStartTableName',
      exclusiveStartTableName,
      3,
      255,
    );
    _s.validateStringPattern(
      'exclusiveStartTableName',
      exclusiveStartTableName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ListTables'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExclusiveStartTableName': exclusiveStartTableName,
        'Limit': limit,
      },
    );

    return ListTablesOutput.fromJson(jsonResponse.body);
  }

  /// List all tags on an Amazon DynamoDB resource. You can call
  /// ListTagsOfResource up to 10 times per second, per account.
  ///
  /// For an overview on tagging DynamoDB resources, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html">Tagging
  /// for DynamoDB</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon DynamoDB resource with tags to be listed. This value is an
  /// Amazon Resource Name (ARN).
  ///
  /// Parameter [nextToken] :
  /// An optional string that, if supplied, must be copied from the output of a
  /// previous call to ListTagOfResource. When provided in this manner, this API
  /// fetches the next page of results.
  Future<ListTagsOfResourceOutput> listTagsOfResource({
    @_s.required String resourceArn,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1283,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.ListTagsOfResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'NextToken': nextToken,
      },
    );

    return ListTagsOfResourceOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new item, or replaces an old item with a new item. If an item
  /// that has the same primary key as the new item already exists in the
  /// specified table, the new item completely replaces the existing item. You
  /// can perform a conditional put operation (add a new item if one with the
  /// specified primary key doesn't exist), or replace an existing item if it
  /// has certain attribute values. You can return the item's attribute values
  /// in the same operation, using the <code>ReturnValues</code> parameter.
  /// <important>
  /// This topic provides general information about the <code>PutItem</code>
  /// API.
  ///
  /// For information on how to call the <code>PutItem</code> API using the AWS
  /// SDK in specific languages, see the following:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="http://docs.aws.amazon.com/goto/aws-cli/dynamodb-2012-08-10/PutItem">
  /// PutItem in the AWS Command Line Interface</a>
  /// </li>
  /// <li>
  /// <a
  /// href="http://docs.aws.amazon.com/goto/DotNetSDKV3/dynamodb-2012-08-10/PutItem">
  /// PutItem in the AWS SDK for .NET</a>
  /// </li>
  /// <li>
  /// <a
  /// href="http://docs.aws.amazon.com/goto/SdkForCpp/dynamodb-2012-08-10/PutItem">
  /// PutItem in the AWS SDK for C++</a>
  /// </li>
  /// <li>
  /// <a
  /// href="http://docs.aws.amazon.com/goto/SdkForGoV1/dynamodb-2012-08-10/PutItem">
  /// PutItem in the AWS SDK for Go</a>
  /// </li>
  /// <li>
  /// <a
  /// href="http://docs.aws.amazon.com/goto/SdkForJava/dynamodb-2012-08-10/PutItem">
  /// PutItem in the AWS SDK for Java</a>
  /// </li>
  /// <li>
  /// <a
  /// href="http://docs.aws.amazon.com/goto/AWSJavaScriptSDK/dynamodb-2012-08-10/PutItem">
  /// PutItem in the AWS SDK for JavaScript</a>
  /// </li>
  /// <li>
  /// <a
  /// href="http://docs.aws.amazon.com/goto/SdkForPHPV3/dynamodb-2012-08-10/PutItem">
  /// PutItem in the AWS SDK for PHP V3</a>
  /// </li>
  /// <li>
  /// <a
  /// href="http://docs.aws.amazon.com/goto/boto3/dynamodb-2012-08-10/PutItem">
  /// PutItem in the AWS SDK for Python</a>
  /// </li>
  /// <li>
  /// <a
  /// href="http://docs.aws.amazon.com/goto/SdkForRubyV2/dynamodb-2012-08-10/PutItem">
  /// PutItem in the AWS SDK for Ruby V2</a>
  /// </li>
  /// </ul> </important>
  /// When you add an item, the primary key attributes are the only required
  /// attributes. Attribute values cannot be null. String and Binary type
  /// attributes must have lengths greater than zero. Set type attributes cannot
  /// be empty. Requests with empty values will be rejected with a
  /// <code>ValidationException</code> exception.
  /// <note>
  /// To prevent a new item from replacing an existing item, use a conditional
  /// expression that contains the <code>attribute_not_exists</code> function
  /// with the name of the attribute being used as the partition key for the
  /// table. Since every record must contain that attribute, the
  /// <code>attribute_not_exists</code> function will only succeed if no
  /// matching item exists.
  /// </note>
  /// For more information about <code>PutItem</code>, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithItems.html">Working
  /// with Items</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// May throw [ConditionalCheckFailedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ItemCollectionSizeLimitExceededException].
  /// May throw [TransactionConflictException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [item] :
  /// A map of attribute name/value pairs, one for each attribute. Only the
  /// primary key attributes are required; you can optionally provide other
  /// attribute name-value pairs for the item.
  ///
  /// You must provide all of the attributes for the primary key. For example,
  /// with a simple primary key, you only need to provide a value for the
  /// partition key. For a composite primary key, you must provide both values
  /// for both the partition key and the sort key.
  ///
  /// If you specify any attributes that are part of an index key, then the data
  /// types for those attributes must match those of the schema in the table's
  /// attribute definition.
  ///
  /// For more information about primary keys, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.CoreComponents.html#HowItWorks.CoreComponents.PrimaryKey">Primary
  /// Key</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Each element in the <code>Item</code> map is an
  /// <code>AttributeValue</code> object.
  ///
  /// Parameter [tableName] :
  /// The name of the table to contain the item.
  ///
  /// Parameter [conditionExpression] :
  /// A condition that must be satisfied in order for a conditional
  /// <code>PutItem</code> operation to succeed.
  ///
  /// An expression can contain any of the following:
  ///
  /// <ul>
  /// <li>
  /// Functions: <code>attribute_exists | attribute_not_exists | attribute_type
  /// | contains | begins_with | size</code>
  ///
  /// These function names are case-sensitive.
  /// </li>
  /// <li>
  /// Comparison operators: <code>= | &lt;&gt; | &lt; | &gt; | &lt;= | &gt;= |
  /// BETWEEN | IN </code>
  /// </li>
  /// <li>
  /// Logical operators: <code>AND | OR | NOT</code>
  /// </li>
  /// </ul>
  /// For more information on condition expressions, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [conditionalOperator] :
  /// This is a legacy parameter. Use <code>ConditionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expected] :
  /// This is a legacy parameter. Use <code>ConditionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html">Expected</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeNames] :
  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information on expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeValues] :
  /// One or more values that can be substituted in an expression.
  ///
  /// Use the <b>:</b> (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the <i>ProductStatus</i> attribute was one of the following:
  ///
  /// <code>Available | Backordered | Discontinued</code>
  ///
  /// You would first need to specify <code>ExpressionAttributeValues</code> as
  /// follows:
  ///
  /// <code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }</code>
  ///
  /// You could then use these values in an expression, such as this:
  ///
  /// <code>ProductStatus IN (:avail, :back, :disc)</code>
  ///
  /// For more information on expression attribute values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [returnItemCollectionMetrics] :
  /// Determines whether item collection metrics are returned. If set to
  /// <code>SIZE</code>, the response includes statistics about item
  /// collections, if any, that were modified during the operation are returned
  /// in the response. If set to <code>NONE</code> (the default), no statistics
  /// are returned.
  ///
  /// Parameter [returnValues] :
  /// Use <code>ReturnValues</code> if you want to get the item attributes as
  /// they appeared before they were updated with the <code>PutItem</code>
  /// request. For <code>PutItem</code>, the valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - If <code>ReturnValues</code> is not specified, or if
  /// its value is <code>NONE</code>, then nothing is returned. (This setting is
  /// the default for <code>ReturnValues</code>.)
  /// </li>
  /// <li>
  /// <code>ALL_OLD</code> - If <code>PutItem</code> overwrote an attribute
  /// name-value pair, then the content of the old item is returned.
  /// </li>
  /// </ul> <note>
  /// The <code>ReturnValues</code> parameter is used by several DynamoDB
  /// operations; however, <code>PutItem</code> does not recognize any values
  /// other than <code>NONE</code> or <code>ALL_OLD</code>.
  /// </note>
  Future<PutItemOutput> putItem({
    @_s.required Map<String, AttributeValue> item,
    @_s.required String tableName,
    String conditionExpression,
    ConditionalOperator conditionalOperator,
    Map<String, ExpectedAttributeValue> expected,
    Map<String, String> expressionAttributeNames,
    Map<String, AttributeValue> expressionAttributeValues,
    ReturnConsumedCapacity returnConsumedCapacity,
    ReturnItemCollectionMetrics returnItemCollectionMetrics,
    ReturnValue returnValues,
  }) async {
    ArgumentError.checkNotNull(item, 'item');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.PutItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Item': item,
        'TableName': tableName,
        'ConditionExpression': conditionExpression,
        'ConditionalOperator': conditionalOperator?.toValue(),
        'Expected': expected,
        'ExpressionAttributeNames': expressionAttributeNames,
        'ExpressionAttributeValues': expressionAttributeValues,
        'ReturnConsumedCapacity': returnConsumedCapacity?.toValue(),
        'ReturnItemCollectionMetrics': returnItemCollectionMetrics?.toValue(),
        'ReturnValues': returnValues?.toValue(),
      },
    );

    return PutItemOutput.fromJson(jsonResponse.body);
  }

  /// The <code>Query</code> operation finds items based on primary key values.
  /// You can query any table or secondary index that has a composite primary
  /// key (a partition key and a sort key).
  ///
  /// Use the <code>KeyConditionExpression</code> parameter to provide a
  /// specific value for the partition key. The <code>Query</code> operation
  /// will return all of the items from the table or index with that partition
  /// key value. You can optionally narrow the scope of the <code>Query</code>
  /// operation by specifying a sort key value and a comparison operator in
  /// <code>KeyConditionExpression</code>. To further refine the
  /// <code>Query</code> results, you can optionally provide a
  /// <code>FilterExpression</code>. A <code>FilterExpression</code> determines
  /// which items within the results should be returned to you. All of the other
  /// results are discarded.
  ///
  /// A <code>Query</code> operation always returns a result set. If no matching
  /// items are found, the result set will be empty. Queries that do not return
  /// results consume the minimum number of read capacity units for that type of
  /// read operation.
  /// <note>
  /// DynamoDB calculates the number of read capacity units consumed based on
  /// item size, not on the amount of data that is returned to an application.
  /// The number of capacity units consumed will be the same whether you request
  /// all of the attributes (the default behavior) or just some of them (using a
  /// projection expression). The number will also be the same whether or not
  /// you use a <code>FilterExpression</code>.
  /// </note>
  /// <code>Query</code> results are always sorted by the sort key value. If the
  /// data type of the sort key is Number, the results are returned in numeric
  /// order; otherwise, the results are returned in order of UTF-8 bytes. By
  /// default, the sort order is ascending. To reverse the order, set the
  /// <code>ScanIndexForward</code> parameter to false.
  ///
  /// A single <code>Query</code> operation will read up to the maximum number
  /// of items set (if using the <code>Limit</code> parameter) or a maximum of 1
  /// MB of data and then apply any filtering to the results using
  /// <code>FilterExpression</code>. If <code>LastEvaluatedKey</code> is present
  /// in the response, you will need to paginate the result set. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Query.html#Query.Pagination">Paginating
  /// the Results</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// <code>FilterExpression</code> is applied after a <code>Query</code>
  /// finishes, but before the results are returned. A
  /// <code>FilterExpression</code> cannot contain partition key or sort key
  /// attributes. You need to specify those attributes in the
  /// <code>KeyConditionExpression</code>.
  /// <note>
  /// A <code>Query</code> operation can return an empty result set and a
  /// <code>LastEvaluatedKey</code> if all the items read for the page of
  /// results are filtered out.
  /// </note>
  /// You can query a table, a local secondary index, or a global secondary
  /// index. For a query on a table or on a local secondary index, you can set
  /// the <code>ConsistentRead</code> parameter to <code>true</code> and obtain
  /// a strongly consistent result. Global secondary indexes support eventually
  /// consistent reads only, so do not specify <code>ConsistentRead</code> when
  /// querying a global secondary index.
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table containing the requested items.
  ///
  /// Parameter [attributesToGet] :
  /// This is a legacy parameter. Use <code>ProjectionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html">AttributesToGet</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [conditionalOperator] :
  /// This is a legacy parameter. Use <code>FilterExpression</code> instead. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [consistentRead] :
  /// Determines the read consistency model: If set to <code>true</code>, then
  /// the operation uses strongly consistent reads; otherwise, the operation
  /// uses eventually consistent reads.
  ///
  /// Strongly consistent reads are not supported on global secondary indexes.
  /// If you query a global secondary index with <code>ConsistentRead</code> set
  /// to <code>true</code>, you will receive a <code>ValidationException</code>.
  ///
  /// Parameter [exclusiveStartKey] :
  /// The primary key of the first item that this operation will evaluate. Use
  /// the value that was returned for <code>LastEvaluatedKey</code> in the
  /// previous operation.
  ///
  /// The data type for <code>ExclusiveStartKey</code> must be String, Number,
  /// or Binary. No set data types are allowed.
  ///
  /// Parameter [expressionAttributeNames] :
  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information on expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeValues] :
  /// One or more values that can be substituted in an expression.
  ///
  /// Use the <b>:</b> (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the <i>ProductStatus</i> attribute was one of the following:
  ///
  /// <code>Available | Backordered | Discontinued</code>
  ///
  /// You would first need to specify <code>ExpressionAttributeValues</code> as
  /// follows:
  ///
  /// <code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }</code>
  ///
  /// You could then use these values in an expression, such as this:
  ///
  /// <code>ProductStatus IN (:avail, :back, :disc)</code>
  ///
  /// For more information on expression attribute values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Specifying
  /// Conditions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [filterExpression] :
  /// A string that contains conditions that DynamoDB applies after the
  /// <code>Query</code> operation, but before the data is returned to you.
  /// Items that do not satisfy the <code>FilterExpression</code> criteria are
  /// not returned.
  ///
  /// A <code>FilterExpression</code> does not allow key attributes. You cannot
  /// define a filter expression based on a partition key or a sort key.
  /// <note>
  /// A <code>FilterExpression</code> is applied after the items have already
  /// been read; the process of filtering does not consume any additional read
  /// capacity units.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#FilteringResults">Filter
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [indexName] :
  /// The name of an index to query. This index can be any local secondary index
  /// or global secondary index on the table. Note that if you use the
  /// <code>IndexName</code> parameter, you must also provide
  /// <code>TableName.</code>
  ///
  /// Parameter [keyConditionExpression] :
  /// The condition that specifies the key values for items to be retrieved by
  /// the <code>Query</code> action.
  ///
  /// The condition must perform an equality test on a single partition key
  /// value.
  ///
  /// The condition can optionally perform one of several comparison tests on a
  /// single sort key value. This allows <code>Query</code> to retrieve one item
  /// with a given partition key value and sort key value, or several items that
  /// have the same partition key value but different sort key values.
  ///
  /// The partition key equality test is required, and must be specified in the
  /// following format:
  ///
  /// <code>partitionKeyName</code> <i>=</i> <code>:partitionkeyval</code>
  ///
  /// If you also want to provide a condition for the sort key, it must be
  /// combined using <code>AND</code> with the condition for the sort key.
  /// Following is an example, using the <b>=</b> comparison operator for the
  /// sort key:
  ///
  /// <code>partitionKeyName</code> <code>=</code> <code>:partitionkeyval</code>
  /// <code>AND</code> <code>sortKeyName</code> <code>=</code>
  /// <code>:sortkeyval</code>
  ///
  /// Valid comparisons for the sort key condition are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>sortKeyName</code> <code>=</code> <code>:sortkeyval</code> - true if
  /// the sort key value is equal to <code>:sortkeyval</code>.
  /// </li>
  /// <li>
  /// <code>sortKeyName</code> <code>&lt;</code> <code>:sortkeyval</code> - true
  /// if the sort key value is less than <code>:sortkeyval</code>.
  /// </li>
  /// <li>
  /// <code>sortKeyName</code> <code>&lt;=</code> <code>:sortkeyval</code> -
  /// true if the sort key value is less than or equal to
  /// <code>:sortkeyval</code>.
  /// </li>
  /// <li>
  /// <code>sortKeyName</code> <code>&gt;</code> <code>:sortkeyval</code> - true
  /// if the sort key value is greater than <code>:sortkeyval</code>.
  /// </li>
  /// <li>
  /// <code>sortKeyName</code> <code>&gt;= </code> <code>:sortkeyval</code> -
  /// true if the sort key value is greater than or equal to
  /// <code>:sortkeyval</code>.
  /// </li>
  /// <li>
  /// <code>sortKeyName</code> <code>BETWEEN</code> <code>:sortkeyval1</code>
  /// <code>AND</code> <code>:sortkeyval2</code> - true if the sort key value is
  /// greater than or equal to <code>:sortkeyval1</code>, and less than or equal
  /// to <code>:sortkeyval2</code>.
  /// </li>
  /// <li>
  /// <code>begins_with (</code> <code>sortKeyName</code>,
  /// <code>:sortkeyval</code> <code>)</code> - true if the sort key value
  /// begins with a particular operand. (You cannot use this function with a
  /// sort key that is of type Number.) Note that the function name
  /// <code>begins_with</code> is case-sensitive.
  /// </li>
  /// </ul>
  /// Use the <code>ExpressionAttributeValues</code> parameter to replace tokens
  /// such as <code>:partitionval</code> and <code>:sortval</code> with actual
  /// values at runtime.
  ///
  /// You can optionally use the <code>ExpressionAttributeNames</code> parameter
  /// to replace the names of the partition key and sort key with placeholder
  /// tokens. This option might be necessary if an attribute name conflicts with
  /// a DynamoDB reserved word. For example, the following
  /// <code>KeyConditionExpression</code> parameter causes an error because
  /// <i>Size</i> is a reserved word:
  ///
  /// <ul>
  /// <li>
  /// <code>Size = :myval</code>
  /// </li>
  /// </ul>
  /// To work around this, define a placeholder (such a <code>#S</code>) to
  /// represent the attribute name <i>Size</i>.
  /// <code>KeyConditionExpression</code> then is as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>#S = :myval</code>
  /// </li>
  /// </ul>
  /// For a list of reserved words, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// For more information on <code>ExpressionAttributeNames</code> and
  /// <code>ExpressionAttributeValues</code>, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ExpressionPlaceholders.html">Using
  /// Placeholders for Attribute Names and Values</a> in the <i>Amazon DynamoDB
  /// Developer Guide</i>.
  ///
  /// Parameter [keyConditions] :
  /// This is a legacy parameter. Use <code>KeyConditionExpression</code>
  /// instead. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.KeyConditions.html">KeyConditions</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to evaluate (not necessarily the number of
  /// matching items). If DynamoDB processes the number of items up to the limit
  /// while processing the results, it stops the operation and returns the
  /// matching values up to that point, and a key in
  /// <code>LastEvaluatedKey</code> to apply in a subsequent operation, so that
  /// you can pick up where you left off. Also, if the processed dataset size
  /// exceeds 1 MB before DynamoDB reaches this limit, it stops the operation
  /// and returns the matching values up to the limit, and a key in
  /// <code>LastEvaluatedKey</code> to apply in a subsequent operation to
  /// continue the operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html">Query
  /// and Scan</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [projectionExpression] :
  /// A string that identifies one or more attributes to retrieve from the
  /// table. These attributes can include scalars, sets, or elements of a JSON
  /// document. The attributes in the expression must be separated by commas.
  ///
  /// If no attribute names are specified, then all attributes will be returned.
  /// If any of the requested attributes are not found, they will not appear in
  /// the result.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [queryFilter] :
  /// This is a legacy parameter. Use <code>FilterExpression</code> instead. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.QueryFilter.html">QueryFilter</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [scanIndexForward] :
  /// Specifies the order for index traversal: If <code>true</code> (default),
  /// the traversal is performed in ascending order; if <code>false</code>, the
  /// traversal is performed in descending order.
  ///
  /// Items with the same partition key value are stored in sorted order by sort
  /// key. If the sort key data type is Number, the results are stored in
  /// numeric order. For type String, the results are stored in order of UTF-8
  /// bytes. For type Binary, DynamoDB treats each byte of the binary data as
  /// unsigned.
  ///
  /// If <code>ScanIndexForward</code> is <code>true</code>, DynamoDB returns
  /// the results in the order in which they are stored (by sort key value).
  /// This is the default behavior. If <code>ScanIndexForward</code> is
  /// <code>false</code>, DynamoDB reads the results in reverse order by sort
  /// key value, and then returns the results to the client.
  ///
  /// Parameter [select] :
  /// The attributes to be returned in the result. You can retrieve all item
  /// attributes, specific item attributes, the count of matching items, or in
  /// the case of an index, some or all of the attributes projected into the
  /// index.
  ///
  /// <ul>
  /// <li>
  /// <code>ALL_ATTRIBUTES</code> - Returns all of the item attributes from the
  /// specified table or index. If you query a local secondary index, then for
  /// each matching item in the index, DynamoDB fetches the entire item from the
  /// parent table. If the index is configured to project all item attributes,
  /// then all of the data can be obtained from the local secondary index, and
  /// no fetching is required.
  /// </li>
  /// <li>
  /// <code>ALL_PROJECTED_ATTRIBUTES</code> - Allowed only when querying an
  /// index. Retrieves all attributes that have been projected into the index.
  /// If the index is configured to project all attributes, this return value is
  /// equivalent to specifying <code>ALL_ATTRIBUTES</code>.
  /// </li>
  /// <li>
  /// <code>COUNT</code> - Returns the number of matching items, rather than the
  /// matching items themselves.
  /// </li>
  /// <li>
  /// <code>SPECIFIC_ATTRIBUTES</code> - Returns only the attributes listed in
  /// <code>AttributesToGet</code>. This return value is equivalent to
  /// specifying <code>AttributesToGet</code> without specifying any value for
  /// <code>Select</code>.
  ///
  /// If you query or scan a local secondary index and request only attributes
  /// that are projected into that index, the operation will read only the index
  /// and not the table. If any of the requested attributes are not projected
  /// into the local secondary index, DynamoDB fetches each of these attributes
  /// from the parent table. This extra fetching incurs additional throughput
  /// cost and latency.
  ///
  /// If you query or scan a global secondary index, you can only request
  /// attributes that are projected into the index. Global secondary index
  /// queries cannot fetch attributes from the parent table.
  /// </li>
  /// </ul>
  /// If neither <code>Select</code> nor <code>AttributesToGet</code> are
  /// specified, DynamoDB defaults to <code>ALL_ATTRIBUTES</code> when accessing
  /// a table, and <code>ALL_PROJECTED_ATTRIBUTES</code> when accessing an
  /// index. You cannot use both <code>Select</code> and
  /// <code>AttributesToGet</code> together in a single request, unless the
  /// value for <code>Select</code> is <code>SPECIFIC_ATTRIBUTES</code>. (This
  /// usage is equivalent to specifying <code>AttributesToGet</code> without any
  /// value for <code>Select</code>.)
  /// <note>
  /// If you use the <code>ProjectionExpression</code> parameter, then the value
  /// for <code>Select</code> can only be <code>SPECIFIC_ATTRIBUTES</code>. Any
  /// other value for <code>Select</code> will return an error.
  /// </note>
  Future<QueryOutput> query({
    @_s.required String tableName,
    List<String> attributesToGet,
    ConditionalOperator conditionalOperator,
    bool consistentRead,
    Map<String, AttributeValue> exclusiveStartKey,
    Map<String, String> expressionAttributeNames,
    Map<String, AttributeValue> expressionAttributeValues,
    String filterExpression,
    String indexName,
    String keyConditionExpression,
    Map<String, Condition> keyConditions,
    int limit,
    String projectionExpression,
    Map<String, Condition> queryFilter,
    ReturnConsumedCapacity returnConsumedCapacity,
    bool scanIndexForward,
    Select select,
  }) async {
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'indexName',
      indexName,
      3,
      255,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.Query'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
        'AttributesToGet': attributesToGet,
        'ConditionalOperator': conditionalOperator?.toValue(),
        'ConsistentRead': consistentRead,
        'ExclusiveStartKey': exclusiveStartKey,
        'ExpressionAttributeNames': expressionAttributeNames,
        'ExpressionAttributeValues': expressionAttributeValues,
        'FilterExpression': filterExpression,
        'IndexName': indexName,
        'KeyConditionExpression': keyConditionExpression,
        'KeyConditions': keyConditions,
        'Limit': limit,
        'ProjectionExpression': projectionExpression,
        'QueryFilter': queryFilter,
        'ReturnConsumedCapacity': returnConsumedCapacity?.toValue(),
        'ScanIndexForward': scanIndexForward,
        'Select': select?.toValue(),
      },
    );

    return QueryOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new table from an existing backup. Any number of users can
  /// execute up to 4 concurrent restores (any type of restore) in a given
  /// account.
  ///
  /// You can call <code>RestoreTableFromBackup</code> at a maximum rate of 10
  /// times per second.
  ///
  /// You must manually set up the following on the restored table:
  ///
  /// <ul>
  /// <li>
  /// Auto scaling policies
  /// </li>
  /// <li>
  /// IAM policies
  /// </li>
  /// <li>
  /// Amazon CloudWatch metrics and alarms
  /// </li>
  /// <li>
  /// Tags
  /// </li>
  /// <li>
  /// Stream settings
  /// </li>
  /// <li>
  /// Time to Live (TTL) settings
  /// </li>
  /// </ul>
  ///
  /// May throw [TableAlreadyExistsException].
  /// May throw [TableInUseException].
  /// May throw [BackupNotFoundException].
  /// May throw [BackupInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupArn] :
  /// The Amazon Resource Name (ARN) associated with the backup.
  ///
  /// Parameter [targetTableName] :
  /// The name of the new table to which the backup must be restored.
  ///
  /// Parameter [billingModeOverride] :
  /// The billing mode of the restored table.
  ///
  /// Parameter [globalSecondaryIndexOverride] :
  /// List of global secondary indexes for the restored table. The indexes
  /// provided should match existing secondary indexes. You can choose to
  /// exclude some or all of the indexes at the time of restore.
  ///
  /// Parameter [localSecondaryIndexOverride] :
  /// List of local secondary indexes for the restored table. The indexes
  /// provided should match existing secondary indexes. You can choose to
  /// exclude some or all of the indexes at the time of restore.
  ///
  /// Parameter [provisionedThroughputOverride] :
  /// Provisioned throughput settings for the restored table.
  ///
  /// Parameter [sSESpecificationOverride] :
  /// The new server-side encryption settings for the restored table.
  Future<RestoreTableFromBackupOutput> restoreTableFromBackup({
    @_s.required String backupArn,
    @_s.required String targetTableName,
    BillingMode billingModeOverride,
    List<GlobalSecondaryIndex> globalSecondaryIndexOverride,
    List<LocalSecondaryIndex> localSecondaryIndexOverride,
    ProvisionedThroughput provisionedThroughputOverride,
    SSESpecification sSESpecificationOverride,
  }) async {
    ArgumentError.checkNotNull(backupArn, 'backupArn');
    _s.validateStringLength(
      'backupArn',
      backupArn,
      37,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetTableName, 'targetTableName');
    _s.validateStringLength(
      'targetTableName',
      targetTableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'targetTableName',
      targetTableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.RestoreTableFromBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupArn': backupArn,
        'TargetTableName': targetTableName,
        'BillingModeOverride': billingModeOverride?.toValue(),
        'GlobalSecondaryIndexOverride': globalSecondaryIndexOverride,
        'LocalSecondaryIndexOverride': localSecondaryIndexOverride,
        'ProvisionedThroughputOverride': provisionedThroughputOverride,
        'SSESpecificationOverride': sSESpecificationOverride,
      },
    );

    return RestoreTableFromBackupOutput.fromJson(jsonResponse.body);
  }

  /// Restores the specified table to the specified point in time within
  /// <code>EarliestRestorableDateTime</code> and
  /// <code>LatestRestorableDateTime</code>. You can restore your table to any
  /// point in time during the last 35 days. Any number of users can execute up
  /// to 4 concurrent restores (any type of restore) in a given account.
  ///
  /// When you restore using point in time recovery, DynamoDB restores your
  /// table data to the state based on the selected date and time
  /// (day:hour:minute:second) to a new table.
  ///
  /// Along with data, the following are also included on the new restored table
  /// using point in time recovery:
  ///
  /// <ul>
  /// <li>
  /// Global secondary indexes (GSIs)
  /// </li>
  /// <li>
  /// Local secondary indexes (LSIs)
  /// </li>
  /// <li>
  /// Provisioned read and write capacity
  /// </li>
  /// <li>
  /// Encryption settings
  /// <important>
  /// All these settings come from the current settings of the source table at
  /// the time of restore.
  /// </important> </li>
  /// </ul>
  /// You must manually set up the following on the restored table:
  ///
  /// <ul>
  /// <li>
  /// Auto scaling policies
  /// </li>
  /// <li>
  /// IAM policies
  /// </li>
  /// <li>
  /// Amazon CloudWatch metrics and alarms
  /// </li>
  /// <li>
  /// Tags
  /// </li>
  /// <li>
  /// Stream settings
  /// </li>
  /// <li>
  /// Time to Live (TTL) settings
  /// </li>
  /// <li>
  /// Point in time recovery settings
  /// </li>
  /// </ul>
  ///
  /// May throw [TableAlreadyExistsException].
  /// May throw [TableNotFoundException].
  /// May throw [TableInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidRestoreTimeException].
  /// May throw [PointInTimeRecoveryUnavailableException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [targetTableName] :
  /// The name of the new table to which it must be restored to.
  ///
  /// Parameter [billingModeOverride] :
  /// The billing mode of the restored table.
  ///
  /// Parameter [globalSecondaryIndexOverride] :
  /// List of global secondary indexes for the restored table. The indexes
  /// provided should match existing secondary indexes. You can choose to
  /// exclude some or all of the indexes at the time of restore.
  ///
  /// Parameter [localSecondaryIndexOverride] :
  /// List of local secondary indexes for the restored table. The indexes
  /// provided should match existing secondary indexes. You can choose to
  /// exclude some or all of the indexes at the time of restore.
  ///
  /// Parameter [provisionedThroughputOverride] :
  /// Provisioned throughput settings for the restored table.
  ///
  /// Parameter [restoreDateTime] :
  /// Time in the past to restore the table to.
  ///
  /// Parameter [sSESpecificationOverride] :
  /// The new server-side encryption settings for the restored table.
  ///
  /// Parameter [sourceTableArn] :
  /// The DynamoDB table that will be restored. This value is an Amazon Resource
  /// Name (ARN).
  ///
  /// Parameter [sourceTableName] :
  /// Name of the source table that is being restored.
  ///
  /// Parameter [useLatestRestorableTime] :
  /// Restore the table to the latest possible time.
  /// <code>LatestRestorableDateTime</code> is typically 5 minutes before the
  /// current time.
  Future<RestoreTableToPointInTimeOutput> restoreTableToPointInTime({
    @_s.required String targetTableName,
    BillingMode billingModeOverride,
    List<GlobalSecondaryIndex> globalSecondaryIndexOverride,
    List<LocalSecondaryIndex> localSecondaryIndexOverride,
    ProvisionedThroughput provisionedThroughputOverride,
    DateTime restoreDateTime,
    SSESpecification sSESpecificationOverride,
    String sourceTableArn,
    String sourceTableName,
    bool useLatestRestorableTime,
  }) async {
    ArgumentError.checkNotNull(targetTableName, 'targetTableName');
    _s.validateStringLength(
      'targetTableName',
      targetTableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'targetTableName',
      targetTableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'sourceTableName',
      sourceTableName,
      3,
      255,
    );
    _s.validateStringPattern(
      'sourceTableName',
      sourceTableName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.RestoreTableToPointInTime'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TargetTableName': targetTableName,
        'BillingModeOverride': billingModeOverride?.toValue(),
        'GlobalSecondaryIndexOverride': globalSecondaryIndexOverride,
        'LocalSecondaryIndexOverride': localSecondaryIndexOverride,
        'ProvisionedThroughputOverride': provisionedThroughputOverride,
        'RestoreDateTime': restoreDateTime,
        'SSESpecificationOverride': sSESpecificationOverride,
        'SourceTableArn': sourceTableArn,
        'SourceTableName': sourceTableName,
        'UseLatestRestorableTime': useLatestRestorableTime,
      },
    );

    return RestoreTableToPointInTimeOutput.fromJson(jsonResponse.body);
  }

  /// The <code>Scan</code> operation returns one or more items and item
  /// attributes by accessing every item in a table or a secondary index. To
  /// have DynamoDB return fewer items, you can provide a
  /// <code>FilterExpression</code> operation.
  ///
  /// If the total number of scanned items exceeds the maximum dataset size
  /// limit of 1 MB, the scan stops and results are returned to the user as a
  /// <code>LastEvaluatedKey</code> value to continue the scan in a subsequent
  /// operation. The results also include the number of items exceeding the
  /// limit. A scan can result in no table data meeting the filter criteria.
  ///
  /// A single <code>Scan</code> operation reads up to the maximum number of
  /// items set (if using the <code>Limit</code> parameter) or a maximum of 1 MB
  /// of data and then apply any filtering to the results using
  /// <code>FilterExpression</code>. If <code>LastEvaluatedKey</code> is present
  /// in the response, you need to paginate the result set. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.Pagination">Paginating
  /// the Results</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// <code>Scan</code> operations proceed sequentially; however, for faster
  /// performance on a large table or secondary index, applications can request
  /// a parallel <code>Scan</code> operation by providing the
  /// <code>Segment</code> and <code>TotalSegments</code> parameters. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Scan.html#Scan.ParallelScan">Parallel
  /// Scan</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// <code>Scan</code> uses eventually consistent reads when accessing the data
  /// in a table; therefore, the result set might not include the changes to
  /// data in the table immediately before the operation began. If you need a
  /// consistent copy of the data, as of the time that the <code>Scan</code>
  /// begins, you can set the <code>ConsistentRead</code> parameter to
  /// <code>true</code>.
  ///
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table containing the requested items; or, if you provide
  /// <code>IndexName</code>, the name of the table to which that index belongs.
  ///
  /// Parameter [attributesToGet] :
  /// This is a legacy parameter. Use <code>ProjectionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html">AttributesToGet</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [conditionalOperator] :
  /// This is a legacy parameter. Use <code>FilterExpression</code> instead. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [consistentRead] :
  /// A Boolean value that determines the read consistency model during the
  /// scan:
  ///
  /// <ul>
  /// <li>
  /// If <code>ConsistentRead</code> is <code>false</code>, then the data
  /// returned from <code>Scan</code> might not contain the results from other
  /// recently completed write operations (<code>PutItem</code>,
  /// <code>UpdateItem</code>, or <code>DeleteItem</code>).
  /// </li>
  /// <li>
  /// If <code>ConsistentRead</code> is <code>true</code>, then all of the write
  /// operations that completed before the <code>Scan</code> began are
  /// guaranteed to be contained in the <code>Scan</code> response.
  /// </li>
  /// </ul>
  /// The default setting for <code>ConsistentRead</code> is <code>false</code>.
  ///
  /// The <code>ConsistentRead</code> parameter is not supported on global
  /// secondary indexes. If you scan a global secondary index with
  /// <code>ConsistentRead</code> set to true, you will receive a
  /// <code>ValidationException</code>.
  ///
  /// Parameter [exclusiveStartKey] :
  /// The primary key of the first item that this operation will evaluate. Use
  /// the value that was returned for <code>LastEvaluatedKey</code> in the
  /// previous operation.
  ///
  /// The data type for <code>ExclusiveStartKey</code> must be String, Number or
  /// Binary. No set data types are allowed.
  ///
  /// In a parallel scan, a <code>Scan</code> request that includes
  /// <code>ExclusiveStartKey</code> must specify the same segment whose
  /// previous <code>Scan</code> returned the corresponding value of
  /// <code>LastEvaluatedKey</code>.
  ///
  /// Parameter [expressionAttributeNames] :
  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information on expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeValues] :
  /// One or more values that can be substituted in an expression.
  ///
  /// Use the <b>:</b> (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the <code>ProductStatus</code> attribute was one of the
  /// following:
  ///
  /// <code>Available | Backordered | Discontinued</code>
  ///
  /// You would first need to specify <code>ExpressionAttributeValues</code> as
  /// follows:
  ///
  /// <code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }</code>
  ///
  /// You could then use these values in an expression, such as this:
  ///
  /// <code>ProductStatus IN (:avail, :back, :disc)</code>
  ///
  /// For more information on expression attribute values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [filterExpression] :
  /// A string that contains conditions that DynamoDB applies after the
  /// <code>Scan</code> operation, but before the data is returned to you. Items
  /// that do not satisfy the <code>FilterExpression</code> criteria are not
  /// returned.
  /// <note>
  /// A <code>FilterExpression</code> is applied after the items have already
  /// been read; the process of filtering does not consume any additional read
  /// capacity units.
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#FilteringResults">Filter
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [indexName] :
  /// The name of a secondary index to scan. This index can be any local
  /// secondary index or global secondary index. Note that if you use the
  /// <code>IndexName</code> parameter, you must also provide
  /// <code>TableName</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of items to evaluate (not necessarily the number of
  /// matching items). If DynamoDB processes the number of items up to the limit
  /// while processing the results, it stops the operation and returns the
  /// matching values up to that point, and a key in
  /// <code>LastEvaluatedKey</code> to apply in a subsequent operation, so that
  /// you can pick up where you left off. Also, if the processed dataset size
  /// exceeds 1 MB before DynamoDB reaches this limit, it stops the operation
  /// and returns the matching values up to the limit, and a key in
  /// <code>LastEvaluatedKey</code> to apply in a subsequent operation to
  /// continue the operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html">Working
  /// with Queries</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [projectionExpression] :
  /// A string that identifies one or more attributes to retrieve from the
  /// specified table or index. These attributes can include scalars, sets, or
  /// elements of a JSON document. The attributes in the expression must be
  /// separated by commas.
  ///
  /// If no attribute names are specified, then all attributes will be returned.
  /// If any of the requested attributes are not found, they will not appear in
  /// the result.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [scanFilter] :
  /// This is a legacy parameter. Use <code>FilterExpression</code> instead. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ScanFilter.html">ScanFilter</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [segment] :
  /// For a parallel <code>Scan</code> request, <code>Segment</code> identifies
  /// an individual segment to be scanned by an application worker.
  ///
  /// Segment IDs are zero-based, so the first segment is always 0. For example,
  /// if you want to use four application threads to scan a table or an index,
  /// then the first thread specifies a <code>Segment</code> value of 0, the
  /// second thread specifies 1, and so on.
  ///
  /// The value of <code>LastEvaluatedKey</code> returned from a parallel
  /// <code>Scan</code> request must be used as <code>ExclusiveStartKey</code>
  /// with the same segment ID in a subsequent <code>Scan</code> operation.
  ///
  /// The value for <code>Segment</code> must be greater than or equal to 0, and
  /// less than the value provided for <code>TotalSegments</code>.
  ///
  /// If you provide <code>Segment</code>, you must also provide
  /// <code>TotalSegments</code>.
  ///
  /// Parameter [select] :
  /// The attributes to be returned in the result. You can retrieve all item
  /// attributes, specific item attributes, the count of matching items, or in
  /// the case of an index, some or all of the attributes projected into the
  /// index.
  ///
  /// <ul>
  /// <li>
  /// <code>ALL_ATTRIBUTES</code> - Returns all of the item attributes from the
  /// specified table or index. If you query a local secondary index, then for
  /// each matching item in the index, DynamoDB fetches the entire item from the
  /// parent table. If the index is configured to project all item attributes,
  /// then all of the data can be obtained from the local secondary index, and
  /// no fetching is required.
  /// </li>
  /// <li>
  /// <code>ALL_PROJECTED_ATTRIBUTES</code> - Allowed only when querying an
  /// index. Retrieves all attributes that have been projected into the index.
  /// If the index is configured to project all attributes, this return value is
  /// equivalent to specifying <code>ALL_ATTRIBUTES</code>.
  /// </li>
  /// <li>
  /// <code>COUNT</code> - Returns the number of matching items, rather than the
  /// matching items themselves.
  /// </li>
  /// <li>
  /// <code>SPECIFIC_ATTRIBUTES</code> - Returns only the attributes listed in
  /// <code>AttributesToGet</code>. This return value is equivalent to
  /// specifying <code>AttributesToGet</code> without specifying any value for
  /// <code>Select</code>.
  ///
  /// If you query or scan a local secondary index and request only attributes
  /// that are projected into that index, the operation reads only the index and
  /// not the table. If any of the requested attributes are not projected into
  /// the local secondary index, DynamoDB fetches each of these attributes from
  /// the parent table. This extra fetching incurs additional throughput cost
  /// and latency.
  ///
  /// If you query or scan a global secondary index, you can only request
  /// attributes that are projected into the index. Global secondary index
  /// queries cannot fetch attributes from the parent table.
  /// </li>
  /// </ul>
  /// If neither <code>Select</code> nor <code>AttributesToGet</code> are
  /// specified, DynamoDB defaults to <code>ALL_ATTRIBUTES</code> when accessing
  /// a table, and <code>ALL_PROJECTED_ATTRIBUTES</code> when accessing an
  /// index. You cannot use both <code>Select</code> and
  /// <code>AttributesToGet</code> together in a single request, unless the
  /// value for <code>Select</code> is <code>SPECIFIC_ATTRIBUTES</code>. (This
  /// usage is equivalent to specifying <code>AttributesToGet</code> without any
  /// value for <code>Select</code>.)
  /// <note>
  /// If you use the <code>ProjectionExpression</code> parameter, then the value
  /// for <code>Select</code> can only be <code>SPECIFIC_ATTRIBUTES</code>. Any
  /// other value for <code>Select</code> will return an error.
  /// </note>
  ///
  /// Parameter [totalSegments] :
  /// For a parallel <code>Scan</code> request, <code>TotalSegments</code>
  /// represents the total number of segments into which the <code>Scan</code>
  /// operation will be divided. The value of <code>TotalSegments</code>
  /// corresponds to the number of application workers that will perform the
  /// parallel scan. For example, if you want to use four application threads to
  /// scan a table or an index, specify a <code>TotalSegments</code> value of 4.
  ///
  /// The value for <code>TotalSegments</code> must be greater than or equal to
  /// 1, and less than or equal to 1000000. If you specify a
  /// <code>TotalSegments</code> value of 1, the <code>Scan</code> operation
  /// will be sequential rather than parallel.
  ///
  /// If you specify <code>TotalSegments</code>, you must also specify
  /// <code>Segment</code>.
  Future<ScanOutput> scan({
    @_s.required String tableName,
    List<String> attributesToGet,
    ConditionalOperator conditionalOperator,
    bool consistentRead,
    Map<String, AttributeValue> exclusiveStartKey,
    Map<String, String> expressionAttributeNames,
    Map<String, AttributeValue> expressionAttributeValues,
    String filterExpression,
    String indexName,
    int limit,
    String projectionExpression,
    ReturnConsumedCapacity returnConsumedCapacity,
    Map<String, Condition> scanFilter,
    int segment,
    Select select,
    int totalSegments,
  }) async {
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'indexName',
      indexName,
      3,
      255,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateNumRange(
      'segment',
      segment,
      0,
      999999,
    );
    _s.validateNumRange(
      'totalSegments',
      totalSegments,
      1,
      1000000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.Scan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
        'AttributesToGet': attributesToGet,
        'ConditionalOperator': conditionalOperator?.toValue(),
        'ConsistentRead': consistentRead,
        'ExclusiveStartKey': exclusiveStartKey,
        'ExpressionAttributeNames': expressionAttributeNames,
        'ExpressionAttributeValues': expressionAttributeValues,
        'FilterExpression': filterExpression,
        'IndexName': indexName,
        'Limit': limit,
        'ProjectionExpression': projectionExpression,
        'ReturnConsumedCapacity': returnConsumedCapacity?.toValue(),
        'ScanFilter': scanFilter,
        'Segment': segment,
        'Select': select?.toValue(),
        'TotalSegments': totalSegments,
      },
    );

    return ScanOutput.fromJson(jsonResponse.body);
  }

  /// Associate a set of tags with an Amazon DynamoDB resource. You can then
  /// activate these user-defined tags so that they appear on the Billing and
  /// Cost Management console for cost allocation tracking. You can call
  /// TagResource up to five times per second, per account.
  ///
  /// For an overview on tagging DynamoDB resources, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html">Tagging
  /// for DynamoDB</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [resourceArn] :
  /// Identifies the Amazon DynamoDB resource to which tags should be added.
  /// This value is an Amazon Resource Name (ARN).
  ///
  /// Parameter [tags] :
  /// The tags to be assigned to the Amazon DynamoDB resource.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1283,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// <code>TransactGetItems</code> is a synchronous operation that atomically
  /// retrieves multiple items from one or more tables (but not from indexes) in
  /// a single account and Region. A <code>TransactGetItems</code> call can
  /// contain up to 25 <code>TransactGetItem</code> objects, each of which
  /// contains a <code>Get</code> structure that specifies an item to retrieve
  /// from a table in the account and Region. A call to
  /// <code>TransactGetItems</code> cannot retrieve items from tables in more
  /// than one AWS account or Region. The aggregate size of the items in the
  /// transaction cannot exceed 4 MB.
  ///
  /// DynamoDB rejects the entire <code>TransactGetItems</code> request if any
  /// of the following is true:
  ///
  /// <ul>
  /// <li>
  /// A conflicting operation is in the process of updating an item to be read.
  /// </li>
  /// <li>
  /// There is insufficient provisioned capacity for the transaction to be
  /// completed.
  /// </li>
  /// <li>
  /// There is a user error, such as an invalid data format.
  /// </li>
  /// <li>
  /// The aggregate size of the items in the transaction cannot exceed 4 MB.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TransactionCanceledException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [transactItems] :
  /// An ordered array of up to 25 <code>TransactGetItem</code> objects, each of
  /// which contains a <code>Get</code> structure.
  ///
  /// Parameter [returnConsumedCapacity] :
  /// A value of <code>TOTAL</code> causes consumed capacity information to be
  /// returned, and a value of <code>NONE</code> prevents that information from
  /// being returned. No other value is valid.
  Future<TransactGetItemsOutput> transactGetItems({
    @_s.required List<TransactGetItem> transactItems,
    ReturnConsumedCapacity returnConsumedCapacity,
  }) async {
    ArgumentError.checkNotNull(transactItems, 'transactItems');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.TransactGetItems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TransactItems': transactItems,
        'ReturnConsumedCapacity': returnConsumedCapacity?.toValue(),
      },
    );

    return TransactGetItemsOutput.fromJson(jsonResponse.body);
  }

  /// <code>TransactWriteItems</code> is a synchronous write operation that
  /// groups up to 25 action requests. These actions can target items in
  /// different tables, but not in different AWS accounts or Regions, and no two
  /// actions can target the same item. For example, you cannot both
  /// <code>ConditionCheck</code> and <code>Update</code> the same item. The
  /// aggregate size of the items in the transaction cannot exceed 4 MB.
  ///
  /// The actions are completed atomically so that either all of them succeed,
  /// or all of them fail. They are defined by the following objects:
  ///
  /// <ul>
  /// <li>
  /// <code>Put</code>  &#x97;   Initiates a <code>PutItem</code> operation to
  /// write a new item. This structure specifies the primary key of the item to
  /// be written, the name of the table to write it in, an optional condition
  /// expression that must be satisfied for the write to succeed, a list of the
  /// item's attributes, and a field indicating whether to retrieve the item's
  /// attributes if the condition is not met.
  /// </li>
  /// <li>
  /// <code>Update</code>  &#x97;   Initiates an <code>UpdateItem</code>
  /// operation to update an existing item. This structure specifies the primary
  /// key of the item to be updated, the name of the table where it resides, an
  /// optional condition expression that must be satisfied for the update to
  /// succeed, an expression that defines one or more attributes to be updated,
  /// and a field indicating whether to retrieve the item's attributes if the
  /// condition is not met.
  /// </li>
  /// <li>
  /// <code>Delete</code>  &#x97;   Initiates a <code>DeleteItem</code>
  /// operation to delete an existing item. This structure specifies the primary
  /// key of the item to be deleted, the name of the table where it resides, an
  /// optional condition expression that must be satisfied for the deletion to
  /// succeed, and a field indicating whether to retrieve the item's attributes
  /// if the condition is not met.
  /// </li>
  /// <li>
  /// <code>ConditionCheck</code>  &#x97;   Applies a condition to an item that
  /// is not being modified by the transaction. This structure specifies the
  /// primary key of the item to be checked, the name of the table where it
  /// resides, a condition expression that must be satisfied for the transaction
  /// to succeed, and a field indicating whether to retrieve the item's
  /// attributes if the condition is not met.
  /// </li>
  /// </ul>
  /// DynamoDB rejects the entire <code>TransactWriteItems</code> request if any
  /// of the following is true:
  ///
  /// <ul>
  /// <li>
  /// A condition in one of the condition expressions is not met.
  /// </li>
  /// <li>
  /// An ongoing operation is in the process of updating the same item.
  /// </li>
  /// <li>
  /// There is insufficient provisioned capacity for the transaction to be
  /// completed.
  /// </li>
  /// <li>
  /// An item size becomes too large (bigger than 400 KB), a local secondary
  /// index (LSI) becomes too large, or a similar validation error occurs
  /// because of changes made by the transaction.
  /// </li>
  /// <li>
  /// The aggregate size of the items in the transaction exceeds 4 MB.
  /// </li>
  /// <li>
  /// There is a user error, such as an invalid data format.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TransactionCanceledException].
  /// May throw [TransactionInProgressException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [transactItems] :
  /// An ordered array of up to 25 <code>TransactWriteItem</code> objects, each
  /// of which contains a <code>ConditionCheck</code>, <code>Put</code>,
  /// <code>Update</code>, or <code>Delete</code> object. These can operate on
  /// items in different tables, but the tables must reside in the same AWS
  /// account and Region, and no two of them can operate on the same item.
  ///
  /// Parameter [clientRequestToken] :
  /// Providing a <code>ClientRequestToken</code> makes the call to
  /// <code>TransactWriteItems</code> idempotent, meaning that multiple
  /// identical calls have the same effect as one single call.
  ///
  /// Although multiple identical calls using the same client request token
  /// produce the same result on the server (no side effects), the responses to
  /// the calls might not be the same. If the
  /// <code>ReturnConsumedCapacity&gt;</code> parameter is set, then the initial
  /// <code>TransactWriteItems</code> call returns the amount of write capacity
  /// units consumed in making the changes. Subsequent
  /// <code>TransactWriteItems</code> calls with the same client token return
  /// the number of read capacity units consumed in reading the item.
  ///
  /// A client request token is valid for 10 minutes after the first request
  /// that uses it is completed. After 10 minutes, any request with the same
  /// client token is treated as a new request. Do not resubmit the same request
  /// with the same client token for more than 10 minutes, or the result might
  /// not be idempotent.
  ///
  /// If you submit a request with the same client token but a change in other
  /// parameters within the 10-minute idempotency window, DynamoDB returns an
  /// <code>IdempotentParameterMismatch</code> exception.
  ///
  /// Parameter [returnItemCollectionMetrics] :
  /// Determines whether item collection metrics are returned. If set to
  /// <code>SIZE</code>, the response includes statistics about item collections
  /// (if any), that were modified during the operation and are returned in the
  /// response. If set to <code>NONE</code> (the default), no statistics are
  /// returned.
  Future<TransactWriteItemsOutput> transactWriteItems({
    @_s.required List<TransactWriteItem> transactItems,
    String clientRequestToken,
    ReturnConsumedCapacity returnConsumedCapacity,
    ReturnItemCollectionMetrics returnItemCollectionMetrics,
  }) async {
    ArgumentError.checkNotNull(transactItems, 'transactItems');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      36,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.TransactWriteItems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TransactItems': transactItems,
        'ClientRequestToken': clientRequestToken,
        'ReturnConsumedCapacity': returnConsumedCapacity?.toValue(),
        'ReturnItemCollectionMetrics': returnItemCollectionMetrics?.toValue(),
      },
    );

    return TransactWriteItemsOutput.fromJson(jsonResponse.body);
  }

  /// Removes the association of tags from an Amazon DynamoDB resource. You can
  /// call <code>UntagResource</code> up to five times per second, per account.
  ///
  /// For an overview on tagging DynamoDB resources, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html">Tagging
  /// for DynamoDB</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [resourceArn] :
  /// The DynamoDB resource that the tags will be removed from. This value is an
  /// Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys. Existing tags of the resource whose keys are members
  /// of this list will be removed from the DynamoDB resource.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1283,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// <code>UpdateContinuousBackups</code> enables or disables point in time
  /// recovery for the specified table. A successful
  /// <code>UpdateContinuousBackups</code> call returns the current
  /// <code>ContinuousBackupsDescription</code>. Continuous backups are
  /// <code>ENABLED</code> on all tables at table creation. If point in time
  /// recovery is enabled, <code>PointInTimeRecoveryStatus</code> will be set to
  /// ENABLED.
  ///
  /// Once continuous backups and point in time recovery are enabled, you can
  /// restore to any point in time within
  /// <code>EarliestRestorableDateTime</code> and
  /// <code>LatestRestorableDateTime</code>.
  ///
  /// <code>LatestRestorableDateTime</code> is typically 5 minutes before the
  /// current time. You can restore your table to any point in time during the
  /// last 35 days.
  ///
  /// May throw [TableNotFoundException].
  /// May throw [ContinuousBackupsUnavailableException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [pointInTimeRecoverySpecification] :
  /// Represents the settings used to enable point in time recovery.
  ///
  /// Parameter [tableName] :
  /// The name of the table.
  Future<UpdateContinuousBackupsOutput> updateContinuousBackups({
    @_s.required
        PointInTimeRecoverySpecification pointInTimeRecoverySpecification,
    @_s.required String tableName,
  }) async {
    ArgumentError.checkNotNull(
        pointInTimeRecoverySpecification, 'pointInTimeRecoverySpecification');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateContinuousBackups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PointInTimeRecoverySpecification': pointInTimeRecoverySpecification,
        'TableName': tableName,
      },
    );

    return UpdateContinuousBackupsOutput.fromJson(jsonResponse.body);
  }

  /// Updates the status for contributor insights for a specific table or index.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [contributorInsightsAction] :
  /// Represents the contributor insights action.
  ///
  /// Parameter [tableName] :
  /// The name of the table.
  ///
  /// Parameter [indexName] :
  /// The global secondary index name, if applicable.
  Future<UpdateContributorInsightsOutput> updateContributorInsights({
    @_s.required ContributorInsightsAction contributorInsightsAction,
    @_s.required String tableName,
    String indexName,
  }) async {
    ArgumentError.checkNotNull(
        contributorInsightsAction, 'contributorInsightsAction');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'indexName',
      indexName,
      3,
      255,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateContributorInsights'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ContributorInsightsAction': contributorInsightsAction?.toValue(),
        'TableName': tableName,
        'IndexName': indexName,
      },
    );

    return UpdateContributorInsightsOutput.fromJson(jsonResponse.body);
  }

  /// Adds or removes replicas in the specified global table. The global table
  /// must already exist to be able to use this operation. Any replica to be
  /// added must be empty, have the same name as the global table, have the same
  /// key schema, have DynamoDB Streams enabled, and have the same provisioned
  /// and maximum write capacity units.
  /// <note>
  /// Although you can use <code>UpdateGlobalTable</code> to add replicas and
  /// remove replicas in a single request, for simplicity we recommend that you
  /// issue separate requests for adding or removing replicas.
  /// </note>
  /// If global secondary indexes are specified, then the following conditions
  /// must also be met:
  ///
  /// <ul>
  /// <li>
  /// The global secondary indexes must have the same name.
  /// </li>
  /// <li>
  /// The global secondary indexes must have the same hash key and sort key (if
  /// present).
  /// </li>
  /// <li>
  /// The global secondary indexes must have the same provisioned and maximum
  /// write capacity units.
  /// </li>
  /// </ul>
  ///
  /// May throw [InternalServerError].
  /// May throw [GlobalTableNotFoundException].
  /// May throw [ReplicaAlreadyExistsException].
  /// May throw [ReplicaNotFoundException].
  /// May throw [TableNotFoundException].
  ///
  /// Parameter [globalTableName] :
  /// The global table name.
  ///
  /// Parameter [replicaUpdates] :
  /// A list of Regions that should be added or removed from the global table.
  Future<UpdateGlobalTableOutput> updateGlobalTable({
    @_s.required String globalTableName,
    @_s.required List<ReplicaUpdate> replicaUpdates,
  }) async {
    ArgumentError.checkNotNull(globalTableName, 'globalTableName');
    _s.validateStringLength(
      'globalTableName',
      globalTableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'globalTableName',
      globalTableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(replicaUpdates, 'replicaUpdates');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateGlobalTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GlobalTableName': globalTableName,
        'ReplicaUpdates': replicaUpdates,
      },
    );

    return UpdateGlobalTableOutput.fromJson(jsonResponse.body);
  }

  /// Updates settings for a global table.
  ///
  /// May throw [GlobalTableNotFoundException].
  /// May throw [ReplicaNotFoundException].
  /// May throw [IndexNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [globalTableName] :
  /// The name of the global table
  ///
  /// Parameter [globalTableBillingMode] :
  /// The billing mode of the global table. If
  /// <code>GlobalTableBillingMode</code> is not specified, the global table
  /// defaults to <code>PROVISIONED</code> capacity billing mode.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONED</code> - We recommend using <code>PROVISIONED</code> for
  /// predictable workloads. <code>PROVISIONED</code> sets the billing mode to
  /// <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html#HowItWorks.ProvisionedThroughput.Manual">Provisioned
  /// Mode</a>.
  /// </li>
  /// <li>
  /// <code>PAY_PER_REQUEST</code> - We recommend using
  /// <code>PAY_PER_REQUEST</code> for unpredictable workloads.
  /// <code>PAY_PER_REQUEST</code> sets the billing mode to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html#HowItWorks.OnDemand">On-Demand
  /// Mode</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [globalTableGlobalSecondaryIndexSettingsUpdate] :
  /// Represents the settings of a global secondary index for a global table
  /// that will be modified.
  ///
  /// Parameter [globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate] :
  /// Auto scaling settings for managing provisioned write capacity for the
  /// global table.
  ///
  /// Parameter [globalTableProvisionedWriteCapacityUnits] :
  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException.</code>
  ///
  /// Parameter [replicaSettingsUpdate] :
  /// Represents the settings for a global table in a Region that will be
  /// modified.
  Future<UpdateGlobalTableSettingsOutput> updateGlobalTableSettings({
    @_s.required String globalTableName,
    BillingMode globalTableBillingMode,
    List<GlobalTableGlobalSecondaryIndexSettingsUpdate>
        globalTableGlobalSecondaryIndexSettingsUpdate,
    AutoScalingSettingsUpdate
        globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate,
    int globalTableProvisionedWriteCapacityUnits,
    List<ReplicaSettingsUpdate> replicaSettingsUpdate,
  }) async {
    ArgumentError.checkNotNull(globalTableName, 'globalTableName');
    _s.validateStringLength(
      'globalTableName',
      globalTableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'globalTableName',
      globalTableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'globalTableProvisionedWriteCapacityUnits',
      globalTableProvisionedWriteCapacityUnits,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateGlobalTableSettings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GlobalTableName': globalTableName,
        'GlobalTableBillingMode': globalTableBillingMode?.toValue(),
        'GlobalTableGlobalSecondaryIndexSettingsUpdate':
            globalTableGlobalSecondaryIndexSettingsUpdate,
        'GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate':
            globalTableProvisionedWriteCapacityAutoScalingSettingsUpdate,
        'GlobalTableProvisionedWriteCapacityUnits':
            globalTableProvisionedWriteCapacityUnits,
        'ReplicaSettingsUpdate': replicaSettingsUpdate,
      },
    );

    return UpdateGlobalTableSettingsOutput.fromJson(jsonResponse.body);
  }

  /// Edits an existing item's attributes, or adds a new item to the table if it
  /// does not already exist. You can put, delete, or add attribute values. You
  /// can also perform a conditional update on an existing item (insert a new
  /// attribute name-value pair if it doesn't exist, or replace an existing
  /// name-value pair if it has certain expected attribute values).
  ///
  /// You can also return the item's attribute values in the same
  /// <code>UpdateItem</code> operation using the <code>ReturnValues</code>
  /// parameter.
  ///
  /// May throw [ConditionalCheckFailedException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ItemCollectionSizeLimitExceededException].
  /// May throw [TransactionConflictException].
  /// May throw [RequestLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [key] :
  /// The primary key of the item to be updated. Each element consists of an
  /// attribute name and a value for that attribute.
  ///
  /// For the primary key, you must provide all of the attributes. For example,
  /// with a simple primary key, you only need to provide a value for the
  /// partition key. For a composite primary key, you must provide values for
  /// both the partition key and the sort key.
  ///
  /// Parameter [tableName] :
  /// The name of the table containing the item to update.
  ///
  /// Parameter [attributeUpdates] :
  /// This is a legacy parameter. Use <code>UpdateExpression</code> instead. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributeUpdates.html">AttributeUpdates</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [conditionExpression] :
  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  ///
  /// An expression can contain any of the following:
  ///
  /// <ul>
  /// <li>
  /// Functions: <code>attribute_exists | attribute_not_exists | attribute_type
  /// | contains | begins_with | size</code>
  ///
  /// These function names are case-sensitive.
  /// </li>
  /// <li>
  /// Comparison operators: <code>= | &lt;&gt; | &lt; | &gt; | &lt;= | &gt;= |
  /// BETWEEN | IN </code>
  /// </li>
  /// <li>
  /// Logical operators: <code>AND | OR | NOT</code>
  /// </li>
  /// </ul>
  /// For more information about condition expressions, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Specifying
  /// Conditions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [conditionalOperator] :
  /// This is a legacy parameter. Use <code>ConditionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html">ConditionalOperator</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expected] :
  /// This is a legacy parameter. Use <code>ConditionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html">Expected</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeNames] :
  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in
  /// an expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being
  /// misinterpreted in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>.) To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information about expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Specifying
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [expressionAttributeValues] :
  /// One or more values that can be substituted in an expression.
  ///
  /// Use the <b>:</b> (colon) character in an expression to dereference an
  /// attribute value. For example, suppose that you wanted to check whether the
  /// value of the <code>ProductStatus</code> attribute was one of the
  /// following:
  ///
  /// <code>Available | Backordered | Discontinued</code>
  ///
  /// You would first need to specify <code>ExpressionAttributeValues</code> as
  /// follows:
  ///
  /// <code>{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"},
  /// ":disc":{"S":"Discontinued"} }</code>
  ///
  /// You could then use these values in an expression, such as this:
  ///
  /// <code>ProductStatus IN (:avail, :back, :disc)</code>
  ///
  /// For more information on expression attribute values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html">Condition
  /// Expressions</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// Parameter [returnItemCollectionMetrics] :
  /// Determines whether item collection metrics are returned. If set to
  /// <code>SIZE</code>, the response includes statistics about item
  /// collections, if any, that were modified during the operation are returned
  /// in the response. If set to <code>NONE</code> (the default), no statistics
  /// are returned.
  ///
  /// Parameter [returnValues] :
  /// Use <code>ReturnValues</code> if you want to get the item attributes as
  /// they appear before or after they are updated. For <code>UpdateItem</code>,
  /// the valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - If <code>ReturnValues</code> is not specified, or if
  /// its value is <code>NONE</code>, then nothing is returned. (This setting is
  /// the default for <code>ReturnValues</code>.)
  /// </li>
  /// <li>
  /// <code>ALL_OLD</code> - Returns all of the attributes of the item, as they
  /// appeared before the UpdateItem operation.
  /// </li>
  /// <li>
  /// <code>UPDATED_OLD</code> - Returns only the updated attributes, as they
  /// appeared before the UpdateItem operation.
  /// </li>
  /// <li>
  /// <code>ALL_NEW</code> - Returns all of the attributes of the item, as they
  /// appear after the UpdateItem operation.
  /// </li>
  /// <li>
  /// <code>UPDATED_NEW</code> - Returns only the updated attributes, as they
  /// appear after the UpdateItem operation.
  /// </li>
  /// </ul>
  /// There is no additional cost associated with requesting a return value
  /// aside from the small network and processing overhead of receiving a larger
  /// response. No read capacity units are consumed.
  ///
  /// The values returned are strongly consistent.
  ///
  /// Parameter [updateExpression] :
  /// An expression that defines one or more attributes to be updated, the
  /// action to be performed on them, and new values for them.
  ///
  /// The following action values are available for
  /// <code>UpdateExpression</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>SET</code> - Adds one or more attributes and values to an item. If
  /// any of these attributes already exist, they are replaced by the new
  /// values. You can also use <code>SET</code> to add or subtract from an
  /// attribute that is of type Number. For example: <code>SET myNum = myNum +
  /// :val</code>
  ///
  /// <code>SET</code> supports the following functions:
  ///
  /// <ul>
  /// <li>
  /// <code>if_not_exists (path, operand)</code> - if the item does not contain
  /// an attribute at the specified path, then <code>if_not_exists</code>
  /// evaluates to operand; otherwise, it evaluates to path. You can use this
  /// function to avoid overwriting an attribute that may already be present in
  /// the item.
  /// </li>
  /// <li>
  /// <code>list_append (operand, operand)</code> - evaluates to a list with a
  /// new element added to it. You can append the new element to the start or
  /// the end of the list by reversing the order of the operands.
  /// </li>
  /// </ul>
  /// These function names are case-sensitive.
  /// </li>
  /// <li>
  /// <code>REMOVE</code> - Removes one or more attributes from an item.
  /// </li>
  /// <li>
  /// <code>ADD</code> - Adds the specified value to the item, if the attribute
  /// does not already exist. If the attribute does exist, then the behavior of
  /// <code>ADD</code> depends on the data type of the attribute:
  ///
  /// <ul>
  /// <li>
  /// If the existing attribute is a number, and if <code>Value</code> is also a
  /// number, then <code>Value</code> is mathematically added to the existing
  /// attribute. If <code>Value</code> is a negative number, then it is
  /// subtracted from the existing attribute.
  /// <note>
  /// If you use <code>ADD</code> to increment or decrement a number value for
  /// an item that doesn't exist before the update, DynamoDB uses <code>0</code>
  /// as the initial value.
  ///
  /// Similarly, if you use <code>ADD</code> for an existing item to increment
  /// or decrement an attribute value that doesn't exist before the update,
  /// DynamoDB uses <code>0</code> as the initial value. For example, suppose
  /// that the item you want to update doesn't have an attribute named
  /// <code>itemcount</code>, but you decide to <code>ADD</code> the number
  /// <code>3</code> to this attribute anyway. DynamoDB will create the
  /// <code>itemcount</code> attribute, set its initial value to <code>0</code>,
  /// and finally add <code>3</code> to it. The result will be a new
  /// <code>itemcount</code> attribute in the item, with a value of
  /// <code>3</code>.
  /// </note> </li>
  /// <li>
  /// If the existing data type is a set and if <code>Value</code> is also a
  /// set, then <code>Value</code> is added to the existing set. For example, if
  /// the attribute value is the set <code>[1,2]</code>, and the
  /// <code>ADD</code> action specified <code>[3]</code>, then the final
  /// attribute value is <code>[1,2,3]</code>. An error occurs if an
  /// <code>ADD</code> action is specified for a set attribute and the attribute
  /// type specified does not match the existing set type.
  ///
  /// Both sets must have the same primitive data type. For example, if the
  /// existing data type is a set of strings, the <code>Value</code> must also
  /// be a set of strings.
  /// </li>
  /// </ul> <important>
  /// The <code>ADD</code> action only supports Number and set data types. In
  /// addition, <code>ADD</code> can only be used on top-level attributes, not
  /// nested attributes.
  /// </important> </li>
  /// <li>
  /// <code>DELETE</code> - Deletes an element from a set.
  ///
  /// If a set of values is specified, then those values are subtracted from the
  /// old set. For example, if the attribute value was the set
  /// <code>[a,b,c]</code> and the <code>DELETE</code> action specifies
  /// <code>[a,c]</code>, then the final attribute value is <code>[b]</code>.
  /// Specifying an empty set is an error.
  /// <important>
  /// The <code>DELETE</code> action only supports set data types. In addition,
  /// <code>DELETE</code> can only be used on top-level attributes, not nested
  /// attributes.
  /// </important> </li>
  /// </ul>
  /// You can have many actions in a single expression, such as the following:
  /// <code>SET a=:value1, b=:value2 DELETE :value3, :value4, :value5</code>
  ///
  /// For more information on update expressions, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.Modifying.html">Modifying
  /// Items and Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  Future<UpdateItemOutput> updateItem({
    @_s.required Map<String, AttributeValue> key,
    @_s.required String tableName,
    Map<String, AttributeValueUpdate> attributeUpdates,
    String conditionExpression,
    ConditionalOperator conditionalOperator,
    Map<String, ExpectedAttributeValue> expected,
    Map<String, String> expressionAttributeNames,
    Map<String, AttributeValue> expressionAttributeValues,
    ReturnConsumedCapacity returnConsumedCapacity,
    ReturnItemCollectionMetrics returnItemCollectionMetrics,
    ReturnValue returnValues,
    String updateExpression,
  }) async {
    ArgumentError.checkNotNull(key, 'key');
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateItem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Key': key,
        'TableName': tableName,
        'AttributeUpdates': attributeUpdates,
        'ConditionExpression': conditionExpression,
        'ConditionalOperator': conditionalOperator?.toValue(),
        'Expected': expected,
        'ExpressionAttributeNames': expressionAttributeNames,
        'ExpressionAttributeValues': expressionAttributeValues,
        'ReturnConsumedCapacity': returnConsumedCapacity?.toValue(),
        'ReturnItemCollectionMetrics': returnItemCollectionMetrics?.toValue(),
        'ReturnValues': returnValues?.toValue(),
        'UpdateExpression': updateExpression,
      },
    );

    return UpdateItemOutput.fromJson(jsonResponse.body);
  }

  /// Modifies the provisioned throughput settings, global secondary indexes, or
  /// DynamoDB Streams settings for a given table.
  ///
  /// You can only perform one of the following operations at once:
  ///
  /// <ul>
  /// <li>
  /// Modify the provisioned throughput settings of the table.
  /// </li>
  /// <li>
  /// Enable or disable DynamoDB Streams on the table.
  /// </li>
  /// <li>
  /// Remove a global secondary index from the table.
  /// </li>
  /// <li>
  /// Create a new global secondary index on the table. After the index begins
  /// backfilling, you can use <code>UpdateTable</code> to perform other
  /// operations.
  /// </li>
  /// </ul>
  /// <code>UpdateTable</code> is an asynchronous operation; while it is
  /// executing, the table status changes from <code>ACTIVE</code> to
  /// <code>UPDATING</code>. While it is <code>UPDATING</code>, you cannot issue
  /// another <code>UpdateTable</code> request. When the table returns to the
  /// <code>ACTIVE</code> state, the <code>UpdateTable</code> operation is
  /// complete.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table to be updated.
  ///
  /// Parameter [attributeDefinitions] :
  /// An array of attributes that describe the key schema for the table and
  /// indexes. If you are adding a new global secondary index to the table,
  /// <code>AttributeDefinitions</code> must include the key element(s) of the
  /// new index.
  ///
  /// Parameter [billingMode] :
  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. When switching from pay-per-request to provisioned
  /// capacity, initial provisioned capacity values must be set. The initial
  /// provisioned capacity values are estimated based on the consumed read and
  /// write capacity of your table and global secondary indexes over the past 30
  /// minutes.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONED</code> - We recommend using <code>PROVISIONED</code> for
  /// predictable workloads. <code>PROVISIONED</code> sets the billing mode to
  /// <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html#HowItWorks.ProvisionedThroughput.Manual">Provisioned
  /// Mode</a>.
  /// </li>
  /// <li>
  /// <code>PAY_PER_REQUEST</code> - We recommend using
  /// <code>PAY_PER_REQUEST</code> for unpredictable workloads.
  /// <code>PAY_PER_REQUEST</code> sets the billing mode to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html#HowItWorks.OnDemand">On-Demand
  /// Mode</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [globalSecondaryIndexUpdates] :
  /// An array of one or more global secondary indexes for the table. For each
  /// index in the array, you can request one action:
  ///
  /// <ul>
  /// <li>
  /// <code>Create</code> - add a new global secondary index to the table.
  /// </li>
  /// <li>
  /// <code>Update</code> - modify the provisioned throughput settings of an
  /// existing global secondary index.
  /// </li>
  /// <li>
  /// <code>Delete</code> - remove a global secondary index from the table.
  /// </li>
  /// </ul>
  /// You can create or delete only one global secondary index per
  /// <code>UpdateTable</code> operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GSI.OnlineOps.html">Managing
  /// Global Secondary Indexes</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  ///
  /// Parameter [provisionedThroughput] :
  /// The new provisioned throughput settings for the specified table or index.
  ///
  /// Parameter [replicaUpdates] :
  /// A list of replica update actions (create, delete, or update) for the
  /// table.
  /// <note>
  /// This property only applies to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.V2.html">Version
  /// 2019.11.21</a> of global tables.
  /// </note>
  ///
  /// Parameter [sSESpecification] :
  /// The new server-side encryption settings for the specified table.
  ///
  /// Parameter [streamSpecification] :
  /// Represents the DynamoDB Streams configuration for the table.
  /// <note>
  /// You receive a <code>ResourceInUseException</code> if you try to enable a
  /// stream on a table that already has a stream, or if you try to disable a
  /// stream on a table that doesn't have a stream.
  /// </note>
  Future<UpdateTableOutput> updateTable({
    @_s.required String tableName,
    List<AttributeDefinition> attributeDefinitions,
    BillingMode billingMode,
    List<GlobalSecondaryIndexUpdate> globalSecondaryIndexUpdates,
    ProvisionedThroughput provisionedThroughput,
    List<ReplicationGroupUpdate> replicaUpdates,
    SSESpecification sSESpecification,
    StreamSpecification streamSpecification,
  }) async {
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateTable'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
        'AttributeDefinitions': attributeDefinitions,
        'BillingMode': billingMode?.toValue(),
        'GlobalSecondaryIndexUpdates': globalSecondaryIndexUpdates,
        'ProvisionedThroughput': provisionedThroughput,
        'ReplicaUpdates': replicaUpdates,
        'SSESpecification': sSESpecification,
        'StreamSpecification': streamSpecification,
      },
    );

    return UpdateTableOutput.fromJson(jsonResponse.body);
  }

  /// Updates auto scaling settings on your global tables at once.
  /// <note>
  /// This method only applies to <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/globaltables.V2.html">Version
  /// 2019.11.21</a> of global tables.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the global table to be updated.
  ///
  /// Parameter [globalSecondaryIndexUpdates] :
  /// Represents the auto scaling settings of the global secondary indexes of
  /// the replica to be updated.
  ///
  /// Parameter [replicaUpdates] :
  /// Represents the auto scaling settings of replicas of the table that will be
  /// modified.
  Future<UpdateTableReplicaAutoScalingOutput> updateTableReplicaAutoScaling({
    @_s.required String tableName,
    List<GlobalSecondaryIndexAutoScalingUpdate> globalSecondaryIndexUpdates,
    AutoScalingSettingsUpdate provisionedWriteCapacityAutoScalingUpdate,
    List<ReplicaAutoScalingUpdate> replicaUpdates,
  }) async {
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateTableReplicaAutoScaling'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
        'GlobalSecondaryIndexUpdates': globalSecondaryIndexUpdates,
        'ProvisionedWriteCapacityAutoScalingUpdate':
            provisionedWriteCapacityAutoScalingUpdate,
        'ReplicaUpdates': replicaUpdates,
      },
    );

    return UpdateTableReplicaAutoScalingOutput.fromJson(jsonResponse.body);
  }

  /// The <code>UpdateTimeToLive</code> method enables or disables Time to Live
  /// (TTL) for the specified table. A successful <code>UpdateTimeToLive</code>
  /// call returns the current <code>TimeToLiveSpecification</code>. It can take
  /// up to one hour for the change to fully process. Any additional
  /// <code>UpdateTimeToLive</code> calls for the same table during this one
  /// hour duration result in a <code>ValidationException</code>.
  ///
  /// TTL compares the current time in epoch time format to the time stored in
  /// the TTL attribute of an item. If the epoch time value stored in the
  /// attribute is less than the current time, the item is marked as expired and
  /// subsequently deleted.
  /// <note>
  /// The epoch time format is the number of seconds elapsed since 12:00:00 AM
  /// January 1, 1970 UTC.
  /// </note>
  /// DynamoDB deletes expired items on a best-effort basis to ensure
  /// availability of throughput for other data operations.
  /// <important>
  /// DynamoDB typically deletes expired items within two days of expiration.
  /// The exact duration within which an item gets deleted after expiration is
  /// specific to the nature of the workload. Items that have expired and not
  /// been deleted will still show up in reads, queries, and scans.
  /// </important>
  /// As items are deleted, they are removed from any local secondary index and
  /// global secondary index immediately in the same eventually consistent way
  /// as a standard delete operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/TTL.html">Time
  /// To Live</a> in the Amazon DynamoDB Developer Guide.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [tableName] :
  /// The name of the table to be configured.
  ///
  /// Parameter [timeToLiveSpecification] :
  /// Represents the settings used to enable or disable Time to Live for the
  /// specified table.
  Future<UpdateTimeToLiveOutput> updateTimeToLive({
    @_s.required String tableName,
    @_s.required TimeToLiveSpecification timeToLiveSpecification,
  }) async {
    ArgumentError.checkNotNull(tableName, 'tableName');
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        timeToLiveSpecification, 'timeToLiveSpecification');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDB_20120810.UpdateTimeToLive'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TableName': tableName,
        'TimeToLiveSpecification': timeToLiveSpecification,
      },
    );

    return UpdateTimeToLiveOutput.fromJson(jsonResponse.body);
  }
}

/// Contains details of a table archival operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ArchivalSummary {
  /// The Amazon Resource Name (ARN) of the backup the table was archived to, when
  /// applicable in the archival reason. If you wish to restore this backup to the
  /// same table name, you will need to delete the original table.
  @_s.JsonKey(name: 'ArchivalBackupArn')
  final String archivalBackupArn;

  /// The date and time when table archival was initiated by DynamoDB, in UNIX
  /// epoch time format.
  @_s.JsonKey(
      name: 'ArchivalDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime archivalDateTime;

  /// The reason DynamoDB archived the table. Currently, the only possible value
  /// is:
  ///
  /// <ul>
  /// <li>
  /// <code>INACCESSIBLE_ENCRYPTION_CREDENTIALS</code> - The table was archived
  /// due to the table's AWS KMS key being inaccessible for more than seven days.
  /// An On-Demand backup was created at the archival time.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ArchivalReason')
  final String archivalReason;

  ArchivalSummary({
    this.archivalBackupArn,
    this.archivalDateTime,
    this.archivalReason,
  });
  factory ArchivalSummary.fromJson(Map<String, dynamic> json) =>
      _$ArchivalSummaryFromJson(json);
}

enum AttributeAction {
  @_s.JsonValue('ADD')
  add,
  @_s.JsonValue('PUT')
  put,
  @_s.JsonValue('DELETE')
  delete,
}

/// Represents an attribute for describing the key schema for the table and
/// indexes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AttributeDefinition {
  /// A name for the attribute.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The data type for the attribute, where:
  ///
  /// <ul>
  /// <li>
  /// <code>S</code> - the attribute is of type String
  /// </li>
  /// <li>
  /// <code>N</code> - the attribute is of type Number
  /// </li>
  /// <li>
  /// <code>B</code> - the attribute is of type Binary
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'AttributeType')
  final ScalarAttributeType attributeType;

  AttributeDefinition({
    @_s.required this.attributeName,
    @_s.required this.attributeType,
  });
  factory AttributeDefinition.fromJson(Map<String, dynamic> json) =>
      _$AttributeDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeDefinitionToJson(this);
}

/// Represents the data for an attribute.
///
/// Each attribute value is described as a name-value pair. The name is the data
/// type, and the value is the data itself.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes">Data
/// Types</a> in the <i>Amazon DynamoDB Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AttributeValue {
  /// An attribute of type Binary. For example:
  ///
  /// <code>"B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"</code>
  @Uint8ListConverter()
  @_s.JsonKey(name: 'B')
  final Uint8List b;

  /// An attribute of type Boolean. For example:
  ///
  /// <code>"BOOL": true</code>
  @_s.JsonKey(name: 'BOOL')
  final bool boolValue;

  /// An attribute of type Binary Set. For example:
  ///
  /// <code>"BS": ["U3Vubnk=", "UmFpbnk=", "U25vd3k="]</code>
  @Uint8ListListConverter()
  @_s.JsonKey(name: 'BS')
  final List<Uint8List> bs;

  /// An attribute of type List. For example:
  ///
  /// <code>"L": [ {"S": "Cookies"} , {"S": "Coffee"}, {"N", "3.14159"}]</code>
  @_s.JsonKey(name: 'L')
  final List<AttributeValue> l;

  /// An attribute of type Map. For example:
  ///
  /// <code>"M": {"Name": {"S": "Joe"}, "Age": {"N": "35"}}</code>
  @_s.JsonKey(name: 'M')
  final Map<String, AttributeValue> m;

  /// An attribute of type Number. For example:
  ///
  /// <code>"N": "123.45"</code>
  ///
  /// Numbers are sent across the network to DynamoDB as strings, to maximize
  /// compatibility across languages and libraries. However, DynamoDB treats them
  /// as number type attributes for mathematical operations.
  @_s.JsonKey(name: 'N')
  final String n;

  /// An attribute of type Number Set. For example:
  ///
  /// <code>"NS": ["42.2", "-19", "7.5", "3.14"]</code>
  ///
  /// Numbers are sent across the network to DynamoDB as strings, to maximize
  /// compatibility across languages and libraries. However, DynamoDB treats them
  /// as number type attributes for mathematical operations.
  @_s.JsonKey(name: 'NS')
  final List<String> ns;

  /// An attribute of type Null. For example:
  ///
  /// <code>"NULL": true</code>
  @_s.JsonKey(name: 'NULL')
  final bool nullValue;

  /// An attribute of type String. For example:
  ///
  /// <code>"S": "Hello"</code>
  @_s.JsonKey(name: 'S')
  final String s;

  /// An attribute of type String Set. For example:
  ///
  /// <code>"SS": ["Giraffe", "Hippo" ,"Zebra"]</code>
  @_s.JsonKey(name: 'SS')
  final List<String> ss;

  AttributeValue({
    this.b,
    this.boolValue,
    this.bs,
    this.l,
    this.m,
    this.n,
    this.ns,
    this.nullValue,
    this.s,
    this.ss,
  });
  factory AttributeValue.fromJson(Map<String, dynamic> json) =>
      _$AttributeValueFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeValueToJson(this);
}

/// For the <code>UpdateItem</code> operation, represents the attributes to be
/// modified, the action to perform on each, and the new value for each.
/// <note>
/// You cannot use <code>UpdateItem</code> to update any primary key attributes.
/// Instead, you will need to delete the item, and then use <code>PutItem</code>
/// to create a new item with new attributes.
/// </note>
/// Attribute values cannot be null; string and binary type attributes must have
/// lengths greater than zero; and set type attributes must not be empty.
/// Requests with empty values will be rejected with a
/// <code>ValidationException</code> exception.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AttributeValueUpdate {
  /// Specifies how to perform the update. Valid values are <code>PUT</code>
  /// (default), <code>DELETE</code>, and <code>ADD</code>. The behavior depends
  /// on whether the specified primary key already exists in the table.
  ///
  /// <b>If an item with the specified <i>Key</i> is found in the table:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>PUT</code> - Adds the specified attribute to the item. If the
  /// attribute already exists, it is replaced by the new value.
  /// </li>
  /// <li>
  /// <code>DELETE</code> - If no value is specified, the attribute and its value
  /// are removed from the item. The data type of the specified value must match
  /// the existing value's data type.
  ///
  /// If a <i>set</i> of values is specified, then those values are subtracted
  /// from the old set. For example, if the attribute value was the set
  /// <code>[a,b,c]</code> and the <code>DELETE</code> action specified
  /// <code>[a,c]</code>, then the final attribute value would be
  /// <code>[b]</code>. Specifying an empty set is an error.
  /// </li>
  /// <li>
  /// <code>ADD</code> - If the attribute does not already exist, then the
  /// attribute and its values are added to the item. If the attribute does exist,
  /// then the behavior of <code>ADD</code> depends on the data type of the
  /// attribute:
  ///
  /// <ul>
  /// <li>
  /// If the existing attribute is a number, and if <code>Value</code> is also a
  /// number, then the <code>Value</code> is mathematically added to the existing
  /// attribute. If <code>Value</code> is a negative number, then it is subtracted
  /// from the existing attribute.
  /// <note>
  /// If you use <code>ADD</code> to increment or decrement a number value for an
  /// item that doesn't exist before the update, DynamoDB uses 0 as the initial
  /// value.
  ///
  /// In addition, if you use <code>ADD</code> to update an existing item, and
  /// intend to increment or decrement an attribute value which does not yet
  /// exist, DynamoDB uses <code>0</code> as the initial value. For example,
  /// suppose that the item you want to update does not yet have an attribute
  /// named <i>itemcount</i>, but you decide to <code>ADD</code> the number
  /// <code>3</code> to this attribute anyway, even though it currently does not
  /// exist. DynamoDB will create the <i>itemcount</i> attribute, set its initial
  /// value to <code>0</code>, and finally add <code>3</code> to it. The result
  /// will be a new <i>itemcount</i> attribute in the item, with a value of
  /// <code>3</code>.
  /// </note> </li>
  /// <li>
  /// If the existing data type is a set, and if the <code>Value</code> is also a
  /// set, then the <code>Value</code> is added to the existing set. (This is a
  /// <i>set</i> operation, not mathematical addition.) For example, if the
  /// attribute value was the set <code>[1,2]</code>, and the <code>ADD</code>
  /// action specified <code>[3]</code>, then the final attribute value would be
  /// <code>[1,2,3]</code>. An error occurs if an Add action is specified for a
  /// set attribute and the attribute type specified does not match the existing
  /// set type.
  ///
  /// Both sets must have the same primitive data type. For example, if the
  /// existing data type is a set of strings, the <code>Value</code> must also be
  /// a set of strings. The same holds true for number sets and binary sets.
  /// </li>
  /// </ul>
  /// This action is only valid for an existing attribute whose data type is
  /// number or is a set. Do not use <code>ADD</code> for any other data types.
  /// </li>
  /// </ul>
  /// <b>If no item with the specified <i>Key</i> is found:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>PUT</code> - DynamoDB creates a new item with the specified primary
  /// key, and then adds the attribute.
  /// </li>
  /// <li>
  /// <code>DELETE</code> - Nothing happens; there is no attribute to delete.
  /// </li>
  /// <li>
  /// <code>ADD</code> - DynamoDB creates an item with the supplied primary key
  /// and number (or set of numbers) for the attribute value. The only data types
  /// allowed are number and number set; no other data types can be specified.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Action')
  final AttributeAction action;

  /// Represents the data for an attribute.
  ///
  /// Each attribute value is described as a name-value pair. The name is the data
  /// type, and the value is the data itself.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes">Data
  /// Types</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'Value')
  final AttributeValue value;

  AttributeValueUpdate({
    this.action,
    this.value,
  });
  Map<String, dynamic> toJson() => _$AttributeValueUpdateToJson(this);
}

/// Represents the properties of the scaling policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoScalingPolicyDescription {
  /// The name of the scaling policy.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  /// Represents a target tracking scaling policy configuration.
  @_s.JsonKey(name: 'TargetTrackingScalingPolicyConfiguration')
  final AutoScalingTargetTrackingScalingPolicyConfigurationDescription
      targetTrackingScalingPolicyConfiguration;

  AutoScalingPolicyDescription({
    this.policyName,
    this.targetTrackingScalingPolicyConfiguration,
  });
  factory AutoScalingPolicyDescription.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingPolicyDescriptionFromJson(json);
}

/// Represents the auto scaling policy to be modified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AutoScalingPolicyUpdate {
  /// Represents a target tracking scaling policy configuration.
  @_s.JsonKey(name: 'TargetTrackingScalingPolicyConfiguration')
  final AutoScalingTargetTrackingScalingPolicyConfigurationUpdate
      targetTrackingScalingPolicyConfiguration;

  /// The name of the scaling policy.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  AutoScalingPolicyUpdate({
    @_s.required this.targetTrackingScalingPolicyConfiguration,
    this.policyName,
  });
  Map<String, dynamic> toJson() => _$AutoScalingPolicyUpdateToJson(this);
}

/// Represents the auto scaling settings for a global table or global secondary
/// index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoScalingSettingsDescription {
  /// Disabled auto scaling for this global table or global secondary index.
  @_s.JsonKey(name: 'AutoScalingDisabled')
  final bool autoScalingDisabled;

  /// Role ARN used for configuring the auto scaling policy.
  @_s.JsonKey(name: 'AutoScalingRoleArn')
  final String autoScalingRoleArn;

  /// The maximum capacity units that a global table or global secondary index
  /// should be scaled up to.
  @_s.JsonKey(name: 'MaximumUnits')
  final int maximumUnits;

  /// The minimum capacity units that a global table or global secondary index
  /// should be scaled down to.
  @_s.JsonKey(name: 'MinimumUnits')
  final int minimumUnits;

  /// Information about the scaling policies.
  @_s.JsonKey(name: 'ScalingPolicies')
  final List<AutoScalingPolicyDescription> scalingPolicies;

  AutoScalingSettingsDescription({
    this.autoScalingDisabled,
    this.autoScalingRoleArn,
    this.maximumUnits,
    this.minimumUnits,
    this.scalingPolicies,
  });
  factory AutoScalingSettingsDescription.fromJson(Map<String, dynamic> json) =>
      _$AutoScalingSettingsDescriptionFromJson(json);
}

/// Represents the auto scaling settings to be modified for a global table or
/// global secondary index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AutoScalingSettingsUpdate {
  /// Disabled auto scaling for this global table or global secondary index.
  @_s.JsonKey(name: 'AutoScalingDisabled')
  final bool autoScalingDisabled;

  /// Role ARN used for configuring auto scaling policy.
  @_s.JsonKey(name: 'AutoScalingRoleArn')
  final String autoScalingRoleArn;

  /// The maximum capacity units that a global table or global secondary index
  /// should be scaled up to.
  @_s.JsonKey(name: 'MaximumUnits')
  final int maximumUnits;

  /// The minimum capacity units that a global table or global secondary index
  /// should be scaled down to.
  @_s.JsonKey(name: 'MinimumUnits')
  final int minimumUnits;

  /// The scaling policy to apply for scaling target global table or global
  /// secondary index capacity units.
  @_s.JsonKey(name: 'ScalingPolicyUpdate')
  final AutoScalingPolicyUpdate scalingPolicyUpdate;

  AutoScalingSettingsUpdate({
    this.autoScalingDisabled,
    this.autoScalingRoleArn,
    this.maximumUnits,
    this.minimumUnits,
    this.scalingPolicyUpdate,
  });
  Map<String, dynamic> toJson() => _$AutoScalingSettingsUpdateToJson(this);
}

/// Represents the properties of a target tracking scaling policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoScalingTargetTrackingScalingPolicyConfigurationDescription {
  /// The target value for the metric. The range is 8.515920e-109 to 1.174271e+108
  /// (Base 10) or 2e-360 to 2e360 (Base 2).
  @_s.JsonKey(name: 'TargetValue')
  final double targetValue;

  /// Indicates whether scale in by the target tracking policy is disabled. If the
  /// value is true, scale in is disabled and the target tracking policy won't
  /// remove capacity from the scalable resource. Otherwise, scale in is enabled
  /// and the target tracking policy can remove capacity from the scalable
  /// resource. The default value is false.
  @_s.JsonKey(name: 'DisableScaleIn')
  final bool disableScaleIn;

  /// The amount of time, in seconds, after a scale in activity completes before
  /// another scale in activity can start. The cooldown period is used to block
  /// subsequent scale in requests until it has expired. You should scale in
  /// conservatively to protect your application's availability. However, if
  /// another alarm triggers a scale out policy during the cooldown period after a
  /// scale-in, application auto scaling scales out your scalable target
  /// immediately.
  @_s.JsonKey(name: 'ScaleInCooldown')
  final int scaleInCooldown;

  /// The amount of time, in seconds, after a scale out activity completes before
  /// another scale out activity can start. While the cooldown period is in
  /// effect, the capacity that has been added by the previous scale out event
  /// that initiated the cooldown is calculated as part of the desired capacity
  /// for the next scale out. You should continuously (but not excessively) scale
  /// out.
  @_s.JsonKey(name: 'ScaleOutCooldown')
  final int scaleOutCooldown;

  AutoScalingTargetTrackingScalingPolicyConfigurationDescription({
    @_s.required this.targetValue,
    this.disableScaleIn,
    this.scaleInCooldown,
    this.scaleOutCooldown,
  });
  factory AutoScalingTargetTrackingScalingPolicyConfigurationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$AutoScalingTargetTrackingScalingPolicyConfigurationDescriptionFromJson(
          json);
}

/// Represents the settings of a target tracking scaling policy that will be
/// modified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AutoScalingTargetTrackingScalingPolicyConfigurationUpdate {
  /// The target value for the metric. The range is 8.515920e-109 to 1.174271e+108
  /// (Base 10) or 2e-360 to 2e360 (Base 2).
  @_s.JsonKey(name: 'TargetValue')
  final double targetValue;

  /// Indicates whether scale in by the target tracking policy is disabled. If the
  /// value is true, scale in is disabled and the target tracking policy won't
  /// remove capacity from the scalable resource. Otherwise, scale in is enabled
  /// and the target tracking policy can remove capacity from the scalable
  /// resource. The default value is false.
  @_s.JsonKey(name: 'DisableScaleIn')
  final bool disableScaleIn;

  /// The amount of time, in seconds, after a scale in activity completes before
  /// another scale in activity can start. The cooldown period is used to block
  /// subsequent scale in requests until it has expired. You should scale in
  /// conservatively to protect your application's availability. However, if
  /// another alarm triggers a scale out policy during the cooldown period after a
  /// scale-in, application auto scaling scales out your scalable target
  /// immediately.
  @_s.JsonKey(name: 'ScaleInCooldown')
  final int scaleInCooldown;

  /// The amount of time, in seconds, after a scale out activity completes before
  /// another scale out activity can start. While the cooldown period is in
  /// effect, the capacity that has been added by the previous scale out event
  /// that initiated the cooldown is calculated as part of the desired capacity
  /// for the next scale out. You should continuously (but not excessively) scale
  /// out.
  @_s.JsonKey(name: 'ScaleOutCooldown')
  final int scaleOutCooldown;

  AutoScalingTargetTrackingScalingPolicyConfigurationUpdate({
    @_s.required this.targetValue,
    this.disableScaleIn,
    this.scaleInCooldown,
    this.scaleOutCooldown,
  });
  Map<String, dynamic> toJson() =>
      _$AutoScalingTargetTrackingScalingPolicyConfigurationUpdateToJson(this);
}

/// Contains the description of the backup created for the table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackupDescription {
  /// Contains the details of the backup created for the table.
  @_s.JsonKey(name: 'BackupDetails')
  final BackupDetails backupDetails;

  /// Contains the details of the table when the backup was created.
  @_s.JsonKey(name: 'SourceTableDetails')
  final SourceTableDetails sourceTableDetails;

  /// Contains the details of the features enabled on the table when the backup
  /// was created. For example, LSIs, GSIs, streams, TTL.
  @_s.JsonKey(name: 'SourceTableFeatureDetails')
  final SourceTableFeatureDetails sourceTableFeatureDetails;

  BackupDescription({
    this.backupDetails,
    this.sourceTableDetails,
    this.sourceTableFeatureDetails,
  });
  factory BackupDescription.fromJson(Map<String, dynamic> json) =>
      _$BackupDescriptionFromJson(json);
}

/// Contains the details of the backup created for the table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackupDetails {
  /// ARN associated with the backup.
  @_s.JsonKey(name: 'BackupArn')
  final String backupArn;

  /// Time at which the backup was created. This is the request time of the
  /// backup.
  @_s.JsonKey(
      name: 'BackupCreationDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime backupCreationDateTime;

  /// Name of the requested backup.
  @_s.JsonKey(name: 'BackupName')
  final String backupName;

  /// Backup can be in one of the following states: CREATING, ACTIVE, DELETED.
  @_s.JsonKey(name: 'BackupStatus')
  final BackupStatus backupStatus;

  /// BackupType:
  ///
  /// <ul>
  /// <li>
  /// <code>USER</code> - You create and manage these using the on-demand backup
  /// feature.
  /// </li>
  /// <li>
  /// <code>SYSTEM</code> - If you delete a table with point-in-time recovery
  /// enabled, a <code>SYSTEM</code> backup is automatically created and is
  /// retained for 35 days (at no additional cost). System backups allow you to
  /// restore the deleted table to the state it was in just before the point of
  /// deletion.
  /// </li>
  /// <li>
  /// <code>AWS_BACKUP</code> - On-demand backup created by you from AWS Backup
  /// service.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'BackupType')
  final BackupType backupType;

  /// Time at which the automatic on-demand backup created by DynamoDB will
  /// expire. This <code>SYSTEM</code> on-demand backup expires automatically 35
  /// days after its creation.
  @_s.JsonKey(
      name: 'BackupExpiryDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime backupExpiryDateTime;

  /// Size of the backup in bytes.
  @_s.JsonKey(name: 'BackupSizeBytes')
  final int backupSizeBytes;

  BackupDetails({
    @_s.required this.backupArn,
    @_s.required this.backupCreationDateTime,
    @_s.required this.backupName,
    @_s.required this.backupStatus,
    @_s.required this.backupType,
    this.backupExpiryDateTime,
    this.backupSizeBytes,
  });
  factory BackupDetails.fromJson(Map<String, dynamic> json) =>
      _$BackupDetailsFromJson(json);
}

enum BackupStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('AVAILABLE')
  available,
}

/// Contains details for the backup.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BackupSummary {
  /// ARN associated with the backup.
  @_s.JsonKey(name: 'BackupArn')
  final String backupArn;

  /// Time at which the backup was created.
  @_s.JsonKey(
      name: 'BackupCreationDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime backupCreationDateTime;

  /// Time at which the automatic on-demand backup created by DynamoDB will
  /// expire. This <code>SYSTEM</code> on-demand backup expires automatically 35
  /// days after its creation.
  @_s.JsonKey(
      name: 'BackupExpiryDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime backupExpiryDateTime;

  /// Name of the specified backup.
  @_s.JsonKey(name: 'BackupName')
  final String backupName;

  /// Size of the backup in bytes.
  @_s.JsonKey(name: 'BackupSizeBytes')
  final int backupSizeBytes;

  /// Backup can be in one of the following states: CREATING, ACTIVE, DELETED.
  @_s.JsonKey(name: 'BackupStatus')
  final BackupStatus backupStatus;

  /// BackupType:
  ///
  /// <ul>
  /// <li>
  /// <code>USER</code> - You create and manage these using the on-demand backup
  /// feature.
  /// </li>
  /// <li>
  /// <code>SYSTEM</code> - If you delete a table with point-in-time recovery
  /// enabled, a <code>SYSTEM</code> backup is automatically created and is
  /// retained for 35 days (at no additional cost). System backups allow you to
  /// restore the deleted table to the state it was in just before the point of
  /// deletion.
  /// </li>
  /// <li>
  /// <code>AWS_BACKUP</code> - On-demand backup created by you from AWS Backup
  /// service.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'BackupType')
  final BackupType backupType;

  /// ARN associated with the table.
  @_s.JsonKey(name: 'TableArn')
  final String tableArn;

  /// Unique identifier for the table.
  @_s.JsonKey(name: 'TableId')
  final String tableId;

  /// Name of the table.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  BackupSummary({
    this.backupArn,
    this.backupCreationDateTime,
    this.backupExpiryDateTime,
    this.backupName,
    this.backupSizeBytes,
    this.backupStatus,
    this.backupType,
    this.tableArn,
    this.tableId,
    this.tableName,
  });
  factory BackupSummary.fromJson(Map<String, dynamic> json) =>
      _$BackupSummaryFromJson(json);
}

enum BackupType {
  @_s.JsonValue('USER')
  user,
  @_s.JsonValue('SYSTEM')
  system,
  @_s.JsonValue('AWS_BACKUP')
  awsBackup,
}

enum BackupTypeFilter {
  @_s.JsonValue('USER')
  user,
  @_s.JsonValue('SYSTEM')
  system,
  @_s.JsonValue('AWS_BACKUP')
  awsBackup,
  @_s.JsonValue('ALL')
  all,
}

extension on BackupTypeFilter {
  String toValue() {
    switch (this) {
      case BackupTypeFilter.user:
        return 'USER';
      case BackupTypeFilter.system:
        return 'SYSTEM';
      case BackupTypeFilter.awsBackup:
        return 'AWS_BACKUP';
      case BackupTypeFilter.all:
        return 'ALL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the output of a <code>BatchGetItem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetItemOutput {
  /// The read capacity units consumed by the entire <code>BatchGetItem</code>
  /// operation.
  ///
  /// Each element consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>TableName</code> - The table that consumed the provisioned throughput.
  /// </li>
  /// <li>
  /// <code>CapacityUnits</code> - The total number of capacity units consumed.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ConsumedCapacity')
  final List<ConsumedCapacity> consumedCapacity;

  /// A map of table name to a list of items. Each object in
  /// <code>Responses</code> consists of a table name, along with a map of
  /// attribute data consisting of the data type and attribute value.
  @_s.JsonKey(name: 'Responses')
  final Map<String, List<Map<String, AttributeValue>>> responses;

  /// A map of tables and their respective keys that were not processed with the
  /// current response. The <code>UnprocessedKeys</code> value is in the same form
  /// as <code>RequestItems</code>, so the value can be provided directly to a
  /// subsequent <code>BatchGetItem</code> operation. For more information, see
  /// <code>RequestItems</code> in the Request Parameters section.
  ///
  /// Each element consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>Keys</code> - An array of primary key attribute values that define
  /// specific items in the table.
  /// </li>
  /// <li>
  /// <code>ProjectionExpression</code> - One or more attributes to be retrieved
  /// from the table or index. By default, all attributes are returned. If a
  /// requested attribute is not found, it does not appear in the result.
  /// </li>
  /// <li>
  /// <code>ConsistentRead</code> - The consistency of a read operation. If set to
  /// <code>true</code>, then a strongly consistent read is used; otherwise, an
  /// eventually consistent read is used.
  /// </li>
  /// </ul>
  /// If there are no unprocessed keys remaining, the response contains an empty
  /// <code>UnprocessedKeys</code> map.
  @_s.JsonKey(name: 'UnprocessedKeys')
  final Map<String, KeysAndAttributes> unprocessedKeys;

  BatchGetItemOutput({
    this.consumedCapacity,
    this.responses,
    this.unprocessedKeys,
  });
  factory BatchGetItemOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchGetItemOutputFromJson(json);
}

/// Represents the output of a <code>BatchWriteItem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchWriteItemOutput {
  /// The capacity units consumed by the entire <code>BatchWriteItem</code>
  /// operation.
  ///
  /// Each element consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>TableName</code> - The table that consumed the provisioned throughput.
  /// </li>
  /// <li>
  /// <code>CapacityUnits</code> - The total number of capacity units consumed.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ConsumedCapacity')
  final List<ConsumedCapacity> consumedCapacity;

  /// A list of tables that were processed by <code>BatchWriteItem</code> and, for
  /// each table, information about any item collections that were affected by
  /// individual <code>DeleteItem</code> or <code>PutItem</code> operations.
  ///
  /// Each entry consists of the following subelements:
  ///
  /// <ul>
  /// <li>
  /// <code>ItemCollectionKey</code> - The partition key value of the item
  /// collection. This is the same as the partition key value of the item.
  /// </li>
  /// <li>
  /// <code>SizeEstimateRangeGB</code> - An estimate of item collection size,
  /// expressed in GB. This is a two-element array containing a lower bound and an
  /// upper bound for the estimate. The estimate includes the size of all the
  /// items in the table, plus the size of all attributes projected into all of
  /// the local secondary indexes on the table. Use this estimate to measure
  /// whether a local secondary index is approaching its size limit.
  ///
  /// The estimate is subject to change over time; therefore, do not rely on the
  /// precision or accuracy of the estimate.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ItemCollectionMetrics')
  final Map<String, List<ItemCollectionMetrics>> itemCollectionMetrics;

  /// A map of tables and requests against those tables that were not processed.
  /// The <code>UnprocessedItems</code> value is in the same form as
  /// <code>RequestItems</code>, so you can provide this value directly to a
  /// subsequent <code>BatchGetItem</code> operation. For more information, see
  /// <code>RequestItems</code> in the Request Parameters section.
  ///
  /// Each <code>UnprocessedItems</code> entry consists of a table name and, for
  /// that table, a list of operations to perform (<code>DeleteRequest</code> or
  /// <code>PutRequest</code>).
  ///
  /// <ul>
  /// <li>
  /// <code>DeleteRequest</code> - Perform a <code>DeleteItem</code> operation on
  /// the specified item. The item to be deleted is identified by a
  /// <code>Key</code> subelement:
  ///
  /// <ul>
  /// <li>
  /// <code>Key</code> - A map of primary key attribute values that uniquely
  /// identify the item. Each entry in this map consists of an attribute name and
  /// an attribute value.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>PutRequest</code> - Perform a <code>PutItem</code> operation on the
  /// specified item. The item to be put is identified by an <code>Item</code>
  /// subelement:
  ///
  /// <ul>
  /// <li>
  /// <code>Item</code> - A map of attributes and their values. Each entry in this
  /// map consists of an attribute name and an attribute value. Attribute values
  /// must not be null; string and binary type attributes must have lengths
  /// greater than zero; and set type attributes must not be empty. Requests that
  /// contain empty values will be rejected with a
  /// <code>ValidationException</code> exception.
  ///
  /// If you specify any attributes that are part of an index key, then the data
  /// types for those attributes must match those of the schema in the table's
  /// attribute definition.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// If there are no unprocessed items remaining, the response contains an empty
  /// <code>UnprocessedItems</code> map.
  @_s.JsonKey(name: 'UnprocessedItems')
  final Map<String, List<WriteRequest>> unprocessedItems;

  BatchWriteItemOutput({
    this.consumedCapacity,
    this.itemCollectionMetrics,
    this.unprocessedItems,
  });
  factory BatchWriteItemOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchWriteItemOutputFromJson(json);
}

enum BillingMode {
  @_s.JsonValue('PROVISIONED')
  provisioned,
  @_s.JsonValue('PAY_PER_REQUEST')
  payPerRequest,
}

extension on BillingMode {
  String toValue() {
    switch (this) {
      case BillingMode.provisioned:
        return 'PROVISIONED';
      case BillingMode.payPerRequest:
        return 'PAY_PER_REQUEST';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the details for the read/write capacity mode.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BillingModeSummary {
  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. This setting can be changed later.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONED</code> - Sets the read/write capacity mode to
  /// <code>PROVISIONED</code>. We recommend using <code>PROVISIONED</code> for
  /// predictable workloads.
  /// </li>
  /// <li>
  /// <code>PAY_PER_REQUEST</code> - Sets the read/write capacity mode to
  /// <code>PAY_PER_REQUEST</code>. We recommend using
  /// <code>PAY_PER_REQUEST</code> for unpredictable workloads.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'BillingMode')
  final BillingMode billingMode;

  /// Represents the time when <code>PAY_PER_REQUEST</code> was last set as the
  /// read/write capacity mode.
  @_s.JsonKey(
      name: 'LastUpdateToPayPerRequestDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdateToPayPerRequestDateTime;

  BillingModeSummary({
    this.billingMode,
    this.lastUpdateToPayPerRequestDateTime,
  });
  factory BillingModeSummary.fromJson(Map<String, dynamic> json) =>
      _$BillingModeSummaryFromJson(json);
}

/// Represents the amount of provisioned throughput capacity consumed on a table
/// or an index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Capacity {
  /// The total number of capacity units consumed on a table or an index.
  @_s.JsonKey(name: 'CapacityUnits')
  final double capacityUnits;

  /// The total number of read capacity units consumed on a table or an index.
  @_s.JsonKey(name: 'ReadCapacityUnits')
  final double readCapacityUnits;

  /// The total number of write capacity units consumed on a table or an index.
  @_s.JsonKey(name: 'WriteCapacityUnits')
  final double writeCapacityUnits;

  Capacity({
    this.capacityUnits,
    this.readCapacityUnits,
    this.writeCapacityUnits,
  });
  factory Capacity.fromJson(Map<String, dynamic> json) =>
      _$CapacityFromJson(json);
}

enum ComparisonOperator {
  @_s.JsonValue('EQ')
  eq,
  @_s.JsonValue('NE')
  ne,
  @_s.JsonValue('IN')
  $in,
  @_s.JsonValue('LE')
  le,
  @_s.JsonValue('LT')
  lt,
  @_s.JsonValue('GE')
  ge,
  @_s.JsonValue('GT')
  gt,
  @_s.JsonValue('BETWEEN')
  between,
  @_s.JsonValue('NOT_NULL')
  notNull,
  @_s.JsonValue('NULL')
  $null,
  @_s.JsonValue('CONTAINS')
  contains,
  @_s.JsonValue('NOT_CONTAINS')
  notContains,
  @_s.JsonValue('BEGINS_WITH')
  beginsWith,
}

/// Represents the selection criteria for a <code>Query</code> or
/// <code>Scan</code> operation:
///
/// <ul>
/// <li>
/// For a <code>Query</code> operation, <code>Condition</code> is used for
/// specifying the <code>KeyConditions</code> to use when querying a table or an
/// index. For <code>KeyConditions</code>, only the following comparison
/// operators are supported:
///
/// <code>EQ | LE | LT | GE | GT | BEGINS_WITH | BETWEEN</code>
///
/// <code>Condition</code> is also used in a <code>QueryFilter</code>, which
/// evaluates the query results and returns only the desired values.
/// </li>
/// <li>
/// For a <code>Scan</code> operation, <code>Condition</code> is used in a
/// <code>ScanFilter</code>, which evaluates the scan results and returns only
/// the desired values.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Condition {
  /// A comparator for evaluating attributes. For example, equals, greater than,
  /// less than, etc.
  ///
  /// The following comparison operators are available:
  ///
  /// <code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS |
  /// NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code>
  ///
  /// The following are descriptions of each comparison operator.
  ///
  /// <ul>
  /// <li>
  /// <code>EQ</code> : Equal. <code>EQ</code> is supported for all data types,
  /// including lists and maps.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, Binary, String
  /// Set, Number Set, or Binary Set. If an item contains an
  /// <code>AttributeValue</code> element of a different type than the one
  /// provided in the request, the value does not match. For example,
  /// <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also,
  /// <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>NE</code> : Not equal. <code>NE</code> is supported for all data
  /// types, including lists and maps.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> of type String, Number, Binary, String Set,
  /// Number Set, or Binary Set. If an item contains an
  /// <code>AttributeValue</code> of a different type than the one provided in the
  /// request, the value does not match. For example, <code>{"S":"6"}</code> does
  /// not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not
  /// equal <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>LE</code> : Less than or equal.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>LT</code> : Less than.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> of type String, Number, or Binary (not a set
  /// type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>GE</code> : Greater than or equal.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>GT</code> : Greater than.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>NOT_NULL</code> : The attribute exists. <code>NOT_NULL</code> is
  /// supported for all data types, including lists and maps.
  /// <note>
  /// This operator tests for the existence of an attribute, not its data type. If
  /// the data type of attribute "<code>a</code>" is null, and you evaluate it
  /// using <code>NOT_NULL</code>, the result is a Boolean <code>true</code>. This
  /// result is because the attribute "<code>a</code>" exists; its data type is
  /// not relevant to the <code>NOT_NULL</code> comparison operator.
  /// </note> </li>
  /// <li>
  /// <code>NULL</code> : The attribute does not exist. <code>NULL</code> is
  /// supported for all data types, including lists and maps.
  /// <note>
  /// This operator tests for the nonexistence of an attribute, not its data type.
  /// If the data type of attribute "<code>a</code>" is null, and you evaluate it
  /// using <code>NULL</code>, the result is a Boolean <code>false</code>. This is
  /// because the attribute "<code>a</code>" exists; its data type is not relevant
  /// to the <code>NULL</code> comparison operator.
  /// </note> </li>
  /// <li>
  /// <code>CONTAINS</code> : Checks for a subsequence, or value in a set.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If the target attribute of the comparison is of type String, then
  /// the operator checks for a substring match. If the target attribute of the
  /// comparison is of type Binary, then the operator looks for a subsequence of
  /// the target that matches the input. If the target attribute of the comparison
  /// is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then
  /// the operator evaluates to true if it finds an exact match with any member of
  /// the set.
  ///
  /// CONTAINS is supported for lists: When evaluating "<code>a CONTAINS
  /// b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot
  /// be a set, a map, or a list.
  /// </li>
  /// <li>
  /// <code>NOT_CONTAINS</code> : Checks for absence of a subsequence, or absence
  /// of a value in a set.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If the target attribute of the comparison is a String, then the
  /// operator checks for the absence of a substring match. If the target
  /// attribute of the comparison is Binary, then the operator checks for the
  /// absence of a subsequence of the target that matches the input. If the target
  /// attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>",
  /// or "<code>BS</code>"), then the operator evaluates to true if it <i>does
  /// not</i> find an exact match with any member of the set.
  ///
  /// NOT_CONTAINS is supported for lists: When evaluating "<code>a NOT CONTAINS
  /// b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot
  /// be a set, a map, or a list.
  /// </li>
  /// <li>
  /// <code>BEGINS_WITH</code> : Checks for a prefix.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> of type String or Binary (not a Number or a set
  /// type). The target attribute of the comparison must be of type String or
  /// Binary (not a Number or a set type).
  /// <p/> </li>
  /// <li>
  /// <code>IN</code> : Checks for matching elements in a list.
  ///
  /// <code>AttributeValueList</code> can contain one or more
  /// <code>AttributeValue</code> elements of type String, Number, or Binary.
  /// These attributes are compared against an existing attribute of an item. If
  /// any elements of the input are equal to the item attribute, the expression
  /// evaluates to true.
  /// </li>
  /// <li>
  /// <code>BETWEEN</code> : Greater than or equal to the first value, and less
  /// than or equal to the second value.
  ///
  /// <code>AttributeValueList</code> must contain two <code>AttributeValue</code>
  /// elements of the same type, either String, Number, or Binary (not a set
  /// type). A target attribute matches if the target value is greater than, or
  /// equal to, the first element and less than, or equal to, the second element.
  /// If an item contains an <code>AttributeValue</code> element of a different
  /// type than the one provided in the request, the value does not match. For
  /// example, <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>.
  /// Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2",
  /// "1"]}</code>
  /// </li>
  /// </ul>
  /// For usage examples of <code>AttributeValueList</code> and
  /// <code>ComparisonOperator</code>, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html">Legacy
  /// Conditional Parameters</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ComparisonOperator')
  final ComparisonOperator comparisonOperator;

  /// One or more values to evaluate against the supplied attribute. The number of
  /// values in the list depends on the <code>ComparisonOperator</code> being
  /// used.
  ///
  /// For type Number, value comparisons are numeric.
  ///
  /// String value comparisons for greater than, equals, or less than are based on
  /// ASCII character code values. For example, <code>a</code> is greater than
  /// <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a
  /// list of code values, see <a
  /// href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.
  ///
  /// For Binary, DynamoDB treats each byte of the binary data as unsigned when it
  /// compares binary values.
  @_s.JsonKey(name: 'AttributeValueList')
  final List<AttributeValue> attributeValueList;

  Condition({
    @_s.required this.comparisonOperator,
    this.attributeValueList,
  });
  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

/// Represents a request to perform a check that an item exists or to check the
/// condition of specific attributes of the item.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ConditionCheck {
  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  @_s.JsonKey(name: 'ConditionExpression')
  final String conditionExpression;

  /// The primary key of the item to be checked. Each element consists of an
  /// attribute name and a value for that attribute.
  @_s.JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  /// Name of the table for the check item request.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// One or more substitution tokens for attribute names in an expression.
  @_s.JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  @_s.JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  /// Use <code>ReturnValuesOnConditionCheckFailure</code> to get the item
  /// attributes if the <code>ConditionCheck</code> condition fails. For
  /// <code>ReturnValuesOnConditionCheckFailure</code>, the valid values are: NONE
  /// and ALL_OLD.
  @_s.JsonKey(name: 'ReturnValuesOnConditionCheckFailure')
  final ReturnValuesOnConditionCheckFailure returnValuesOnConditionCheckFailure;

  ConditionCheck({
    @_s.required this.conditionExpression,
    @_s.required this.key,
    @_s.required this.tableName,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });
  Map<String, dynamic> toJson() => _$ConditionCheckToJson(this);
}

enum ConditionalOperator {
  @_s.JsonValue('AND')
  and,
  @_s.JsonValue('OR')
  or,
}

extension on ConditionalOperator {
  String toValue() {
    switch (this) {
      case ConditionalOperator.and:
        return 'AND';
      case ConditionalOperator.or:
        return 'OR';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The capacity units consumed by an operation. The data returned includes the
/// total provisioned throughput consumed, along with statistics for the table
/// and any indexes involved in the operation. <code>ConsumedCapacity</code> is
/// only returned if the request asked for it. For more information, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned
/// Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConsumedCapacity {
  /// The total number of capacity units consumed by the operation.
  @_s.JsonKey(name: 'CapacityUnits')
  final double capacityUnits;

  /// The amount of throughput consumed on each global index affected by the
  /// operation.
  @_s.JsonKey(name: 'GlobalSecondaryIndexes')
  final Map<String, Capacity> globalSecondaryIndexes;

  /// The amount of throughput consumed on each local index affected by the
  /// operation.
  @_s.JsonKey(name: 'LocalSecondaryIndexes')
  final Map<String, Capacity> localSecondaryIndexes;

  /// The total number of read capacity units consumed by the operation.
  @_s.JsonKey(name: 'ReadCapacityUnits')
  final double readCapacityUnits;

  /// The amount of throughput consumed on the table affected by the operation.
  @_s.JsonKey(name: 'Table')
  final Capacity table;

  /// The name of the table that was affected by the operation.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The total number of write capacity units consumed by the operation.
  @_s.JsonKey(name: 'WriteCapacityUnits')
  final double writeCapacityUnits;

  ConsumedCapacity({
    this.capacityUnits,
    this.globalSecondaryIndexes,
    this.localSecondaryIndexes,
    this.readCapacityUnits,
    this.table,
    this.tableName,
    this.writeCapacityUnits,
  });
  factory ConsumedCapacity.fromJson(Map<String, dynamic> json) =>
      _$ConsumedCapacityFromJson(json);
}

/// Represents the continuous backups and point in time recovery settings on the
/// table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContinuousBackupsDescription {
  /// <code>ContinuousBackupsStatus</code> can be one of the following states:
  /// ENABLED, DISABLED
  @_s.JsonKey(name: 'ContinuousBackupsStatus')
  final ContinuousBackupsStatus continuousBackupsStatus;

  /// The description of the point in time recovery settings applied to the table.
  @_s.JsonKey(name: 'PointInTimeRecoveryDescription')
  final PointInTimeRecoveryDescription pointInTimeRecoveryDescription;

  ContinuousBackupsDescription({
    @_s.required this.continuousBackupsStatus,
    this.pointInTimeRecoveryDescription,
  });
  factory ContinuousBackupsDescription.fromJson(Map<String, dynamic> json) =>
      _$ContinuousBackupsDescriptionFromJson(json);
}

enum ContinuousBackupsStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

enum ContributorInsightsAction {
  @_s.JsonValue('ENABLE')
  enable,
  @_s.JsonValue('DISABLE')
  disable,
}

extension on ContributorInsightsAction {
  String toValue() {
    switch (this) {
      case ContributorInsightsAction.enable:
        return 'ENABLE';
      case ContributorInsightsAction.disable:
        return 'DISABLE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ContributorInsightsStatus {
  @_s.JsonValue('ENABLING')
  enabling,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLING')
  disabling,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('FAILED')
  failed,
}

/// Represents a Contributor Insights summary entry..
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContributorInsightsSummary {
  /// Describes the current status for contributor insights for the given table
  /// and index, if applicable.
  @_s.JsonKey(name: 'ContributorInsightsStatus')
  final ContributorInsightsStatus contributorInsightsStatus;

  /// Name of the index associated with the summary, if any.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// Name of the table associated with the summary.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  ContributorInsightsSummary({
    this.contributorInsightsStatus,
    this.indexName,
    this.tableName,
  });
  factory ContributorInsightsSummary.fromJson(Map<String, dynamic> json) =>
      _$ContributorInsightsSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBackupOutput {
  /// Contains the details of the backup created for the table.
  @_s.JsonKey(name: 'BackupDetails')
  final BackupDetails backupDetails;

  CreateBackupOutput({
    this.backupDetails,
  });
  factory CreateBackupOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateBackupOutputFromJson(json);
}

/// Represents a new global secondary index to be added to an existing table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateGlobalSecondaryIndexAction {
  /// The name of the global secondary index to be created.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The key schema for the global secondary index.
  @_s.JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into an
  /// index. These are in addition to the primary key attributes and index key
  /// attributes, which are automatically projected.
  @_s.JsonKey(name: 'Projection')
  final Projection projection;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  ///
  /// For current minimum and maximum provisioned throughput values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughput provisionedThroughput;

  CreateGlobalSecondaryIndexAction({
    @_s.required this.indexName,
    @_s.required this.keySchema,
    @_s.required this.projection,
    this.provisionedThroughput,
  });
  Map<String, dynamic> toJson() =>
      _$CreateGlobalSecondaryIndexActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGlobalTableOutput {
  /// Contains the details of the global table.
  @_s.JsonKey(name: 'GlobalTableDescription')
  final GlobalTableDescription globalTableDescription;

  CreateGlobalTableOutput({
    this.globalTableDescription,
  });
  factory CreateGlobalTableOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateGlobalTableOutputFromJson(json);
}

/// Represents a replica to be added.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateReplicaAction {
  /// The Region of the replica to be added.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;

  CreateReplicaAction({
    @_s.required this.regionName,
  });
  Map<String, dynamic> toJson() => _$CreateReplicaActionToJson(this);
}

/// Represents a replica to be created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateReplicationGroupMemberAction {
  /// The Region where the new replica will be created.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;

  /// Replica-specific global secondary index settings.
  @_s.JsonKey(name: 'GlobalSecondaryIndexes')
  final List<ReplicaGlobalSecondaryIndex> globalSecondaryIndexes;

  /// The AWS KMS customer master key (CMK) that should be used for AWS KMS
  /// encryption in the new replica. To specify a CMK, use its key ID, Amazon
  /// Resource Name (ARN), alias name, or alias ARN. Note that you should only
  /// provide this parameter if the key is different from the default DynamoDB KMS
  /// master key alias/aws/dynamodb.
  @_s.JsonKey(name: 'KMSMasterKeyId')
  final String kMSMasterKeyId;

  /// Replica-specific provisioned throughput. If not specified, uses the source
  /// table's provisioned throughput settings.
  @_s.JsonKey(name: 'ProvisionedThroughputOverride')
  final ProvisionedThroughputOverride provisionedThroughputOverride;

  CreateReplicationGroupMemberAction({
    @_s.required this.regionName,
    this.globalSecondaryIndexes,
    this.kMSMasterKeyId,
    this.provisionedThroughputOverride,
  });
  Map<String, dynamic> toJson() =>
      _$CreateReplicationGroupMemberActionToJson(this);
}

/// Represents the output of a <code>CreateTable</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTableOutput {
  /// Represents the properties of the table.
  @_s.JsonKey(name: 'TableDescription')
  final TableDescription tableDescription;

  CreateTableOutput({
    this.tableDescription,
  });
  factory CreateTableOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateTableOutputFromJson(json);
}

/// Represents a request to perform a <code>DeleteItem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Delete {
  /// The primary key of the item to be deleted. Each element consists of an
  /// attribute name and a value for that attribute.
  @_s.JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  /// Name of the table in which the item to be deleted resides.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// A condition that must be satisfied in order for a conditional delete to
  /// succeed.
  @_s.JsonKey(name: 'ConditionExpression')
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  @_s.JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  @_s.JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  /// Use <code>ReturnValuesOnConditionCheckFailure</code> to get the item
  /// attributes if the <code>Delete</code> condition fails. For
  /// <code>ReturnValuesOnConditionCheckFailure</code>, the valid values are: NONE
  /// and ALL_OLD.
  @_s.JsonKey(name: 'ReturnValuesOnConditionCheckFailure')
  final ReturnValuesOnConditionCheckFailure returnValuesOnConditionCheckFailure;

  Delete({
    @_s.required this.key,
    @_s.required this.tableName,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });
  Map<String, dynamic> toJson() => _$DeleteToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBackupOutput {
  /// Contains the description of the backup created for the table.
  @_s.JsonKey(name: 'BackupDescription')
  final BackupDescription backupDescription;

  DeleteBackupOutput({
    this.backupDescription,
  });
  factory DeleteBackupOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteBackupOutputFromJson(json);
}

/// Represents a global secondary index to be deleted from an existing table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteGlobalSecondaryIndexAction {
  /// The name of the global secondary index to be deleted.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  DeleteGlobalSecondaryIndexAction({
    @_s.required this.indexName,
  });
  Map<String, dynamic> toJson() =>
      _$DeleteGlobalSecondaryIndexActionToJson(this);
}

/// Represents the output of a <code>DeleteItem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteItemOutput {
  /// A map of attribute names to <code>AttributeValue</code> objects,
  /// representing the item as it appeared before the <code>DeleteItem</code>
  /// operation. This map appears in the response only if
  /// <code>ReturnValues</code> was specified as <code>ALL_OLD</code> in the
  /// request.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, AttributeValue> attributes;

  /// The capacity units consumed by the <code>DeleteItem</code> operation. The
  /// data returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// <code>ConsumedCapacity</code> is only returned if the
  /// <code>ReturnConsumedCapacity</code> parameter was specified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned
  /// Mode</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ConsumedCapacity')
  final ConsumedCapacity consumedCapacity;

  /// Information about item collections, if any, that were affected by the
  /// <code>DeleteItem</code> operation. <code>ItemCollectionMetrics</code> is
  /// only returned if the <code>ReturnItemCollectionMetrics</code> parameter was
  /// specified. If the table does not have any local secondary indexes, this
  /// information is not returned in the response.
  ///
  /// Each <code>ItemCollectionMetrics</code> element consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>ItemCollectionKey</code> - The partition key value of the item
  /// collection. This is the same as the partition key value of the item itself.
  /// </li>
  /// <li>
  /// <code>SizeEstimateRangeGB</code> - An estimate of item collection size, in
  /// gigabytes. This value is a two-element array containing a lower bound and an
  /// upper bound for the estimate. The estimate includes the size of all the
  /// items in the table, plus the size of all attributes projected into all of
  /// the local secondary indexes on that table. Use this estimate to measure
  /// whether a local secondary index is approaching its size limit.
  ///
  /// The estimate is subject to change over time; therefore, do not rely on the
  /// precision or accuracy of the estimate.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ItemCollectionMetrics')
  final ItemCollectionMetrics itemCollectionMetrics;

  DeleteItemOutput({
    this.attributes,
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });
  factory DeleteItemOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteItemOutputFromJson(json);
}

/// Represents a replica to be removed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteReplicaAction {
  /// The Region of the replica to be removed.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;

  DeleteReplicaAction({
    @_s.required this.regionName,
  });
  Map<String, dynamic> toJson() => _$DeleteReplicaActionToJson(this);
}

/// Represents a replica to be deleted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteReplicationGroupMemberAction {
  /// The Region where the replica exists.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;

  DeleteReplicationGroupMemberAction({
    @_s.required this.regionName,
  });
  Map<String, dynamic> toJson() =>
      _$DeleteReplicationGroupMemberActionToJson(this);
}

/// Represents a request to perform a <code>DeleteItem</code> operation on an
/// item.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeleteRequest {
  /// A map of attribute name to attribute values, representing the primary key of
  /// the item to delete. All of the table's primary key attributes must be
  /// specified, and their data types must match those of the table's key schema.
  @_s.JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  DeleteRequest({
    @_s.required this.key,
  });
  factory DeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteRequestToJson(this);
}

/// Represents the output of a <code>DeleteTable</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTableOutput {
  /// Represents the properties of a table.
  @_s.JsonKey(name: 'TableDescription')
  final TableDescription tableDescription;

  DeleteTableOutput({
    this.tableDescription,
  });
  factory DeleteTableOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteTableOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBackupOutput {
  /// Contains the description of the backup created for the table.
  @_s.JsonKey(name: 'BackupDescription')
  final BackupDescription backupDescription;

  DescribeBackupOutput({
    this.backupDescription,
  });
  factory DescribeBackupOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeBackupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeContinuousBackupsOutput {
  /// Represents the continuous backups and point in time recovery settings on the
  /// table.
  @_s.JsonKey(name: 'ContinuousBackupsDescription')
  final ContinuousBackupsDescription continuousBackupsDescription;

  DescribeContinuousBackupsOutput({
    this.continuousBackupsDescription,
  });
  factory DescribeContinuousBackupsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeContinuousBackupsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeContributorInsightsOutput {
  /// List of names of the associated Alpine rules.
  @_s.JsonKey(name: 'ContributorInsightsRuleList')
  final List<String> contributorInsightsRuleList;

  /// Current Status contributor insights.
  @_s.JsonKey(name: 'ContributorInsightsStatus')
  final ContributorInsightsStatus contributorInsightsStatus;

  /// Returns information about the last failure that encountered.
  ///
  /// The most common exceptions for a FAILED status are:
  ///
  /// <ul>
  /// <li>
  /// LimitExceededException - Per-account Amazon CloudWatch Contributor Insights
  /// rule limit reached. Please disable Contributor Insights for other
  /// tables/indexes OR disable Contributor Insights rules before retrying.
  /// </li>
  /// <li>
  /// AccessDeniedException - Amazon CloudWatch Contributor Insights rules cannot
  /// be modified due to insufficient permissions.
  /// </li>
  /// <li>
  /// AccessDeniedException - Failed to create service-linked role for Contributor
  /// Insights due to insufficient permissions.
  /// </li>
  /// <li>
  /// InternalServerError - Failed to create Amazon CloudWatch Contributor
  /// Insights rules. Please retry request.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'FailureException')
  final FailureException failureException;

  /// The name of the global secondary index being described.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// Timestamp of the last time the status was changed.
  @_s.JsonKey(
      name: 'LastUpdateDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdateDateTime;

  /// The name of the table being described.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  DescribeContributorInsightsOutput({
    this.contributorInsightsRuleList,
    this.contributorInsightsStatus,
    this.failureException,
    this.indexName,
    this.lastUpdateDateTime,
    this.tableName,
  });
  factory DescribeContributorInsightsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeContributorInsightsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEndpointsResponse {
  /// List of endpoints.
  @_s.JsonKey(name: 'Endpoints')
  final List<Endpoint> endpoints;

  DescribeEndpointsResponse({
    @_s.required this.endpoints,
  });
  factory DescribeEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEndpointsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGlobalTableOutput {
  /// Contains the details of the global table.
  @_s.JsonKey(name: 'GlobalTableDescription')
  final GlobalTableDescription globalTableDescription;

  DescribeGlobalTableOutput({
    this.globalTableDescription,
  });
  factory DescribeGlobalTableOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeGlobalTableOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeGlobalTableSettingsOutput {
  /// The name of the global table.
  @_s.JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  /// The Region-specific settings for the global table.
  @_s.JsonKey(name: 'ReplicaSettings')
  final List<ReplicaSettingsDescription> replicaSettings;

  DescribeGlobalTableSettingsOutput({
    this.globalTableName,
    this.replicaSettings,
  });
  factory DescribeGlobalTableSettingsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeGlobalTableSettingsOutputFromJson(json);
}

/// Represents the output of a <code>DescribeLimits</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLimitsOutput {
  /// The maximum total read capacity units that your account allows you to
  /// provision across all of your tables in this Region.
  @_s.JsonKey(name: 'AccountMaxReadCapacityUnits')
  final int accountMaxReadCapacityUnits;

  /// The maximum total write capacity units that your account allows you to
  /// provision across all of your tables in this Region.
  @_s.JsonKey(name: 'AccountMaxWriteCapacityUnits')
  final int accountMaxWriteCapacityUnits;

  /// The maximum read capacity units that your account allows you to provision
  /// for a new table that you are creating in this Region, including the read
  /// capacity units provisioned for its global secondary indexes (GSIs).
  @_s.JsonKey(name: 'TableMaxReadCapacityUnits')
  final int tableMaxReadCapacityUnits;

  /// The maximum write capacity units that your account allows you to provision
  /// for a new table that you are creating in this Region, including the write
  /// capacity units provisioned for its global secondary indexes (GSIs).
  @_s.JsonKey(name: 'TableMaxWriteCapacityUnits')
  final int tableMaxWriteCapacityUnits;

  DescribeLimitsOutput({
    this.accountMaxReadCapacityUnits,
    this.accountMaxWriteCapacityUnits,
    this.tableMaxReadCapacityUnits,
    this.tableMaxWriteCapacityUnits,
  });
  factory DescribeLimitsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeLimitsOutputFromJson(json);
}

/// Represents the output of a <code>DescribeTable</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTableOutput {
  /// The properties of the table.
  @_s.JsonKey(name: 'Table')
  final TableDescription table;

  DescribeTableOutput({
    this.table,
  });
  factory DescribeTableOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeTableOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTableReplicaAutoScalingOutput {
  /// Represents the auto scaling properties of the table.
  @_s.JsonKey(name: 'TableAutoScalingDescription')
  final TableAutoScalingDescription tableAutoScalingDescription;

  DescribeTableReplicaAutoScalingOutput({
    this.tableAutoScalingDescription,
  });
  factory DescribeTableReplicaAutoScalingOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeTableReplicaAutoScalingOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTimeToLiveOutput {
  /// <p/>
  @_s.JsonKey(name: 'TimeToLiveDescription')
  final TimeToLiveDescription timeToLiveDescription;

  DescribeTimeToLiveOutput({
    this.timeToLiveDescription,
  });
  factory DescribeTimeToLiveOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeTimeToLiveOutputFromJson(json);
}

/// An endpoint information details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Endpoint {
  /// IP address of the endpoint.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// Endpoint cache time to live (TTL) value.
  @_s.JsonKey(name: 'CachePeriodInMinutes')
  final int cachePeriodInMinutes;

  Endpoint({
    @_s.required this.address,
    @_s.required this.cachePeriodInMinutes,
  });
  factory Endpoint.fromJson(Map<String, dynamic> json) =>
      _$EndpointFromJson(json);
}

/// Represents a condition to be compared with an attribute value. This
/// condition can be used with <code>DeleteItem</code>, <code>PutItem</code>, or
/// <code>UpdateItem</code> operations; if the comparison evaluates to true, the
/// operation succeeds; if not, the operation fails. You can use
/// <code>ExpectedAttributeValue</code> in one of two different ways:
///
/// <ul>
/// <li>
/// Use <code>AttributeValueList</code> to specify one or more values to compare
/// against an attribute. Use <code>ComparisonOperator</code> to specify how you
/// want to perform the comparison. If the comparison evaluates to true, then
/// the conditional operation succeeds.
/// </li>
/// <li>
/// Use <code>Value</code> to specify a value that DynamoDB will compare against
/// an attribute. If the values match, then <code>ExpectedAttributeValue</code>
/// evaluates to true and the conditional operation succeeds. Optionally, you
/// can also set <code>Exists</code> to false, indicating that you <i>do not</i>
/// expect to find the attribute value in the table. In this case, the
/// conditional operation succeeds only if the comparison evaluates to false.
/// </li>
/// </ul>
/// <code>Value</code> and <code>Exists</code> are incompatible with
/// <code>AttributeValueList</code> and <code>ComparisonOperator</code>. Note
/// that if you use both sets of parameters at once, DynamoDB will return a
/// <code>ValidationException</code> exception.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExpectedAttributeValue {
  /// One or more values to evaluate against the supplied attribute. The number of
  /// values in the list depends on the <code>ComparisonOperator</code> being
  /// used.
  ///
  /// For type Number, value comparisons are numeric.
  ///
  /// String value comparisons for greater than, equals, or less than are based on
  /// ASCII character code values. For example, <code>a</code> is greater than
  /// <code>A</code>, and <code>a</code> is greater than <code>B</code>. For a
  /// list of code values, see <a
  /// href="http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.
  ///
  /// For Binary, DynamoDB treats each byte of the binary data as unsigned when it
  /// compares binary values.
  ///
  /// For information on specifying data types in JSON, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataFormat.html">JSON
  /// Data Format</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'AttributeValueList')
  final List<AttributeValue> attributeValueList;

  /// A comparator for evaluating attributes in the
  /// <code>AttributeValueList</code>. For example, equals, greater than, less
  /// than, etc.
  ///
  /// The following comparison operators are available:
  ///
  /// <code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS |
  /// NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code>
  ///
  /// The following are descriptions of each comparison operator.
  ///
  /// <ul>
  /// <li>
  /// <code>EQ</code> : Equal. <code>EQ</code> is supported for all data types,
  /// including lists and maps.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, Binary, String
  /// Set, Number Set, or Binary Set. If an item contains an
  /// <code>AttributeValue</code> element of a different type than the one
  /// provided in the request, the value does not match. For example,
  /// <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>. Also,
  /// <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>NE</code> : Not equal. <code>NE</code> is supported for all data
  /// types, including lists and maps.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> of type String, Number, Binary, String Set,
  /// Number Set, or Binary Set. If an item contains an
  /// <code>AttributeValue</code> of a different type than the one provided in the
  /// request, the value does not match. For example, <code>{"S":"6"}</code> does
  /// not equal <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not
  /// equal <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>LE</code> : Less than or equal.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>LT</code> : Less than.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> of type String, Number, or Binary (not a set
  /// type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>GE</code> : Greater than or equal.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>GT</code> : Greater than.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If an item contains an <code>AttributeValue</code> element of a
  /// different type than the one provided in the request, the value does not
  /// match. For example, <code>{"S":"6"}</code> does not equal
  /// <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare to
  /// <code>{"NS":["6", "2", "1"]}</code>.
  /// <p/> </li>
  /// <li>
  /// <code>NOT_NULL</code> : The attribute exists. <code>NOT_NULL</code> is
  /// supported for all data types, including lists and maps.
  /// <note>
  /// This operator tests for the existence of an attribute, not its data type. If
  /// the data type of attribute "<code>a</code>" is null, and you evaluate it
  /// using <code>NOT_NULL</code>, the result is a Boolean <code>true</code>. This
  /// result is because the attribute "<code>a</code>" exists; its data type is
  /// not relevant to the <code>NOT_NULL</code> comparison operator.
  /// </note> </li>
  /// <li>
  /// <code>NULL</code> : The attribute does not exist. <code>NULL</code> is
  /// supported for all data types, including lists and maps.
  /// <note>
  /// This operator tests for the nonexistence of an attribute, not its data type.
  /// If the data type of attribute "<code>a</code>" is null, and you evaluate it
  /// using <code>NULL</code>, the result is a Boolean <code>false</code>. This is
  /// because the attribute "<code>a</code>" exists; its data type is not relevant
  /// to the <code>NULL</code> comparison operator.
  /// </note> </li>
  /// <li>
  /// <code>CONTAINS</code> : Checks for a subsequence, or value in a set.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If the target attribute of the comparison is of type String, then
  /// the operator checks for a substring match. If the target attribute of the
  /// comparison is of type Binary, then the operator looks for a subsequence of
  /// the target that matches the input. If the target attribute of the comparison
  /// is a set ("<code>SS</code>", "<code>NS</code>", or "<code>BS</code>"), then
  /// the operator evaluates to true if it finds an exact match with any member of
  /// the set.
  ///
  /// CONTAINS is supported for lists: When evaluating "<code>a CONTAINS
  /// b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot
  /// be a set, a map, or a list.
  /// </li>
  /// <li>
  /// <code>NOT_CONTAINS</code> : Checks for absence of a subsequence, or absence
  /// of a value in a set.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> element of type String, Number, or Binary (not a
  /// set type). If the target attribute of the comparison is a String, then the
  /// operator checks for the absence of a substring match. If the target
  /// attribute of the comparison is Binary, then the operator checks for the
  /// absence of a subsequence of the target that matches the input. If the target
  /// attribute of the comparison is a set ("<code>SS</code>", "<code>NS</code>",
  /// or "<code>BS</code>"), then the operator evaluates to true if it <i>does
  /// not</i> find an exact match with any member of the set.
  ///
  /// NOT_CONTAINS is supported for lists: When evaluating "<code>a NOT CONTAINS
  /// b</code>", "<code>a</code>" can be a list; however, "<code>b</code>" cannot
  /// be a set, a map, or a list.
  /// </li>
  /// <li>
  /// <code>BEGINS_WITH</code> : Checks for a prefix.
  ///
  /// <code>AttributeValueList</code> can contain only one
  /// <code>AttributeValue</code> of type String or Binary (not a Number or a set
  /// type). The target attribute of the comparison must be of type String or
  /// Binary (not a Number or a set type).
  /// <p/> </li>
  /// <li>
  /// <code>IN</code> : Checks for matching elements in a list.
  ///
  /// <code>AttributeValueList</code> can contain one or more
  /// <code>AttributeValue</code> elements of type String, Number, or Binary.
  /// These attributes are compared against an existing attribute of an item. If
  /// any elements of the input are equal to the item attribute, the expression
  /// evaluates to true.
  /// </li>
  /// <li>
  /// <code>BETWEEN</code> : Greater than or equal to the first value, and less
  /// than or equal to the second value.
  ///
  /// <code>AttributeValueList</code> must contain two <code>AttributeValue</code>
  /// elements of the same type, either String, Number, or Binary (not a set
  /// type). A target attribute matches if the target value is greater than, or
  /// equal to, the first element and less than, or equal to, the second element.
  /// If an item contains an <code>AttributeValue</code> element of a different
  /// type than the one provided in the request, the value does not match. For
  /// example, <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>.
  /// Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6", "2",
  /// "1"]}</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ComparisonOperator')
  final ComparisonOperator comparisonOperator;

  /// Causes DynamoDB to evaluate the value before attempting a conditional
  /// operation:
  ///
  /// <ul>
  /// <li>
  /// If <code>Exists</code> is <code>true</code>, DynamoDB will check to see if
  /// that attribute value already exists in the table. If it is found, then the
  /// operation succeeds. If it is not found, the operation fails with a
  /// <code>ConditionCheckFailedException</code>.
  /// </li>
  /// <li>
  /// If <code>Exists</code> is <code>false</code>, DynamoDB assumes that the
  /// attribute value does not exist in the table. If in fact the value does not
  /// exist, then the assumption is valid and the operation succeeds. If the value
  /// is found, despite the assumption that it does not exist, the operation fails
  /// with a <code>ConditionCheckFailedException</code>.
  /// </li>
  /// </ul>
  /// The default setting for <code>Exists</code> is <code>true</code>. If you
  /// supply a <code>Value</code> all by itself, DynamoDB assumes the attribute
  /// exists: You don't have to set <code>Exists</code> to <code>true</code>,
  /// because it is implied.
  ///
  /// DynamoDB returns a <code>ValidationException</code> if:
  ///
  /// <ul>
  /// <li>
  /// <code>Exists</code> is <code>true</code> but there is no <code>Value</code>
  /// to check. (You expect a value to exist, but don't specify what that value
  /// is.)
  /// </li>
  /// <li>
  /// <code>Exists</code> is <code>false</code> but you also provide a
  /// <code>Value</code>. (You cannot expect an attribute to have a value, while
  /// also expecting it not to exist.)
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Exists')
  final bool exists;

  /// Represents the data for the expected attribute.
  ///
  /// Each attribute value is described as a name-value pair. The name is the data
  /// type, and the value is the data itself.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes">Data
  /// Types</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'Value')
  final AttributeValue value;

  ExpectedAttributeValue({
    this.attributeValueList,
    this.comparisonOperator,
    this.exists,
    this.value,
  });
  Map<String, dynamic> toJson() => _$ExpectedAttributeValueToJson(this);
}

/// Represents a failure a contributor insights operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailureException {
  /// Description of the failure.
  @_s.JsonKey(name: 'ExceptionDescription')
  final String exceptionDescription;

  /// Exception name.
  @_s.JsonKey(name: 'ExceptionName')
  final String exceptionName;

  FailureException({
    this.exceptionDescription,
    this.exceptionName,
  });
  factory FailureException.fromJson(Map<String, dynamic> json) =>
      _$FailureExceptionFromJson(json);
}

/// Specifies an item and related attribute values to retrieve in a
/// <code>TransactGetItem</code> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Get {
  /// A map of attribute names to <code>AttributeValue</code> objects that
  /// specifies the primary key of the item to retrieve.
  @_s.JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  /// The name of the table from which to retrieve the specified item.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// One or more substitution tokens for attribute names in the
  /// ProjectionExpression parameter.
  @_s.JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// A string that identifies one or more attributes of the specified item to
  /// retrieve from the table. The attributes in the expression must be separated
  /// by commas. If no attribute names are specified, then all attributes of the
  /// specified item are returned. If any of the requested attributes are not
  /// found, they do not appear in the result.
  @_s.JsonKey(name: 'ProjectionExpression')
  final String projectionExpression;

  Get({
    @_s.required this.key,
    @_s.required this.tableName,
    this.expressionAttributeNames,
    this.projectionExpression,
  });
  Map<String, dynamic> toJson() => _$GetToJson(this);
}

/// Represents the output of a <code>GetItem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetItemOutput {
  /// The capacity units consumed by the <code>GetItem</code> operation. The data
  /// returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// <code>ConsumedCapacity</code> is only returned if the
  /// <code>ReturnConsumedCapacity</code> parameter was specified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Read/Write
  /// Capacity Mode</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ConsumedCapacity')
  final ConsumedCapacity consumedCapacity;

  /// A map of attribute names to <code>AttributeValue</code> objects, as
  /// specified by <code>ProjectionExpression</code>.
  @_s.JsonKey(name: 'Item')
  final Map<String, AttributeValue> item;

  GetItemOutput({
    this.consumedCapacity,
    this.item,
  });
  factory GetItemOutput.fromJson(Map<String, dynamic> json) =>
      _$GetItemOutputFromJson(json);
}

/// Represents the properties of a global secondary index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GlobalSecondaryIndex {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The complete key schema for a global secondary index, which consists of one
  /// or more pairs of attribute names and key types:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  @_s.JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  @_s.JsonKey(name: 'Projection')
  final Projection projection;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  ///
  /// For current minimum and maximum provisioned throughput values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughput provisionedThroughput;

  GlobalSecondaryIndex({
    @_s.required this.indexName,
    @_s.required this.keySchema,
    @_s.required this.projection,
    this.provisionedThroughput,
  });
  Map<String, dynamic> toJson() => _$GlobalSecondaryIndexToJson(this);
}

/// Represents the auto scaling settings of a global secondary index for a
/// global table that will be modified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GlobalSecondaryIndexAutoScalingUpdate {
  /// The name of the global secondary index.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;
  @_s.JsonKey(name: 'ProvisionedWriteCapacityAutoScalingUpdate')
  final AutoScalingSettingsUpdate provisionedWriteCapacityAutoScalingUpdate;

  GlobalSecondaryIndexAutoScalingUpdate({
    this.indexName,
    this.provisionedWriteCapacityAutoScalingUpdate,
  });
  Map<String, dynamic> toJson() =>
      _$GlobalSecondaryIndexAutoScalingUpdateToJson(this);
}

/// Represents the properties of a global secondary index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GlobalSecondaryIndexDescription {
  /// Indicates whether the index is currently backfilling. <i>Backfilling</i> is
  /// the process of reading items from the table and determining whether they can
  /// be added to the index. (Not all items will qualify: For example, a partition
  /// key cannot have any duplicate values.) If an item can be added to the index,
  /// DynamoDB will do so. After all items have been processed, the backfilling
  /// operation is complete and <code>Backfilling</code> is false.
  ///
  /// You can delete an index that is being created during the
  /// <code>Backfilling</code> phase when <code>IndexStatus</code> is set to
  /// CREATING and <code>Backfilling</code> is true. You can't delete the index
  /// that is being created when <code>IndexStatus</code> is set to CREATING and
  /// <code>Backfilling</code> is false.
  /// <note>
  /// For indexes that were created during a <code>CreateTable</code> operation,
  /// the <code>Backfilling</code> attribute does not appear in the
  /// <code>DescribeTable</code> output.
  /// </note>
  @_s.JsonKey(name: 'Backfilling')
  final bool backfilling;

  /// The Amazon Resource Name (ARN) that uniquely identifies the index.
  @_s.JsonKey(name: 'IndexArn')
  final String indexArn;

  /// The name of the global secondary index.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The total size of the specified index, in bytes. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in this
  /// value.
  @_s.JsonKey(name: 'IndexSizeBytes')
  final int indexSizeBytes;

  /// The current state of the global secondary index:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The index is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The index is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The index is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The index is ready for use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'IndexStatus')
  final IndexStatus indexStatus;

  /// The number of items in the specified index. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in this
  /// value.
  @_s.JsonKey(name: 'ItemCount')
  final int itemCount;

  /// The complete key schema for a global secondary index, which consists of one
  /// or more pairs of attribute names and key types:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  @_s.JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  @_s.JsonKey(name: 'Projection')
  final Projection projection;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  ///
  /// For current minimum and maximum provisioned throughput values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughputDescription provisionedThroughput;

  GlobalSecondaryIndexDescription({
    this.backfilling,
    this.indexArn,
    this.indexName,
    this.indexSizeBytes,
    this.indexStatus,
    this.itemCount,
    this.keySchema,
    this.projection,
    this.provisionedThroughput,
  });
  factory GlobalSecondaryIndexDescription.fromJson(Map<String, dynamic> json) =>
      _$GlobalSecondaryIndexDescriptionFromJson(json);
}

/// Represents the properties of a global secondary index for the table when the
/// backup was created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GlobalSecondaryIndexInfo {
  /// The name of the global secondary index.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The complete key schema for a global secondary index, which consists of one
  /// or more pairs of attribute names and key types:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  @_s.JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  @_s.JsonKey(name: 'Projection')
  final Projection projection;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  @_s.JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughput provisionedThroughput;

  GlobalSecondaryIndexInfo({
    this.indexName,
    this.keySchema,
    this.projection,
    this.provisionedThroughput,
  });
  factory GlobalSecondaryIndexInfo.fromJson(Map<String, dynamic> json) =>
      _$GlobalSecondaryIndexInfoFromJson(json);
}

/// Represents one of the following:
///
/// <ul>
/// <li>
/// A new global secondary index to be added to an existing table.
/// </li>
/// <li>
/// New provisioned throughput parameters for an existing global secondary
/// index.
/// </li>
/// <li>
/// An existing global secondary index to be removed from an existing table.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GlobalSecondaryIndexUpdate {
  /// The parameters required for creating a global secondary index on an existing
  /// table:
  ///
  /// <ul>
  /// <li>
  /// <code>IndexName </code>
  /// </li>
  /// <li>
  /// <code>KeySchema </code>
  /// </li>
  /// <li>
  /// <code>AttributeDefinitions </code>
  /// </li>
  /// <li>
  /// <code>Projection </code>
  /// </li>
  /// <li>
  /// <code>ProvisionedThroughput </code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Create')
  final CreateGlobalSecondaryIndexAction create;

  /// The name of an existing global secondary index to be removed.
  @_s.JsonKey(name: 'Delete')
  final DeleteGlobalSecondaryIndexAction delete;

  /// The name of an existing global secondary index, along with new provisioned
  /// throughput settings to be applied to that index.
  @_s.JsonKey(name: 'Update')
  final UpdateGlobalSecondaryIndexAction update;

  GlobalSecondaryIndexUpdate({
    this.create,
    this.delete,
    this.update,
  });
  Map<String, dynamic> toJson() => _$GlobalSecondaryIndexUpdateToJson(this);
}

/// Represents the properties of a global table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GlobalTable {
  /// The global table name.
  @_s.JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  /// The Regions where the global table has replicas.
  @_s.JsonKey(name: 'ReplicationGroup')
  final List<Replica> replicationGroup;

  GlobalTable({
    this.globalTableName,
    this.replicationGroup,
  });
  factory GlobalTable.fromJson(Map<String, dynamic> json) =>
      _$GlobalTableFromJson(json);
}

/// Contains details about the global table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GlobalTableDescription {
  /// The creation time of the global table.
  @_s.JsonKey(
      name: 'CreationDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDateTime;

  /// The unique identifier of the global table.
  @_s.JsonKey(name: 'GlobalTableArn')
  final String globalTableArn;

  /// The global table name.
  @_s.JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  /// The current state of the global table:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The global table is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The global table is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The global table is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The global table is ready for use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'GlobalTableStatus')
  final GlobalTableStatus globalTableStatus;

  /// The Regions where the global table has replicas.
  @_s.JsonKey(name: 'ReplicationGroup')
  final List<ReplicaDescription> replicationGroup;

  GlobalTableDescription({
    this.creationDateTime,
    this.globalTableArn,
    this.globalTableName,
    this.globalTableStatus,
    this.replicationGroup,
  });
  factory GlobalTableDescription.fromJson(Map<String, dynamic> json) =>
      _$GlobalTableDescriptionFromJson(json);
}

/// Represents the settings of a global secondary index for a global table that
/// will be modified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GlobalTableGlobalSecondaryIndexSettingsUpdate {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// Auto scaling settings for managing a global secondary index's write capacity
  /// units.
  @_s.JsonKey(name: 'ProvisionedWriteCapacityAutoScalingSettingsUpdate')
  final AutoScalingSettingsUpdate
      provisionedWriteCapacityAutoScalingSettingsUpdate;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException.</code>
  @_s.JsonKey(name: 'ProvisionedWriteCapacityUnits')
  final int provisionedWriteCapacityUnits;

  GlobalTableGlobalSecondaryIndexSettingsUpdate({
    @_s.required this.indexName,
    this.provisionedWriteCapacityAutoScalingSettingsUpdate,
    this.provisionedWriteCapacityUnits,
  });
  Map<String, dynamic> toJson() =>
      _$GlobalTableGlobalSecondaryIndexSettingsUpdateToJson(this);
}

enum GlobalTableStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('UPDATING')
  updating,
}

enum IndexStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('ACTIVE')
  active,
}

/// Information about item collections, if any, that were affected by the
/// operation. <code>ItemCollectionMetrics</code> is only returned if the
/// request asked for it. If the table does not have any local secondary
/// indexes, this information is not returned in the response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ItemCollectionMetrics {
  /// The partition key value of the item collection. This value is the same as
  /// the partition key value of the item.
  @_s.JsonKey(name: 'ItemCollectionKey')
  final Map<String, AttributeValue> itemCollectionKey;

  /// An estimate of item collection size, in gigabytes. This value is a
  /// two-element array containing a lower bound and an upper bound for the
  /// estimate. The estimate includes the size of all the items in the table, plus
  /// the size of all attributes projected into all of the local secondary indexes
  /// on that table. Use this estimate to measure whether a local secondary index
  /// is approaching its size limit.
  ///
  /// The estimate is subject to change over time; therefore, do not rely on the
  /// precision or accuracy of the estimate.
  @_s.JsonKey(name: 'SizeEstimateRangeGB')
  final List<double> sizeEstimateRangeGB;

  ItemCollectionMetrics({
    this.itemCollectionKey,
    this.sizeEstimateRangeGB,
  });
  factory ItemCollectionMetrics.fromJson(Map<String, dynamic> json) =>
      _$ItemCollectionMetricsFromJson(json);
}

/// Details for the requested item.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ItemResponse {
  /// Map of attribute data consisting of the data type and attribute value.
  @_s.JsonKey(name: 'Item')
  final Map<String, AttributeValue> item;

  ItemResponse({
    this.item,
  });
  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);
}

/// Represents <i>a single element</i> of a key schema. A key schema specifies
/// the attributes that make up the primary key of a table, or the key
/// attributes of an index.
///
/// A <code>KeySchemaElement</code> represents exactly one attribute of the
/// primary key. For example, a simple primary key would be represented by one
/// <code>KeySchemaElement</code> (for the partition key). A composite primary
/// key would require one <code>KeySchemaElement</code> for the partition key,
/// and another <code>KeySchemaElement</code> for the sort key.
///
/// A <code>KeySchemaElement</code> must be a scalar, top-level attribute (not a
/// nested attribute). The data type must be one of String, Number, or Binary.
/// The attribute cannot be nested within a List or a Map.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KeySchemaElement {
  /// The name of a key attribute.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The role that this key attribute will assume:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  @_s.JsonKey(name: 'KeyType')
  final KeyType keyType;

  KeySchemaElement({
    @_s.required this.attributeName,
    @_s.required this.keyType,
  });
  factory KeySchemaElement.fromJson(Map<String, dynamic> json) =>
      _$KeySchemaElementFromJson(json);

  Map<String, dynamic> toJson() => _$KeySchemaElementToJson(this);
}

enum KeyType {
  @_s.JsonValue('HASH')
  hash,
  @_s.JsonValue('RANGE')
  range,
}

/// Represents a set of primary keys and, for each key, the attributes to
/// retrieve from the table.
///
/// For each primary key, you must provide <i>all</i> of the key attributes. For
/// example, with a simple primary key, you only need to provide the partition
/// key. For a composite primary key, you must provide <i>both</i> the partition
/// key and the sort key.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KeysAndAttributes {
  /// The primary key attribute values that define the items and the attributes
  /// associated with the items.
  @_s.JsonKey(name: 'Keys')
  final List<Map<String, AttributeValue>> keys;

  /// This is a legacy parameter. Use <code>ProjectionExpression</code> instead.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.html">Legacy
  /// Conditional Parameters</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'AttributesToGet')
  final List<String> attributesToGet;

  /// The consistency of a read operation. If set to <code>true</code>, then a
  /// strongly consistent read is used; otherwise, an eventually consistent read
  /// is used.
  @_s.JsonKey(name: 'ConsistentRead')
  final bool consistentRead;

  /// One or more substitution tokens for attribute names in an expression. The
  /// following are some use cases for using
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// To access an attribute whose name conflicts with a DynamoDB reserved word.
  /// </li>
  /// <li>
  /// To create a placeholder for repeating occurrences of an attribute name in an
  /// expression.
  /// </li>
  /// <li>
  /// To prevent special characters in an attribute name from being misinterpreted
  /// in an expression.
  /// </li>
  /// </ul>
  /// Use the <b>#</b> character in an expression to dereference an attribute
  /// name. For example, consider the following attribute name:
  ///
  /// <ul>
  /// <li>
  /// <code>Percentile</code>
  /// </li>
  /// </ul>
  /// The name of this attribute conflicts with a reserved word, so it cannot be
  /// used directly in an expression. (For the complete list of reserved words,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html">Reserved
  /// Words</a> in the <i>Amazon DynamoDB Developer Guide</i>). To work around
  /// this, you could specify the following for
  /// <code>ExpressionAttributeNames</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>{"#P":"Percentile"}</code>
  /// </li>
  /// </ul>
  /// You could then use this substitution in an expression, as in this example:
  ///
  /// <ul>
  /// <li>
  /// <code>#P = :val</code>
  /// </li>
  /// </ul> <note>
  /// Tokens that begin with the <b>:</b> character are <i>expression attribute
  /// values</i>, which are placeholders for the actual value at runtime.
  /// </note>
  /// For more information on expression attribute names, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// A string that identifies one or more attributes to retrieve from the table.
  /// These attributes can include scalars, sets, or elements of a JSON document.
  /// The attributes in the <code>ProjectionExpression</code> must be separated by
  /// commas.
  ///
  /// If no attribute names are specified, then all attributes will be returned.
  /// If any of the requested attributes are not found, they will not appear in
  /// the result.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html">Accessing
  /// Item Attributes</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ProjectionExpression')
  final String projectionExpression;

  KeysAndAttributes({
    @_s.required this.keys,
    this.attributesToGet,
    this.consistentRead,
    this.expressionAttributeNames,
    this.projectionExpression,
  });
  factory KeysAndAttributes.fromJson(Map<String, dynamic> json) =>
      _$KeysAndAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$KeysAndAttributesToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBackupsOutput {
  /// List of <code>BackupSummary</code> objects.
  @_s.JsonKey(name: 'BackupSummaries')
  final List<BackupSummary> backupSummaries;

  /// The ARN of the backup last evaluated when the current page of results was
  /// returned, inclusive of the current page of results. This value may be
  /// specified as the <code>ExclusiveStartBackupArn</code> of a new
  /// <code>ListBackups</code> operation in order to fetch the next page of
  /// results.
  ///
  /// If <code>LastEvaluatedBackupArn</code> is empty, then the last page of
  /// results has been processed and there are no more results to be retrieved.
  ///
  /// If <code>LastEvaluatedBackupArn</code> is not empty, this may or may not
  /// indicate that there is more data to be returned. All results are guaranteed
  /// to have been returned if and only if no value for
  /// <code>LastEvaluatedBackupArn</code> is returned.
  @_s.JsonKey(name: 'LastEvaluatedBackupArn')
  final String lastEvaluatedBackupArn;

  ListBackupsOutput({
    this.backupSummaries,
    this.lastEvaluatedBackupArn,
  });
  factory ListBackupsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListBackupsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListContributorInsightsOutput {
  /// A list of ContributorInsightsSummary.
  @_s.JsonKey(name: 'ContributorInsightsSummaries')
  final List<ContributorInsightsSummary> contributorInsightsSummaries;

  /// A token to go to the next page if there is one.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListContributorInsightsOutput({
    this.contributorInsightsSummaries,
    this.nextToken,
  });
  factory ListContributorInsightsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListContributorInsightsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListGlobalTablesOutput {
  /// List of global table names.
  @_s.JsonKey(name: 'GlobalTables')
  final List<GlobalTable> globalTables;

  /// Last evaluated global table name.
  @_s.JsonKey(name: 'LastEvaluatedGlobalTableName')
  final String lastEvaluatedGlobalTableName;

  ListGlobalTablesOutput({
    this.globalTables,
    this.lastEvaluatedGlobalTableName,
  });
  factory ListGlobalTablesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListGlobalTablesOutputFromJson(json);
}

/// Represents the output of a <code>ListTables</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTablesOutput {
  /// The name of the last table in the current page of results. Use this value as
  /// the <code>ExclusiveStartTableName</code> in a new request to obtain the next
  /// page of results, until all the table names are returned.
  ///
  /// If you do not receive a <code>LastEvaluatedTableName</code> value in the
  /// response, this means that there are no more table names to be retrieved.
  @_s.JsonKey(name: 'LastEvaluatedTableName')
  final String lastEvaluatedTableName;

  /// The names of the tables associated with the current account at the current
  /// endpoint. The maximum size of this array is 100.
  ///
  /// If <code>LastEvaluatedTableName</code> also appears in the output, you can
  /// use this value as the <code>ExclusiveStartTableName</code> parameter in a
  /// subsequent <code>ListTables</code> request and obtain the next page of
  /// results.
  @_s.JsonKey(name: 'TableNames')
  final List<String> tableNames;

  ListTablesOutput({
    this.lastEvaluatedTableName,
    this.tableNames,
  });
  factory ListTablesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTablesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsOfResourceOutput {
  /// If this value is returned, there are additional results to be displayed. To
  /// retrieve them, call ListTagsOfResource again, with NextToken set to this
  /// value.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The tags currently associated with the Amazon DynamoDB resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsOfResourceOutput({
    this.nextToken,
    this.tags,
  });
  factory ListTagsOfResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsOfResourceOutputFromJson(json);
}

/// Represents the properties of a local secondary index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LocalSecondaryIndex {
  /// The name of the local secondary index. The name must be unique among all
  /// other indexes on this table.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The complete key schema for the local secondary index, consisting of one or
  /// more pairs of attribute names and key types:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  @_s.JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// local secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  @_s.JsonKey(name: 'Projection')
  final Projection projection;

  LocalSecondaryIndex({
    @_s.required this.indexName,
    @_s.required this.keySchema,
    @_s.required this.projection,
  });
  Map<String, dynamic> toJson() => _$LocalSecondaryIndexToJson(this);
}

/// Represents the properties of a local secondary index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LocalSecondaryIndexDescription {
  /// The Amazon Resource Name (ARN) that uniquely identifies the index.
  @_s.JsonKey(name: 'IndexArn')
  final String indexArn;

  /// Represents the name of the local secondary index.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The total size of the specified index, in bytes. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in this
  /// value.
  @_s.JsonKey(name: 'IndexSizeBytes')
  final int indexSizeBytes;

  /// The number of items in the specified index. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in this
  /// value.
  @_s.JsonKey(name: 'ItemCount')
  final int itemCount;

  /// The complete key schema for the local secondary index, consisting of one or
  /// more pairs of attribute names and key types:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  @_s.JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  @_s.JsonKey(name: 'Projection')
  final Projection projection;

  LocalSecondaryIndexDescription({
    this.indexArn,
    this.indexName,
    this.indexSizeBytes,
    this.itemCount,
    this.keySchema,
    this.projection,
  });
  factory LocalSecondaryIndexDescription.fromJson(Map<String, dynamic> json) =>
      _$LocalSecondaryIndexDescriptionFromJson(json);
}

/// Represents the properties of a local secondary index for the table when the
/// backup was created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LocalSecondaryIndexInfo {
  /// Represents the name of the local secondary index.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The complete key schema for a local secondary index, which consists of one
  /// or more pairs of attribute names and key types:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  @_s.JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Represents attributes that are copied (projected) from the table into the
  /// global secondary index. These are in addition to the primary key attributes
  /// and index key attributes, which are automatically projected.
  @_s.JsonKey(name: 'Projection')
  final Projection projection;

  LocalSecondaryIndexInfo({
    this.indexName,
    this.keySchema,
    this.projection,
  });
  factory LocalSecondaryIndexInfo.fromJson(Map<String, dynamic> json) =>
      _$LocalSecondaryIndexInfoFromJson(json);
}

/// The description of the point in time settings applied to the table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PointInTimeRecoveryDescription {
  /// Specifies the earliest point in time you can restore your table to. You can
  /// restore your table to any point in time during the last 35 days.
  @_s.JsonKey(
      name: 'EarliestRestorableDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime earliestRestorableDateTime;

  /// <code>LatestRestorableDateTime</code> is typically 5 minutes before the
  /// current time.
  @_s.JsonKey(
      name: 'LatestRestorableDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime latestRestorableDateTime;

  /// The current state of point in time recovery:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLING</code> - Point in time recovery is being enabled.
  /// </li>
  /// <li>
  /// <code>ENABLED</code> - Point in time recovery is enabled.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - Point in time recovery is disabled.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'PointInTimeRecoveryStatus')
  final PointInTimeRecoveryStatus pointInTimeRecoveryStatus;

  PointInTimeRecoveryDescription({
    this.earliestRestorableDateTime,
    this.latestRestorableDateTime,
    this.pointInTimeRecoveryStatus,
  });
  factory PointInTimeRecoveryDescription.fromJson(Map<String, dynamic> json) =>
      _$PointInTimeRecoveryDescriptionFromJson(json);
}

/// Represents the settings used to enable point in time recovery.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PointInTimeRecoverySpecification {
  /// Indicates whether point in time recovery is enabled (true) or disabled
  /// (false) on the table.
  @_s.JsonKey(name: 'PointInTimeRecoveryEnabled')
  final bool pointInTimeRecoveryEnabled;

  PointInTimeRecoverySpecification({
    @_s.required this.pointInTimeRecoveryEnabled,
  });
  Map<String, dynamic> toJson() =>
      _$PointInTimeRecoverySpecificationToJson(this);
}

enum PointInTimeRecoveryStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Represents attributes that are copied (projected) from the table into an
/// index. These are in addition to the primary key attributes and index key
/// attributes, which are automatically projected.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Projection {
  /// Represents the non-key attribute names which will be projected into the
  /// index.
  ///
  /// For local secondary indexes, the total count of
  /// <code>NonKeyAttributes</code> summed across all of the local secondary
  /// indexes, must not exceed 20. If you project the same attribute into two
  /// different indexes, this counts as two distinct attributes when determining
  /// the total.
  @_s.JsonKey(name: 'NonKeyAttributes')
  final List<String> nonKeyAttributes;

  /// The set of attributes that are projected into the index:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the index and primary keys are projected into
  /// the index.
  /// </li>
  /// <li>
  /// <code>INCLUDE</code> - Only the specified table attributes are projected
  /// into the index. The list of projected attributes is in
  /// <code>NonKeyAttributes</code>.
  /// </li>
  /// <li>
  /// <code>ALL</code> - All of the table attributes are projected into the index.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ProjectionType')
  final ProjectionType projectionType;

  Projection({
    this.nonKeyAttributes,
    this.projectionType,
  });
  factory Projection.fromJson(Map<String, dynamic> json) =>
      _$ProjectionFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectionToJson(this);
}

enum ProjectionType {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('KEYS_ONLY')
  keysOnly,
  @_s.JsonValue('INCLUDE')
  include,
}

/// Represents the provisioned throughput settings for a specified table or
/// index. The settings can be modified using the <code>UpdateTable</code>
/// operation.
///
/// For current minimum and maximum provisioned throughput values, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a>
/// in the <i>Amazon DynamoDB Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProvisionedThroughput {
  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying
  /// Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  ///
  /// If read/write capacity mode is <code>PAY_PER_REQUEST</code> the value is set
  /// to 0.
  @_s.JsonKey(name: 'ReadCapacityUnits')
  final int readCapacityUnits;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying
  /// Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  ///
  /// If read/write capacity mode is <code>PAY_PER_REQUEST</code> the value is set
  /// to 0.
  @_s.JsonKey(name: 'WriteCapacityUnits')
  final int writeCapacityUnits;

  ProvisionedThroughput({
    @_s.required this.readCapacityUnits,
    @_s.required this.writeCapacityUnits,
  });
  factory ProvisionedThroughput.fromJson(Map<String, dynamic> json) =>
      _$ProvisionedThroughputFromJson(json);

  Map<String, dynamic> toJson() => _$ProvisionedThroughputToJson(this);
}

/// Represents the provisioned throughput settings for the table, consisting of
/// read and write capacity units, along with data about increases and
/// decreases.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisionedThroughputDescription {
  /// The date and time of the last provisioned throughput decrease for this
  /// table.
  @_s.JsonKey(
      name: 'LastDecreaseDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastDecreaseDateTime;

  /// The date and time of the last provisioned throughput increase for this
  /// table.
  @_s.JsonKey(
      name: 'LastIncreaseDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastIncreaseDateTime;

  /// The number of provisioned throughput decreases for this table during this
  /// UTC calendar day. For current maximums on provisioned throughput decreases,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'NumberOfDecreasesToday')
  final int numberOfDecreasesToday;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>. Eventually consistent
  /// reads require less effort than strongly consistent reads, so a setting of 50
  /// <code>ReadCapacityUnits</code> per second provides 100 eventually consistent
  /// <code>ReadCapacityUnits</code> per second.
  @_s.JsonKey(name: 'ReadCapacityUnits')
  final int readCapacityUnits;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException</code>.
  @_s.JsonKey(name: 'WriteCapacityUnits')
  final int writeCapacityUnits;

  ProvisionedThroughputDescription({
    this.lastDecreaseDateTime,
    this.lastIncreaseDateTime,
    this.numberOfDecreasesToday,
    this.readCapacityUnits,
    this.writeCapacityUnits,
  });
  factory ProvisionedThroughputDescription.fromJson(
          Map<String, dynamic> json) =>
      _$ProvisionedThroughputDescriptionFromJson(json);
}

/// Replica-specific provisioned throughput settings. If not specified, uses the
/// source table's provisioned throughput settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProvisionedThroughputOverride {
  /// Replica-specific read capacity units. If not specified, uses the source
  /// table's read capacity settings.
  @_s.JsonKey(name: 'ReadCapacityUnits')
  final int readCapacityUnits;

  ProvisionedThroughputOverride({
    this.readCapacityUnits,
  });
  factory ProvisionedThroughputOverride.fromJson(Map<String, dynamic> json) =>
      _$ProvisionedThroughputOverrideFromJson(json);

  Map<String, dynamic> toJson() => _$ProvisionedThroughputOverrideToJson(this);
}

/// Represents a request to perform a <code>PutItem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Put {
  /// A map of attribute name to attribute values, representing the primary key of
  /// the item to be written by <code>PutItem</code>. All of the table's primary
  /// key attributes must be specified, and their data types must match those of
  /// the table's key schema. If any attributes are present in the item that are
  /// part of an index key schema for the table, their types must match the index
  /// key schema.
  @_s.JsonKey(name: 'Item')
  final Map<String, AttributeValue> item;

  /// Name of the table in which to write the item.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  @_s.JsonKey(name: 'ConditionExpression')
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  @_s.JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  @_s.JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  /// Use <code>ReturnValuesOnConditionCheckFailure</code> to get the item
  /// attributes if the <code>Put</code> condition fails. For
  /// <code>ReturnValuesOnConditionCheckFailure</code>, the valid values are: NONE
  /// and ALL_OLD.
  @_s.JsonKey(name: 'ReturnValuesOnConditionCheckFailure')
  final ReturnValuesOnConditionCheckFailure returnValuesOnConditionCheckFailure;

  Put({
    @_s.required this.item,
    @_s.required this.tableName,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });
  Map<String, dynamic> toJson() => _$PutToJson(this);
}

/// Represents the output of a <code>PutItem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutItemOutput {
  /// The attribute values as they appeared before the <code>PutItem</code>
  /// operation, but only if <code>ReturnValues</code> is specified as
  /// <code>ALL_OLD</code> in the request. Each element consists of an attribute
  /// name and an attribute value.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, AttributeValue> attributes;

  /// The capacity units consumed by the <code>PutItem</code> operation. The data
  /// returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// <code>ConsumedCapacity</code> is only returned if the
  /// <code>ReturnConsumedCapacity</code> parameter was specified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Read/Write
  /// Capacity Mode</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ConsumedCapacity')
  final ConsumedCapacity consumedCapacity;

  /// Information about item collections, if any, that were affected by the
  /// <code>PutItem</code> operation. <code>ItemCollectionMetrics</code> is only
  /// returned if the <code>ReturnItemCollectionMetrics</code> parameter was
  /// specified. If the table does not have any local secondary indexes, this
  /// information is not returned in the response.
  ///
  /// Each <code>ItemCollectionMetrics</code> element consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>ItemCollectionKey</code> - The partition key value of the item
  /// collection. This is the same as the partition key value of the item itself.
  /// </li>
  /// <li>
  /// <code>SizeEstimateRangeGB</code> - An estimate of item collection size, in
  /// gigabytes. This value is a two-element array containing a lower bound and an
  /// upper bound for the estimate. The estimate includes the size of all the
  /// items in the table, plus the size of all attributes projected into all of
  /// the local secondary indexes on that table. Use this estimate to measure
  /// whether a local secondary index is approaching its size limit.
  ///
  /// The estimate is subject to change over time; therefore, do not rely on the
  /// precision or accuracy of the estimate.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ItemCollectionMetrics')
  final ItemCollectionMetrics itemCollectionMetrics;

  PutItemOutput({
    this.attributes,
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });
  factory PutItemOutput.fromJson(Map<String, dynamic> json) =>
      _$PutItemOutputFromJson(json);
}

/// Represents a request to perform a <code>PutItem</code> operation on an item.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PutRequest {
  /// A map of attribute name to attribute values, representing the primary key of
  /// an item to be processed by <code>PutItem</code>. All of the table's primary
  /// key attributes must be specified, and their data types must match those of
  /// the table's key schema. If any attributes are present in the item that are
  /// part of an index key schema for the table, their types must match the index
  /// key schema.
  @_s.JsonKey(name: 'Item')
  final Map<String, AttributeValue> item;

  PutRequest({
    @_s.required this.item,
  });
  factory PutRequest.fromJson(Map<String, dynamic> json) =>
      _$PutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PutRequestToJson(this);
}

/// Represents the output of a <code>Query</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryOutput {
  /// The capacity units consumed by the <code>Query</code> operation. The data
  /// returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// <code>ConsumedCapacity</code> is only returned if the
  /// <code>ReturnConsumedCapacity</code> parameter was specified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned
  /// Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ConsumedCapacity')
  final ConsumedCapacity consumedCapacity;

  /// The number of items in the response.
  ///
  /// If you used a <code>QueryFilter</code> in the request, then
  /// <code>Count</code> is the number of items returned after the filter was
  /// applied, and <code>ScannedCount</code> is the number of matching items
  /// before the filter was applied.
  ///
  /// If you did not use a filter in the request, then <code>Count</code> and
  /// <code>ScannedCount</code> are the same.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// An array of item attributes that match the query criteria. Each element in
  /// this array consists of an attribute name and the value for that attribute.
  @_s.JsonKey(name: 'Items')
  final List<Map<String, AttributeValue>> items;

  /// The primary key of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding this
  /// value in the new request.
  ///
  /// If <code>LastEvaluatedKey</code> is empty, then the "last page" of results
  /// has been processed and there is no more data to be retrieved.
  ///
  /// If <code>LastEvaluatedKey</code> is not empty, it does not necessarily mean
  /// that there is more data in the result set. The only way to know when you
  /// have reached the end of the result set is when <code>LastEvaluatedKey</code>
  /// is empty.
  @_s.JsonKey(name: 'LastEvaluatedKey')
  final Map<String, AttributeValue> lastEvaluatedKey;

  /// The number of items evaluated, before any <code>QueryFilter</code> is
  /// applied. A high <code>ScannedCount</code> value with few, or no,
  /// <code>Count</code> results indicates an inefficient <code>Query</code>
  /// operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count">Count
  /// and ScannedCount</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// If you did not use a filter in the request, then <code>ScannedCount</code>
  /// is the same as <code>Count</code>.
  @_s.JsonKey(name: 'ScannedCount')
  final int scannedCount;

  QueryOutput({
    this.consumedCapacity,
    this.count,
    this.items,
    this.lastEvaluatedKey,
    this.scannedCount,
  });
  factory QueryOutput.fromJson(Map<String, dynamic> json) =>
      _$QueryOutputFromJson(json);
}

/// Represents the properties of a replica.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Replica {
  /// The Region where the replica needs to be created.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;

  Replica({
    this.regionName,
  });
  factory Replica.fromJson(Map<String, dynamic> json) =>
      _$ReplicaFromJson(json);

  Map<String, dynamic> toJson() => _$ReplicaToJson(this);
}

/// Represents the auto scaling settings of the replica.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicaAutoScalingDescription {
  /// Replica-specific global secondary index auto scaling settings.
  @_s.JsonKey(name: 'GlobalSecondaryIndexes')
  final List<ReplicaGlobalSecondaryIndexAutoScalingDescription>
      globalSecondaryIndexes;

  /// The Region where the replica exists.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;
  @_s.JsonKey(name: 'ReplicaProvisionedReadCapacityAutoScalingSettings')
  final AutoScalingSettingsDescription
      replicaProvisionedReadCapacityAutoScalingSettings;
  @_s.JsonKey(name: 'ReplicaProvisionedWriteCapacityAutoScalingSettings')
  final AutoScalingSettingsDescription
      replicaProvisionedWriteCapacityAutoScalingSettings;

  /// The current state of the replica:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The replica is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The replica is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The replica is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The replica is ready for use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ReplicaStatus')
  final ReplicaStatus replicaStatus;

  ReplicaAutoScalingDescription({
    this.globalSecondaryIndexes,
    this.regionName,
    this.replicaProvisionedReadCapacityAutoScalingSettings,
    this.replicaProvisionedWriteCapacityAutoScalingSettings,
    this.replicaStatus,
  });
  factory ReplicaAutoScalingDescription.fromJson(Map<String, dynamic> json) =>
      _$ReplicaAutoScalingDescriptionFromJson(json);
}

/// Represents the auto scaling settings of a replica that will be modified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReplicaAutoScalingUpdate {
  /// The Region where the replica exists.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;

  /// Represents the auto scaling settings of global secondary indexes that will
  /// be modified.
  @_s.JsonKey(name: 'ReplicaGlobalSecondaryIndexUpdates')
  final List<ReplicaGlobalSecondaryIndexAutoScalingUpdate>
      replicaGlobalSecondaryIndexUpdates;
  @_s.JsonKey(name: 'ReplicaProvisionedReadCapacityAutoScalingUpdate')
  final AutoScalingSettingsUpdate
      replicaProvisionedReadCapacityAutoScalingUpdate;

  ReplicaAutoScalingUpdate({
    @_s.required this.regionName,
    this.replicaGlobalSecondaryIndexUpdates,
    this.replicaProvisionedReadCapacityAutoScalingUpdate,
  });
  Map<String, dynamic> toJson() => _$ReplicaAutoScalingUpdateToJson(this);
}

/// Contains the details of the replica.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicaDescription {
  /// Replica-specific global secondary index settings.
  @_s.JsonKey(name: 'GlobalSecondaryIndexes')
  final List<ReplicaGlobalSecondaryIndexDescription> globalSecondaryIndexes;

  /// The AWS KMS customer master key (CMK) of the replica that will be used for
  /// AWS KMS encryption.
  @_s.JsonKey(name: 'KMSMasterKeyId')
  final String kMSMasterKeyId;

  /// Replica-specific provisioned throughput. If not described, uses the source
  /// table's provisioned throughput settings.
  @_s.JsonKey(name: 'ProvisionedThroughputOverride')
  final ProvisionedThroughputOverride provisionedThroughputOverride;

  /// The name of the Region.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;

  /// The current state of the replica:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The replica is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The replica is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The replica is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The replica is ready for use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ReplicaStatus')
  final ReplicaStatus replicaStatus;

  /// Detailed information about the replica status.
  @_s.JsonKey(name: 'ReplicaStatusDescription')
  final String replicaStatusDescription;

  /// Specifies the progress of a Create, Update, or Delete action on the replica
  /// as a percentage.
  @_s.JsonKey(name: 'ReplicaStatusPercentProgress')
  final String replicaStatusPercentProgress;

  ReplicaDescription({
    this.globalSecondaryIndexes,
    this.kMSMasterKeyId,
    this.provisionedThroughputOverride,
    this.regionName,
    this.replicaStatus,
    this.replicaStatusDescription,
    this.replicaStatusPercentProgress,
  });
  factory ReplicaDescription.fromJson(Map<String, dynamic> json) =>
      _$ReplicaDescriptionFromJson(json);
}

/// Represents the properties of a replica global secondary index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReplicaGlobalSecondaryIndex {
  /// The name of the global secondary index.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// Replica table GSI-specific provisioned throughput. If not specified, uses
  /// the source table GSI's read capacity settings.
  @_s.JsonKey(name: 'ProvisionedThroughputOverride')
  final ProvisionedThroughputOverride provisionedThroughputOverride;

  ReplicaGlobalSecondaryIndex({
    @_s.required this.indexName,
    this.provisionedThroughputOverride,
  });
  Map<String, dynamic> toJson() => _$ReplicaGlobalSecondaryIndexToJson(this);
}

/// Represents the auto scaling configuration for a replica global secondary
/// index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicaGlobalSecondaryIndexAutoScalingDescription {
  /// The name of the global secondary index.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The current state of the replica global secondary index:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The index is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The index is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The index is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The index is ready for use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'IndexStatus')
  final IndexStatus indexStatus;
  @_s.JsonKey(name: 'ProvisionedReadCapacityAutoScalingSettings')
  final AutoScalingSettingsDescription
      provisionedReadCapacityAutoScalingSettings;
  @_s.JsonKey(name: 'ProvisionedWriteCapacityAutoScalingSettings')
  final AutoScalingSettingsDescription
      provisionedWriteCapacityAutoScalingSettings;

  ReplicaGlobalSecondaryIndexAutoScalingDescription({
    this.indexName,
    this.indexStatus,
    this.provisionedReadCapacityAutoScalingSettings,
    this.provisionedWriteCapacityAutoScalingSettings,
  });
  factory ReplicaGlobalSecondaryIndexAutoScalingDescription.fromJson(
          Map<String, dynamic> json) =>
      _$ReplicaGlobalSecondaryIndexAutoScalingDescriptionFromJson(json);
}

/// Represents the auto scaling settings of a global secondary index for a
/// replica that will be modified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReplicaGlobalSecondaryIndexAutoScalingUpdate {
  /// The name of the global secondary index.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;
  @_s.JsonKey(name: 'ProvisionedReadCapacityAutoScalingUpdate')
  final AutoScalingSettingsUpdate provisionedReadCapacityAutoScalingUpdate;

  ReplicaGlobalSecondaryIndexAutoScalingUpdate({
    this.indexName,
    this.provisionedReadCapacityAutoScalingUpdate,
  });
  Map<String, dynamic> toJson() =>
      _$ReplicaGlobalSecondaryIndexAutoScalingUpdateToJson(this);
}

/// Represents the properties of a replica global secondary index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicaGlobalSecondaryIndexDescription {
  /// The name of the global secondary index.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// If not described, uses the source table GSI's read capacity settings.
  @_s.JsonKey(name: 'ProvisionedThroughputOverride')
  final ProvisionedThroughputOverride provisionedThroughputOverride;

  ReplicaGlobalSecondaryIndexDescription({
    this.indexName,
    this.provisionedThroughputOverride,
  });
  factory ReplicaGlobalSecondaryIndexDescription.fromJson(
          Map<String, dynamic> json) =>
      _$ReplicaGlobalSecondaryIndexDescriptionFromJson(json);
}

/// Represents the properties of a global secondary index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicaGlobalSecondaryIndexSettingsDescription {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The current status of the global secondary index:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The global secondary index is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The global secondary index is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The global secondary index is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The global secondary index is ready for use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'IndexStatus')
  final IndexStatus indexStatus;

  /// Auto scaling settings for a global secondary index replica's read capacity
  /// units.
  @_s.JsonKey(name: 'ProvisionedReadCapacityAutoScalingSettings')
  final AutoScalingSettingsDescription
      provisionedReadCapacityAutoScalingSettings;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>.
  @_s.JsonKey(name: 'ProvisionedReadCapacityUnits')
  final int provisionedReadCapacityUnits;

  /// Auto scaling settings for a global secondary index replica's write capacity
  /// units.
  @_s.JsonKey(name: 'ProvisionedWriteCapacityAutoScalingSettings')
  final AutoScalingSettingsDescription
      provisionedWriteCapacityAutoScalingSettings;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException</code>.
  @_s.JsonKey(name: 'ProvisionedWriteCapacityUnits')
  final int provisionedWriteCapacityUnits;

  ReplicaGlobalSecondaryIndexSettingsDescription({
    @_s.required this.indexName,
    this.indexStatus,
    this.provisionedReadCapacityAutoScalingSettings,
    this.provisionedReadCapacityUnits,
    this.provisionedWriteCapacityAutoScalingSettings,
    this.provisionedWriteCapacityUnits,
  });
  factory ReplicaGlobalSecondaryIndexSettingsDescription.fromJson(
          Map<String, dynamic> json) =>
      _$ReplicaGlobalSecondaryIndexSettingsDescriptionFromJson(json);
}

/// Represents the settings of a global secondary index for a global table that
/// will be modified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReplicaGlobalSecondaryIndexSettingsUpdate {
  /// The name of the global secondary index. The name must be unique among all
  /// other indexes on this table.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// Auto scaling settings for managing a global secondary index replica's read
  /// capacity units.
  @_s.JsonKey(name: 'ProvisionedReadCapacityAutoScalingSettingsUpdate')
  final AutoScalingSettingsUpdate
      provisionedReadCapacityAutoScalingSettingsUpdate;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>.
  @_s.JsonKey(name: 'ProvisionedReadCapacityUnits')
  final int provisionedReadCapacityUnits;

  ReplicaGlobalSecondaryIndexSettingsUpdate({
    @_s.required this.indexName,
    this.provisionedReadCapacityAutoScalingSettingsUpdate,
    this.provisionedReadCapacityUnits,
  });
  Map<String, dynamic> toJson() =>
      _$ReplicaGlobalSecondaryIndexSettingsUpdateToJson(this);
}

/// Represents the properties of a replica.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicaSettingsDescription {
  /// The Region name of the replica.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;

  /// The read/write capacity mode of the replica.
  @_s.JsonKey(name: 'ReplicaBillingModeSummary')
  final BillingModeSummary replicaBillingModeSummary;

  /// Replica global secondary index settings for the global table.
  @_s.JsonKey(name: 'ReplicaGlobalSecondaryIndexSettings')
  final List<ReplicaGlobalSecondaryIndexSettingsDescription>
      replicaGlobalSecondaryIndexSettings;

  /// Auto scaling settings for a global table replica's read capacity units.
  @_s.JsonKey(name: 'ReplicaProvisionedReadCapacityAutoScalingSettings')
  final AutoScalingSettingsDescription
      replicaProvisionedReadCapacityAutoScalingSettings;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying
  /// Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'ReplicaProvisionedReadCapacityUnits')
  final int replicaProvisionedReadCapacityUnits;

  /// Auto scaling settings for a global table replica's write capacity units.
  @_s.JsonKey(name: 'ReplicaProvisionedWriteCapacityAutoScalingSettings')
  final AutoScalingSettingsDescription
      replicaProvisionedWriteCapacityAutoScalingSettings;

  /// The maximum number of writes consumed per second before DynamoDB returns a
  /// <code>ThrottlingException</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying
  /// Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'ReplicaProvisionedWriteCapacityUnits')
  final int replicaProvisionedWriteCapacityUnits;

  /// The current state of the Region:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The Region is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The Region is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The Region is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The Region is ready for use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ReplicaStatus')
  final ReplicaStatus replicaStatus;

  ReplicaSettingsDescription({
    @_s.required this.regionName,
    this.replicaBillingModeSummary,
    this.replicaGlobalSecondaryIndexSettings,
    this.replicaProvisionedReadCapacityAutoScalingSettings,
    this.replicaProvisionedReadCapacityUnits,
    this.replicaProvisionedWriteCapacityAutoScalingSettings,
    this.replicaProvisionedWriteCapacityUnits,
    this.replicaStatus,
  });
  factory ReplicaSettingsDescription.fromJson(Map<String, dynamic> json) =>
      _$ReplicaSettingsDescriptionFromJson(json);
}

/// Represents the settings for a global table in a Region that will be
/// modified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReplicaSettingsUpdate {
  /// The Region of the replica to be added.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;

  /// Represents the settings of a global secondary index for a global table that
  /// will be modified.
  @_s.JsonKey(name: 'ReplicaGlobalSecondaryIndexSettingsUpdate')
  final List<ReplicaGlobalSecondaryIndexSettingsUpdate>
      replicaGlobalSecondaryIndexSettingsUpdate;

  /// Auto scaling settings for managing a global table replica's read capacity
  /// units.
  @_s.JsonKey(name: 'ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate')
  final AutoScalingSettingsUpdate
      replicaProvisionedReadCapacityAutoScalingSettingsUpdate;

  /// The maximum number of strongly consistent reads consumed per second before
  /// DynamoDB returns a <code>ThrottlingException</code>. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html#ProvisionedThroughput">Specifying
  /// Read and Write Requirements</a> in the <i>Amazon DynamoDB Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'ReplicaProvisionedReadCapacityUnits')
  final int replicaProvisionedReadCapacityUnits;

  ReplicaSettingsUpdate({
    @_s.required this.regionName,
    this.replicaGlobalSecondaryIndexSettingsUpdate,
    this.replicaProvisionedReadCapacityAutoScalingSettingsUpdate,
    this.replicaProvisionedReadCapacityUnits,
  });
  Map<String, dynamic> toJson() => _$ReplicaSettingsUpdateToJson(this);
}

enum ReplicaStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('CREATION_FAILED')
  creationFailed,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('ACTIVE')
  active,
}

/// Represents one of the following:
///
/// <ul>
/// <li>
/// A new replica to be added to an existing global table.
/// </li>
/// <li>
/// New parameters for an existing replica.
/// </li>
/// <li>
/// An existing replica to be removed from an existing global table.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReplicaUpdate {
  /// The parameters required for creating a replica on an existing global table.
  @_s.JsonKey(name: 'Create')
  final CreateReplicaAction create;

  /// The name of the existing replica to be removed.
  @_s.JsonKey(name: 'Delete')
  final DeleteReplicaAction delete;

  ReplicaUpdate({
    this.create,
    this.delete,
  });
  Map<String, dynamic> toJson() => _$ReplicaUpdateToJson(this);
}

/// Represents one of the following:
///
/// <ul>
/// <li>
/// A new replica to be added to an existing regional table or global table.
/// This request invokes the <code>CreateTableReplica</code> action in the
/// destination Region.
/// </li>
/// <li>
/// New parameters for an existing replica. This request invokes the
/// <code>UpdateTable</code> action in the destination Region.
/// </li>
/// <li>
/// An existing replica to be deleted. The request invokes the
/// <code>DeleteTableReplica</code> action in the destination Region, deleting
/// the replica and all if its items in the destination Region.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ReplicationGroupUpdate {
  /// The parameters required for creating a replica for the table.
  @_s.JsonKey(name: 'Create')
  final CreateReplicationGroupMemberAction create;

  /// The parameters required for deleting a replica for the table.
  @_s.JsonKey(name: 'Delete')
  final DeleteReplicationGroupMemberAction delete;

  /// The parameters required for updating a replica for the table.
  @_s.JsonKey(name: 'Update')
  final UpdateReplicationGroupMemberAction update;

  ReplicationGroupUpdate({
    this.create,
    this.delete,
    this.update,
  });
  Map<String, dynamic> toJson() => _$ReplicationGroupUpdateToJson(this);
}

/// Contains details for the restore.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestoreSummary {
  /// Point in time or source backup time.
  @_s.JsonKey(
      name: 'RestoreDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime restoreDateTime;

  /// Indicates if a restore is in progress or not.
  @_s.JsonKey(name: 'RestoreInProgress')
  final bool restoreInProgress;

  /// The Amazon Resource Name (ARN) of the backup from which the table was
  /// restored.
  @_s.JsonKey(name: 'SourceBackupArn')
  final String sourceBackupArn;

  /// The ARN of the source table of the backup that is being restored.
  @_s.JsonKey(name: 'SourceTableArn')
  final String sourceTableArn;

  RestoreSummary({
    @_s.required this.restoreDateTime,
    @_s.required this.restoreInProgress,
    this.sourceBackupArn,
    this.sourceTableArn,
  });
  factory RestoreSummary.fromJson(Map<String, dynamic> json) =>
      _$RestoreSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestoreTableFromBackupOutput {
  /// The description of the table created from an existing backup.
  @_s.JsonKey(name: 'TableDescription')
  final TableDescription tableDescription;

  RestoreTableFromBackupOutput({
    this.tableDescription,
  });
  factory RestoreTableFromBackupOutput.fromJson(Map<String, dynamic> json) =>
      _$RestoreTableFromBackupOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestoreTableToPointInTimeOutput {
  /// Represents the properties of a table.
  @_s.JsonKey(name: 'TableDescription')
  final TableDescription tableDescription;

  RestoreTableToPointInTimeOutput({
    this.tableDescription,
  });
  factory RestoreTableToPointInTimeOutput.fromJson(Map<String, dynamic> json) =>
      _$RestoreTableToPointInTimeOutputFromJson(json);
}

/// Determines the level of detail about provisioned throughput consumption that
/// is returned in the response:
///
/// <ul>
/// <li>
/// <code>INDEXES</code> - The response includes the aggregate
/// <code>ConsumedCapacity</code> for the operation, together with
/// <code>ConsumedCapacity</code> for each table and secondary index that was
/// accessed.
///
/// Note that some operations, such as <code>GetItem</code> and
/// <code>BatchGetItem</code>, do not access any indexes at all. In these cases,
/// specifying <code>INDEXES</code> will only return
/// <code>ConsumedCapacity</code> information for table(s).
/// </li>
/// <li>
/// <code>TOTAL</code> - The response includes only the aggregate
/// <code>ConsumedCapacity</code> for the operation.
/// </li>
/// <li>
/// <code>NONE</code> - No <code>ConsumedCapacity</code> details are included in
/// the response.
/// </li>
/// </ul>
enum ReturnConsumedCapacity {
  @_s.JsonValue('INDEXES')
  indexes,
  @_s.JsonValue('TOTAL')
  total,
  @_s.JsonValue('NONE')
  none,
}

extension on ReturnConsumedCapacity {
  String toValue() {
    switch (this) {
      case ReturnConsumedCapacity.indexes:
        return 'INDEXES';
      case ReturnConsumedCapacity.total:
        return 'TOTAL';
      case ReturnConsumedCapacity.none:
        return 'NONE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ReturnItemCollectionMetrics {
  @_s.JsonValue('SIZE')
  size,
  @_s.JsonValue('NONE')
  none,
}

extension on ReturnItemCollectionMetrics {
  String toValue() {
    switch (this) {
      case ReturnItemCollectionMetrics.size:
        return 'SIZE';
      case ReturnItemCollectionMetrics.none:
        return 'NONE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ReturnValue {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('ALL_OLD')
  allOld,
  @_s.JsonValue('UPDATED_OLD')
  updatedOld,
  @_s.JsonValue('ALL_NEW')
  allNew,
  @_s.JsonValue('UPDATED_NEW')
  updatedNew,
}

extension on ReturnValue {
  String toValue() {
    switch (this) {
      case ReturnValue.none:
        return 'NONE';
      case ReturnValue.allOld:
        return 'ALL_OLD';
      case ReturnValue.updatedOld:
        return 'UPDATED_OLD';
      case ReturnValue.allNew:
        return 'ALL_NEW';
      case ReturnValue.updatedNew:
        return 'UPDATED_NEW';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ReturnValuesOnConditionCheckFailure {
  @_s.JsonValue('ALL_OLD')
  allOld,
  @_s.JsonValue('NONE')
  none,
}

/// The description of the server-side encryption status on the specified table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SSEDescription {
  /// Indicates the time, in UNIX epoch date format, when DynamoDB detected that
  /// the table's AWS KMS key was inaccessible. This attribute will automatically
  /// be cleared when DynamoDB detects that the table's AWS KMS key is accessible
  /// again. DynamoDB will initiate the table archival process when table's AWS
  /// KMS key remains inaccessible for more than seven days from this date.
  @_s.JsonKey(
      name: 'InaccessibleEncryptionDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime inaccessibleEncryptionDateTime;

  /// The AWS KMS customer master key (CMK) ARN used for the AWS KMS encryption.
  @_s.JsonKey(name: 'KMSMasterKeyArn')
  final String kMSMasterKeyArn;

  /// Server-side encryption type. The only supported value is:
  ///
  /// <ul>
  /// <li>
  /// <code>KMS</code> - Server-side encryption that uses AWS Key Management
  /// Service. The key is stored in your account and is managed by AWS KMS (AWS
  /// KMS charges apply).
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'SSEType')
  final SSEType sSEType;

  /// Represents the current state of server-side encryption. The only supported
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> - Server-side encryption is enabled.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - Server-side encryption is being updated.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final SSEStatus status;

  SSEDescription({
    this.inaccessibleEncryptionDateTime,
    this.kMSMasterKeyArn,
    this.sSEType,
    this.status,
  });
  factory SSEDescription.fromJson(Map<String, dynamic> json) =>
      _$SSEDescriptionFromJson(json);
}

/// Represents the settings used to enable server-side encryption.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SSESpecification {
  /// Indicates whether server-side encryption is done using an AWS managed CMK or
  /// an AWS owned CMK. If enabled (true), server-side encryption type is set to
  /// <code>KMS</code> and an AWS managed CMK is used (AWS KMS charges apply). If
  /// disabled (false) or not specified, server-side encryption is set to AWS
  /// owned CMK.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The AWS KMS customer master key (CMK) that should be used for the AWS KMS
  /// encryption. To specify a CMK, use its key ID, Amazon Resource Name (ARN),
  /// alias name, or alias ARN. Note that you should only provide this parameter
  /// if the key is different from the default DynamoDB customer master key
  /// alias/aws/dynamodb.
  @_s.JsonKey(name: 'KMSMasterKeyId')
  final String kMSMasterKeyId;

  /// Server-side encryption type. The only supported value is:
  ///
  /// <ul>
  /// <li>
  /// <code>KMS</code> - Server-side encryption that uses AWS Key Management
  /// Service. The key is stored in your account and is managed by AWS KMS (AWS
  /// KMS charges apply).
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'SSEType')
  final SSEType sSEType;

  SSESpecification({
    this.enabled,
    this.kMSMasterKeyId,
    this.sSEType,
  });
  Map<String, dynamic> toJson() => _$SSESpecificationToJson(this);
}

enum SSEStatus {
  @_s.JsonValue('ENABLING')
  enabling,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLING')
  disabling,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('UPDATING')
  updating,
}

enum SSEType {
  @_s.JsonValue('AES256')
  aes256,
  @_s.JsonValue('KMS')
  kms,
}

enum ScalarAttributeType {
  @_s.JsonValue('S')
  s,
  @_s.JsonValue('N')
  n,
  @_s.JsonValue('B')
  b,
}

/// Represents the output of a <code>Scan</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScanOutput {
  /// The capacity units consumed by the <code>Scan</code> operation. The data
  /// returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// <code>ConsumedCapacity</code> is only returned if the
  /// <code>ReturnConsumedCapacity</code> parameter was specified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned
  /// Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ConsumedCapacity')
  final ConsumedCapacity consumedCapacity;

  /// The number of items in the response.
  ///
  /// If you set <code>ScanFilter</code> in the request, then <code>Count</code>
  /// is the number of items returned after the filter was applied, and
  /// <code>ScannedCount</code> is the number of matching items before the filter
  /// was applied.
  ///
  /// If you did not use a filter in the request, then <code>Count</code> is the
  /// same as <code>ScannedCount</code>.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// An array of item attributes that match the scan criteria. Each element in
  /// this array consists of an attribute name and the value for that attribute.
  @_s.JsonKey(name: 'Items')
  final List<Map<String, AttributeValue>> items;

  /// The primary key of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding this
  /// value in the new request.
  ///
  /// If <code>LastEvaluatedKey</code> is empty, then the "last page" of results
  /// has been processed and there is no more data to be retrieved.
  ///
  /// If <code>LastEvaluatedKey</code> is not empty, it does not necessarily mean
  /// that there is more data in the result set. The only way to know when you
  /// have reached the end of the result set is when <code>LastEvaluatedKey</code>
  /// is empty.
  @_s.JsonKey(name: 'LastEvaluatedKey')
  final Map<String, AttributeValue> lastEvaluatedKey;

  /// The number of items evaluated, before any <code>ScanFilter</code> is
  /// applied. A high <code>ScannedCount</code> value with few, or no,
  /// <code>Count</code> results indicates an inefficient <code>Scan</code>
  /// operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html#Count">Count
  /// and ScannedCount</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  ///
  /// If you did not use a filter in the request, then <code>ScannedCount</code>
  /// is the same as <code>Count</code>.
  @_s.JsonKey(name: 'ScannedCount')
  final int scannedCount;

  ScanOutput({
    this.consumedCapacity,
    this.count,
    this.items,
    this.lastEvaluatedKey,
    this.scannedCount,
  });
  factory ScanOutput.fromJson(Map<String, dynamic> json) =>
      _$ScanOutputFromJson(json);
}

enum Select {
  @_s.JsonValue('ALL_ATTRIBUTES')
  allAttributes,
  @_s.JsonValue('ALL_PROJECTED_ATTRIBUTES')
  allProjectedAttributes,
  @_s.JsonValue('SPECIFIC_ATTRIBUTES')
  specificAttributes,
  @_s.JsonValue('COUNT')
  count,
}

extension on Select {
  String toValue() {
    switch (this) {
      case Select.allAttributes:
        return 'ALL_ATTRIBUTES';
      case Select.allProjectedAttributes:
        return 'ALL_PROJECTED_ATTRIBUTES';
      case Select.specificAttributes:
        return 'SPECIFIC_ATTRIBUTES';
      case Select.count:
        return 'COUNT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the details of the table when the backup was created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SourceTableDetails {
  /// Schema of the table.
  @_s.JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// Read IOPs and Write IOPS on the table when the backup was created.
  @_s.JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughput provisionedThroughput;

  /// Time when the source table was created.
  @_s.JsonKey(
      name: 'TableCreationDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime tableCreationDateTime;

  /// Unique identifier for the table for which the backup was created.
  @_s.JsonKey(name: 'TableId')
  final String tableId;

  /// The name of the table for which the backup was created.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// Controls how you are charged for read and write throughput and how you
  /// manage capacity. This setting can be changed later.
  ///
  /// <ul>
  /// <li>
  /// <code>PROVISIONED</code> - Sets the read/write capacity mode to
  /// <code>PROVISIONED</code>. We recommend using <code>PROVISIONED</code> for
  /// predictable workloads.
  /// </li>
  /// <li>
  /// <code>PAY_PER_REQUEST</code> - Sets the read/write capacity mode to
  /// <code>PAY_PER_REQUEST</code>. We recommend using
  /// <code>PAY_PER_REQUEST</code> for unpredictable workloads.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'BillingMode')
  final BillingMode billingMode;

  /// Number of items in the table. Note that this is an approximate value.
  @_s.JsonKey(name: 'ItemCount')
  final int itemCount;

  /// ARN of the table for which backup was created.
  @_s.JsonKey(name: 'TableArn')
  final String tableArn;

  /// Size of the table in bytes. Note that this is an approximate value.
  @_s.JsonKey(name: 'TableSizeBytes')
  final int tableSizeBytes;

  SourceTableDetails({
    @_s.required this.keySchema,
    @_s.required this.provisionedThroughput,
    @_s.required this.tableCreationDateTime,
    @_s.required this.tableId,
    @_s.required this.tableName,
    this.billingMode,
    this.itemCount,
    this.tableArn,
    this.tableSizeBytes,
  });
  factory SourceTableDetails.fromJson(Map<String, dynamic> json) =>
      _$SourceTableDetailsFromJson(json);
}

/// Contains the details of the features enabled on the table when the backup
/// was created. For example, LSIs, GSIs, streams, TTL.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SourceTableFeatureDetails {
  /// Represents the GSI properties for the table when the backup was created. It
  /// includes the IndexName, KeySchema, Projection, and ProvisionedThroughput for
  /// the GSIs on the table at the time of backup.
  @_s.JsonKey(name: 'GlobalSecondaryIndexes')
  final List<GlobalSecondaryIndexInfo> globalSecondaryIndexes;

  /// Represents the LSI properties for the table when the backup was created. It
  /// includes the IndexName, KeySchema and Projection for the LSIs on the table
  /// at the time of backup.
  @_s.JsonKey(name: 'LocalSecondaryIndexes')
  final List<LocalSecondaryIndexInfo> localSecondaryIndexes;

  /// The description of the server-side encryption status on the table when the
  /// backup was created.
  @_s.JsonKey(name: 'SSEDescription')
  final SSEDescription sSEDescription;

  /// Stream settings on the table when the backup was created.
  @_s.JsonKey(name: 'StreamDescription')
  final StreamSpecification streamDescription;

  /// Time to Live settings on the table when the backup was created.
  @_s.JsonKey(name: 'TimeToLiveDescription')
  final TimeToLiveDescription timeToLiveDescription;

  SourceTableFeatureDetails({
    this.globalSecondaryIndexes,
    this.localSecondaryIndexes,
    this.sSEDescription,
    this.streamDescription,
    this.timeToLiveDescription,
  });
  factory SourceTableFeatureDetails.fromJson(Map<String, dynamic> json) =>
      _$SourceTableFeatureDetailsFromJson(json);
}

/// Represents the DynamoDB Streams configuration for a table in DynamoDB.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StreamSpecification {
  /// Indicates whether DynamoDB Streams is enabled (true) or disabled (false) on
  /// the table.
  @_s.JsonKey(name: 'StreamEnabled')
  final bool streamEnabled;

  /// When an item in the table is modified, <code>StreamViewType</code>
  /// determines what information is written to the stream for this table. Valid
  /// values for <code>StreamViewType</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the key attributes of the modified item are
  /// written to the stream.
  /// </li>
  /// <li>
  /// <code>NEW_IMAGE</code> - The entire item, as it appears after it was
  /// modified, is written to the stream.
  /// </li>
  /// <li>
  /// <code>OLD_IMAGE</code> - The entire item, as it appeared before it was
  /// modified, is written to the stream.
  /// </li>
  /// <li>
  /// <code>NEW_AND_OLD_IMAGES</code> - Both the new and the old item images of
  /// the item are written to the stream.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StreamViewType')
  final StreamViewType streamViewType;

  StreamSpecification({
    @_s.required this.streamEnabled,
    this.streamViewType,
  });
  factory StreamSpecification.fromJson(Map<String, dynamic> json) =>
      _$StreamSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$StreamSpecificationToJson(this);
}

enum StreamViewType {
  @_s.JsonValue('NEW_IMAGE')
  newImage,
  @_s.JsonValue('OLD_IMAGE')
  oldImage,
  @_s.JsonValue('NEW_AND_OLD_IMAGES')
  newAndOldImages,
  @_s.JsonValue('KEYS_ONLY')
  keysOnly,
}

/// Represents the auto scaling configuration for a global table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TableAutoScalingDescription {
  /// Represents replicas of the global table.
  @_s.JsonKey(name: 'Replicas')
  final List<ReplicaAutoScalingDescription> replicas;

  /// The name of the table.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The current state of the table:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The table is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The table is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The table is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The table is ready for use.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'TableStatus')
  final TableStatus tableStatus;

  TableAutoScalingDescription({
    this.replicas,
    this.tableName,
    this.tableStatus,
  });
  factory TableAutoScalingDescription.fromJson(Map<String, dynamic> json) =>
      _$TableAutoScalingDescriptionFromJson(json);
}

/// Represents the properties of a table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TableDescription {
  /// Contains information about the table archive.
  @_s.JsonKey(name: 'ArchivalSummary')
  final ArchivalSummary archivalSummary;

  /// An array of <code>AttributeDefinition</code> objects. Each of these objects
  /// describes one attribute in the table and index key schema.
  ///
  /// Each <code>AttributeDefinition</code> object in this array is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>AttributeName</code> - The name of the attribute.
  /// </li>
  /// <li>
  /// <code>AttributeType</code> - The data type for the attribute.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'AttributeDefinitions')
  final List<AttributeDefinition> attributeDefinitions;

  /// Contains the details for the read/write capacity mode.
  @_s.JsonKey(name: 'BillingModeSummary')
  final BillingModeSummary billingModeSummary;

  /// The date and time when the table was created, in <a
  /// href="http://www.epochconverter.com/">UNIX epoch time</a> format.
  @_s.JsonKey(
      name: 'CreationDateTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime creationDateTime;

  /// The global secondary indexes, if any, on the table. Each index is scoped to
  /// a given partition key value. Each element is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>Backfilling</code> - If true, then the index is currently in the
  /// backfilling phase. Backfilling occurs only when a new global secondary index
  /// is added to the table. It is the process by which DynamoDB populates the new
  /// index with data from the table. (This attribute does not appear for indexes
  /// that were created during a <code>CreateTable</code> operation.)
  ///
  /// You can delete an index that is being created during the
  /// <code>Backfilling</code> phase when <code>IndexStatus</code> is set to
  /// CREATING and <code>Backfilling</code> is true. You can't delete the index
  /// that is being created when <code>IndexStatus</code> is set to CREATING and
  /// <code>Backfilling</code> is false. (This attribute does not appear for
  /// indexes that were created during a <code>CreateTable</code> operation.)
  /// </li>
  /// <li>
  /// <code>IndexName</code> - The name of the global secondary index.
  /// </li>
  /// <li>
  /// <code>IndexSizeBytes</code> - The total size of the global secondary index,
  /// in bytes. DynamoDB updates this value approximately every six hours. Recent
  /// changes might not be reflected in this value.
  /// </li>
  /// <li>
  /// <code>IndexStatus</code> - The current status of the global secondary index:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The index is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The index is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The index is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The index is ready for use.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ItemCount</code> - The number of items in the global secondary index.
  /// DynamoDB updates this value approximately every six hours. Recent changes
  /// might not be reflected in this value.
  /// </li>
  /// <li>
  /// <code>KeySchema</code> - Specifies the complete index key schema. The
  /// attribute names in the key schema must be between 1 and 255 characters
  /// (inclusive). The key schema must begin with the same partition key as the
  /// table.
  /// </li>
  /// <li>
  /// <code>Projection</code> - Specifies attributes that are copied (projected)
  /// from the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected. Each
  /// attribute specification is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>ProjectionType</code> - One of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the index and primary keys are projected into
  /// the index.
  /// </li>
  /// <li>
  /// <code>INCLUDE</code> - Only the specified table attributes are projected
  /// into the index. The list of projected attributes is in
  /// <code>NonKeyAttributes</code>.
  /// </li>
  /// <li>
  /// <code>ALL</code> - All of the table attributes are projected into the index.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NonKeyAttributes</code> - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of
  /// attributes provided in <code>NonKeyAttributes</code>, summed across all of
  /// the secondary indexes, must not exceed 20. If you project the same attribute
  /// into two different indexes, this counts as two distinct attributes when
  /// determining the total.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>ProvisionedThroughput</code> - The provisioned throughput settings for
  /// the global secondary index, consisting of read and write capacity units,
  /// along with data about increases and decreases.
  /// </li>
  /// </ul>
  /// If the table is in the <code>DELETING</code> state, no information about
  /// indexes will be returned.
  @_s.JsonKey(name: 'GlobalSecondaryIndexes')
  final List<GlobalSecondaryIndexDescription> globalSecondaryIndexes;

  /// Represents the version of <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GlobalTables.html">global
  /// tables</a> in use, if the table is replicated across AWS Regions.
  @_s.JsonKey(name: 'GlobalTableVersion')
  final String globalTableVersion;

  /// The number of items in the specified table. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in this
  /// value.
  @_s.JsonKey(name: 'ItemCount')
  final int itemCount;

  /// The primary key structure for the table. Each <code>KeySchemaElement</code>
  /// consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>AttributeName</code> - The name of the attribute.
  /// </li>
  /// <li>
  /// <code>KeyType</code> - The role of the attribute:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note> </li>
  /// </ul>
  /// For more information about primary keys, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DataModel.html#DataModelPrimaryKey">Primary
  /// Key</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// The Amazon Resource Name (ARN) that uniquely identifies the latest stream
  /// for this table.
  @_s.JsonKey(name: 'LatestStreamArn')
  final String latestStreamArn;

  /// A timestamp, in ISO 8601 format, for this stream.
  ///
  /// Note that <code>LatestStreamLabel</code> is not a unique identifier for the
  /// stream, because it is possible that a stream from another table might have
  /// the same timestamp. However, the combination of the following three elements
  /// is guaranteed to be unique:
  ///
  /// <ul>
  /// <li>
  /// AWS customer ID
  /// </li>
  /// <li>
  /// Table name
  /// </li>
  /// <li>
  /// <code>StreamLabel</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'LatestStreamLabel')
  final String latestStreamLabel;

  /// Represents one or more local secondary indexes on the table. Each index is
  /// scoped to a given partition key value. Tables with one or more local
  /// secondary indexes are subject to an item collection size limit, where the
  /// amount of data within a given item collection cannot exceed 10 GB. Each
  /// element is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>IndexName</code> - The name of the local secondary index.
  /// </li>
  /// <li>
  /// <code>KeySchema</code> - Specifies the complete index key schema. The
  /// attribute names in the key schema must be between 1 and 255 characters
  /// (inclusive). The key schema must begin with the same partition key as the
  /// table.
  /// </li>
  /// <li>
  /// <code>Projection</code> - Specifies attributes that are copied (projected)
  /// from the table into the index. These are in addition to the primary key
  /// attributes and index key attributes, which are automatically projected. Each
  /// attribute specification is composed of:
  ///
  /// <ul>
  /// <li>
  /// <code>ProjectionType</code> - One of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - Only the index and primary keys are projected into
  /// the index.
  /// </li>
  /// <li>
  /// <code>INCLUDE</code> - Only the specified table attributes are projected
  /// into the index. The list of projected attributes is in
  /// <code>NonKeyAttributes</code>.
  /// </li>
  /// <li>
  /// <code>ALL</code> - All of the table attributes are projected into the index.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>NonKeyAttributes</code> - A list of one or more non-key attribute
  /// names that are projected into the secondary index. The total count of
  /// attributes provided in <code>NonKeyAttributes</code>, summed across all of
  /// the secondary indexes, must not exceed 20. If you project the same attribute
  /// into two different indexes, this counts as two distinct attributes when
  /// determining the total.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>IndexSizeBytes</code> - Represents the total size of the index, in
  /// bytes. DynamoDB updates this value approximately every six hours. Recent
  /// changes might not be reflected in this value.
  /// </li>
  /// <li>
  /// <code>ItemCount</code> - Represents the number of items in the index.
  /// DynamoDB updates this value approximately every six hours. Recent changes
  /// might not be reflected in this value.
  /// </li>
  /// </ul>
  /// If the table is in the <code>DELETING</code> state, no information about
  /// indexes will be returned.
  @_s.JsonKey(name: 'LocalSecondaryIndexes')
  final List<LocalSecondaryIndexDescription> localSecondaryIndexes;

  /// The provisioned throughput settings for the table, consisting of read and
  /// write capacity units, along with data about increases and decreases.
  @_s.JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughputDescription provisionedThroughput;

  /// Represents replicas of the table.
  @_s.JsonKey(name: 'Replicas')
  final List<ReplicaDescription> replicas;

  /// Contains details for the restore.
  @_s.JsonKey(name: 'RestoreSummary')
  final RestoreSummary restoreSummary;

  /// The description of the server-side encryption status on the specified table.
  @_s.JsonKey(name: 'SSEDescription')
  final SSEDescription sSEDescription;

  /// The current DynamoDB Streams configuration for the table.
  @_s.JsonKey(name: 'StreamSpecification')
  final StreamSpecification streamSpecification;

  /// The Amazon Resource Name (ARN) that uniquely identifies the table.
  @_s.JsonKey(name: 'TableArn')
  final String tableArn;

  /// Unique identifier for the table for which the backup was created.
  @_s.JsonKey(name: 'TableId')
  final String tableId;

  /// The name of the table.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// The total size of the specified table, in bytes. DynamoDB updates this value
  /// approximately every six hours. Recent changes might not be reflected in this
  /// value.
  @_s.JsonKey(name: 'TableSizeBytes')
  final int tableSizeBytes;

  /// The current state of the table:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The table is being created.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The table is being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The table is being deleted.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The table is ready for use.
  /// </li>
  /// <li>
  /// <code>INACCESSIBLE_ENCRYPTION_CREDENTIALS</code> - The AWS KMS key used to
  /// encrypt the table in inaccessible. Table operations may fail due to failure
  /// to use the AWS KMS key. DynamoDB will initiate the table archival process
  /// when a table's AWS KMS key remains inaccessible for more than seven days.
  /// </li>
  /// <li>
  /// <code>ARCHIVING</code> - The table is being archived. Operations are not
  /// allowed until archival is complete.
  /// </li>
  /// <li>
  /// <code>ARCHIVED</code> - The table has been archived. See the ArchivalReason
  /// for more information.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'TableStatus')
  final TableStatus tableStatus;

  TableDescription({
    this.archivalSummary,
    this.attributeDefinitions,
    this.billingModeSummary,
    this.creationDateTime,
    this.globalSecondaryIndexes,
    this.globalTableVersion,
    this.itemCount,
    this.keySchema,
    this.latestStreamArn,
    this.latestStreamLabel,
    this.localSecondaryIndexes,
    this.provisionedThroughput,
    this.replicas,
    this.restoreSummary,
    this.sSEDescription,
    this.streamSpecification,
    this.tableArn,
    this.tableId,
    this.tableName,
    this.tableSizeBytes,
    this.tableStatus,
  });
  factory TableDescription.fromJson(Map<String, dynamic> json) =>
      _$TableDescriptionFromJson(json);
}

enum TableStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACCESSIBLE_ENCRYPTION_CREDENTIALS')
  inaccessibleEncryptionCredentials,
  @_s.JsonValue('ARCHIVING')
  archiving,
  @_s.JsonValue('ARCHIVED')
  archived,
}

/// Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a
/// single DynamoDB table.
///
/// AWS-assigned tag names and values are automatically assigned the
/// <code>aws:</code> prefix, which the user cannot assign. AWS-assigned tag
/// names do not count towards the tag limit of 50. User-assigned tag names have
/// the prefix <code>user:</code> in the Cost Allocation Report. You cannot
/// backdate the application of a tag.
///
/// For an overview on tagging DynamoDB resources, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tagging.html">Tagging
/// for DynamoDB</a> in the <i>Amazon DynamoDB Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the tag. Tag keys are case sensitive. Each DynamoDB table can
  /// only have up to one tag with the same key. If you try to add an existing tag
  /// (same key), the existing tag value will be updated to the new value.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag. Tag values are case-sensitive and can be null.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// The description of the Time to Live (TTL) status on the specified table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TimeToLiveDescription {
  /// The name of the TTL attribute for items in the table.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The TTL status for the table.
  @_s.JsonKey(name: 'TimeToLiveStatus')
  final TimeToLiveStatus timeToLiveStatus;

  TimeToLiveDescription({
    this.attributeName,
    this.timeToLiveStatus,
  });
  factory TimeToLiveDescription.fromJson(Map<String, dynamic> json) =>
      _$TimeToLiveDescriptionFromJson(json);
}

/// Represents the settings used to enable or disable Time to Live (TTL) for the
/// specified table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimeToLiveSpecification {
  /// The name of the TTL attribute used to store the expiration time for items in
  /// the table.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// Indicates whether TTL is to be enabled (true) or disabled (false) on the
  /// table.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  TimeToLiveSpecification({
    @_s.required this.attributeName,
    @_s.required this.enabled,
  });
  factory TimeToLiveSpecification.fromJson(Map<String, dynamic> json) =>
      _$TimeToLiveSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToLiveSpecificationToJson(this);
}

enum TimeToLiveStatus {
  @_s.JsonValue('ENABLING')
  enabling,
  @_s.JsonValue('DISABLING')
  disabling,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

/// Specifies an item to be retrieved as part of the transaction.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TransactGetItem {
  /// Contains the primary key that identifies the item to get, together with the
  /// name of the table that contains the item, and optionally the specific
  /// attributes of the item to retrieve.
  @_s.JsonKey(name: 'Get')
  final Get get;

  TransactGetItem({
    @_s.required this.get,
  });
  Map<String, dynamic> toJson() => _$TransactGetItemToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TransactGetItemsOutput {
  /// If the <i>ReturnConsumedCapacity</i> value was <code>TOTAL</code>, this is
  /// an array of <code>ConsumedCapacity</code> objects, one for each table
  /// addressed by <code>TransactGetItem</code> objects in the
  /// <i>TransactItems</i> parameter. These <code>ConsumedCapacity</code> objects
  /// report the read-capacity units consumed by the <code>TransactGetItems</code>
  /// call in that table.
  @_s.JsonKey(name: 'ConsumedCapacity')
  final List<ConsumedCapacity> consumedCapacity;

  /// An ordered array of up to 25 <code>ItemResponse</code> objects, each of
  /// which corresponds to the <code>TransactGetItem</code> object in the same
  /// position in the <i>TransactItems</i> array. Each <code>ItemResponse</code>
  /// object contains a Map of the name-value pairs that are the projected
  /// attributes of the requested item.
  ///
  /// If a requested item could not be retrieved, the corresponding
  /// <code>ItemResponse</code> object is Null, or if the requested item has no
  /// projected attributes, the corresponding <code>ItemResponse</code> object is
  /// an empty Map.
  @_s.JsonKey(name: 'Responses')
  final List<ItemResponse> responses;

  TransactGetItemsOutput({
    this.consumedCapacity,
    this.responses,
  });
  factory TransactGetItemsOutput.fromJson(Map<String, dynamic> json) =>
      _$TransactGetItemsOutputFromJson(json);
}

/// A list of requests that can perform update, put, delete, or check operations
/// on multiple items in one or more tables atomically.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TransactWriteItem {
  /// A request to perform a check item operation.
  @_s.JsonKey(name: 'ConditionCheck')
  final ConditionCheck conditionCheck;

  /// A request to perform a <code>DeleteItem</code> operation.
  @_s.JsonKey(name: 'Delete')
  final Delete delete;

  /// A request to perform a <code>PutItem</code> operation.
  @_s.JsonKey(name: 'Put')
  final Put put;

  /// A request to perform an <code>UpdateItem</code> operation.
  @_s.JsonKey(name: 'Update')
  final Update update;

  TransactWriteItem({
    this.conditionCheck,
    this.delete,
    this.put,
    this.update,
  });
  Map<String, dynamic> toJson() => _$TransactWriteItemToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TransactWriteItemsOutput {
  /// The capacity units consumed by the entire <code>TransactWriteItems</code>
  /// operation. The values of the list are ordered according to the ordering of
  /// the <code>TransactItems</code> request parameter.
  @_s.JsonKey(name: 'ConsumedCapacity')
  final List<ConsumedCapacity> consumedCapacity;

  /// A list of tables that were processed by <code>TransactWriteItems</code> and,
  /// for each table, information about any item collections that were affected by
  /// individual <code>UpdateItem</code>, <code>PutItem</code>, or
  /// <code>DeleteItem</code> operations.
  @_s.JsonKey(name: 'ItemCollectionMetrics')
  final Map<String, List<ItemCollectionMetrics>> itemCollectionMetrics;

  TransactWriteItemsOutput({
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });
  factory TransactWriteItemsOutput.fromJson(Map<String, dynamic> json) =>
      _$TransactWriteItemsOutputFromJson(json);
}

/// Represents a request to perform an <code>UpdateItem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Update {
  /// The primary key of the item to be updated. Each element consists of an
  /// attribute name and a value for that attribute.
  @_s.JsonKey(name: 'Key')
  final Map<String, AttributeValue> key;

  /// Name of the table for the <code>UpdateItem</code> request.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// An expression that defines one or more attributes to be updated, the action
  /// to be performed on them, and new value(s) for them.
  @_s.JsonKey(name: 'UpdateExpression')
  final String updateExpression;

  /// A condition that must be satisfied in order for a conditional update to
  /// succeed.
  @_s.JsonKey(name: 'ConditionExpression')
  final String conditionExpression;

  /// One or more substitution tokens for attribute names in an expression.
  @_s.JsonKey(name: 'ExpressionAttributeNames')
  final Map<String, String> expressionAttributeNames;

  /// One or more values that can be substituted in an expression.
  @_s.JsonKey(name: 'ExpressionAttributeValues')
  final Map<String, AttributeValue> expressionAttributeValues;

  /// Use <code>ReturnValuesOnConditionCheckFailure</code> to get the item
  /// attributes if the <code>Update</code> condition fails. For
  /// <code>ReturnValuesOnConditionCheckFailure</code>, the valid values are:
  /// NONE, ALL_OLD, UPDATED_OLD, ALL_NEW, UPDATED_NEW.
  @_s.JsonKey(name: 'ReturnValuesOnConditionCheckFailure')
  final ReturnValuesOnConditionCheckFailure returnValuesOnConditionCheckFailure;

  Update({
    @_s.required this.key,
    @_s.required this.tableName,
    @_s.required this.updateExpression,
    this.conditionExpression,
    this.expressionAttributeNames,
    this.expressionAttributeValues,
    this.returnValuesOnConditionCheckFailure,
  });
  Map<String, dynamic> toJson() => _$UpdateToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateContinuousBackupsOutput {
  /// Represents the continuous backups and point in time recovery settings on the
  /// table.
  @_s.JsonKey(name: 'ContinuousBackupsDescription')
  final ContinuousBackupsDescription continuousBackupsDescription;

  UpdateContinuousBackupsOutput({
    this.continuousBackupsDescription,
  });
  factory UpdateContinuousBackupsOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateContinuousBackupsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateContributorInsightsOutput {
  /// The status of contributor insights
  @_s.JsonKey(name: 'ContributorInsightsStatus')
  final ContributorInsightsStatus contributorInsightsStatus;

  /// The name of the global secondary index, if applicable.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The name of the table.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  UpdateContributorInsightsOutput({
    this.contributorInsightsStatus,
    this.indexName,
    this.tableName,
  });
  factory UpdateContributorInsightsOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateContributorInsightsOutputFromJson(json);
}

/// Represents the new provisioned throughput settings to be applied to a global
/// secondary index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateGlobalSecondaryIndexAction {
  /// The name of the global secondary index to be updated.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// Represents the provisioned throughput settings for the specified global
  /// secondary index.
  ///
  /// For current minimum and maximum provisioned throughput values, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a>
  /// in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ProvisionedThroughput')
  final ProvisionedThroughput provisionedThroughput;

  UpdateGlobalSecondaryIndexAction({
    @_s.required this.indexName,
    @_s.required this.provisionedThroughput,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateGlobalSecondaryIndexActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGlobalTableOutput {
  /// Contains the details of the global table.
  @_s.JsonKey(name: 'GlobalTableDescription')
  final GlobalTableDescription globalTableDescription;

  UpdateGlobalTableOutput({
    this.globalTableDescription,
  });
  factory UpdateGlobalTableOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGlobalTableOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGlobalTableSettingsOutput {
  /// The name of the global table.
  @_s.JsonKey(name: 'GlobalTableName')
  final String globalTableName;

  /// The Region-specific settings for the global table.
  @_s.JsonKey(name: 'ReplicaSettings')
  final List<ReplicaSettingsDescription> replicaSettings;

  UpdateGlobalTableSettingsOutput({
    this.globalTableName,
    this.replicaSettings,
  });
  factory UpdateGlobalTableSettingsOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateGlobalTableSettingsOutputFromJson(json);
}

/// Represents the output of an <code>UpdateItem</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateItemOutput {
  /// A map of attribute values as they appear before or after the
  /// <code>UpdateItem</code> operation, as determined by the
  /// <code>ReturnValues</code> parameter.
  ///
  /// The <code>Attributes</code> map is only present if <code>ReturnValues</code>
  /// was specified as something other than <code>NONE</code> in the request. Each
  /// element represents one attribute.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, AttributeValue> attributes;

  /// The capacity units consumed by the <code>UpdateItem</code> operation. The
  /// data returned includes the total provisioned throughput consumed, along with
  /// statistics for the table and any indexes involved in the operation.
  /// <code>ConsumedCapacity</code> is only returned if the
  /// <code>ReturnConsumedCapacity</code> parameter was specified. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ProvisionedThroughputIntro.html">Provisioned
  /// Throughput</a> in the <i>Amazon DynamoDB Developer Guide</i>.
  @_s.JsonKey(name: 'ConsumedCapacity')
  final ConsumedCapacity consumedCapacity;

  /// Information about item collections, if any, that were affected by the
  /// <code>UpdateItem</code> operation. <code>ItemCollectionMetrics</code> is
  /// only returned if the <code>ReturnItemCollectionMetrics</code> parameter was
  /// specified. If the table does not have any local secondary indexes, this
  /// information is not returned in the response.
  ///
  /// Each <code>ItemCollectionMetrics</code> element consists of:
  ///
  /// <ul>
  /// <li>
  /// <code>ItemCollectionKey</code> - The partition key value of the item
  /// collection. This is the same as the partition key value of the item itself.
  /// </li>
  /// <li>
  /// <code>SizeEstimateRangeGB</code> - An estimate of item collection size, in
  /// gigabytes. This value is a two-element array containing a lower bound and an
  /// upper bound for the estimate. The estimate includes the size of all the
  /// items in the table, plus the size of all attributes projected into all of
  /// the local secondary indexes on that table. Use this estimate to measure
  /// whether a local secondary index is approaching its size limit.
  ///
  /// The estimate is subject to change over time; therefore, do not rely on the
  /// precision or accuracy of the estimate.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ItemCollectionMetrics')
  final ItemCollectionMetrics itemCollectionMetrics;

  UpdateItemOutput({
    this.attributes,
    this.consumedCapacity,
    this.itemCollectionMetrics,
  });
  factory UpdateItemOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateItemOutputFromJson(json);
}

/// Represents a replica to be modified.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateReplicationGroupMemberAction {
  /// The Region where the replica exists.
  @_s.JsonKey(name: 'RegionName')
  final String regionName;

  /// Replica-specific global secondary index settings.
  @_s.JsonKey(name: 'GlobalSecondaryIndexes')
  final List<ReplicaGlobalSecondaryIndex> globalSecondaryIndexes;

  /// The AWS KMS customer master key (CMK) of the replica that should be used for
  /// AWS KMS encryption. To specify a CMK, use its key ID, Amazon Resource Name
  /// (ARN), alias name, or alias ARN. Note that you should only provide this
  /// parameter if the key is different from the default DynamoDB KMS master key
  /// alias/aws/dynamodb.
  @_s.JsonKey(name: 'KMSMasterKeyId')
  final String kMSMasterKeyId;

  /// Replica-specific provisioned throughput. If not specified, uses the source
  /// table's provisioned throughput settings.
  @_s.JsonKey(name: 'ProvisionedThroughputOverride')
  final ProvisionedThroughputOverride provisionedThroughputOverride;

  UpdateReplicationGroupMemberAction({
    @_s.required this.regionName,
    this.globalSecondaryIndexes,
    this.kMSMasterKeyId,
    this.provisionedThroughputOverride,
  });
  Map<String, dynamic> toJson() =>
      _$UpdateReplicationGroupMemberActionToJson(this);
}

/// Represents the output of an <code>UpdateTable</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTableOutput {
  /// Represents the properties of the table.
  @_s.JsonKey(name: 'TableDescription')
  final TableDescription tableDescription;

  UpdateTableOutput({
    this.tableDescription,
  });
  factory UpdateTableOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateTableOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTableReplicaAutoScalingOutput {
  /// Returns information about the auto scaling settings of a table with
  /// replicas.
  @_s.JsonKey(name: 'TableAutoScalingDescription')
  final TableAutoScalingDescription tableAutoScalingDescription;

  UpdateTableReplicaAutoScalingOutput({
    this.tableAutoScalingDescription,
  });
  factory UpdateTableReplicaAutoScalingOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateTableReplicaAutoScalingOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTimeToLiveOutput {
  /// Represents the output of an <code>UpdateTimeToLive</code> operation.
  @_s.JsonKey(name: 'TimeToLiveSpecification')
  final TimeToLiveSpecification timeToLiveSpecification;

  UpdateTimeToLiveOutput({
    this.timeToLiveSpecification,
  });
  factory UpdateTimeToLiveOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateTimeToLiveOutputFromJson(json);
}

/// Represents an operation to perform - either <code>DeleteItem</code> or
/// <code>PutItem</code>. You can only request one of these operations, not
/// both, in a single <code>WriteRequest</code>. If you do need to perform both
/// of these operations, you need to provide two separate
/// <code>WriteRequest</code> objects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WriteRequest {
  /// A request to perform a <code>DeleteItem</code> operation.
  @_s.JsonKey(name: 'DeleteRequest')
  final DeleteRequest deleteRequest;

  /// A request to perform a <code>PutItem</code> operation.
  @_s.JsonKey(name: 'PutRequest')
  final PutRequest putRequest;

  WriteRequest({
    this.deleteRequest,
    this.putRequest,
  });
  factory WriteRequest.fromJson(Map<String, dynamic> json) =>
      _$WriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WriteRequestToJson(this);
}

class BackupInUseException extends _s.GenericAwsException {
  BackupInUseException({String type, String message})
      : super(type: type, code: 'BackupInUseException', message: message);
}

class BackupNotFoundException extends _s.GenericAwsException {
  BackupNotFoundException({String type, String message})
      : super(type: type, code: 'BackupNotFoundException', message: message);
}

class ConditionalCheckFailedException extends _s.GenericAwsException {
  ConditionalCheckFailedException({String type, String message})
      : super(
            type: type,
            code: 'ConditionalCheckFailedException',
            message: message);
}

class ContinuousBackupsUnavailableException extends _s.GenericAwsException {
  ContinuousBackupsUnavailableException({String type, String message})
      : super(
            type: type,
            code: 'ContinuousBackupsUnavailableException',
            message: message);
}

class GlobalTableAlreadyExistsException extends _s.GenericAwsException {
  GlobalTableAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'GlobalTableAlreadyExistsException',
            message: message);
}

class GlobalTableNotFoundException extends _s.GenericAwsException {
  GlobalTableNotFoundException({String type, String message})
      : super(
            type: type, code: 'GlobalTableNotFoundException', message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String type, String message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class IndexNotFoundException extends _s.GenericAwsException {
  IndexNotFoundException({String type, String message})
      : super(type: type, code: 'IndexNotFoundException', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String type, String message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidRestoreTimeException extends _s.GenericAwsException {
  InvalidRestoreTimeException({String type, String message})
      : super(
            type: type, code: 'InvalidRestoreTimeException', message: message);
}

class ItemCollectionSizeLimitExceededException extends _s.GenericAwsException {
  ItemCollectionSizeLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ItemCollectionSizeLimitExceededException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class PointInTimeRecoveryUnavailableException extends _s.GenericAwsException {
  PointInTimeRecoveryUnavailableException({String type, String message})
      : super(
            type: type,
            code: 'PointInTimeRecoveryUnavailableException',
            message: message);
}

class ProvisionedThroughputExceededException extends _s.GenericAwsException {
  ProvisionedThroughputExceededException({String type, String message})
      : super(
            type: type,
            code: 'ProvisionedThroughputExceededException',
            message: message);
}

class ReplicaAlreadyExistsException extends _s.GenericAwsException {
  ReplicaAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ReplicaAlreadyExistsException',
            message: message);
}

class ReplicaNotFoundException extends _s.GenericAwsException {
  ReplicaNotFoundException({String type, String message})
      : super(type: type, code: 'ReplicaNotFoundException', message: message);
}

class RequestLimitExceeded extends _s.GenericAwsException {
  RequestLimitExceeded({String type, String message})
      : super(type: type, code: 'RequestLimitExceeded', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TableAlreadyExistsException extends _s.GenericAwsException {
  TableAlreadyExistsException({String type, String message})
      : super(
            type: type, code: 'TableAlreadyExistsException', message: message);
}

class TableInUseException extends _s.GenericAwsException {
  TableInUseException({String type, String message})
      : super(type: type, code: 'TableInUseException', message: message);
}

class TableNotFoundException extends _s.GenericAwsException {
  TableNotFoundException({String type, String message})
      : super(type: type, code: 'TableNotFoundException', message: message);
}

class TransactionCanceledException extends _s.GenericAwsException {
  TransactionCanceledException({String type, String message})
      : super(
            type: type, code: 'TransactionCanceledException', message: message);
}

class TransactionConflictException extends _s.GenericAwsException {
  TransactionConflictException({String type, String message})
      : super(
            type: type, code: 'TransactionConflictException', message: message);
}

class TransactionInProgressException extends _s.GenericAwsException {
  TransactionInProgressException({String type, String message})
      : super(
            type: type,
            code: 'TransactionInProgressException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BackupInUseException': (type, message) =>
      BackupInUseException(type: type, message: message),
  'BackupNotFoundException': (type, message) =>
      BackupNotFoundException(type: type, message: message),
  'ConditionalCheckFailedException': (type, message) =>
      ConditionalCheckFailedException(type: type, message: message),
  'ContinuousBackupsUnavailableException': (type, message) =>
      ContinuousBackupsUnavailableException(type: type, message: message),
  'GlobalTableAlreadyExistsException': (type, message) =>
      GlobalTableAlreadyExistsException(type: type, message: message),
  'GlobalTableNotFoundException': (type, message) =>
      GlobalTableNotFoundException(type: type, message: message),
  'IdempotentParameterMismatchException': (type, message) =>
      IdempotentParameterMismatchException(type: type, message: message),
  'IndexNotFoundException': (type, message) =>
      IndexNotFoundException(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InvalidRestoreTimeException': (type, message) =>
      InvalidRestoreTimeException(type: type, message: message),
  'ItemCollectionSizeLimitExceededException': (type, message) =>
      ItemCollectionSizeLimitExceededException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'PointInTimeRecoveryUnavailableException': (type, message) =>
      PointInTimeRecoveryUnavailableException(type: type, message: message),
  'ProvisionedThroughputExceededException': (type, message) =>
      ProvisionedThroughputExceededException(type: type, message: message),
  'ReplicaAlreadyExistsException': (type, message) =>
      ReplicaAlreadyExistsException(type: type, message: message),
  'ReplicaNotFoundException': (type, message) =>
      ReplicaNotFoundException(type: type, message: message),
  'RequestLimitExceeded': (type, message) =>
      RequestLimitExceeded(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TableAlreadyExistsException': (type, message) =>
      TableAlreadyExistsException(type: type, message: message),
  'TableInUseException': (type, message) =>
      TableInUseException(type: type, message: message),
  'TableNotFoundException': (type, message) =>
      TableNotFoundException(type: type, message: message),
  'TransactionCanceledException': (type, message) =>
      TransactionCanceledException(type: type, message: message),
  'TransactionConflictException': (type, message) =>
      TransactionConflictException(type: type, message: message),
  'TransactionInProgressException': (type, message) =>
      TransactionInProgressException(type: type, message: message),
};
