#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Performance
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MAX_COUNTER_PATH := 256

/**
 * @type {Integer (UInt32)}
 */
export global PDH_MAX_COUNTER_NAME := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PDH_MAX_INSTANCE_NAME := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PDH_MAX_COUNTER_PATH := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PDH_MAX_DATASOURCE_PATH := 1024

/**
 * @type {Integer (Int32)}
 */
export global H_WBEM_DATASOURCE := -1

/**
 * @type {Integer (Int32)}
 */
export global PDH_MAX_SCALE := 7

/**
 * @type {Integer (Int32)}
 */
export global PDH_MIN_SCALE := -7

/**
 * @type {Integer (UInt32)}
 */
export global PDH_NOEXPANDCOUNTERS := 1

/**
 * @type {Integer (UInt32)}
 */
export global PDH_NOEXPANDINSTANCES := 2

/**
 * @type {Integer (UInt32)}
 */
export global PDH_REFRESHCOUNTERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global PDH_LOG_TYPE_RETIRED_BIN := 3

/**
 * @type {Integer (UInt32)}
 */
export global PDH_LOG_TYPE_TRACE_KERNEL := 4

/**
 * @type {Integer (UInt32)}
 */
export global PDH_LOG_TYPE_TRACE_GENERIC := 5

/**
 * @type {Integer (UInt32)}
 */
export global PERF_PROVIDER_USER_MODE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PERF_PROVIDER_KERNEL_MODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PERF_PROVIDER_DRIVER := 2

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTERSET_FLAG_MULTIPLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTERSET_FLAG_AGGREGATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTERSET_FLAG_HISTORY := 8

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTERSET_FLAG_INSTANCE := 16

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTERSET_SINGLE_INSTANCE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTERSET_MULTI_INSTANCES := 2

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTERSET_SINGLE_AGGREGATE := 4

/**
 * @type {Integer (UInt64)}
 */
export global PERF_ATTRIB_BY_REFERENCE := 1

/**
 * @type {Integer (UInt64)}
 */
export global PERF_ATTRIB_NO_DISPLAYABLE := 2

/**
 * @type {Integer (UInt64)}
 */
export global PERF_ATTRIB_NO_GROUP_SEPARATOR := 4

/**
 * @type {Integer (UInt64)}
 */
export global PERF_ATTRIB_DISPLAY_AS_REAL := 8

/**
 * @type {Integer (UInt64)}
 */
export global PERF_ATTRIB_DISPLAY_AS_HEX := 16

/**
 * @type {Integer (UInt32)}
 */
export global PERF_WILDCARD_COUNTER := 4294967295

/**
 * @type {String}
 */
export global PERF_WILDCARD_INSTANCE := "*"

/**
 * @type {String}
 */
export global PERF_AGGREGATE_INSTANCE := "_Total"

/**
 * @type {Integer (UInt32)}
 */
export global PERF_MAX_INSTANCE_NAME := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PERF_ADD_COUNTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global PERF_REMOVE_COUNTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global PERF_ENUM_INSTANCES := 3

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COLLECT_START := 5

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COLLECT_END := 6

/**
 * @type {Integer (UInt32)}
 */
export global PERF_FILTER := 9

/**
 * @type {Integer (UInt32)}
 */
export global PERF_DATA_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global PERF_DATA_REVISION := 1

/**
 * @type {Integer (Int32)}
 */
export global PERF_NO_INSTANCES := -1

/**
 * @type {Integer (Int32)}
 */
export global PERF_METADATA_MULTIPLE_INSTANCES := -2

/**
 * @type {Integer (Int32)}
 */
export global PERF_METADATA_NO_INSTANCES := -3

/**
 * @type {Integer (UInt32)}
 */
export global PERF_SIZE_DWORD := 0

/**
 * @type {Integer (UInt32)}
 */
export global PERF_SIZE_LARGE := 256

/**
 * @type {Integer (UInt32)}
 */
export global PERF_SIZE_ZERO := 512

/**
 * @type {Integer (UInt32)}
 */
export global PERF_SIZE_VARIABLE_LEN := 768

/**
 * @type {Integer (UInt32)}
 */
export global PERF_TYPE_NUMBER := 0

/**
 * @type {Integer (UInt32)}
 */
export global PERF_TYPE_COUNTER := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PERF_TYPE_TEXT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PERF_TYPE_ZERO := 3072

/**
 * @type {Integer (UInt32)}
 */
export global PERF_NUMBER_HEX := 0

/**
 * @type {Integer (UInt32)}
 */
export global PERF_NUMBER_DECIMAL := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PERF_NUMBER_DEC_1000 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTER_VALUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTER_RATE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTER_FRACTION := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTER_BASE := 196608

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTER_ELAPSED := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTER_QUEUELEN := 327680

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTER_HISTOGRAM := 393216

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTER_PRECISION := 458752

/**
 * @type {Integer (UInt32)}
 */
export global PERF_TEXT_UNICODE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PERF_TEXT_ASCII := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PERF_TIMER_TICK := 0

/**
 * @type {Integer (UInt32)}
 */
export global PERF_TIMER_100NS := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PERF_OBJECT_TIMER := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PERF_DELTA_COUNTER := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global PERF_DELTA_BASE := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global PERF_INVERSE_COUNTER := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global PERF_MULTI_COUNTER := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global PERF_DISPLAY_NO_SUFFIX := 0

/**
 * @type {Integer (UInt32)}
 */
export global PERF_DISPLAY_PER_SEC := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global PERF_DISPLAY_PERCENT := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global PERF_DISPLAY_SECONDS := 805306368

/**
 * @type {Integer (UInt32)}
 */
export global PERF_DISPLAY_NOSHOW := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global PERF_COUNTER_HISTOGRAM_TYPE := 2147483648

/**
 * @type {Integer (Int32)}
 */
export global PERF_NO_UNIQUE_ID := -1

/**
 * @type {Integer (Int32)}
 */
export global MAX_PERF_OBJECTS_IN_QUERY_FUNCTION := 64

/**
 * @type {Integer (UInt32)}
 */
export global WINPERF_LOG_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WINPERF_LOG_USER := 1

/**
 * @type {Integer (UInt32)}
 */
export global WINPERF_LOG_DEBUG := 2

/**
 * @type {Integer (UInt32)}
 */
export global WINPERF_LOG_VERBOSE := 3

/**
 * @type {Guid}
 */
export global LIBID_SystemMonitor := Guid("{1b773e42-2509-11cf-942f-008029004347}")

/**
 * @type {Guid}
 */
export global DIID_DICounterItem := Guid("{c08c4ff2-0e2e-11cf-942c-008029004347}")

/**
 * @type {Guid}
 */
export global DIID_DILogFileItem := Guid("{8d093ffc-f777-4917-82d1-833fbc54c58f}")

/**
 * @type {Guid}
 */
export global DIID_DISystemMonitor := Guid("{13d73d81-c32e-11cf-9398-00aa00a3ddea}")

/**
 * @type {Guid}
 */
export global DIID_DISystemMonitorInternal := Guid("{194eb242-c32c-11cf-9398-00aa00a3ddea}")

/**
 * @type {Guid}
 */
export global DIID_DISystemMonitorEvents := Guid("{84979930-4ab3-11cf-943a-008029004347}")

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CSTATUS_VALID_DATA := 0

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CSTATUS_NEW_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CSTATUS_NO_MACHINE := 2147485648

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CSTATUS_NO_INSTANCE := 2147485649

/**
 * @type {Integer (UInt32)}
 */
export global PDH_MORE_DATA := 2147485650

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CSTATUS_ITEM_NOT_VALIDATED := 2147485651

/**
 * @type {Integer (UInt32)}
 */
export global PDH_RETRY := 2147485652

/**
 * @type {Integer (UInt32)}
 */
export global PDH_NO_DATA := 2147485653

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CALC_NEGATIVE_DENOMINATOR := 2147485654

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CALC_NEGATIVE_TIMEBASE := 2147485655

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CALC_NEGATIVE_VALUE := 2147485656

/**
 * @type {Integer (UInt32)}
 */
export global PDH_DIALOG_CANCELLED := 2147485657

/**
 * @type {Integer (UInt32)}
 */
export global PDH_END_OF_LOG_FILE := 2147485658

/**
 * @type {Integer (UInt32)}
 */
export global PDH_ASYNC_QUERY_TIMEOUT := 2147485659

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CANNOT_SET_DEFAULT_REALTIME_DATASOURCE := 2147485660

/**
 * @type {Integer (UInt32)}
 */
export global PDH_UNABLE_MAP_NAME_FILES := 2147486677

/**
 * @type {Integer (UInt32)}
 */
export global PDH_PLA_VALIDATION_WARNING := 2147486707

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CSTATUS_NO_OBJECT := 3221228472

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CSTATUS_NO_COUNTER := 3221228473

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CSTATUS_INVALID_DATA := 3221228474

/**
 * @type {Integer (UInt32)}
 */
export global PDH_MEMORY_ALLOCATION_FAILURE := 3221228475

/**
 * @type {Integer (UInt32)}
 */
export global PDH_INVALID_HANDLE := 3221228476

/**
 * @type {Integer (UInt32)}
 */
export global PDH_INVALID_ARGUMENT := 3221228477

/**
 * @type {Integer (UInt32)}
 */
export global PDH_FUNCTION_NOT_FOUND := 3221228478

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CSTATUS_NO_COUNTERNAME := 3221228479

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CSTATUS_BAD_COUNTERNAME := 3221228480

/**
 * @type {Integer (UInt32)}
 */
export global PDH_INVALID_BUFFER := 3221228481

/**
 * @type {Integer (UInt32)}
 */
export global PDH_INSUFFICIENT_BUFFER := 3221228482

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CANNOT_CONNECT_MACHINE := 3221228483

/**
 * @type {Integer (UInt32)}
 */
export global PDH_INVALID_PATH := 3221228484

/**
 * @type {Integer (UInt32)}
 */
export global PDH_INVALID_INSTANCE := 3221228485

/**
 * @type {Integer (UInt32)}
 */
export global PDH_INVALID_DATA := 3221228486

/**
 * @type {Integer (UInt32)}
 */
export global PDH_NO_DIALOG_DATA := 3221228487

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CANNOT_READ_NAME_STRINGS := 3221228488

/**
 * @type {Integer (UInt32)}
 */
export global PDH_LOG_FILE_CREATE_ERROR := 3221228489

/**
 * @type {Integer (UInt32)}
 */
export global PDH_LOG_FILE_OPEN_ERROR := 3221228490

/**
 * @type {Integer (UInt32)}
 */
export global PDH_LOG_TYPE_NOT_FOUND := 3221228491

/**
 * @type {Integer (UInt32)}
 */
export global PDH_NO_MORE_DATA := 3221228492

/**
 * @type {Integer (UInt32)}
 */
export global PDH_ENTRY_NOT_IN_LOG_FILE := 3221228493

/**
 * @type {Integer (UInt32)}
 */
export global PDH_DATA_SOURCE_IS_LOG_FILE := 3221228494

/**
 * @type {Integer (UInt32)}
 */
export global PDH_DATA_SOURCE_IS_REAL_TIME := 3221228495

/**
 * @type {Integer (UInt32)}
 */
export global PDH_UNABLE_READ_LOG_HEADER := 3221228496

/**
 * @type {Integer (UInt32)}
 */
export global PDH_FILE_NOT_FOUND := 3221228497

/**
 * @type {Integer (UInt32)}
 */
export global PDH_FILE_ALREADY_EXISTS := 3221228498

/**
 * @type {Integer (UInt32)}
 */
export global PDH_NOT_IMPLEMENTED := 3221228499

/**
 * @type {Integer (UInt32)}
 */
export global PDH_STRING_NOT_FOUND := 3221228500

/**
 * @type {Integer (UInt32)}
 */
export global PDH_UNKNOWN_LOG_FORMAT := 3221228502

/**
 * @type {Integer (UInt32)}
 */
export global PDH_UNKNOWN_LOGSVC_COMMAND := 3221228503

/**
 * @type {Integer (UInt32)}
 */
export global PDH_LOGSVC_QUERY_NOT_FOUND := 3221228504

/**
 * @type {Integer (UInt32)}
 */
export global PDH_LOGSVC_NOT_OPENED := 3221228505

/**
 * @type {Integer (UInt32)}
 */
export global PDH_WBEM_ERROR := 3221228506

/**
 * @type {Integer (UInt32)}
 */
export global PDH_ACCESS_DENIED := 3221228507

/**
 * @type {Integer (UInt32)}
 */
export global PDH_LOG_FILE_TOO_SMALL := 3221228508

/**
 * @type {Integer (UInt32)}
 */
export global PDH_INVALID_DATASOURCE := 3221228509

/**
 * @type {Integer (UInt32)}
 */
export global PDH_INVALID_SQLDB := 3221228510

/**
 * @type {Integer (UInt32)}
 */
export global PDH_NO_COUNTERS := 3221228511

/**
 * @type {Integer (UInt32)}
 */
export global PDH_SQL_ALLOC_FAILED := 3221228512

/**
 * @type {Integer (UInt32)}
 */
export global PDH_SQL_ALLOCCON_FAILED := 3221228513

/**
 * @type {Integer (UInt32)}
 */
export global PDH_SQL_EXEC_DIRECT_FAILED := 3221228514

/**
 * @type {Integer (UInt32)}
 */
export global PDH_SQL_FETCH_FAILED := 3221228515

/**
 * @type {Integer (UInt32)}
 */
export global PDH_SQL_ROWCOUNT_FAILED := 3221228516

/**
 * @type {Integer (UInt32)}
 */
export global PDH_SQL_MORE_RESULTS_FAILED := 3221228517

/**
 * @type {Integer (UInt32)}
 */
export global PDH_SQL_CONNECT_FAILED := 3221228518

/**
 * @type {Integer (UInt32)}
 */
export global PDH_SQL_BIND_FAILED := 3221228519

/**
 * @type {Integer (UInt32)}
 */
export global PDH_CANNOT_CONNECT_WMI_SERVER := 3221228520

/**
 * @type {Integer (UInt32)}
 */
export global PDH_PLA_COLLECTION_ALREADY_RUNNING := 3221228521

/**
 * @type {Integer (UInt32)}
 */
export global PDH_PLA_ERROR_SCHEDULE_OVERLAP := 3221228522

/**
 * @type {Integer (UInt32)}
 */
export global PDH_PLA_COLLECTION_NOT_FOUND := 3221228523

/**
 * @type {Integer (UInt32)}
 */
export global PDH_PLA_ERROR_SCHEDULE_ELAPSED := 3221228524

/**
 * @type {Integer (UInt32)}
 */
export global PDH_PLA_ERROR_NOSTART := 3221228525

/**
 * @type {Integer (UInt32)}
 */
export global PDH_PLA_ERROR_ALREADY_EXISTS := 3221228526

/**
 * @type {Integer (UInt32)}
 */
export global PDH_PLA_ERROR_TYPE_MISMATCH := 3221228527

/**
 * @type {Integer (UInt32)}
 */
export global PDH_PLA_ERROR_FILEPATH := 3221228528

/**
 * @type {Integer (UInt32)}
 */
export global PDH_PLA_SERVICE_ERROR := 3221228529

/**
 * @type {Integer (UInt32)}
 */
export global PDH_PLA_VALIDATION_ERROR := 3221228530

/**
 * @type {Integer (UInt32)}
 */
export global PDH_PLA_ERROR_NAME_TOO_LONG := 3221228532

/**
 * @type {Integer (UInt32)}
 */
export global PDH_INVALID_SQL_LOG_FORMAT := 3221228533

/**
 * @type {Integer (UInt32)}
 */
export global PDH_COUNTER_ALREADY_IN_QUERY := 3221228534

/**
 * @type {Integer (UInt32)}
 */
export global PDH_BINARY_LOG_CORRUPT := 3221228535

/**
 * @type {Integer (UInt32)}
 */
export global PDH_LOG_SAMPLE_TOO_SMALL := 3221228536

/**
 * @type {Integer (UInt32)}
 */
export global PDH_OS_LATER_VERSION := 3221228537

/**
 * @type {Integer (UInt32)}
 */
export global PDH_OS_EARLIER_VERSION := 3221228538

/**
 * @type {Integer (UInt32)}
 */
export global PDH_INCORRECT_APPEND_TIME := 3221228539

/**
 * @type {Integer (UInt32)}
 */
export global PDH_UNMATCHED_APPEND_COUNTER := 3221228540

/**
 * @type {Integer (UInt32)}
 */
export global PDH_SQL_ALTER_DETAIL_FAILED := 3221228541

/**
 * @type {Integer (UInt32)}
 */
export global PDH_QUERY_PERF_DATA_TIMEOUT := 3221228542

/**
 * @type {Integer (UInt32)}
 */
export global PLA_CAPABILITY_LOCAL := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global PLA_CAPABILITY_V1_SVC := 1

/**
 * @type {Integer (UInt32)}
 */
export global PLA_CAPABILITY_V1_SESSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global PLA_CAPABILITY_V1_SYSTEM := 4

/**
 * @type {Integer (UInt32)}
 */
export global PLA_CAPABILITY_LEGACY_SESSION := 8

/**
 * @type {Integer (UInt32)}
 */
export global PLA_CAPABILITY_LEGACY_SVC := 16

/**
 * @type {Integer (UInt32)}
 */
export global PLA_CAPABILITY_AUTOLOGGER := 32

/**
 * @type {Integer (UInt32)}
 */
export global PLAL_ALERT_CMD_LINE_SINGLE := 256

/**
 * @type {Integer (UInt32)}
 */
export global PLAL_ALERT_CMD_LINE_A_NAME := 512

/**
 * @type {Integer (UInt32)}
 */
export global PLAL_ALERT_CMD_LINE_C_NAME := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PLAL_ALERT_CMD_LINE_D_TIME := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PLAL_ALERT_CMD_LINE_L_VAL := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PLAL_ALERT_CMD_LINE_M_VAL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PLAL_ALERT_CMD_LINE_U_TEXT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global PLAL_ALERT_CMD_LINE_MASK := 32512

/**
 * @type {Guid}
 */
export global S_PDH := Guid("{04d66358-c4a1-419b-8023-23b73902de2c}")
;@endregion Constants
