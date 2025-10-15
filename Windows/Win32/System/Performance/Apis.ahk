#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class Performance {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_COUNTER_PATH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_MAX_COUNTER_NAME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_MAX_INSTANCE_NAME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_MAX_COUNTER_PATH => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_MAX_DATASOURCE_PATH => 1024

    /**
     * @type {Integer (Int32)}
     */
    static H_WBEM_DATASOURCE => -1

    /**
     * @type {Integer (Int32)}
     */
    static PDH_MAX_SCALE => 7

    /**
     * @type {Integer (Int32)}
     */
    static PDH_MIN_SCALE => -7

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_NOEXPANDCOUNTERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_NOEXPANDINSTANCES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_REFRESHCOUNTERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_RETIRED_BIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_TRACE_KERNEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_TRACE_GENERIC => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_PROVIDER_USER_MODE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_PROVIDER_KERNEL_MODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_PROVIDER_DRIVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTERSET_FLAG_MULTIPLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTERSET_FLAG_AGGREGATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTERSET_FLAG_HISTORY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTERSET_FLAG_INSTANCE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTERSET_SINGLE_INSTANCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTERSET_MULTI_INSTANCES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTERSET_SINGLE_AGGREGATE => 4

    /**
     * @type {Integer (UInt64)}
     */
    static PERF_ATTRIB_BY_REFERENCE => 1

    /**
     * @type {Integer (UInt64)}
     */
    static PERF_ATTRIB_NO_DISPLAYABLE => 2

    /**
     * @type {Integer (UInt64)}
     */
    static PERF_ATTRIB_NO_GROUP_SEPARATOR => 4

    /**
     * @type {Integer (UInt64)}
     */
    static PERF_ATTRIB_DISPLAY_AS_REAL => 8

    /**
     * @type {Integer (UInt64)}
     */
    static PERF_ATTRIB_DISPLAY_AS_HEX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_WILDCARD_COUNTER => 4294967295

    /**
     * @type {String}
     */
    static PERF_WILDCARD_INSTANCE => "*"

    /**
     * @type {String}
     */
    static PERF_AGGREGATE_INSTANCE => "_Total"

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_MAX_INSTANCE_NAME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_ADD_COUNTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_REMOVE_COUNTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_ENUM_INSTANCES => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COLLECT_START => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COLLECT_END => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_FILTER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DATA_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DATA_REVISION => 1

    /**
     * @type {Integer (Int32)}
     */
    static PERF_NO_INSTANCES => -1

    /**
     * @type {Integer (Int32)}
     */
    static PERF_METADATA_MULTIPLE_INSTANCES => -2

    /**
     * @type {Integer (Int32)}
     */
    static PERF_METADATA_NO_INSTANCES => -3

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_SIZE_DWORD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_SIZE_LARGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_SIZE_ZERO => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_SIZE_VARIABLE_LEN => 768

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_TYPE_NUMBER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_TYPE_COUNTER => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_TYPE_TEXT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_TYPE_ZERO => 3072

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_NUMBER_HEX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_NUMBER_DECIMAL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_NUMBER_DEC_1000 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTER_VALUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTER_RATE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTER_FRACTION => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTER_BASE => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTER_ELAPSED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTER_QUEUELEN => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTER_HISTOGRAM => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTER_PRECISION => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_TEXT_UNICODE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_TEXT_ASCII => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_TIMER_TICK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_TIMER_100NS => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_OBJECT_TIMER => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DELTA_COUNTER => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DELTA_BASE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_INVERSE_COUNTER => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_MULTI_COUNTER => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DISPLAY_NO_SUFFIX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DISPLAY_PER_SEC => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DISPLAY_PERCENT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DISPLAY_SECONDS => 805306368

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DISPLAY_NOSHOW => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_COUNTER_HISTOGRAM_TYPE => 2147483648

    /**
     * @type {Integer (Int32)}
     */
    static PERF_NO_UNIQUE_ID => -1

    /**
     * @type {Integer (Int32)}
     */
    static MAX_PERF_OBJECTS_IN_QUERY_FUNCTION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WINPERF_LOG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WINPERF_LOG_USER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WINPERF_LOG_DEBUG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WINPERF_LOG_VERBOSE => 3

    /**
     * @type {String}
     */
    static LIBID_SystemMonitor => "{1b773e42-2509-11cf-942f-008029004347}"

    /**
     * @type {String}
     */
    static DIID_DICounterItem => "{c08c4ff2-0e2e-11cf-942c-008029004347}"

    /**
     * @type {String}
     */
    static DIID_DILogFileItem => "{8d093ffc-f777-4917-82d1-833fbc54c58f}"

    /**
     * @type {String}
     */
    static DIID_DISystemMonitor => "{13d73d81-c32e-11cf-9398-00aa00a3ddea}"

    /**
     * @type {String}
     */
    static DIID_DISystemMonitorInternal => "{194eb242-c32c-11cf-9398-00aa00a3ddea}"

    /**
     * @type {String}
     */
    static DIID_DISystemMonitorEvents => "{84979930-4ab3-11cf-943a-008029004347}"

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CSTATUS_VALID_DATA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CSTATUS_NEW_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CSTATUS_NO_MACHINE => 2147485648

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CSTATUS_NO_INSTANCE => 2147485649

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_MORE_DATA => 2147485650

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CSTATUS_ITEM_NOT_VALIDATED => 2147485651

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_RETRY => 2147485652

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_NO_DATA => 2147485653

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CALC_NEGATIVE_DENOMINATOR => 2147485654

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CALC_NEGATIVE_TIMEBASE => 2147485655

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CALC_NEGATIVE_VALUE => 2147485656

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_DIALOG_CANCELLED => 2147485657

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_END_OF_LOG_FILE => 2147485658

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_ASYNC_QUERY_TIMEOUT => 2147485659

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CANNOT_SET_DEFAULT_REALTIME_DATASOURCE => 2147485660

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_UNABLE_MAP_NAME_FILES => 2147486677

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PLA_VALIDATION_WARNING => 2147486707

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CSTATUS_NO_OBJECT => 3221228472

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CSTATUS_NO_COUNTER => 3221228473

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CSTATUS_INVALID_DATA => 3221228474

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_MEMORY_ALLOCATION_FAILURE => 3221228475

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_INVALID_HANDLE => 3221228476

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_INVALID_ARGUMENT => 3221228477

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_FUNCTION_NOT_FOUND => 3221228478

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CSTATUS_NO_COUNTERNAME => 3221228479

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CSTATUS_BAD_COUNTERNAME => 3221228480

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_INVALID_BUFFER => 3221228481

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_INSUFFICIENT_BUFFER => 3221228482

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CANNOT_CONNECT_MACHINE => 3221228483

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_INVALID_PATH => 3221228484

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_INVALID_INSTANCE => 3221228485

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_INVALID_DATA => 3221228486

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_NO_DIALOG_DATA => 3221228487

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CANNOT_READ_NAME_STRINGS => 3221228488

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_FILE_CREATE_ERROR => 3221228489

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_FILE_OPEN_ERROR => 3221228490

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_NOT_FOUND => 3221228491

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_NO_MORE_DATA => 3221228492

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_ENTRY_NOT_IN_LOG_FILE => 3221228493

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_DATA_SOURCE_IS_LOG_FILE => 3221228494

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_DATA_SOURCE_IS_REAL_TIME => 3221228495

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_UNABLE_READ_LOG_HEADER => 3221228496

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_FILE_NOT_FOUND => 3221228497

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_FILE_ALREADY_EXISTS => 3221228498

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_NOT_IMPLEMENTED => 3221228499

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_STRING_NOT_FOUND => 3221228500

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_UNKNOWN_LOG_FORMAT => 3221228502

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_UNKNOWN_LOGSVC_COMMAND => 3221228503

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOGSVC_QUERY_NOT_FOUND => 3221228504

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOGSVC_NOT_OPENED => 3221228505

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_WBEM_ERROR => 3221228506

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_ACCESS_DENIED => 3221228507

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_FILE_TOO_SMALL => 3221228508

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_INVALID_DATASOURCE => 3221228509

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_INVALID_SQLDB => 3221228510

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_NO_COUNTERS => 3221228511

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_SQL_ALLOC_FAILED => 3221228512

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_SQL_ALLOCCON_FAILED => 3221228513

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_SQL_EXEC_DIRECT_FAILED => 3221228514

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_SQL_FETCH_FAILED => 3221228515

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_SQL_ROWCOUNT_FAILED => 3221228516

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_SQL_MORE_RESULTS_FAILED => 3221228517

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_SQL_CONNECT_FAILED => 3221228518

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_SQL_BIND_FAILED => 3221228519

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_CANNOT_CONNECT_WMI_SERVER => 3221228520

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PLA_COLLECTION_ALREADY_RUNNING => 3221228521

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PLA_ERROR_SCHEDULE_OVERLAP => 3221228522

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PLA_COLLECTION_NOT_FOUND => 3221228523

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PLA_ERROR_SCHEDULE_ELAPSED => 3221228524

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PLA_ERROR_NOSTART => 3221228525

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PLA_ERROR_ALREADY_EXISTS => 3221228526

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PLA_ERROR_TYPE_MISMATCH => 3221228527

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PLA_ERROR_FILEPATH => 3221228528

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PLA_SERVICE_ERROR => 3221228529

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PLA_VALIDATION_ERROR => 3221228530

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_PLA_ERROR_NAME_TOO_LONG => 3221228532

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_INVALID_SQL_LOG_FORMAT => 3221228533

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_COUNTER_ALREADY_IN_QUERY => 3221228534

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_BINARY_LOG_CORRUPT => 3221228535

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_SAMPLE_TOO_SMALL => 3221228536

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_OS_LATER_VERSION => 3221228537

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_OS_EARLIER_VERSION => 3221228538

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_INCORRECT_APPEND_TIME => 3221228539

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_UNMATCHED_APPEND_COUNTER => 3221228540

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_SQL_ALTER_DETAIL_FAILED => 3221228541

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_QUERY_PERF_DATA_TIMEOUT => 3221228542

    /**
     * @type {Integer (UInt32)}
     */
    static PLA_CAPABILITY_LOCAL => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static PLA_CAPABILITY_V1_SVC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PLA_CAPABILITY_V1_SESSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PLA_CAPABILITY_V1_SYSTEM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PLA_CAPABILITY_LEGACY_SESSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PLA_CAPABILITY_LEGACY_SVC => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PLA_CAPABILITY_AUTOLOGGER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PLAL_ALERT_CMD_LINE_SINGLE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PLAL_ALERT_CMD_LINE_A_NAME => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PLAL_ALERT_CMD_LINE_C_NAME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PLAL_ALERT_CMD_LINE_D_TIME => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PLAL_ALERT_CMD_LINE_L_VAL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PLAL_ALERT_CMD_LINE_M_VAL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PLAL_ALERT_CMD_LINE_U_TEXT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static PLAL_ALERT_CMD_LINE_MASK => 32512

    /**
     * @type {String}
     */
    static S_PDH => "{04d66358-c4a1-419b-8023-23b73902de2c}"
;@endregion Constants

;@region Methods
    /**
     * Retrieves the current value of the performance counter, which is a high resolution (&lt;1us) time stamp that can be used for time-interval measurements.
     * @param {Pointer<Int64>} lpPerformanceCount A pointer to a variable that receives the current performance-counter value, in counts.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. On systems that run Windows XP or later, the function will always succeed and will thus never return zero.
     * @see https://docs.microsoft.com/windows/win32/api//profileapi/nf-profileapi-queryperformancecounter
     * @since windows5.0
     */
    static QueryPerformanceCounter(lpPerformanceCount) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryPerformanceCounter", "int64*", lpPerformanceCount, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the frequency of the performance counter.
     * @param {Pointer<Int64>} lpFrequency A pointer to a variable that receives the current performance-counter frequency, in counts per second. If the installed hardware doesn't support a high-resolution performance counter, this parameter can be zero (this will not occur on systems that run Windows XP or later).
     * @returns {BOOL} If the installed hardware supports a high-resolution performance counter, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. On systems that run Windows XP or later, the function will always succeed and will thus never return zero.
     * @see https://docs.microsoft.com/windows/win32/api//profileapi/nf-profileapi-queryperformancefrequency
     * @since windows5.0
     */
    static QueryPerformanceFrequency(lpFrequency) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\QueryPerformanceFrequency", "int64*", lpFrequency, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Installs performance counter strings, as defined in an input .ini file, into the system registry.
     * @param {PWSTR} szComputerName The name of the system. This should be <b>NULL</b> because this function cannot be used to install remotely.
     * @param {PWSTR} lpIniFile The name of the initialization file that contains definitions to  add to the registry.
     * @param {Pointer} dwFlags This parameter can be <b>LOADPERF_FLAGS_DISPLAY_USER_MSGS</b> (<c>(ULONG_PTR) 8</c>).
     * @returns {Integer} If the function is successful, it returns <b>TRUE</b> and posts additional information in  an application event log. Otherwise, it returns an error code that represents the condition that caused the failure.
     * @see https://docs.microsoft.com/windows/win32/api//loadperf/nf-loadperf-installperfdllw
     */
    static InstallPerfDllW(szComputerName, lpIniFile, dwFlags) {
        szComputerName := szComputerName is String ? StrPtr(szComputerName) : szComputerName
        lpIniFile := lpIniFile is String ? StrPtr(lpIniFile) : lpIniFile

        result := DllCall("loadperf.dll\InstallPerfDllW", "ptr", szComputerName, "ptr", lpIniFile, "ptr", dwFlags, "uint")
        return result
    }

    /**
     * Installs performance counter strings, as defined in an input .ini file, into the system registry.
     * @param {PSTR} szComputerName The name of the system. This should be <b>NULL</b> because this function cannot be used to install remotely.
     * @param {PSTR} lpIniFile The name of the initialization file that contains definitions to  add to the registry.
     * @param {Pointer} dwFlags This parameter can be <b>LOADPERF_FLAGS_DISPLAY_USER_MSGS</b> (<c>(ULONG_PTR) 8</c>).
     * @returns {Integer} If the function is successful, it returns <b>TRUE</b> and posts additional information in  an application event log. Otherwise, it returns an error code that represents the condition that caused the failure.
     * @see https://docs.microsoft.com/windows/win32/api//loadperf/nf-loadperf-installperfdlla
     */
    static InstallPerfDllA(szComputerName, lpIniFile, dwFlags) {
        szComputerName := szComputerName is String ? StrPtr(szComputerName) : szComputerName
        lpIniFile := lpIniFile is String ? StrPtr(lpIniFile) : lpIniFile

        result := DllCall("loadperf.dll\InstallPerfDllA", "ptr", szComputerName, "ptr", lpIniFile, "ptr", dwFlags, "uint")
        return result
    }

    /**
     * Loads onto the computer the performance objects and counters defined in the specified initialization file.
     * @param {PSTR} lpCommandLine Null-terminated string that consists of one or more arbitrary letters, a space, and then the name of the initialization (.ini) file. The name can include the path to the initialization file. 
     * 
     * The function uses only the initialization file; the first argument is discarded. For example, to load an initialization file called "myfile.ini", the <i>commandLine</i> string could be "xx myfile.ini". The letters before the space (here "xx")  are discarded, and the second part, following the space, is interpreted as the initialization file specification.
     * @param {BOOL} bQuietModeArg Set to <b>TRUE</b> to prevent the function from displaying the output from the  <b>Lodctr</b> tool; otherwise, <b>FALSE</b>. This parameter has meaning only if the application is run from a command prompt.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//loadperf/nf-loadperf-loadperfcountertextstringsa
     * @since windows5.1.2600
     */
    static LoadPerfCounterTextStringsA(lpCommandLine, bQuietModeArg) {
        lpCommandLine := lpCommandLine is String ? StrPtr(lpCommandLine) : lpCommandLine

        result := DllCall("loadperf.dll\LoadPerfCounterTextStringsA", "ptr", lpCommandLine, "ptr", bQuietModeArg, "uint")
        return result
    }

    /**
     * Loads onto the computer the performance objects and counters defined in the specified initialization file.
     * @param {PWSTR} lpCommandLine Null-terminated string that consists of one or more arbitrary letters, a space, and then the name of the initialization (.ini) file. The name can include the path to the initialization file. 
     * 
     * The function uses only the initialization file; the first argument is discarded. For example, to load an initialization file called "myfile.ini", the <i>commandLine</i> string could be "xx myfile.ini". The letters before the space (here "xx")  are discarded, and the second part, following the space, is interpreted as the initialization file specification.
     * @param {BOOL} bQuietModeArg Set to <b>TRUE</b> to prevent the function from displaying the output from the  <b>Lodctr</b> tool; otherwise, <b>FALSE</b>. This parameter has meaning only if the application is run from a command prompt.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//loadperf/nf-loadperf-loadperfcountertextstringsw
     * @since windows5.1.2600
     */
    static LoadPerfCounterTextStringsW(lpCommandLine, bQuietModeArg) {
        lpCommandLine := lpCommandLine is String ? StrPtr(lpCommandLine) : lpCommandLine

        result := DllCall("loadperf.dll\LoadPerfCounterTextStringsW", "ptr", lpCommandLine, "ptr", bQuietModeArg, "uint")
        return result
    }

    /**
     * Unloads performance objects and counters from the computer for the specified application.
     * @param {PWSTR} lpCommandLine Null-terminated string that consists of one or more arbitrary letters, a space, and then the name of the application. The name of the application must match the <b>drivername</b> key value found in the initialization (.ini) file used to <a href="https://docs.microsoft.com/windows/desktop/api/loadperf/nf-loadperf-loadperfcountertextstringsa">load the text strings</a>.
     * @param {BOOL} bQuietModeArg Set to <b>TRUE</b> to prevent the function from displaying the output from the  <b>Unlodctr</b> tool; otherwise, <b>FALSE</b>. This parameter has meaning only if the application is run from a command prompt.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//loadperf/nf-loadperf-unloadperfcountertextstringsw
     * @since windows5.1.2600
     */
    static UnloadPerfCounterTextStringsW(lpCommandLine, bQuietModeArg) {
        lpCommandLine := lpCommandLine is String ? StrPtr(lpCommandLine) : lpCommandLine

        result := DllCall("loadperf.dll\UnloadPerfCounterTextStringsW", "ptr", lpCommandLine, "ptr", bQuietModeArg, "uint")
        return result
    }

    /**
     * Unloads performance objects and counters from the computer for the specified application.
     * @param {PSTR} lpCommandLine Null-terminated string that consists of one or more arbitrary letters, a space, and then the name of the application. The name of the application must match the <b>drivername</b> key value found in the initialization (.ini) file used to <a href="https://docs.microsoft.com/windows/desktop/api/loadperf/nf-loadperf-loadperfcountertextstringsa">load the text strings</a>.
     * @param {BOOL} bQuietModeArg Set to <b>TRUE</b> to prevent the function from displaying the output from the  <b>Unlodctr</b> tool; otherwise, <b>FALSE</b>. This parameter has meaning only if the application is run from a command prompt.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//loadperf/nf-loadperf-unloadperfcountertextstringsa
     * @since windows5.1.2600
     */
    static UnloadPerfCounterTextStringsA(lpCommandLine, bQuietModeArg) {
        lpCommandLine := lpCommandLine is String ? StrPtr(lpCommandLine) : lpCommandLine

        result := DllCall("loadperf.dll\UnloadPerfCounterTextStringsA", "ptr", lpCommandLine, "ptr", bQuietModeArg, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} szNewCtrFilePath 
     * @param {PSTR} szNewHlpFilePath 
     * @param {PSTR} szLanguageID 
     * @param {Pointer} dwModes 
     * @returns {Integer} 
     */
    static UpdatePerfNameFilesA(szNewCtrFilePath, szNewHlpFilePath, szLanguageID, dwModes) {
        szNewCtrFilePath := szNewCtrFilePath is String ? StrPtr(szNewCtrFilePath) : szNewCtrFilePath
        szNewHlpFilePath := szNewHlpFilePath is String ? StrPtr(szNewHlpFilePath) : szNewHlpFilePath
        szLanguageID := szLanguageID is String ? StrPtr(szLanguageID) : szLanguageID

        result := DllCall("loadperf.dll\UpdatePerfNameFilesA", "ptr", szNewCtrFilePath, "ptr", szNewHlpFilePath, "ptr", szLanguageID, "ptr", dwModes, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} szNewCtrFilePath 
     * @param {PWSTR} szNewHlpFilePath 
     * @param {PWSTR} szLanguageID 
     * @param {Pointer} dwModes 
     * @returns {Integer} 
     */
    static UpdatePerfNameFilesW(szNewCtrFilePath, szNewHlpFilePath, szLanguageID, dwModes) {
        szNewCtrFilePath := szNewCtrFilePath is String ? StrPtr(szNewCtrFilePath) : szNewCtrFilePath
        szNewHlpFilePath := szNewHlpFilePath is String ? StrPtr(szNewHlpFilePath) : szNewHlpFilePath
        szLanguageID := szLanguageID is String ? StrPtr(szLanguageID) : szLanguageID

        result := DllCall("loadperf.dll\UpdatePerfNameFilesW", "ptr", szNewCtrFilePath, "ptr", szNewHlpFilePath, "ptr", szLanguageID, "ptr", dwModes, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} szReserved 
     * @param {PSTR} szServiceName 
     * @returns {Integer} 
     */
    static SetServiceAsTrustedA(szReserved, szServiceName) {
        szReserved := szReserved is String ? StrPtr(szReserved) : szReserved
        szServiceName := szServiceName is String ? StrPtr(szServiceName) : szServiceName

        result := DllCall("loadperf.dll\SetServiceAsTrustedA", "ptr", szReserved, "ptr", szServiceName, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} szReserved 
     * @param {PWSTR} szServiceName 
     * @returns {Integer} 
     */
    static SetServiceAsTrustedW(szReserved, szServiceName) {
        szReserved := szReserved is String ? StrPtr(szReserved) : szReserved
        szServiceName := szServiceName is String ? StrPtr(szServiceName) : szServiceName

        result := DllCall("loadperf.dll\SetServiceAsTrustedW", "ptr", szReserved, "ptr", szServiceName, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} szFileName 
     * @param {PWSTR} szCommentString 
     * @returns {Integer} 
     */
    static BackupPerfRegistryToFileW(szFileName, szCommentString) {
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName
        szCommentString := szCommentString is String ? StrPtr(szCommentString) : szCommentString

        result := DllCall("loadperf.dll\BackupPerfRegistryToFileW", "ptr", szFileName, "ptr", szCommentString, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} szFileName 
     * @param {PWSTR} szLangId 
     * @returns {Integer} 
     */
    static RestorePerfRegistryFromFileW(szFileName, szLangId) {
        szFileName := szFileName is String ? StrPtr(szFileName) : szFileName
        szLangId := szLangId is String ? StrPtr(szLangId) : szLangId

        result := DllCall("loadperf.dll\RestorePerfRegistryFromFileW", "ptr", szFileName, "ptr", szLangId, "uint")
        return result
    }

    /**
     * Registers the provider.
     * @param {Pointer<Guid>} ProviderGuid GUID that uniquely identifies the provider. The <b>providerGuid</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element specifies the GUID.
     * @param {Pointer<PERFLIBREQUEST>} ControlCallback <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nc-perflib-perflibrequest">ControlCallback</a> function that PERFLIB calls to notify you of consumer requests, such as a request to add or remove counters from the query. This parameter is set if the <b>callback</b> attribute of the <b>counters</b> element is "custom"; otherwise, <b>NULL</b>.
     * @param {Pointer<HANDLE>} phProvider Handle to the provider. You must call <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstopprovider">PerfStopProvider</a> to release resources associated with the handle.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfstartprovider
     * @since windows6.0.6000
     */
    static PerfStartProvider(ProviderGuid, ControlCallback, phProvider) {
        result := DllCall("ADVAPI32.dll\PerfStartProvider", "ptr", ProviderGuid, "ptr", ControlCallback, "ptr", phProvider, "uint")
        return result
    }

    /**
     * Registers the provider.
     * @param {Pointer<Guid>} ProviderGuid GUID that uniquely identifies the provider. The <b>providerGuid</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element specifies the GUID.
     * @param {Pointer<PERF_PROVIDER_CONTEXT>} ProviderContext A <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_provider_context">PERF_PROVIDER_CONTEXT</a> structure that contains pointers to the control callback, memory management routines, and context information.
     * @param {Pointer<HANDLE>} Provider Handle to the provider. You must call <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstopprovider">PerfStopProvider</a> to release resources associated with the handle.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfstartproviderex
     * @since windows6.0.6000
     */
    static PerfStartProviderEx(ProviderGuid, ProviderContext, Provider) {
        result := DllCall("ADVAPI32.dll\PerfStartProviderEx", "ptr", ProviderGuid, "ptr", ProviderContext, "ptr", Provider, "uint")
        return result
    }

    /**
     * Removes the provider's registration from the list of registered providers and frees all resources associated with the provider.
     * @param {HANDLE} ProviderHandle Handle to the provider.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfstopprovider
     * @since windows6.0.6000
     */
    static PerfStopProvider(ProviderHandle) {
        ProviderHandle := ProviderHandle is Win32Handle ? NumGet(ProviderHandle, "ptr") : ProviderHandle

        result := DllCall("ADVAPI32.dll\PerfStopProvider", "ptr", ProviderHandle, "uint")
        return result
    }

    /**
     * Specifies the layout of a particular counter set.
     * @param {HANDLE} ProviderHandle The handle of the provider. Use the handle variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element.
     * 
     * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstartprovider">PerfStartProvider</a> function returns the handle.
     * @param {Pointer} Template Buffer that contains the counter set information. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_info">PERF_COUNTERSET_INFO</a>.
     * @param {Integer} TemplateSize Size, in bytes, of the <i>pTemplate</i> buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfsetcountersetinfo
     * @since windows6.0.6000
     */
    static PerfSetCounterSetInfo(ProviderHandle, Template, TemplateSize) {
        ProviderHandle := ProviderHandle is Win32Handle ? NumGet(ProviderHandle, "ptr") : ProviderHandle

        result := DllCall("ADVAPI32.dll\PerfSetCounterSetInfo", "ptr", ProviderHandle, "ptr", Template, "uint", TemplateSize, "uint")
        return result
    }

    /**
     * Creates an instance of the specified counter set.
     * @param {HANDLE} ProviderHandle The handle of the provider. Use the handle variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element.
     * 
     * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstartprovider">PerfStartProvider</a> function returns the handle.
     * @param {Pointer<Guid>} CounterSetGuid GUID that uniquely identifies the counter set that you want to create an instance of. This is the same GUID specified in the <b>guid</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-counters-counterset--provider--element">counterSet</a> element. Use the GUID variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <b>counterSet</b> element.
     * 
     * <b>Windows Vista:  </b>The GUID variable is not available.
     * @param {PWSTR} Name <b>Null</b>-terminated Unicode string that contains a unique name for this instance.
     * @param {Integer} Id Unique identifier for this instance of the counter set. The identifier can be a serial number that you increment for each new instance.
     * @returns {Pointer<PERF_COUNTERSET_INSTANCE>} A <a href="/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> structure that contains the instance of the counter set or <b>NULL</b> if PERFLIB could not create the instance. Cache this pointer to use in later calls instead of calling <a href="/windows/desktop/api/perflib/nf-perflib-perfqueryinstance">PerfQueryInstance</a> to retrieve the pointer to the instance.
     * 
     * This function returns <b>NULL</b> if an error occurred. To determine the error that occurred, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfcreateinstance
     * @since windows6.0.6000
     */
    static PerfCreateInstance(ProviderHandle, CounterSetGuid, Name, Id) {
        Name := Name is String ? StrPtr(Name) : Name
        ProviderHandle := ProviderHandle is Win32Handle ? NumGet(ProviderHandle, "ptr") : ProviderHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\PerfCreateInstance", "ptr", ProviderHandle, "ptr", CounterSetGuid, "ptr", Name, "uint", Id, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes an instance of the counter set created by the PerfCreateInstance function.
     * @param {HANDLE} Provider The handle of the provider. Use the handle variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element.
     * 
     * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstartprovider">PerfStartProvider</a> function returns the handle.
     * @param {Pointer<PERF_COUNTERSET_INSTANCE>} InstanceBlock A <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> structure that contains the instance of the counter set to delete.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfdeleteinstance
     * @since windows6.0.6000
     */
    static PerfDeleteInstance(Provider, InstanceBlock) {
        Provider := Provider is Win32Handle ? NumGet(Provider, "ptr") : Provider

        result := DllCall("ADVAPI32.dll\PerfDeleteInstance", "ptr", Provider, "ptr", InstanceBlock, "uint")
        return result
    }

    /**
     * Retrieves a pointer to the specified counter set instance. Providers use this function.
     * @param {HANDLE} ProviderHandle The handle of the provider. Use the handle variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element.
     * 
     * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstartprovider">PerfStartProvider</a> function returns the handle.
     * @param {Pointer<Guid>} CounterSetGuid GUID that uniquely identifies the counter set that you want to query. This is the same GUID specified in the <b>guid</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-counters-counterset--provider--element">counterSet</a> element. Use the GUID variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <b>counterSet</b> element.
     * 
     * <b>Windows Vista:  </b>The GUID variable is not available.
     * @param {PWSTR} Name <b>Null</b>-terminated Unicode string that contains the name of counter set instance that you want to retrieve.
     * @param {Integer} Id Unique identifier of the counter set instance that you want to retrieve.
     * @returns {Pointer<PERF_COUNTERSET_INSTANCE>} A <a href="/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> structure that contains the counter set instance or <b>NULL</b> if the instance does not exist.
     * 
     * This function returns <b>NULL</b> if an error occurred. To determine the error that occurred, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfqueryinstance
     * @since windows6.0.6000
     */
    static PerfQueryInstance(ProviderHandle, CounterSetGuid, Name, Id) {
        Name := Name is String ? StrPtr(Name) : Name
        ProviderHandle := ProviderHandle is Win32Handle ? NumGet(ProviderHandle, "ptr") : ProviderHandle

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\PerfQueryInstance", "ptr", ProviderHandle, "ptr", CounterSetGuid, "ptr", Name, "uint", Id, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Updates the value of a counter whose value is a pointer to the actual data. Providers use this function.
     * @param {HANDLE} Provider The handle of the provider. Use the handle variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element.
     * 
     * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstartprovider">PerfStartProvider</a> function returns the handle.
     * @param {Pointer<PERF_COUNTERSET_INSTANCE>} Instance A <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> structure that contains the counter set instance. The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfcreateinstance">PerfCreateInstance</a> function returns this pointer.
     * @param {Integer} CounterId Identifier that uniquely identifies the counter to update in the instance block. The identifier is defined in the <b>id</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-counters-counter--counterset--element">counter</a> element and must match the <b>CounterId</b> member of one of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_info">PERF_COUNTER_INFO</a> structures in the instance block. Use the counter ID constant that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the constant, see the <b>symbol</b> attribute of the <b>counter</b> element.
     * 
     * <b>Windows Vista:  </b>The counter ID constant is not available.
     * @param {Pointer<Void>} Address Pointer to the actual counter data. 
     * 
     * If <b>NULL</b>, the consumer receives ERROR_NO_DATA.
     * 
     * To indicate that the counter data is accessed by reference, the counter declaration in the manifest must include a <a href="https://docs.microsoft.com/previous-versions/aa371909(v=vs.85)">counterAttribute</a> element whose <b>name</b> attribute is set to "reference".
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfsetcounterrefvalue
     * @since windows6.0.6000
     */
    static PerfSetCounterRefValue(Provider, Instance, CounterId, Address) {
        Provider := Provider is Win32Handle ? NumGet(Provider, "ptr") : Provider

        result := DllCall("ADVAPI32.dll\PerfSetCounterRefValue", "ptr", Provider, "ptr", Instance, "uint", CounterId, "ptr", Address, "uint")
        return result
    }

    /**
     * Updates the value of a counter whose value is a 4-byte unsigned integer. Providers use this function.
     * @param {HANDLE} Provider The handle of the provider. Use the handle variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element.
     * 
     * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstartprovider">PerfStartProvider</a> function returns the handle.
     * @param {Pointer<PERF_COUNTERSET_INSTANCE>} Instance A <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> structure that contains the counter set instance. The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfcreateinstance">PerfCreateInstance</a> function returns this pointer.
     * @param {Integer} CounterId Identifier that uniquely identifies the counter to update in the instance block. The identifier is defined in the <b>id</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-counters-counter--counterset--element">counter</a> element and must match the <b>CounterId</b> member of one of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_info">PERF_COUNTER_INFO</a> structures in the instance block. Use the counter ID constant that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the constant, see the <b>symbol</b> attribute of the <b>counter</b> element.
     * 
     * <b>Windows Vista:  </b>The counter ID constant is not available.
     * @param {Integer} Value New 4-byte counter value.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfsetulongcountervalue
     * @since windows6.0.6000
     */
    static PerfSetULongCounterValue(Provider, Instance, CounterId, Value) {
        Provider := Provider is Win32Handle ? NumGet(Provider, "ptr") : Provider

        result := DllCall("ADVAPI32.dll\PerfSetULongCounterValue", "ptr", Provider, "ptr", Instance, "uint", CounterId, "uint", Value, "uint")
        return result
    }

    /**
     * Updates the value of a counter whose value is an 8-byte unsigned integer. Providers use this function.
     * @param {HANDLE} Provider The handle of the provider. Use the handle variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element.
     * 
     * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstartprovider">PerfStartProvider</a> function returns the handle.
     * @param {Pointer<PERF_COUNTERSET_INSTANCE>} Instance A <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> structure that contains the counter set instance. The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfcreateinstance">PerfCreateInstance</a> function returns this pointer.
     * @param {Integer} CounterId Identifier that uniquely identifies the counter to update in the instance block. The identifier is defined in the <b>id</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-counters-counter--counterset--element">counter</a> element and must match the <b>CounterId</b> member of one of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_info">PERF_COUNTER_INFO</a> structures in the instance block. Use the counter ID constant that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the constant, see the <b>symbol</b> attribute of the <b>counter</b> element.
     * 
     * <b>Windows Vista:  </b>The counter ID constant is not available.
     * @param {Integer} Value New 8-byte counter value.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfsetulonglongcountervalue
     * @since windows6.0.6000
     */
    static PerfSetULongLongCounterValue(Provider, Instance, CounterId, Value) {
        Provider := Provider is Win32Handle ? NumGet(Provider, "ptr") : Provider

        result := DllCall("ADVAPI32.dll\PerfSetULongLongCounterValue", "ptr", Provider, "ptr", Instance, "uint", CounterId, "uint", Value, "uint")
        return result
    }

    /**
     * Increments the value of a counter whose value is a 4-byte unsigned integer. Providers use this function.
     * @param {HANDLE} Provider The handle of the provider. Use the handle variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element.
     * 
     * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstartprovider">PerfStartProvider</a> function returns the handle.
     * @param {Pointer<PERF_COUNTERSET_INSTANCE>} Instance A <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> structure that contains the counter set instance. The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfcreateinstance">PerfCreateInstance</a> function returns this pointer.
     * @param {Integer} CounterId Identifier that uniquely identifies the counter to update in the instance block. The identifier is defined in the <b>id</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-counters-counter--counterset--element">counter</a> element and must match the <b>CounterId</b> member of one of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_info">PERF_COUNTER_INFO</a> structures in the instance block. Use the counter ID constant that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the constant, see the <b>symbol</b> attribute of the <b>counter</b> element.
     * 
     * <b>Windows Vista:  </b>The counter ID constant is not available.
     * @param {Integer} Value Value by which to increment the counter.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfincrementulongcountervalue
     * @since windows6.0.6000
     */
    static PerfIncrementULongCounterValue(Provider, Instance, CounterId, Value) {
        Provider := Provider is Win32Handle ? NumGet(Provider, "ptr") : Provider

        result := DllCall("ADVAPI32.dll\PerfIncrementULongCounterValue", "ptr", Provider, "ptr", Instance, "uint", CounterId, "uint", Value, "uint")
        return result
    }

    /**
     * Increments the value of a counter whose value is an 8-byte unsigned integer. Providers use this function.
     * @param {HANDLE} Provider The handle of the provider. Use the handle variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element.
     * 
     * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstartprovider">PerfStartProvider</a> function returns the handle.
     * @param {Pointer<PERF_COUNTERSET_INSTANCE>} Instance A <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> structure that contains the counter set instance. The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfcreateinstance">PerfCreateInstance</a> function returns this pointer.
     * @param {Integer} CounterId Identifier that uniquely identifies the counter to update in the instance block. The identifier is defined in the <b>id</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-counters-counter--counterset--element">counter</a> element and must match the <b>CounterId</b> member of one of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_info">PERF_COUNTER_INFO</a> structures in the instance block. Use the counter ID constant that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the constant, see the <b>symbol</b> attribute of the <b>counter</b> element.
     * 
     * <b>Windows Vista:  </b>The counter ID constant is not available.
     * @param {Integer} Value Value by which to increment the counter.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfincrementulonglongcountervalue
     * @since windows6.0.6000
     */
    static PerfIncrementULongLongCounterValue(Provider, Instance, CounterId, Value) {
        Provider := Provider is Win32Handle ? NumGet(Provider, "ptr") : Provider

        result := DllCall("ADVAPI32.dll\PerfIncrementULongLongCounterValue", "ptr", Provider, "ptr", Instance, "uint", CounterId, "uint", Value, "uint")
        return result
    }

    /**
     * Decrements the value of a counter whose value is a 4-byte unsigned integer. Providers use this function.
     * @param {HANDLE} Provider The handle of the provider. Use the handle variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element.
     * 
     * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstartprovider">PerfStartProvider</a> function returns the handle.
     * @param {Pointer<PERF_COUNTERSET_INSTANCE>} Instance A <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> structure that contains the counter set instance. The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfcreateinstance">PerfCreateInstance</a> function returns this pointer.
     * @param {Integer} CounterId Identifier that uniquely identifies the counter to update in the instance block. The identifier is defined in the <b>id</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-counters-counter--counterset--element">counter</a> element and must match the <b>CounterId</b> member of one of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_info">PERF_COUNTER_INFO</a> structures in the instance block. Use the counter ID constant that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the constant, see the <b>symbol</b> attribute of the <b>counter</b> element.
     * 
     * <b>Windows Vista:  </b>The counter ID constant is not available.
     * @param {Integer} Value Value by which to decrement the counter.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfdecrementulongcountervalue
     * @since windows6.0.6000
     */
    static PerfDecrementULongCounterValue(Provider, Instance, CounterId, Value) {
        Provider := Provider is Win32Handle ? NumGet(Provider, "ptr") : Provider

        result := DllCall("ADVAPI32.dll\PerfDecrementULongCounterValue", "ptr", Provider, "ptr", Instance, "uint", CounterId, "uint", Value, "uint")
        return result
    }

    /**
     * Decrements the value of a counter whose value is an 8-byte unsigned integer. Providers use this function.
     * @param {HANDLE} Provider The handle of the provider. Use the handle variable that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the variable, see the <b>symbol</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element.
     * 
     * <b>Windows Vista:  </b>The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfstartprovider">PerfStartProvider</a> function returns the handle.
     * @param {Pointer<PERF_COUNTERSET_INSTANCE>} Instance A <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> structure that contains the counter set instance. The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfcreateinstance">PerfCreateInstance</a> function returns this pointer.
     * @param {Integer} CounterId Identifier that uniquely identifies the counter to update in the instance block. The identifier is defined in the <b>id</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-counters-counter--counterset--element">counter</a> element and must match the <b>CounterId</b> member of one of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_info">PERF_COUNTER_INFO</a> structures in the instance block. Use the counter ID constant that the <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a> tool generated for you. For the name of the constant, see the <b>symbol</b> attribute of the <b>counter</b> element.
     * 
     * <b>Windows Vista:  </b>The counter ID constant is not available.
     * @param {Integer} Value Value by which to decrement the counter.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfdecrementulonglongcountervalue
     * @since windows6.0.6000
     */
    static PerfDecrementULongLongCounterValue(Provider, Instance, CounterId, Value) {
        Provider := Provider is Win32Handle ? NumGet(Provider, "ptr") : Provider

        result := DllCall("ADVAPI32.dll\PerfDecrementULongLongCounterValue", "ptr", Provider, "ptr", Instance, "uint", CounterId, "uint", Value, "uint")
        return result
    }

    /**
     * Gets the counter set identifiers of the counter sets that are registered on the specified system. Counter set identifiers are globally unique identifiers (GUIDs).
     * @param {PWSTR} szMachine The name of the machine for which to get the counter set identifiers. If NULL, the function retrieves the counter set identifiers for the local machine.
     * @param {Pointer<Guid>} pCounterSetIds A pointer to a buffer that has enough space to receive the number of GUIDs that the <i>cCounterSetIds</i> parameter specifies. May be NULL if  
     * 
     * <i>cCounterSetIds</i> is 0.
     * @param {Integer} cCounterSetIds The size of the buffer that the <i>pCounterSetIds</i> parameter specifies, measured in GUIDs.
     * @param {Pointer<UInt32>} pcCounterSetIdsActual The size of the buffer actually required to get the counter set identifiers. The meaning depends on the value that the function  
     * 
     * returns.
     * 
     * <table>
     * <tr>
     * <th>Function  Return Value</th>
     * <th>Meaning of <i>pcCounterSetIdsActual</i></th>
     * </tr>
     * <tr>
     * <td><b>ERROR_SUCCESS</b></td>
     * <td>The number of  
     * 
     *   GUIDs that the function stored in the buffer that <i>pCounterSetIds</i> specified.</td>
     * </tr>
     * <tr>
     * <td><b> ERROR_NOT_ENOUGH_MEMORY</b></td>
     * <td>The  
     * 
     *   size (in GUIDs) of the buffer required. Enlarge the buffer to the required  
     * 
     *   size and call the function again.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Other</td>
     * <td>The value is undefined and should not be used.</td>
     * </tr>
     * </table>
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function successfully stored all of the content set identifiers in the buffer that <i>pCounterSetIds</i> specified. The value that <i>pcCounterSetIdsActual</i> points to indicates the number of counter set identifiers actually stored in the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The buffer that <i>pCounterSetIds</i> specified was not large enough to store all of the counter set identifiers for the counter sets on the specified system.  The value that <i>pcCounterSetIdsActual</i> points to  indicates the size of the buffer required to store all of the counter set identifiers. Enlarge the buffer to the required  
     * 
     *   size and call the function again.  
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For other types of failures, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfenumeratecounterset
     * @since windows10.0.14393
     */
    static PerfEnumerateCounterSet(szMachine, pCounterSetIds, cCounterSetIds, pcCounterSetIdsActual) {
        szMachine := szMachine is String ? StrPtr(szMachine) : szMachine

        result := DllCall("ADVAPI32.dll\PerfEnumerateCounterSet", "ptr", szMachine, "ptr", pCounterSetIds, "uint", cCounterSetIds, "uint*", pcCounterSetIdsActual, "uint")
        return result
    }

    /**
     * Gets the names and identifiers of the active instances of a counter set on the specified system.
     * @param {PWSTR} szMachine The name of the machine for which to get the information about the active instances of the counter set  that the <i>pCounterSet</i> parameter specifies. If NULL, the function retrieves information about the active instances of the specified counter set for the local machine.
     * @param {Pointer<Guid>} pCounterSetId The counter set identifier of the counter set for which you want to get the information about of the active instances.
     * @param {Pointer} pInstances Pointer to a buffer that is large enough to receive the amount of data that the <i>cbInstances</i> parameter specifies. May be  
     * 
     * NULL if <i>cbInstances</i> is 0.
     * @param {Integer} cbInstances The size of the buffer that the  <i>pInstances</i> parameter specifies,  in bytes.
     * @param {Pointer<UInt32>} pcbInstancesActual The size of the buffer actually required to get the information about of the active instances. The meaning depends on the value that the function  
     * 
     * returns.
     * 
     * <table>
     * <tr>
     * <th>Function  Return Value</th>
     * <th>Meaning of <i>pcbInstancesActual</i></th>
     * </tr>
     * <tr>
     * <td><b>ERROR_SUCCESS</b></td>
     * <td>The number of  
     * 
     *   bytes of information about the active instances of the specified counter set that the function stored in the buffer that <i>pInstances</i> specified.</td>
     * </tr>
     * <tr>
     * <td><b> ERROR_NOT_ENOUGH_MEMORY</b></td>
     * <td>The  
     * 
     *   size of the buffer required to store the information about the active instances of the counter set on the specified machine, in bytes. Enlarge the buffer to the required  
     * 
     *   size and call the function again.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Other</td>
     * <td>The value is undefined and should not be used.</td>
     * </tr>
     * </table>
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function successfully stored all of the information about the active instances of the counter set in the buffer that <i>pInstances</i> specified. The value that <i>pcbInstancesActual</i> points to indicates amount of information actually stored in the buffer, in bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The buffer that <i>pInstances</i> specified was not large enough to store all of the information about the active instances of the counter set.  The value that <i>pcbInstancesActual</i> points to  indicates the size of the buffer required to store all of the information. Enlarge the buffer to the required  
     * 
     *   size and call the function again.  
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For other types of failures, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfenumeratecountersetinstances
     * @since windows10.0.14393
     */
    static PerfEnumerateCounterSetInstances(szMachine, pCounterSetId, pInstances, cbInstances, pcbInstancesActual) {
        szMachine := szMachine is String ? StrPtr(szMachine) : szMachine

        result := DllCall("ADVAPI32.dll\PerfEnumerateCounterSetInstances", "ptr", szMachine, "ptr", pCounterSetId, "ptr", pInstances, "uint", cbInstances, "uint*", pcbInstancesActual, "uint")
        return result
    }

    /**
     * Gets information about a counter set on the specified system.
     * @param {PWSTR} szMachine The name of the machine for which to get the information about the counter set  that the <i>pCounterSet</i> parameter specifies. If NULL, the function retrieves information about the specified counter set for the local machine.
     * @param {Pointer<Guid>} pCounterSetId The counter set identifier of the counter set for which you want to get information.
     * @param {Integer} requestCode The type of information that you want to get about the counter set. See <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ne-perflib-perfreginfotype">PerfRegInfoType</a> for a list of possible values.
     * @param {Integer} requestLangId The preferred locale identifier for the strings that contain the requested information if <i>requestCode</i> is <b>PERF_REG_COUNTERSET_NAME_STRING</b>,  
     * 
     * <b>PERF_REG_COUNTERSET_HELP_STRING</b>, <b>PERF_REG_COUNTER_NAME_STRINGS</b>, or  
     * 
     * <b>PERF_REG_COUNTER_HELP_STRINGS</b>.
     * 
     * The counter identifier of the counter for which you want data, if <i>requestCode</i> is <b>PERF_REG_COUNTER_STRUCT</b>. 
     * 
     * Set to 0 for all other values of <i>requestCode</i>.
     * @param {Pointer} pbRegInfo Pointer to a buffer that is large enough to receive the amount of data that the <i>cbRegInfo</i> parameter specifies, in bytes. May be  
     * 
     * NULL if <i>cbRegInfo</i> is 0.
     * @param {Integer} cbRegInfo The size of the buffer that the <i>pbRegInfo</i> parameter specifies, in bytes.
     * @param {Pointer<UInt32>} pcbRegInfoActual The size of the buffer actually required to get the information about the counter set. The meaning depends on the value that the function  
     * 
     * returns.
     * 
     * <table>
     * <tr>
     * <th>Function  Return Value</th>
     * <th>Meaning of <i>pcbRegInfoActual</i></th>
     * </tr>
     * <tr>
     * <td><b>ERROR_SUCCESS</b></td>
     * <td>The number of  
     * 
     *   bytes of information about the specified counter set that the function stored in the buffer that <i>pbRegInfo</i> specified.</td>
     * </tr>
     * <tr>
     * <td><b> ERROR_NOT_ENOUGH_MEMORY</b></td>
     * <td>The  
     * 
     *   size of the buffer required to store the information about the counter set on the specified machine, in bytes. Enlarge the buffer to the required  
     * 
     *   size and call the function again.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Other</td>
     * <td>The value is undefined and should not be used.</td>
     * </tr>
     * </table>
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function successfully stored all of the information about the counter set in the buffer that <i>pbRegInfo</i> specified. The value that <i>pcbRegInfoActual</i> points to indicates amount of information actually stored in the buffer, in bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The buffer that <i>pbRegInfo</i> specified was not large enough to store all of the information about the counter set.  The value that <i>pcbRegInfoActual</i> points to  indicates the size of the buffer required to store all of the information. Enlarge the buffer to the required  
     * 
     *   size and call the function again.  
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For other types of failures, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfquerycountersetregistrationinfo
     * @since windows10.0.14393
     */
    static PerfQueryCounterSetRegistrationInfo(szMachine, pCounterSetId, requestCode, requestLangId, pbRegInfo, cbRegInfo, pcbRegInfoActual) {
        szMachine := szMachine is String ? StrPtr(szMachine) : szMachine

        result := DllCall("ADVAPI32.dll\PerfQueryCounterSetRegistrationInfo", "ptr", szMachine, "ptr", pCounterSetId, "int", requestCode, "uint", requestLangId, "ptr", pbRegInfo, "uint", cbRegInfo, "uint*", pcbRegInfoActual, "uint")
        return result
    }

    /**
     * Creates a handle that references a query on the specified system. A query is a list of counter specifications.
     * @param {PWSTR} szMachine The name of the machine for which you want to get the query handle.
     * @param {Pointer<HANDLE>} phQuery The handle to the query. Call <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfclosequeryhandle">PerfCloseQueryHandle</a> to close ths handle when you no longer need it.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfopenqueryhandle
     * @since windows10.0.14393
     */
    static PerfOpenQueryHandle(szMachine, phQuery) {
        szMachine := szMachine is String ? StrPtr(szMachine) : szMachine

        result := DllCall("ADVAPI32.dll\PerfOpenQueryHandle", "ptr", szMachine, "ptr", phQuery, "uint")
        return result
    }

    /**
     * Closes a query handle that you opened by calling PerfOpenQueryHandle.
     * @param {HANDLE} hQuery A handle to the query that you want to close
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfclosequeryhandle
     * @since windows10.0.14393
     */
    static PerfCloseQueryHandle(hQuery) {
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("ADVAPI32.dll\PerfCloseQueryHandle", "ptr", hQuery, "uint")
        return result
    }

    /**
     * Gets the counter specifications in the specified query.
     * @param {HANDLE} hQuery A handle to the query for which you want to get the counter specifications
     * @param {Pointer} pCounters Pointer to a buffer that is large enough to hold the amount of data that the <i>cbCounters</i> parameter specifies, in bytes. May be
     * NULL if <i>cbCounters</i> is 0.
     * @param {Integer} cbCounters The size of the <i>pCounters</i> buffer, in bytes.
     * @param {Pointer<UInt32>} pcbCountersActual The size of the buffer actually required to get the counter specifications. The meaning depends on the value that the function  
     * 
     * returns.
     * 
     * <table>
     * <tr>
     * <th>Function  Return Value</th>
     * <th>Meaning of <i>pcbCountersActual</i></th>
     * </tr>
     * <tr>
     * <td><b>ERROR_SUCCESS</b></td>
     * <td>The number of  
     * 
     *   bytes of information about the counter specifications that the function stored in the buffer that <i>pCounters</i> specified.</td>
     * </tr>
     * <tr>
     * <td><b> ERROR_NOT_ENOUGH_MEMORY</b></td>
     * <td>The  
     * 
     *   size of the buffer required to store the information about the counter specifications, in bytes. Enlarge the buffer to the required  
     * 
     *   size and call the function again.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Other</td>
     * <td>The value is undefined and should not be used.</td>
     * </tr>
     * </table>
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function successfully stored all of the information about the counter specifications in the buffer that <i>pCounters</i> specified. The value that <i>pcbCountersActual</i> points to indicates amount of information actually stored in the buffer, in bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The buffer that <i>pCounters</i> specified was not large enough to store all of the information about the counter specifications.  The value that <i>pcbCountersActual</i> points to  indicates the size of the buffer required to store all of the information. Enlarge the buffer to the required  
     * 
     *   size and call the function again.  
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For other types of failures, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfquerycounterinfo
     * @since windows10.0.14393
     */
    static PerfQueryCounterInfo(hQuery, pCounters, cbCounters, pcbCountersActual) {
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("ADVAPI32.dll\PerfQueryCounterInfo", "ptr", hQuery, "ptr", pCounters, "uint", cbCounters, "uint*", pcbCountersActual, "uint")
        return result
    }

    /**
     * Gets the values of the performance counters that match the counter specifications in the specified query.
     * @param {HANDLE} hQuery A handle to a query for the counter specifications of the performance counters for which you want to get the values.
     * @param {Pointer} pCounterBlock A pointer to a buffer that has enough space to receive the amount of  data that the <i>cbCounterBlock</i> parameter specifies, in bytes. May be NULL if  
     * 
     * <i>cbCounterBlock</i> is 0.
     * @param {Integer} cbCounterBlock The size of the buffer that the <i>pCounterBlock</i> parameter specifies, in bytes.
     * @param {Pointer<UInt32>} pcbCounterBlockActual The size of the buffer actually required to get the performance counter values. The meaning depends on the value that the function  
     * 
     * returns.
     * 
     * <table>
     * <tr>
     * <th>Function  Return Value</th>
     * <th>Meaning of <i>pcbCounterBlockActual</i></th>
     * </tr>
     * <tr>
     * <td><b>ERROR_SUCCESS</b></td>
     * <td>The number of  
     * 
     *   bytes of performance counter values that the function stored in the buffer that <i>pCounterBlock</i> specified.</td>
     * </tr>
     * <tr>
     * <td><b> ERROR_NOT_ENOUGH_MEMORY</b></td>
     * <td>The  
     * 
     *   size of the buffer required to store the performance counter values, in bytes. Enlarge the buffer to the required  
     * 
     *   size and call the function again.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Other</td>
     * <td>The value is undefined and should not be used.</td>
     * </tr>
     * </table>
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function successfully stored all of the requested performance counter values in the buffer that <i>pCounterBlock</i> specified. The value that <i>pcbCounterBlockActual</i> points to indicates amount of information actually stored in the buffer, in bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The buffer that <i>pCounterBlock</i> specified was not large enough to store all of the requested performance counter values.  The value that <i>pcbCounterBlockActual</i> points to  indicates the size of the buffer required to store all of the information. Enlarge the buffer to the required  
     * 
     *   size and call the function again.  
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For other types of failures, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfquerycounterdata
     * @since windows10.0.14393
     */
    static PerfQueryCounterData(hQuery, pCounterBlock, cbCounterBlock, pcbCounterBlockActual) {
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("ADVAPI32.dll\PerfQueryCounterData", "ptr", hQuery, "ptr", pCounterBlock, "uint", cbCounterBlock, "uint*", pcbCounterBlockActual, "uint")
        return result
    }

    /**
     * Adds performance counter specifications to the specified query.
     * @param {HANDLE} hQuery A handle to the query to which you want to add performance counter specifications.
     * @param {Pointer} pCounters A pointer to the performance counter specifications that you want to add.
     * @param {Integer} cbCounters The size of the buffer that the <i>pCounters</i> parameter specifies, in bytes.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfaddcounters
     * @since windows10.0.14393
     */
    static PerfAddCounters(hQuery, pCounters, cbCounters) {
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("ADVAPI32.dll\PerfAddCounters", "ptr", hQuery, "ptr", pCounters, "uint", cbCounters, "uint")
        return result
    }

    /**
     * Removes the specified performance counter specifications from the specified query.
     * @param {HANDLE} hQuery A handle to the query from which you want to remove performance counter specifications.
     * @param {Pointer} pCounters A pointer to the performance counter specifications that you want to remove.
     * @param {Integer} cbCounters The size of the buffer that the <i>pCounters</i> parameter specifies, in bytes.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//perflib/nf-perflib-perfdeletecounters
     * @since windows10.0.14393
     */
    static PerfDeleteCounters(hQuery, pCounters, cbCounters) {
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("ADVAPI32.dll\PerfDeleteCounters", "ptr", hQuery, "ptr", pCounters, "uint", cbCounters, "uint")
        return result
    }

    /**
     * Returns the version of the currently installed Pdh.dll file.
     * @param {Pointer<UInt32>} lpdwVersion 
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetdllversion
     * @since windows5.1.2600
     */
    static PdhGetDllVersion(lpdwVersion) {
        result := DllCall("pdh.dll\PdhGetDllVersion", "uint*", lpdwVersion, "uint")
        return result
    }

    /**
     * Creates a new query that is used to manage the collection of performance data. To use handles to data sources, use the PdhOpenQueryH function.
     * @param {PWSTR} szDataSource <b>Null</b>-terminated string that specifies the name of the log file from which to retrieve performance data. If <b>NULL</b>, performance data is collected from a real-time data source.
     * @param {Pointer} dwUserData User-defined value to associate with this query. To retrieve the user data later, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetcounterinfoa">PdhGetCounterInfo</a> and access the <b>dwQueryUserData</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_info_a">PDH_COUNTER_INFO</a>.
     * @param {Pointer<PDH_HQUERY>} phQuery Handle to the query. You use this handle in subsequent calls.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhopenqueryw
     * @since windows5.1.2600
     */
    static PdhOpenQueryW(szDataSource, dwUserData, phQuery) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource

        result := DllCall("pdh.dll\PdhOpenQueryW", "ptr", szDataSource, "ptr", dwUserData, "ptr", phQuery, "uint")
        return result
    }

    /**
     * Creates a new query that is used to manage the collection of performance data. To use handles to data sources, use the PdhOpenQueryH function.
     * @param {PSTR} szDataSource <b>Null</b>-terminated string that specifies the name of the log file from which to retrieve performance data. If <b>NULL</b>, performance data is collected from a real-time data source.
     * @param {Pointer} dwUserData User-defined value to associate with this query. To retrieve the user data later, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetcounterinfoa">PdhGetCounterInfo</a> and access the <b>dwQueryUserData</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_info_a">PDH_COUNTER_INFO</a>.
     * @param {Pointer<PDH_HQUERY>} phQuery Handle to the query. You use this handle in subsequent calls.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhopenquerya
     * @since windows5.1.2600
     */
    static PdhOpenQueryA(szDataSource, dwUserData, phQuery) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource

        result := DllCall("pdh.dll\PdhOpenQueryA", "ptr", szDataSource, "ptr", dwUserData, "ptr", phQuery, "uint")
        return result
    }

    /**
     * Adds the specified counter to the query.
     * @param {PDH_HQUERY} hQuery Handle to the query to which you want to add the counter. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a> function.
     * @param {PWSTR} szFullCounterPath Null-terminated string that contains the counter path. For details on the format of a counter path, see 
     * <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/specifying-a-counter-path">Specifying a Counter Path</a>. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * @param {Pointer} dwUserData User-defined value. This value becomes part of the counter information. To retrieve this value later, call the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetcounterinfoa">PdhGetCounterInfo</a> function and access the <b>dwUserData</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_info_a">PDH_COUNTER_INFO</a> structure.
     * @param {Pointer<PDH_HCOUNTER>} phCounter Handle to the counter that was added to the query. You may need to reference this handle in subsequent calls.
     * @returns {Integer} Return ERROR_SUCCESS if the function succeeds.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_BAD_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter path could not be parsed or interpreted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the specified counter on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter path is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The path did not contain a computer name, and the function was unable to retrieve the local computer name. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the specified object on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_FUNCTION_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to determine the calculation function to use for this counter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory required to complete the function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhaddcounterw
     * @since windows5.1.2600
     */
    static PdhAddCounterW(hQuery, szFullCounterPath, dwUserData, phCounter) {
        szFullCounterPath := szFullCounterPath is String ? StrPtr(szFullCounterPath) : szFullCounterPath
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("pdh.dll\PdhAddCounterW", "ptr", hQuery, "ptr", szFullCounterPath, "ptr", dwUserData, "ptr", phCounter, "uint")
        return result
    }

    /**
     * Adds the specified counter to the query.
     * @param {PDH_HQUERY} hQuery Handle to the query to which you want to add the counter. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a> function.
     * @param {PSTR} szFullCounterPath Null-terminated string that contains the counter path. For details on the format of a counter path, see 
     * <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/specifying-a-counter-path">Specifying a Counter Path</a>. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * @param {Pointer} dwUserData User-defined value. This value becomes part of the counter information. To retrieve this value later, call the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetcounterinfoa">PdhGetCounterInfo</a> function and access the <b>dwUserData</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_info_a">PDH_COUNTER_INFO</a> structure.
     * @param {Pointer<PDH_HCOUNTER>} phCounter Handle to the counter that was added to the query. You may need to reference this handle in subsequent calls.
     * @returns {Integer} Return ERROR_SUCCESS if the function succeeds.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_BAD_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter path could not be parsed or interpreted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the specified counter on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter path is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The path did not contain a computer name, and the function was unable to retrieve the local computer name. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the specified object on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_FUNCTION_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to determine the calculation function to use for this counter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory required to complete the function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhaddcountera
     * @since windows5.1.2600
     */
    static PdhAddCounterA(hQuery, szFullCounterPath, dwUserData, phCounter) {
        szFullCounterPath := szFullCounterPath is String ? StrPtr(szFullCounterPath) : szFullCounterPath
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("pdh.dll\PdhAddCounterA", "ptr", hQuery, "ptr", szFullCounterPath, "ptr", dwUserData, "ptr", phCounter, "uint")
        return result
    }

    /**
     * Adds the specified language-neutral counter to the query.
     * @param {PDH_HQUERY} hQuery Handle to the query to which you want to add the counter. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a> function.
     * @param {PWSTR} szFullCounterPath Null-terminated string that contains the counter path. For details on the format of a counter path, see 
     * <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/specifying-a-counter-path">Specifying a Counter Path</a>. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * @param {Pointer} dwUserData User-defined value. This value becomes part of the counter information. To retrieve this value later, call the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetcounterinfoa">PdhGetCounterInfo</a> function and access the <b>dwQueryUserData</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_info_a">PDH_COUNTER_INFO</a> structure.
     * @param {Pointer<PDH_HCOUNTER>} phCounter Handle to the counter that was added to the query. You may need to reference this handle in subsequent calls.
     * @returns {Integer} Return ERROR_SUCCESS if the function succeeds.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_BAD_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter path could not be parsed or interpreted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the specified counter on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter path is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The path did not contain a computer name and the function was unable to retrieve the local computer name. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the specified object on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_FUNCTION_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to determine the calculation function to use for this counter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory required to complete the function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhaddenglishcounterw
     * @since windows6.0.6000
     */
    static PdhAddEnglishCounterW(hQuery, szFullCounterPath, dwUserData, phCounter) {
        szFullCounterPath := szFullCounterPath is String ? StrPtr(szFullCounterPath) : szFullCounterPath
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("pdh.dll\PdhAddEnglishCounterW", "ptr", hQuery, "ptr", szFullCounterPath, "ptr", dwUserData, "ptr", phCounter, "uint")
        return result
    }

    /**
     * Adds the specified language-neutral counter to the query.
     * @param {PDH_HQUERY} hQuery Handle to the query to which you want to add the counter. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a> function.
     * @param {PSTR} szFullCounterPath Null-terminated string that contains the counter path. For details on the format of a counter path, see 
     * <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/specifying-a-counter-path">Specifying a Counter Path</a>. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * @param {Pointer} dwUserData User-defined value. This value becomes part of the counter information. To retrieve this value later, call the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetcounterinfoa">PdhGetCounterInfo</a> function and access the <b>dwQueryUserData</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_info_a">PDH_COUNTER_INFO</a> structure.
     * @param {Pointer<PDH_HCOUNTER>} phCounter Handle to the counter that was added to the query. You may need to reference this handle in subsequent calls.
     * @returns {Integer} Return ERROR_SUCCESS if the function succeeds.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_BAD_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter path could not be parsed or interpreted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the specified counter on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter path is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The path did not contain a computer name and the function was unable to retrieve the local computer name. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the specified object on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_FUNCTION_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to determine the calculation function to use for this counter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory required to complete the function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhaddenglishcountera
     * @since windows6.0.6000
     */
    static PdhAddEnglishCounterA(hQuery, szFullCounterPath, dwUserData, phCounter) {
        szFullCounterPath := szFullCounterPath is String ? StrPtr(szFullCounterPath) : szFullCounterPath
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("pdh.dll\PdhAddEnglishCounterA", "ptr", hQuery, "ptr", szFullCounterPath, "ptr", dwUserData, "ptr", phCounter, "uint")
        return result
    }

    /**
     * Collects the current raw data value for all counters in the specified query and updates the status code of each counter.
     * @param {PDH_HQUERY} hQuery Handle of the query for which you want to collect data. The <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a> function returns this handle.
     * @param {Pointer<Int64>} pllTimeStamp Time stamp when the first counter value in the query was retrieved. The time is specified as FILETIME.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS. Otherwise, the function returns a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * 						
     * 					
     * 
     * 
     * The following are possible values.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_NO_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query does not currently have any counters.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhcollectquerydatawithtime
     * @since windows6.0.6000
     */
    static PdhCollectQueryDataWithTime(hQuery, pllTimeStamp) {
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("pdh.dll\PdhCollectQueryDataWithTime", "ptr", hQuery, "int64*", pllTimeStamp, "uint")
        return result
    }

    /**
     * Validates that the specified counter is present on the computer or in the log file.
     * @param {PDH_HLOG} hDataSource Handle to the data source. The <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenloga">PdhOpenLog</a> and <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> functions return this handle. 
     * 
     * To validate that the counter is present on the local computer, specify <b>NULL</b> (this is the same as calling <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhvalidatepatha">PdhValidatePath</a>).
     * @param {PWSTR} szFullPathBuffer <b>Null</b>-terminated string that specifies the counter path to validate. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_INSTANCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified instance of the performance object was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified counter was not found in the performance object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified performance object was not found on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer could not be found or connected to.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_BAD_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter path string could not be parsed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate a required temporary buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhvalidatepathexw
     * @since windows6.0.6000
     */
    static PdhValidatePathExW(hDataSource, szFullPathBuffer) {
        szFullPathBuffer := szFullPathBuffer is String ? StrPtr(szFullPathBuffer) : szFullPathBuffer
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhValidatePathExW", "ptr", hDataSource, "ptr", szFullPathBuffer, "uint")
        return result
    }

    /**
     * Validates that the specified counter is present on the computer or in the log file.
     * @param {PDH_HLOG} hDataSource Handle to the data source. The <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenloga">PdhOpenLog</a> and <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> functions return this handle. 
     * 
     * To validate that the counter is present on the local computer, specify <b>NULL</b> (this is the same as calling <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhvalidatepatha">PdhValidatePath</a>).
     * @param {PSTR} szFullPathBuffer <b>Null</b>-terminated string that specifies the counter path to validate. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_INSTANCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified instance of the performance object was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified counter was not found in the performance object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified performance object was not found on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer could not be found or connected to.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_BAD_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter path string could not be parsed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate a required temporary buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhvalidatepathexa
     * @since windows6.0.6000
     */
    static PdhValidatePathExA(hDataSource, szFullPathBuffer) {
        szFullPathBuffer := szFullPathBuffer is String ? StrPtr(szFullPathBuffer) : szFullPathBuffer
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhValidatePathExA", "ptr", hDataSource, "ptr", szFullPathBuffer, "uint")
        return result
    }

    /**
     * Removes a counter from a query.
     * @param {PDH_HCOUNTER} hCounter Handle of the counter to remove from its query. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function returns this handle.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * 
     * 
     * The following is a possible value.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhremovecounter
     * @since windows5.1.2600
     */
    static PdhRemoveCounter(hCounter) {
        result := DllCall("pdh.dll\PdhRemoveCounter", "ptr", hCounter, "uint")
        return result
    }

    /**
     * Collects the current raw data value for all counters in the specified query and updates the status code of each counter.
     * @param {PDH_HQUERY} hQuery Handle of the query for which you want to collect data. The <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a> function returns this handle.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS. Otherwise, the function returns a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * 						
     * 					
     * 
     * 
     * The following are possible values.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_NO_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query does not currently contain any counters. The query may not contain data because the user is not running with an elevated token (see <a href="/windows/desktop/PerfCtrs/limited-user-access-support">Limited User Access Support</a>).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhcollectquerydata
     * @since windows5.1.2600
     */
    static PdhCollectQueryData(hQuery) {
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("pdh.dll\PdhCollectQueryData", "ptr", hQuery, "uint")
        return result
    }

    /**
     * Closes all counters contained in the specified query, closes all handles related to the query, and frees all memory associated with the query.
     * @param {PDH_HQUERY} hQuery Handle to the query to close. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a> function.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS. Otherwise, the function returns a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * 						
     * 					
     * 
     * 
     * The following is a possible value.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhclosequery
     * @since windows5.1.2600
     */
    static PdhCloseQuery(hQuery) {
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("pdh.dll\PdhCloseQuery", "ptr", hQuery, "uint")
        return result
    }

    /**
     * Computes a displayable value for the specified counter.
     * @param {PDH_HCOUNTER} hCounter Handle of the counter for which you want to compute a displayable value. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function returns this handle.
     * @param {Integer} dwFormat 
     * @param {Pointer<UInt32>} lpdwType Receives the counter type. For a list of counter types, see the Counter Types section of the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc776490(v=ws.10)">Windows Server 2003 Deployment Kit</a>. This parameter is optional.
     * @param {Pointer<PDH_FMT_COUNTERVALUE>} pValue A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_fmt_countervalue">PDH_FMT_COUNTERVALUE</a> structure that receives the counter value.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified counter does not contain valid data or a successful status code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetformattedcountervalue
     * @since windows5.1.2600
     */
    static PdhGetFormattedCounterValue(hCounter, dwFormat, lpdwType, pValue) {
        result := DllCall("pdh.dll\PdhGetFormattedCounterValue", "ptr", hCounter, "uint", dwFormat, "uint*", lpdwType, "ptr", pValue, "uint")
        return result
    }

    /**
     * Returns an array of formatted counter values. Use this function when you want to format the counter values of a counter that contains a wildcard character for the instance name.
     * @param {PDH_HCOUNTER} hCounter Handle to the counter whose current value you want to format. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function returns this handle.
     * @param {Integer} dwFormat 
     * @param {Pointer<UInt32>} lpdwBufferSize Size of the <i>ItemBuffer</i> buffer, in bytes. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {Pointer<UInt32>} lpdwItemCount Number of counter values in the <i>ItemBuffer</i> buffer.
     * @param {Pointer<PDH_FMT_COUNTERVALUE_ITEM_A>} ItemBuffer Caller-allocated buffer that receives an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_fmt_countervalue_item_a">PDH_FMT_COUNTERVALUE_ITEM</a> structures; the structures contain the counter values. Set to <b>NULL</b> if <i>lpdwBufferSize</i> is zero.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ItemBuffer</i> buffer is not large enough to contain the object name. This return value is expected if <i>lpdwBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetformattedcounterarraya
     * @since windows5.1.2600
     */
    static PdhGetFormattedCounterArrayA(hCounter, dwFormat, lpdwBufferSize, lpdwItemCount, ItemBuffer) {
        result := DllCall("pdh.dll\PdhGetFormattedCounterArrayA", "ptr", hCounter, "uint", dwFormat, "uint*", lpdwBufferSize, "uint*", lpdwItemCount, "ptr", ItemBuffer, "uint")
        return result
    }

    /**
     * Returns an array of formatted counter values. Use this function when you want to format the counter values of a counter that contains a wildcard character for the instance name.
     * @param {PDH_HCOUNTER} hCounter Handle to the counter whose current value you want to format. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function returns this handle.
     * @param {Integer} dwFormat 
     * @param {Pointer<UInt32>} lpdwBufferSize Size of the <i>ItemBuffer</i> buffer, in bytes. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {Pointer<UInt32>} lpdwItemCount Number of counter values in the <i>ItemBuffer</i> buffer.
     * @param {Pointer<PDH_FMT_COUNTERVALUE_ITEM_W>} ItemBuffer Caller-allocated buffer that receives an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_fmt_countervalue_item_a">PDH_FMT_COUNTERVALUE_ITEM</a> structures; the structures contain the counter values. Set to <b>NULL</b> if <i>lpdwBufferSize</i> is zero.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ItemBuffer</i> buffer is not large enough to contain the object name. This return value is expected if <i>lpdwBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetformattedcounterarrayw
     * @since windows5.1.2600
     */
    static PdhGetFormattedCounterArrayW(hCounter, dwFormat, lpdwBufferSize, lpdwItemCount, ItemBuffer) {
        result := DllCall("pdh.dll\PdhGetFormattedCounterArrayW", "ptr", hCounter, "uint", dwFormat, "uint*", lpdwBufferSize, "uint*", lpdwItemCount, "ptr", ItemBuffer, "uint")
        return result
    }

    /**
     * Returns the current raw value of the counter.
     * @param {PDH_HCOUNTER} hCounter Handle of the counter from which to retrieve the current raw value. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function returns this handle.
     * @param {Pointer<UInt32>} lpdwType Receives the counter type. For a list of counter types, see the Counter Types section of the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc776490(v=ws.10)">Windows Server 2003 Deployment Kit</a>. This parameter is optional.
     * @param {Pointer<PDH_RAW_COUNTER>} pValue A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_raw_counter">PDH_RAW_COUNTER</a> structure that receives the counter value.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetrawcountervalue
     * @since windows5.1.2600
     */
    static PdhGetRawCounterValue(hCounter, lpdwType, pValue) {
        result := DllCall("pdh.dll\PdhGetRawCounterValue", "ptr", hCounter, "uint*", lpdwType, "ptr", pValue, "uint")
        return result
    }

    /**
     * Returns an array of raw values from the specified counter. Use this function when you want to retrieve the raw counter values of a counter that contains a wildcard character for the instance name.
     * @param {PDH_HCOUNTER} hCounter Handle of the counter for whose current raw instance values you want to retrieve. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function returns this handle.
     * @param {Pointer<UInt32>} lpdwBufferSize Size of the <i>ItemBuffer</i> buffer, in bytes. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {Pointer<UInt32>} lpdwItemCount Number of raw counter values in the <i>ItemBuffer</i> buffer.
     * @param {Pointer<PDH_RAW_COUNTER_ITEM_A>} ItemBuffer Caller-allocated buffer that receives the array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_raw_counter_item_a">PDH_RAW_COUNTER_ITEM</a> structures; the structures contain the raw instance counter values.  Set to <b>NULL</b> if <i>lpdwBufferSize</i> is zero.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ItemBuffer</i> buffer is not large enough to contain the object name. This return value is expected if <i>lpdwBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetrawcounterarraya
     * @since windows5.1.2600
     */
    static PdhGetRawCounterArrayA(hCounter, lpdwBufferSize, lpdwItemCount, ItemBuffer) {
        result := DllCall("pdh.dll\PdhGetRawCounterArrayA", "ptr", hCounter, "uint*", lpdwBufferSize, "uint*", lpdwItemCount, "ptr", ItemBuffer, "uint")
        return result
    }

    /**
     * Returns an array of raw values from the specified counter. Use this function when you want to retrieve the raw counter values of a counter that contains a wildcard character for the instance name.
     * @param {PDH_HCOUNTER} hCounter Handle of the counter for whose current raw instance values you want to retrieve. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function returns this handle.
     * @param {Pointer<UInt32>} lpdwBufferSize Size of the <i>ItemBuffer</i> buffer, in bytes. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {Pointer<UInt32>} lpdwItemCount Number of raw counter values in the <i>ItemBuffer</i> buffer.
     * @param {Pointer<PDH_RAW_COUNTER_ITEM_W>} ItemBuffer Caller-allocated buffer that receives the array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_raw_counter_item_a">PDH_RAW_COUNTER_ITEM</a> structures; the structures contain the raw instance counter values.  Set to <b>NULL</b> if <i>lpdwBufferSize</i> is zero.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ItemBuffer</i> buffer is not large enough to contain the object name. This return value is expected if <i>lpdwBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetrawcounterarrayw
     * @since windows5.1.2600
     */
    static PdhGetRawCounterArrayW(hCounter, lpdwBufferSize, lpdwItemCount, ItemBuffer) {
        result := DllCall("pdh.dll\PdhGetRawCounterArrayW", "ptr", hCounter, "uint*", lpdwBufferSize, "uint*", lpdwItemCount, "ptr", ItemBuffer, "uint")
        return result
    }

    /**
     * Calculates the displayable value of two raw counter values.
     * @param {PDH_HCOUNTER} hCounter Handle to the counter to calculate. The function uses information from the counter to determine how to calculate the value. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function.
     * @param {Integer} dwFormat 
     * @param {Pointer<PDH_RAW_COUNTER>} rawValue1 Raw counter value used to compute the displayable counter value. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_raw_counter">PDH_RAW_COUNTER</a> structure.
     * @param {Pointer<PDH_RAW_COUNTER>} rawValue2 Raw counter value used to compute the displayable counter value. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_raw_counter">PDH_RAW_COUNTER</a>. Some counters (for example, rate counters) require two raw values to calculate a displayable value. If the counter type does not require a second value, set this parameter to <b>NULL</b>. This value must be the older of the two raw values.
     * @param {Pointer<PDH_FMT_COUNTERVALUE>} fmtValue A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_fmt_countervalue">PDH_FMT_COUNTERVALUE</a> structure that receives the calculated counter value.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An argument is not correct or is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhcalculatecounterfromrawvalue
     * @since windows5.1.2600
     */
    static PdhCalculateCounterFromRawValue(hCounter, dwFormat, rawValue1, rawValue2, fmtValue) {
        result := DllCall("pdh.dll\PdhCalculateCounterFromRawValue", "ptr", hCounter, "uint", dwFormat, "ptr", rawValue1, "ptr", rawValue2, "ptr", fmtValue, "uint")
        return result
    }

    /**
     * Computes statistics for a counter from an array of raw values.
     * @param {PDH_HCOUNTER} hCounter Handle of the counter for which you want to compute statistics. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function returns this handle.
     * @param {Integer} dwFormat 
     * @param {Integer} dwFirstEntry Zero-based index of the first raw counter value to use to begin the calculations. The index value must point to the oldest entry in the buffer. The 
     * function starts at this entry and scans through the buffer, wrapping at the last entry back to the beginning of the buffer and up to the <i>dwFirstEntry-1</i> entry, which is assumed to be the newest or most recent data.
     * @param {Integer} dwNumEntries Number of raw counter values in the <i>lpRawValueArray</i> buffer.
     * @param {Pointer<PDH_RAW_COUNTER>} lpRawValueArray Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_raw_counter">PDH_RAW_COUNTER</a> structures that contain <i>dwNumEntries</i> entries.
     * @param {Pointer<PDH_STATISTICS>} data A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_statistics">PDH_STATISTICS</a> structure that receives the counter statistics.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An argument is not correct or is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhcomputecounterstatistics
     * @since windows5.1.2600
     */
    static PdhComputeCounterStatistics(hCounter, dwFormat, dwFirstEntry, dwNumEntries, lpRawValueArray, data) {
        result := DllCall("pdh.dll\PdhComputeCounterStatistics", "ptr", hCounter, "uint", dwFormat, "uint", dwFirstEntry, "uint", dwNumEntries, "ptr", lpRawValueArray, "ptr", data, "uint")
        return result
    }

    /**
     * Retrieves information about a counter, such as data size, counter type, path, and user-supplied data values.
     * @param {PDH_HCOUNTER} hCounter Handle of the counter from which you want to retrieve information. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function returns this handle.
     * @param {BOOLEAN} bRetrieveExplainText Determines whether explain text is retrieved. If you set this parameter to <b>TRUE</b>, the explain text for the counter is retrieved. If you set this parameter to <b>FALSE</b>, the field in the returned buffer is <b>NULL</b>.
     * @param {Pointer<UInt32>} pdwBufferSize Size of the <i>lpBuffer</i> buffer, in bytes. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {Pointer<PDH_COUNTER_INFO_W>} lpBuffer Caller-allocated buffer that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_info_a">PDH_COUNTER_INFO</a> structure. The structure is variable-length, because the string data is appended to the end of the fixed-format portion of the structure. This is done so that all data is returned in a single buffer allocated by the caller. Set to <b>NULL</b> if <i>pdwBufferSize</i> is zero.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpBuffer</i> buffer is too small to hold the counter information. This return value is expected if <i>pdwBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetcounterinfow
     * @since windows5.1.2600
     */
    static PdhGetCounterInfoW(hCounter, bRetrieveExplainText, pdwBufferSize, lpBuffer) {
        result := DllCall("pdh.dll\PdhGetCounterInfoW", "ptr", hCounter, "ptr", bRetrieveExplainText, "uint*", pdwBufferSize, "ptr", lpBuffer, "uint")
        return result
    }

    /**
     * Retrieves information about a counter, such as data size, counter type, path, and user-supplied data values.
     * @param {PDH_HCOUNTER} hCounter Handle of the counter from which you want to retrieve information. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function returns this handle.
     * @param {BOOLEAN} bRetrieveExplainText Determines whether explain text is retrieved. If you set this parameter to <b>TRUE</b>, the explain text for the counter is retrieved. If you set this parameter to <b>FALSE</b>, the field in the returned buffer is <b>NULL</b>.
     * @param {Pointer<UInt32>} pdwBufferSize Size of the <i>lpBuffer</i> buffer, in bytes. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {Pointer<PDH_COUNTER_INFO_A>} lpBuffer Caller-allocated buffer that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_info_a">PDH_COUNTER_INFO</a> structure. The structure is variable-length, because the string data is appended to the end of the fixed-format portion of the structure. This is done so that all data is returned in a single buffer allocated by the caller. Set to <b>NULL</b> if <i>pdwBufferSize</i> is zero.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpBuffer</i> buffer is too small to hold the counter information. This return value is expected if <i>pdwBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetcounterinfoa
     * @since windows5.1.2600
     */
    static PdhGetCounterInfoA(hCounter, bRetrieveExplainText, pdwBufferSize, lpBuffer) {
        result := DllCall("pdh.dll\PdhGetCounterInfoA", "ptr", hCounter, "ptr", bRetrieveExplainText, "uint*", pdwBufferSize, "ptr", lpBuffer, "uint")
        return result
    }

    /**
     * Sets the scale factor that is applied to the calculated value of the specified counter when you request the formatted counter value. If the PDH_FMT_NOSCALE flag is set, then this scale factor is ignored.
     * @param {PDH_HCOUNTER} hCounter Handle of the counter to apply the scale factor to. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function returns this handle.
     * @param {Integer} lFactor Power of ten by which to multiply the calculated value before returning it. The minimum value of this parameter is PDH_MIN_SCALE (–7), where the returned value is the actual value multiplied by 10<sup>–</sup>⁷. The maximum value of this parameter is PDH_MAX_SCALE (+7), where the returned value is the actual value multiplied by 10⁺⁷. A value of zero will set the scale to one, so that the actual value is returned.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The scale value is out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhsetcounterscalefactor
     * @since windows5.1.2600
     */
    static PdhSetCounterScaleFactor(hCounter, lFactor) {
        result := DllCall("pdh.dll\PdhSetCounterScaleFactor", "ptr", hCounter, "int", lFactor, "uint")
        return result
    }

    /**
     * Connects to the specified computer.
     * @param {PWSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer to connect to. If <b>NULL</b>, PDH connects to the local computer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to connect to the specified computer. Could be caused by the computer not being on, not supporting PDH, not being connected to the network, or having the permissions set on the registry that prevent remote connections or remote performance monitoring by the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate a dynamic memory block. Occurs when there is a serious memory shortage in the system due to too many applications running on the system or an insufficient memory paging file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhconnectmachinew
     * @since windows5.1.2600
     */
    static PdhConnectMachineW(szMachineName) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName

        result := DllCall("pdh.dll\PdhConnectMachineW", "ptr", szMachineName, "uint")
        return result
    }

    /**
     * Connects to the specified computer.
     * @param {PSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer to connect to. If <b>NULL</b>, PDH connects to the local computer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to connect to the specified computer. Could be caused by the computer not being on, not supporting PDH, not being connected to the network, or having the permissions set on the registry that prevent remote connections or remote performance monitoring by the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate a dynamic memory block. Occurs when there is a serious memory shortage in the system due to too many applications running on the system or an insufficient memory paging file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhconnectmachinea
     * @since windows5.1.2600
     */
    static PdhConnectMachineA(szMachineName) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName

        result := DllCall("pdh.dll\PdhConnectMachineA", "ptr", szMachineName, "uint")
        return result
    }

    /**
     * Returns a list of the computer names associated with counters in a log file.
     * @param {PWSTR} szDataSource <b>Null</b>-terminated string that specifies the name of a log file. The function enumerates the names of the computers whose counter data is in the log file. If <b>NULL</b>, the function enumerates the list of computers that were specified when adding counters to a real time query or when calling the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhconnectmachinea">PdhConnectMachine</a> function.
     * @param {PWSTR} mszMachineList Caller-allocated buffer to receive the list of <b>null</b>-terminated strings that contain the computer names. The list is terminated with two <b>null</b>-terminator characters. Set to <b>NULL</b> if <i>pcchBufferLength</i> is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>mszMachineNameList</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszMachineNameList</i> buffer is too small to contain all the data. This return value is expected if <i>pcchBufferLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenummachinesw
     * @since windows5.1.2600
     */
    static PdhEnumMachinesW(szDataSource, mszMachineList, pcchBufferSize) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        mszMachineList := mszMachineList is String ? StrPtr(mszMachineList) : mszMachineList

        result := DllCall("pdh.dll\PdhEnumMachinesW", "ptr", szDataSource, "ptr", mszMachineList, "uint*", pcchBufferSize, "uint")
        return result
    }

    /**
     * Returns a list of the computer names associated with counters in a log file.
     * @param {PSTR} szDataSource <b>Null</b>-terminated string that specifies the name of a log file. The function enumerates the names of the computers whose counter data is in the log file. If <b>NULL</b>, the function enumerates the list of computers that were specified when adding counters to a real time query or when calling the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhconnectmachinea">PdhConnectMachine</a> function.
     * @param {PSTR} mszMachineList Caller-allocated buffer to receive the list of <b>null</b>-terminated strings that contain the computer names. The list is terminated with two <b>null</b>-terminator characters. Set to <b>NULL</b> if <i>pcchBufferLength</i> is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>mszMachineNameList</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszMachineNameList</i> buffer is too small to contain all the data. This return value is expected if <i>pcchBufferLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenummachinesa
     * @since windows5.1.2600
     */
    static PdhEnumMachinesA(szDataSource, mszMachineList, pcchBufferSize) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        mszMachineList := mszMachineList is String ? StrPtr(mszMachineList) : mszMachineList

        result := DllCall("pdh.dll\PdhEnumMachinesA", "ptr", szDataSource, "ptr", mszMachineList, "uint*", pcchBufferSize, "uint")
        return result
    }

    /**
     * Returns a list of objects available on the specified computer or in the specified log file. To use handles to data sources, use the PdhEnumObjectsH function.
     * @param {PWSTR} szDataSource <b>Null</b>-terminated string that specifies the name of the log file used to enumerate the performance objects. If <b>NULL</b>, the function uses the computer specified in  
     * 
     * 
     * the <i>szMachineName</i> parameter to enumerate the names.
     * @param {PWSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer used to enumerate the performance objects. 
     * 
     * 
     * Include the leading slashes in the computer name, for example, \\computername.
     * 
     * If the <i>szDataSource</i> parameter is <b>NULL</b>, you can set <i>szMachineName</i> to <b>NULL</b> to specify the local computer.
     * @param {PWSTR} mszObjectList Caller-allocated buffer that receives the list of object names. Each object name in this list is terminated by a <b>null</b> character. The list is terminated with two <b>null</b>-terminator characters. Set to <b>NULL</b> if the <i>pcchBufferLength</i> parameter is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>mszObjectList</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * <b>Windows XP:  </b>Add one to the required buffer size.
     * @param {Integer} dwDetailLevel 
     * @param {BOOL} bRefresh 
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszObjectList</i> buffer is too small to hold the list of objects. This return value is expected if <i>pcchBufferLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenumobjectsw
     * @since windows5.1.2600
     */
    static PdhEnumObjectsW(szDataSource, szMachineName, mszObjectList, pcchBufferSize, dwDetailLevel, bRefresh) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        mszObjectList := mszObjectList is String ? StrPtr(mszObjectList) : mszObjectList

        result := DllCall("pdh.dll\PdhEnumObjectsW", "ptr", szDataSource, "ptr", szMachineName, "ptr", mszObjectList, "uint*", pcchBufferSize, "uint", dwDetailLevel, "ptr", bRefresh, "uint")
        return result
    }

    /**
     * Returns a list of objects available on the specified computer or in the specified log file. To use handles to data sources, use the PdhEnumObjectsH function.
     * @param {PSTR} szDataSource <b>Null</b>-terminated string that specifies the name of the log file used to enumerate the performance objects. If <b>NULL</b>, the function uses the computer specified in  
     * 
     * 
     * the <i>szMachineName</i> parameter to enumerate the names.
     * @param {PSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer used to enumerate the performance objects. 
     * 
     * 
     * Include the leading slashes in the computer name, for example, \\computername.
     * 
     * If the <i>szDataSource</i> parameter is <b>NULL</b>, you can set <i>szMachineName</i> to <b>NULL</b> to specify the local computer.
     * @param {PSTR} mszObjectList Caller-allocated buffer that receives the list of object names. Each object name in this list is terminated by a <b>null</b> character. The list is terminated with two <b>null</b>-terminator characters. Set to <b>NULL</b> if the <i>pcchBufferLength</i> parameter is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>mszObjectList</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * <b>Windows XP:  </b>Add one to the required buffer size.
     * @param {Integer} dwDetailLevel 
     * @param {BOOL} bRefresh 
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszObjectList</i> buffer is too small to hold the list of objects. This return value is expected if <i>pcchBufferLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenumobjectsa
     * @since windows5.1.2600
     */
    static PdhEnumObjectsA(szDataSource, szMachineName, mszObjectList, pcchBufferSize, dwDetailLevel, bRefresh) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        mszObjectList := mszObjectList is String ? StrPtr(mszObjectList) : mszObjectList

        result := DllCall("pdh.dll\PdhEnumObjectsA", "ptr", szDataSource, "ptr", szMachineName, "ptr", mszObjectList, "uint*", pcchBufferSize, "uint", dwDetailLevel, "ptr", bRefresh, "uint")
        return result
    }

    /**
     * Returns the specified object's counter and instance names that exist on the specified computer or in the specified log file. To use handles to data sources, use the PdhEnumObjectItemsH function.
     * @param {PWSTR} szDataSource <b>Null</b>-terminated string that specifies the name of the log file used to enumerate the counter and instance names. If <b>NULL</b>, the function uses the computer specified in  
     * 
     * 
     * the <i>szMachineName</i> parameter to enumerate the names.
     * @param {PWSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer that contains the counter and instance names that you want to enumerate. 
     * 
     * 
     * Include the leading slashes in the computer name, for example, \\computername.
     * 
     * If the <i>szDataSource</i> parameter is <b>NULL</b>, you can set <i>szMachineName</i> to <b>NULL</b> to specify the local computer.
     * @param {PWSTR} szObjectName <b>Null</b>-terminated string that specifies the name of the object whose counter and instance names you want to enumerate.
     * @param {PWSTR} mszCounterList Caller-allocated buffer that receives a list of <b>null</b>-terminated counter names provided by the specified object. The list contains unique counter names. The list is terminated by two <b>NULL</b> characters. Set to <b>NULL</b> if the <i>pcchCounterListLength</i>parameter is zero.
     * @param {Pointer<UInt32>} pcchCounterListLength Size of the <i>mszCounterList</i> buffer, in <b>TCHARs</b>. If zero on input and the object exists, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {PWSTR} mszInstanceList Caller-allocated buffer that receives a list of <b>null</b>-terminated instance names provided by the specified object. The list contains unique instance names. The list is terminated by two <b>NULL</b> characters. Set to <b>NULL</b> if <i>pcchInstanceListLength</i> is zero.
     * @param {Pointer<UInt32>} pcchInstanceListLength Size of the <i>mszInstanceList</i> buffer, in <b>TCHARs</b>. If zero on input and the object exists, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * If the specified object does not support variable instances, then the returned value will be zero. If the specified object does support variable instances, but does not currently have any instances, then the value returned is 2, which is the size of an empty MULTI_SZ list string.
     * @param {Integer} dwDetailLevel 
     * @param {Integer} dwFlags This parameter must be zero.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the buffers is too small to contain the list of names. This return value is expected if <i>pcchCounterListLength</i> or <i>pcchInstanceListLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object could not be found on the specified computer or in the specified log file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenumobjectitemsw
     * @since windows5.1.2600
     */
    static PdhEnumObjectItemsW(szDataSource, szMachineName, szObjectName, mszCounterList, pcchCounterListLength, mszInstanceList, pcchInstanceListLength, dwDetailLevel, dwFlags) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szObjectName := szObjectName is String ? StrPtr(szObjectName) : szObjectName
        mszCounterList := mszCounterList is String ? StrPtr(mszCounterList) : mszCounterList
        mszInstanceList := mszInstanceList is String ? StrPtr(mszInstanceList) : mszInstanceList

        result := DllCall("pdh.dll\PdhEnumObjectItemsW", "ptr", szDataSource, "ptr", szMachineName, "ptr", szObjectName, "ptr", mszCounterList, "uint*", pcchCounterListLength, "ptr", mszInstanceList, "uint*", pcchInstanceListLength, "uint", dwDetailLevel, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Returns the specified object's counter and instance names that exist on the specified computer or in the specified log file. To use handles to data sources, use the PdhEnumObjectItemsH function.
     * @param {PSTR} szDataSource <b>Null</b>-terminated string that specifies the name of the log file used to enumerate the counter and instance names. If <b>NULL</b>, the function uses the computer specified in  
     * 
     * 
     * the <i>szMachineName</i> parameter to enumerate the names.
     * @param {PSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer that contains the counter and instance names that you want to enumerate. 
     * 
     * 
     * Include the leading slashes in the computer name, for example, \\computername.
     * 
     * If the <i>szDataSource</i> parameter is <b>NULL</b>, you can set <i>szMachineName</i> to <b>NULL</b> to specify the local computer.
     * @param {PSTR} szObjectName <b>Null</b>-terminated string that specifies the name of the object whose counter and instance names you want to enumerate.
     * @param {PSTR} mszCounterList Caller-allocated buffer that receives a list of <b>null</b>-terminated counter names provided by the specified object. The list contains unique counter names. The list is terminated by two <b>NULL</b> characters. Set to <b>NULL</b> if the <i>pcchCounterListLength</i>parameter is zero.
     * @param {Pointer<UInt32>} pcchCounterListLength Size of the <i>mszCounterList</i> buffer, in <b>TCHARs</b>. If zero on input and the object exists, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {PSTR} mszInstanceList Caller-allocated buffer that receives a list of <b>null</b>-terminated instance names provided by the specified object. The list contains unique instance names. The list is terminated by two <b>NULL</b> characters. Set to <b>NULL</b> if <i>pcchInstanceListLength</i> is zero.
     * @param {Pointer<UInt32>} pcchInstanceListLength Size of the <i>mszInstanceList</i> buffer, in <b>TCHARs</b>. If zero on input and the object exists, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * If the specified object does not support variable instances, then the returned value will be zero. If the specified object does support variable instances, but does not currently have any instances, then the value returned is 2, which is the size of an empty MULTI_SZ list string.
     * @param {Integer} dwDetailLevel 
     * @param {Integer} dwFlags This parameter must be zero.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the buffers is too small to contain the list of names. This return value is expected if <i>pcchCounterListLength</i> or <i>pcchInstanceListLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object could not be found on the specified computer or in the specified log file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenumobjectitemsa
     * @since windows5.1.2600
     */
    static PdhEnumObjectItemsA(szDataSource, szMachineName, szObjectName, mszCounterList, pcchCounterListLength, mszInstanceList, pcchInstanceListLength, dwDetailLevel, dwFlags) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szObjectName := szObjectName is String ? StrPtr(szObjectName) : szObjectName
        mszCounterList := mszCounterList is String ? StrPtr(mszCounterList) : mszCounterList
        mszInstanceList := mszInstanceList is String ? StrPtr(mszInstanceList) : mszInstanceList

        result := DllCall("pdh.dll\PdhEnumObjectItemsA", "ptr", szDataSource, "ptr", szMachineName, "ptr", szObjectName, "ptr", mszCounterList, "uint*", pcchCounterListLength, "ptr", mszInstanceList, "uint*", pcchInstanceListLength, "uint", dwDetailLevel, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Creates a full counter path using the members specified in the PDH_COUNTER_PATH_ELEMENTS structure.
     * @param {Pointer<PDH_COUNTER_PATH_ELEMENTS_W>} pCounterPathElements A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_path_elements_a">PDH_COUNTER_PATH_ELEMENTS</a> structure that contains the members used to make up the path. Only the <b>szObjectName</b> and <b>szCounterName</b> members are required, the others are optional. 
     * 
     * 
     * 
     * If the instance name member is <b>NULL</b>, the path will not contain an instance reference and the <b>szParentInstance</b> and <b>dwInstanceIndex</b> members will be ignored.
     * @param {PWSTR} szFullPathBuffer Caller-allocated buffer that receives a <b>null</b>-terminated counter path. The maximum length of a counter path is PDH_MAX_COUNTER_PATH. Set to <b>NULL</b> if <i>pcchBufferSize</i> is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>szFullPathBuffer</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {Integer} dwFlags 
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szFullPathBuffer</i> buffer is too small to contain the counter name. This return value is expected if <i>pcchBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhmakecounterpathw
     * @since windows5.1.2600
     */
    static PdhMakeCounterPathW(pCounterPathElements, szFullPathBuffer, pcchBufferSize, dwFlags) {
        szFullPathBuffer := szFullPathBuffer is String ? StrPtr(szFullPathBuffer) : szFullPathBuffer

        result := DllCall("pdh.dll\PdhMakeCounterPathW", "ptr", pCounterPathElements, "ptr", szFullPathBuffer, "uint*", pcchBufferSize, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Creates a full counter path using the members specified in the PDH_COUNTER_PATH_ELEMENTS structure.
     * @param {Pointer<PDH_COUNTER_PATH_ELEMENTS_A>} pCounterPathElements A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_path_elements_a">PDH_COUNTER_PATH_ELEMENTS</a> structure that contains the members used to make up the path. Only the <b>szObjectName</b> and <b>szCounterName</b> members are required, the others are optional. 
     * 
     * 
     * 
     * If the instance name member is <b>NULL</b>, the path will not contain an instance reference and the <b>szParentInstance</b> and <b>dwInstanceIndex</b> members will be ignored.
     * @param {PSTR} szFullPathBuffer Caller-allocated buffer that receives a <b>null</b>-terminated counter path. The maximum length of a counter path is PDH_MAX_COUNTER_PATH. Set to <b>NULL</b> if <i>pcchBufferSize</i> is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>szFullPathBuffer</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {Integer} dwFlags 
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szFullPathBuffer</i> buffer is too small to contain the counter name. This return value is expected if <i>pcchBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhmakecounterpatha
     * @since windows5.1.2600
     */
    static PdhMakeCounterPathA(pCounterPathElements, szFullPathBuffer, pcchBufferSize, dwFlags) {
        szFullPathBuffer := szFullPathBuffer is String ? StrPtr(szFullPathBuffer) : szFullPathBuffer

        result := DllCall("pdh.dll\PdhMakeCounterPathA", "ptr", pCounterPathElements, "ptr", szFullPathBuffer, "uint*", pcchBufferSize, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Parses the elements of the counter path and stores the results in the PDH_COUNTER_PATH_ELEMENTS structure.
     * @param {PWSTR} szFullPathBuffer <b>Null</b>-terminated string that contains the counter path to parse. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * @param {Pointer<PDH_COUNTER_PATH_ELEMENTS_W>} pCounterPathElements Caller-allocated buffer that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_path_elements_a">PDH_COUNTER_PATH_ELEMENTS</a> structure. The structure contains pointers to the individual string elements of the path referenced by the <i>szFullPathBuffer</i> parameter. The function appends the strings to the end of the <b>PDH_COUNTER_PATH_ELEMENTS</b> structure. The allocated buffer should be large enough for the structure and the strings. Set to <b>NULL</b> if <i>pdwBufferSize</i> is zero.
     * @param {Pointer<UInt32>} pdwBufferSize Size of the <i>pCounterPathElements</i> buffer, in bytes. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {Integer} dwFlags Reserved. Must be zero.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pCounterPathElements</i> buffer is too small to contain the path elements. This return value is expected if <i>pdwBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The path is not formatted correctly and cannot be parsed. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory in order to complete the function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhparsecounterpathw
     * @since windows5.1.2600
     */
    static PdhParseCounterPathW(szFullPathBuffer, pCounterPathElements, pdwBufferSize, dwFlags) {
        szFullPathBuffer := szFullPathBuffer is String ? StrPtr(szFullPathBuffer) : szFullPathBuffer

        result := DllCall("pdh.dll\PdhParseCounterPathW", "ptr", szFullPathBuffer, "ptr", pCounterPathElements, "uint*", pdwBufferSize, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Parses the elements of the counter path and stores the results in the PDH_COUNTER_PATH_ELEMENTS structure.
     * @param {PSTR} szFullPathBuffer <b>Null</b>-terminated string that contains the counter path to parse. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * @param {Pointer<PDH_COUNTER_PATH_ELEMENTS_A>} pCounterPathElements Caller-allocated buffer that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_path_elements_a">PDH_COUNTER_PATH_ELEMENTS</a> structure. The structure contains pointers to the individual string elements of the path referenced by the <i>szFullPathBuffer</i> parameter. The function appends the strings to the end of the <b>PDH_COUNTER_PATH_ELEMENTS</b> structure. The allocated buffer should be large enough for the structure and the strings. Set to <b>NULL</b> if <i>pdwBufferSize</i> is zero.
     * @param {Pointer<UInt32>} pdwBufferSize Size of the <i>pCounterPathElements</i> buffer, in bytes. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {Integer} dwFlags Reserved. Must be zero.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pCounterPathElements</i> buffer is too small to contain the path elements. This return value is expected if <i>pdwBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The path is not formatted correctly and cannot be parsed. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory in order to complete the function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhparsecounterpatha
     * @since windows5.1.2600
     */
    static PdhParseCounterPathA(szFullPathBuffer, pCounterPathElements, pdwBufferSize, dwFlags) {
        szFullPathBuffer := szFullPathBuffer is String ? StrPtr(szFullPathBuffer) : szFullPathBuffer

        result := DllCall("pdh.dll\PdhParseCounterPathA", "ptr", szFullPathBuffer, "ptr", pCounterPathElements, "uint*", pdwBufferSize, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Parses the elements of an instance string.
     * @param {PWSTR} szInstanceString <b>Null</b>-terminated string that specifies the instance string to parse into individual components. This string can contain the following formats, and is less than MAX_PATH characters in length: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>instance</li>
     * <li>instance#index</li>
     * <li>parent/instance</li>
     * <li>parent/instance#index</li>
     * </ul>
     * @param {PWSTR} szInstanceName Caller-allocated buffer that receives the <b>null</b>-terminated instance name. Set to <b>NULL</b> if <i>pcchInstanceNameLength</i> is zero.
     * @param {Pointer<UInt32>} pcchInstanceNameLength Size of the <i>szInstanceName</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {PWSTR} szParentName Caller-allocated buffer that receives the <b>null</b>-terminated name of the parent instance, if one is specified. Set to <b>NULL</b> if <i>pcchParentNameLength</i> is zero.
     * @param {Pointer<UInt32>} pcchParentNameLength Size of the <i>szParentName</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {Pointer<UInt32>} lpIndex Index value of the instance. If an index entry is not present in the string, then this value is zero. This parameter can be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or both of the string buffers are too small to contain the data. This return value is expected if the corresponding size buffer  is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_INSTANCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The instance string is incorrectly formatted, exceeds MAX_PATH characters in length, or cannot be parsed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhparseinstancenamew
     * @since windows5.1.2600
     */
    static PdhParseInstanceNameW(szInstanceString, szInstanceName, pcchInstanceNameLength, szParentName, pcchParentNameLength, lpIndex) {
        szInstanceString := szInstanceString is String ? StrPtr(szInstanceString) : szInstanceString
        szInstanceName := szInstanceName is String ? StrPtr(szInstanceName) : szInstanceName
        szParentName := szParentName is String ? StrPtr(szParentName) : szParentName

        result := DllCall("pdh.dll\PdhParseInstanceNameW", "ptr", szInstanceString, "ptr", szInstanceName, "uint*", pcchInstanceNameLength, "ptr", szParentName, "uint*", pcchParentNameLength, "uint*", lpIndex, "uint")
        return result
    }

    /**
     * Parses the elements of an instance string.
     * @param {PSTR} szInstanceString <b>Null</b>-terminated string that specifies the instance string to parse into individual components. This string can contain the following formats, and is less than MAX_PATH characters in length: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>instance</li>
     * <li>instance#index</li>
     * <li>parent/instance</li>
     * <li>parent/instance#index</li>
     * </ul>
     * @param {PSTR} szInstanceName Caller-allocated buffer that receives the <b>null</b>-terminated instance name. Set to <b>NULL</b> if <i>pcchInstanceNameLength</i> is zero.
     * @param {Pointer<UInt32>} pcchInstanceNameLength Size of the <i>szInstanceName</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {PSTR} szParentName Caller-allocated buffer that receives the <b>null</b>-terminated name of the parent instance, if one is specified. Set to <b>NULL</b> if <i>pcchParentNameLength</i> is zero.
     * @param {Pointer<UInt32>} pcchParentNameLength Size of the <i>szParentName</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {Pointer<UInt32>} lpIndex Index value of the instance. If an index entry is not present in the string, then this value is zero. This parameter can be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or both of the string buffers are too small to contain the data. This return value is expected if the corresponding size buffer  is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_INSTANCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The instance string is incorrectly formatted, exceeds MAX_PATH characters in length, or cannot be parsed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhparseinstancenamea
     * @since windows5.1.2600
     */
    static PdhParseInstanceNameA(szInstanceString, szInstanceName, pcchInstanceNameLength, szParentName, pcchParentNameLength, lpIndex) {
        szInstanceString := szInstanceString is String ? StrPtr(szInstanceString) : szInstanceString
        szInstanceName := szInstanceName is String ? StrPtr(szInstanceName) : szInstanceName
        szParentName := szParentName is String ? StrPtr(szParentName) : szParentName

        result := DllCall("pdh.dll\PdhParseInstanceNameA", "ptr", szInstanceString, "ptr", szInstanceName, "uint*", pcchInstanceNameLength, "ptr", szParentName, "uint*", pcchParentNameLength, "uint*", lpIndex, "uint")
        return result
    }

    /**
     * Validates that the counter is present on the computer specified in the counter path.
     * @param {PWSTR} szFullPathBuffer Null-terminated string that contains the counter path to validate. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_INSTANCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified instance of the performance object was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified counter was not found in the performance object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified performance object was not found on the computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer could not be found or connected to.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_BAD_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter path string could not be parsed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate a required temporary buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhvalidatepathw
     * @since windows5.1.2600
     */
    static PdhValidatePathW(szFullPathBuffer) {
        szFullPathBuffer := szFullPathBuffer is String ? StrPtr(szFullPathBuffer) : szFullPathBuffer

        result := DllCall("pdh.dll\PdhValidatePathW", "ptr", szFullPathBuffer, "uint")
        return result
    }

    /**
     * Validates that the counter is present on the computer specified in the counter path.
     * @param {PSTR} szFullPathBuffer Null-terminated string that contains the counter path to validate. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_INSTANCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified instance of the performance object was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified counter was not found in the performance object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified performance object was not found on the computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer could not be found or connected to.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_BAD_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter path string could not be parsed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is unable to allocate a required temporary buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhvalidatepatha
     * @since windows5.1.2600
     */
    static PdhValidatePathA(szFullPathBuffer) {
        szFullPathBuffer := szFullPathBuffer is String ? StrPtr(szFullPathBuffer) : szFullPathBuffer

        result := DllCall("pdh.dll\PdhValidatePathA", "ptr", szFullPathBuffer, "uint")
        return result
    }

    /**
     * Retrieves the name of the default object. This name can be used to set the initial object selection in the Browse Counter dialog box. To use handles to data sources, use the PdhGetDefaultPerfObjectH function.
     * @param {PWSTR} szDataSource Should be <b>NULL</b>. 
     * 
     * If you specify a log file, the <i>szDefaultObjectName</i> parameter will be a <b>null</b> string.
     * @param {PWSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer used to verify the object name. If <b>NULL</b>, the local computer is used to verify the name.
     * @param {PWSTR} szDefaultObjectName Caller-allocated buffer that receives the <b>null</b>-terminated default object name. Set to <b>NULL</b> if the <i>pcchBufferSize</i> parameter is zero.
     * 
     * Note that PDH always returns Processor for the default object name.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>szDefaultObjectName</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szDefaultObjectName</i> buffer is too small to contain the object name. This return value is expected if <i>pcchBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory in order to complete the function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetdefaultperfobjectw
     * @since windows5.1.2600
     */
    static PdhGetDefaultPerfObjectW(szDataSource, szMachineName, szDefaultObjectName, pcchBufferSize) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szDefaultObjectName := szDefaultObjectName is String ? StrPtr(szDefaultObjectName) : szDefaultObjectName

        result := DllCall("pdh.dll\PdhGetDefaultPerfObjectW", "ptr", szDataSource, "ptr", szMachineName, "ptr", szDefaultObjectName, "uint*", pcchBufferSize, "uint")
        return result
    }

    /**
     * Retrieves the name of the default object. This name can be used to set the initial object selection in the Browse Counter dialog box. To use handles to data sources, use the PdhGetDefaultPerfObjectH function.
     * @param {PSTR} szDataSource Should be <b>NULL</b>. 
     * 
     * If you specify a log file, the <i>szDefaultObjectName</i> parameter will be a <b>null</b> string.
     * @param {PSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer used to verify the object name. If <b>NULL</b>, the local computer is used to verify the name.
     * @param {PSTR} szDefaultObjectName Caller-allocated buffer that receives the <b>null</b>-terminated default object name. Set to <b>NULL</b> if the <i>pcchBufferSize</i> parameter is zero.
     * 
     * Note that PDH always returns Processor for the default object name.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>szDefaultObjectName</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szDefaultObjectName</i> buffer is too small to contain the object name. This return value is expected if <i>pcchBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory in order to complete the function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetdefaultperfobjecta
     * @since windows5.1.2600
     */
    static PdhGetDefaultPerfObjectA(szDataSource, szMachineName, szDefaultObjectName, pcchBufferSize) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szDefaultObjectName := szDefaultObjectName is String ? StrPtr(szDefaultObjectName) : szDefaultObjectName

        result := DllCall("pdh.dll\PdhGetDefaultPerfObjectA", "ptr", szDataSource, "ptr", szMachineName, "ptr", szDefaultObjectName, "uint*", pcchBufferSize, "uint")
        return result
    }

    /**
     * Retrieves the name of the default counter for the specified object. This name can be used to set the initial counter selection in the Browse Counter dialog box. To use handles to data sources, use the PdhGetDefaultPerfCounterH function.
     * @param {PWSTR} szDataSource Should be <b>NULL</b>. 
     * 
     * 
     * If you specify a log file, <i>szDefaultCounterName</i> will be a <b>null</b> string.
     * @param {PWSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer used to verify the object name. If <b>NULL</b>, the local computer is used to verify the object name.
     * @param {PWSTR} szObjectName <b>Null</b>-terminated string that specifies the name of the object whose default counter name you want to retrieve.
     * @param {PWSTR} szDefaultCounterName Caller-allocated buffer that receives the <b>null</b>-terminated default counter name. Set to <b>NULL</b> if <i>pcchBufferSize</i> is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>szDefaultCounterName</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szDefaultCounterName</i> buffer is too small to contain the counter name. This return value is expected if <i>pcchBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory in order to complete the function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The default counter name cannot be read or found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object did not specify a default counter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetdefaultperfcounterw
     * @since windows5.1.2600
     */
    static PdhGetDefaultPerfCounterW(szDataSource, szMachineName, szObjectName, szDefaultCounterName, pcchBufferSize) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szObjectName := szObjectName is String ? StrPtr(szObjectName) : szObjectName
        szDefaultCounterName := szDefaultCounterName is String ? StrPtr(szDefaultCounterName) : szDefaultCounterName

        result := DllCall("pdh.dll\PdhGetDefaultPerfCounterW", "ptr", szDataSource, "ptr", szMachineName, "ptr", szObjectName, "ptr", szDefaultCounterName, "uint*", pcchBufferSize, "uint")
        return result
    }

    /**
     * Retrieves the name of the default counter for the specified object. This name can be used to set the initial counter selection in the Browse Counter dialog box. To use handles to data sources, use the PdhGetDefaultPerfCounterH function.
     * @param {PSTR} szDataSource Should be <b>NULL</b>. 
     * 
     * If you specify a log file, <i>szDefaultCounterName</i> will be a <b>null</b> string.
     * @param {PSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer used to verify the object name. If <b>NULL</b>, the local computer is used to verify the object name.
     * @param {PSTR} szObjectName <b>Null</b>-terminated string that specifies the name of the object whose default counter name you want to retrieve.
     * @param {PSTR} szDefaultCounterName Caller-allocated buffer that receives the <b>null</b>-terminated default counter name. Set to <b>NULL</b> if <i>pcchBufferSize</i> is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>szDefaultCounterName</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szDefaultCounterName</i> buffer is too small to contain the counter name. This return value is expected if <i>pcchBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory in order to complete the function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The default counter name cannot be read or found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object did not specify a default counter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetdefaultperfcountera
     * @since windows5.1.2600
     */
    static PdhGetDefaultPerfCounterA(szDataSource, szMachineName, szObjectName, szDefaultCounterName, pcchBufferSize) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szObjectName := szObjectName is String ? StrPtr(szObjectName) : szObjectName
        szDefaultCounterName := szDefaultCounterName is String ? StrPtr(szDefaultCounterName) : szDefaultCounterName

        result := DllCall("pdh.dll\PdhGetDefaultPerfCounterA", "ptr", szDataSource, "ptr", szMachineName, "ptr", szObjectName, "ptr", szDefaultCounterName, "uint*", pcchBufferSize, "uint")
        return result
    }

    /**
     * Displays a Browse Counters dialog box that the user can use to select one or more counters that they want to add to the query. To use handles to data sources, use the PdhBrowseCountersH function.
     * @param {Pointer<PDH_BROWSE_DLG_CONFIG_W>} pBrowseDlgData A 
     * <a href="https://docs.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_a">PDH_BROWSE_DLG_CONFIG</a> structure that specifies the behavior of the dialog box.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhbrowsecountersw
     * @since windows5.1.2600
     */
    static PdhBrowseCountersW(pBrowseDlgData) {
        result := DllCall("pdh.dll\PdhBrowseCountersW", "ptr", pBrowseDlgData, "uint")
        return result
    }

    /**
     * Displays a Browse Counters dialog box that the user can use to select one or more counters that they want to add to the query. To use handles to data sources, use the PdhBrowseCountersH function.
     * @param {Pointer<PDH_BROWSE_DLG_CONFIG_A>} pBrowseDlgData A 
     * <a href="https://docs.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_a">PDH_BROWSE_DLG_CONFIG</a> structure that specifies the behavior of the dialog box.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhbrowsecountersa
     * @since windows5.1.2600
     */
    static PdhBrowseCountersA(pBrowseDlgData) {
        result := DllCall("pdh.dll\PdhBrowseCountersA", "ptr", pBrowseDlgData, "uint")
        return result
    }

    /**
     * Examines the specified computer (or local computer if none is specified) for counters and instances of counters that match the wildcard strings in the counter path.
     * @param {PWSTR} szWildCardPath <b>Null</b>-terminated string that contains the counter path to expand. The function searches the computer specified in the path for matches. If the path does not specify a computer, the function searches the local computer. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * @param {PWSTR} mszExpandedPathList Caller-allocated buffer that receives the list of expanded counter paths that match the wildcard specification in <i>szWildCardPath</i>. Each counter path in this list is terminated by a <b>null</b> character. The list is terminated with two <b>NULL</b> characters. Set to <b>NULL</b> if <i>pcchPathListLength</i> is zero.
     * @param {Pointer<UInt32>} pcchPathListLength Size of the <i>mszExpandedPathList</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * <div class="alert"><b>Note</b>  You must add one to the required size on Windows XP.</div>
     * <div> </div>
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszExpandedPathList</i> buffer is too small to contain the list of paths. This return value is expected if <i>pcchPathListLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to support this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhexpandcounterpathw
     * @since windows5.1.2600
     */
    static PdhExpandCounterPathW(szWildCardPath, mszExpandedPathList, pcchPathListLength) {
        szWildCardPath := szWildCardPath is String ? StrPtr(szWildCardPath) : szWildCardPath
        mszExpandedPathList := mszExpandedPathList is String ? StrPtr(mszExpandedPathList) : mszExpandedPathList

        result := DllCall("pdh.dll\PdhExpandCounterPathW", "ptr", szWildCardPath, "ptr", mszExpandedPathList, "uint*", pcchPathListLength, "uint")
        return result
    }

    /**
     * Examines the specified computer (or local computer if none is specified) for counters and instances of counters that match the wildcard strings in the counter path.
     * @param {PSTR} szWildCardPath <b>Null</b>-terminated string that contains the counter path to expand. The function searches the computer specified in the path for matches. If the path does not specify a computer, the function searches the local computer. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * @param {PSTR} mszExpandedPathList Caller-allocated buffer that receives the list of expanded counter paths that match the wildcard specification in <i>szWildCardPath</i>. Each counter path in this list is terminated by a <b>null</b> character. The list is terminated with two <b>NULL</b> characters. Set to <b>NULL</b> if <i>pcchPathListLength</i> is zero.
     * @param {Pointer<UInt32>} pcchPathListLength Size of the <i>mszExpandedPathList</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * <div class="alert"><b>Note</b>  You must add one to the required size on Windows XP.</div>
     * <div> </div>
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszExpandedPathList</i> buffer is too small to contain the list of paths. This return value is expected if <i>pcchPathListLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to support this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhexpandcounterpatha
     * @since windows5.1.2600
     */
    static PdhExpandCounterPathA(szWildCardPath, mszExpandedPathList, pcchPathListLength) {
        szWildCardPath := szWildCardPath is String ? StrPtr(szWildCardPath) : szWildCardPath
        mszExpandedPathList := mszExpandedPathList is String ? StrPtr(mszExpandedPathList) : mszExpandedPathList

        result := DllCall("pdh.dll\PdhExpandCounterPathA", "ptr", szWildCardPath, "ptr", mszExpandedPathList, "uint*", pcchPathListLength, "uint")
        return result
    }

    /**
     * Returns the performance object name or counter name corresponding to the specified index.
     * @param {PWSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer where the specified performance object or counter is located. The computer name can be specified by the DNS name or the IP address. If <b>NULL</b>, the function uses the local computer.
     * @param {Integer} dwNameIndex Index of the performance object or counter.
     * @param {PWSTR} szNameBuffer Caller-allocated buffer that receives the <b>null</b>-terminated name of the performance object or counter. Set to <b>NULL</b> if <i>pcchNameBufferSize</i> is zero.
     * @param {Pointer<UInt32>} pcchNameBufferSize Size of the <i>szNameBuffer</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szNameBuffer</i> buffer is not large enough to contain the counter name. This return value is expected if <i>pcchNameBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhlookupperfnamebyindexw
     * @since windows5.1.2600
     */
    static PdhLookupPerfNameByIndexW(szMachineName, dwNameIndex, szNameBuffer, pcchNameBufferSize) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szNameBuffer := szNameBuffer is String ? StrPtr(szNameBuffer) : szNameBuffer

        result := DllCall("pdh.dll\PdhLookupPerfNameByIndexW", "ptr", szMachineName, "uint", dwNameIndex, "ptr", szNameBuffer, "uint*", pcchNameBufferSize, "uint")
        return result
    }

    /**
     * Returns the performance object name or counter name corresponding to the specified index.
     * @param {PSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer where the specified performance object or counter is located. The computer name can be specified by the DNS name or the IP address. If <b>NULL</b>, the function uses the local computer.
     * @param {Integer} dwNameIndex Index of the performance object or counter.
     * @param {PSTR} szNameBuffer Caller-allocated buffer that receives the <b>null</b>-terminated name of the performance object or counter. Set to <b>NULL</b> if <i>pcchNameBufferSize</i> is zero.
     * @param {Pointer<UInt32>} pcchNameBufferSize Size of the <i>szNameBuffer</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szNameBuffer</i> buffer is not large enough to contain the counter name. This return value is expected if <i>pcchNameBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhlookupperfnamebyindexa
     * @since windows5.1.2600
     */
    static PdhLookupPerfNameByIndexA(szMachineName, dwNameIndex, szNameBuffer, pcchNameBufferSize) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szNameBuffer := szNameBuffer is String ? StrPtr(szNameBuffer) : szNameBuffer

        result := DllCall("pdh.dll\PdhLookupPerfNameByIndexA", "ptr", szMachineName, "uint", dwNameIndex, "ptr", szNameBuffer, "uint*", pcchNameBufferSize, "uint")
        return result
    }

    /**
     * Returns the counter index corresponding to the specified counter name.
     * @param {PWSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer where the specified counter is located. The computer name can be specified by the DNS name or the IP address. If <b>NULL</b>, the function uses the local computer.
     * @param {PWSTR} szNameBuffer <b>Null</b>-terminated string that contains the counter name.
     * @param {Pointer<UInt32>} pdwIndex Index of the counter.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following is a possible value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhlookupperfindexbynamew
     * @since windows5.1.2600
     */
    static PdhLookupPerfIndexByNameW(szMachineName, szNameBuffer, pdwIndex) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szNameBuffer := szNameBuffer is String ? StrPtr(szNameBuffer) : szNameBuffer

        result := DllCall("pdh.dll\PdhLookupPerfIndexByNameW", "ptr", szMachineName, "ptr", szNameBuffer, "uint*", pdwIndex, "uint")
        return result
    }

    /**
     * Returns the counter index corresponding to the specified counter name.
     * @param {PSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer where the specified counter is located. The computer name can be specified by the DNS name or the IP address. If <b>NULL</b>, the function uses the local computer.
     * @param {PSTR} szNameBuffer <b>Null</b>-terminated string that contains the counter name.
     * @param {Pointer<UInt32>} pdwIndex Index of the counter.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following is a possible value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhlookupperfindexbynamea
     * @since windows5.1.2600
     */
    static PdhLookupPerfIndexByNameA(szMachineName, szNameBuffer, pdwIndex) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szNameBuffer := szNameBuffer is String ? StrPtr(szNameBuffer) : szNameBuffer

        result := DllCall("pdh.dll\PdhLookupPerfIndexByNameA", "ptr", szMachineName, "ptr", szNameBuffer, "uint*", pdwIndex, "uint")
        return result
    }

    /**
     * Examines the specified computer or log file and returns those counter paths that match the given counter path which contains wildcard characters. To use handles to data sources, use the PdhExpandWildCardPathH function.
     * @param {PSTR} szDataSource <b>Null</b>-terminated string that contains the name of a log file. The function uses the performance objects and counters defined in the log file to expand the path specified in the <i>szWildCardPath</i> parameter. 
     * 
     * If <b>NULL</b>, the function searches the computer specified in <i>szWildCardPath</i>.
     * @param {PSTR} szWildCardPath <b>Null</b>-terminated string that specifies the counter path to expand. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * 
     * If the <i>szDataSource</i> parameter is <b>NULL</b>, the function searches the computer specified in the path for matches. If the path does not specify a computer, the function searches the local computer.
     * @param {PSTR} mszExpandedPathList Caller-allocated buffer that receives a list of <b>null</b>-terminated counter paths that match the wildcard specification in the <i>szWildCardPath</i>. The list is terminated by two <b>NULL</b> characters. Set to <b>NULL</b> if <i>pcchPathListLength</i> is zero.
     * @param {Pointer<UInt32>} pcchPathListLength Size of the <i>mszExpandedPathList</i> buffer, in <b>TCHARs</b>. If zero on input and the object exists, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * <div class="alert"><b>Note</b>  You must add one to the required size on Windows XP.</div>
     * <div> </div>
     * @param {Integer} dwFlags Flags that indicate which wildcard characters not to expand. You can specify one or more flags. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDH_NOEXPANDCOUNTERS"></a><a id="pdh_noexpandcounters"></a><dl>
     * <dt><b>PDH_NOEXPANDCOUNTERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not expand the counter name if the path contains a wildcard character for counter name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDH_NOEXPANDINSTANCES"></a><a id="pdh_noexpandinstances"></a><dl>
     * <dt><b>PDH_NOEXPANDINSTANCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not expand the instance name if the path contains a wildcard character for parent instance, instance name, or instance index.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszExpandedPathList</i> buffer is not large enough to contain the list of paths. This return value is expected if <i>pcchPathListLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object does not contain an instance.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the specified object on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhexpandwildcardpatha
     * @since windows5.1.2600
     */
    static PdhExpandWildCardPathA(szDataSource, szWildCardPath, mszExpandedPathList, pcchPathListLength, dwFlags) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        szWildCardPath := szWildCardPath is String ? StrPtr(szWildCardPath) : szWildCardPath
        mszExpandedPathList := mszExpandedPathList is String ? StrPtr(mszExpandedPathList) : mszExpandedPathList

        result := DllCall("pdh.dll\PdhExpandWildCardPathA", "ptr", szDataSource, "ptr", szWildCardPath, "ptr", mszExpandedPathList, "uint*", pcchPathListLength, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Examines the specified computer or log file and returns those counter paths that match the given counter path which contains wildcard characters. To use handles to data sources, use the PdhExpandWildCardPathH function.
     * @param {PWSTR} szDataSource <b>Null</b>-terminated string that contains the name of a log file. The function uses the performance objects and counters defined in the log file to expand the path specified in the <i>szWildCardPath</i> parameter. 
     * 
     * If <b>NULL</b>, the function searches the computer specified in <i>szWildCardPath</i>.
     * @param {PWSTR} szWildCardPath <b>Null</b>-terminated string that specifies the counter path to expand. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * 
     * If the <i>szDataSource</i> parameter is <b>NULL</b>, the function searches the computer specified in the path for matches. If the path does not specify a computer, the function searches the local computer.
     * @param {PWSTR} mszExpandedPathList Caller-allocated buffer that receives a list of <b>null</b>-terminated counter paths that match the wildcard specification in the <i>szWildCardPath</i>. The list is terminated by two <b>NULL</b> characters. Set to <b>NULL</b> if <i>pcchPathListLength</i> is zero.
     * @param {Pointer<UInt32>} pcchPathListLength Size of the <i>mszExpandedPathList</i> buffer, in <b>TCHARs</b>. If zero on input and the object exists, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * <div class="alert"><b>Note</b>  You must add one to the required size on Windows XP.</div>
     * <div> </div>
     * @param {Integer} dwFlags Flags that indicate which wildcard characters not to expand. You can specify one or more flags. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDH_NOEXPANDCOUNTERS"></a><a id="pdh_noexpandcounters"></a><dl>
     * <dt><b>PDH_NOEXPANDCOUNTERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not expand the counter name if the path contains a wildcard character for counter name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDH_NOEXPANDINSTANCES"></a><a id="pdh_noexpandinstances"></a><dl>
     * <dt><b>PDH_NOEXPANDINSTANCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not expand the instance name if the path contains a wildcard character for parent instance, instance name, or instance index.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszExpandedPathList</i> buffer is not large enough to contain the list of paths. This return value is expected if <i>pcchPathListLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object does not contain an instance.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the specified object on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhexpandwildcardpathw
     * @since windows5.1.2600
     */
    static PdhExpandWildCardPathW(szDataSource, szWildCardPath, mszExpandedPathList, pcchPathListLength, dwFlags) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        szWildCardPath := szWildCardPath is String ? StrPtr(szWildCardPath) : szWildCardPath
        mszExpandedPathList := mszExpandedPathList is String ? StrPtr(mszExpandedPathList) : mszExpandedPathList

        result := DllCall("pdh.dll\PdhExpandWildCardPathW", "ptr", szDataSource, "ptr", szWildCardPath, "ptr", mszExpandedPathList, "uint*", pcchPathListLength, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Opens the specified log file for reading or writing.
     * @param {PWSTR} szLogFileName <b>Null</b>-terminated string that specifies the name of the log file to open. The name can contain an absolute or relative path. 
     * 
     * 
     * 
     * 
     * If the <i>lpdwLogType</i> parameter is <b>PDH_LOG_TYPE_SQL</b>, specify the name of the log file in the form, <b>SQL:</b><i>DataSourceName</i><b>!</b><i>LogFileName</i>.
     * @param {Integer} dwAccessFlags 
     * @param {Pointer<UInt32>} lpdwLogType 
     * @param {PDH_HQUERY} hQuery Specify a query handle if you are writing query data to a log file. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a> function returns this handle. 
     * 
     * 
     * 
     * 
     * This parameter is ignored and should be <b>NULL</b> if you are reading from the log file.
     * @param {Integer} dwMaxSize Maximum size of the log file, in bytes. Specify the maximum size if you want to limit the file size or if <i>dwAccessFlags</i> specifies <b>PDH_LOG_OPT_CIRCULAR</b>; otherwise, set to 0.
     * 
     * For circular log files, you must specify a value large enough to hold at least one sample.   Sample size depends on data being collected. However, specifying a value of at least one megabyte will cover most samples.
     * @param {PWSTR} szUserCaption <b>Null</b>-terminated string that specifies the user-defined caption of the log file. A log file caption generally describes the contents of the log file. When an existing log file is opened, the value of this parameter is ignored.
     * @param {Pointer<PDH_HLOG>} phLog Handle to the opened log file.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhopenlogw
     * @since windows5.1.2600
     */
    static PdhOpenLogW(szLogFileName, dwAccessFlags, lpdwLogType, hQuery, dwMaxSize, szUserCaption, phLog) {
        szLogFileName := szLogFileName is String ? StrPtr(szLogFileName) : szLogFileName
        szUserCaption := szUserCaption is String ? StrPtr(szUserCaption) : szUserCaption
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("pdh.dll\PdhOpenLogW", "ptr", szLogFileName, "uint", dwAccessFlags, "uint*", lpdwLogType, "ptr", hQuery, "uint", dwMaxSize, "ptr", szUserCaption, "ptr", phLog, "uint")
        return result
    }

    /**
     * Opens the specified log file for reading or writing.
     * @param {PSTR} szLogFileName <b>Null</b>-terminated string that specifies the name of the log file to open. The name can contain an absolute or relative path. 
     * 
     * 
     * 
     * 
     * If the <i>lpdwLogType</i> parameter is <b>PDH_LOG_TYPE_SQL</b>, specify the name of the log file in the form, <b>SQL:</b><i>DataSourceName</i><b>!</b><i>LogFileName</i>.
     * @param {Integer} dwAccessFlags 
     * @param {Pointer<UInt32>} lpdwLogType 
     * @param {PDH_HQUERY} hQuery Specify a query handle if you are writing query data to a log file. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a> function returns this handle. 
     * 
     * 
     * 
     * 
     * This parameter is ignored and should be <b>NULL</b> if you are reading from the log file.
     * @param {Integer} dwMaxSize Maximum size of the log file, in bytes. Specify the maximum size if you want to limit the file size or if <i>dwAccessFlags</i> specifies <b>PDH_LOG_OPT_CIRCULAR</b>; otherwise, set to 0.
     * 
     * For circular log files, you must specify a value large enough to hold at least one sample.   Sample size depends on data being collected. However, specifying a value of at least one megabyte will cover most samples.
     * @param {PSTR} szUserCaption <b>Null</b>-terminated string that specifies the user-defined caption of the log file. A log file caption generally describes the contents of the log file. When an existing log file is opened, the value of this parameter is ignored.
     * @param {Pointer<PDH_HLOG>} phLog Handle to the opened log file.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhopenloga
     * @since windows5.1.2600
     */
    static PdhOpenLogA(szLogFileName, dwAccessFlags, lpdwLogType, hQuery, dwMaxSize, szUserCaption, phLog) {
        szLogFileName := szLogFileName is String ? StrPtr(szLogFileName) : szLogFileName
        szUserCaption := szUserCaption is String ? StrPtr(szUserCaption) : szUserCaption
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("pdh.dll\PdhOpenLogA", "ptr", szLogFileName, "uint", dwAccessFlags, "uint*", lpdwLogType, "ptr", hQuery, "uint", dwMaxSize, "ptr", szUserCaption, "ptr", phLog, "uint")
        return result
    }

    /**
     * Collects counter data for the current query and writes the data to the log file.
     * @param {PDH_HLOG} hLog Handle of a single log file to update. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenloga">PdhOpenLog</a> function returns this handle.
     * @param {PWSTR} szUserString Null-terminated string that contains a user-defined comment to add to the data record. The string can not be empty.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The log file handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An empty string was passed in the <i>szUserString</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhupdatelogw
     * @since windows5.1.2600
     */
    static PdhUpdateLogW(hLog, szUserString) {
        szUserString := szUserString is String ? StrPtr(szUserString) : szUserString
        hLog := hLog is Win32Handle ? NumGet(hLog, "ptr") : hLog

        result := DllCall("pdh.dll\PdhUpdateLogW", "ptr", hLog, "ptr", szUserString, "uint")
        return result
    }

    /**
     * Collects counter data for the current query and writes the data to the log file.
     * @param {PDH_HLOG} hLog Handle of a single log file to update. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenloga">PdhOpenLog</a> function returns this handle.
     * @param {PSTR} szUserString Null-terminated string that contains a user-defined comment to add to the data record. The string can not be empty.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The log file handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An empty string was passed in the <i>szUserString</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhupdateloga
     * @since windows5.1.2600
     */
    static PdhUpdateLogA(hLog, szUserString) {
        szUserString := szUserString is String ? StrPtr(szUserString) : szUserString
        hLog := hLog is Win32Handle ? NumGet(hLog, "ptr") : hLog

        result := DllCall("pdh.dll\PdhUpdateLogA", "ptr", hLog, "ptr", szUserString, "uint")
        return result
    }

    /**
     * Synchronizes the information in the log file catalog with the performance data in the log file.
     * @param {PDH_HLOG} hLog Handle to the log file containing the file catalog to update. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenloga">PdhOpenLog</a> function.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_NOT_IMPLEMENTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A handle to a CSV or TSV log file was specified. These log file types do not have catalogs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_UNKNOWN_LOG_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A handle to a log file with an unknown format was specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhupdatelogfilecatalog
     * @since windows5.1.2600
     */
    static PdhUpdateLogFileCatalog(hLog) {
        hLog := hLog is Win32Handle ? NumGet(hLog, "ptr") : hLog

        result := DllCall("pdh.dll\PdhUpdateLogFileCatalog", "ptr", hLog, "uint")
        return result
    }

    /**
     * Returns the size of the specified log file.
     * @param {PDH_HLOG} hLog Handle to the log file. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenloga">PdhOpenLog</a> or <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function returns this handle.
     * @param {Pointer<Int64>} llSize Size of the log file, in bytes.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_LOG_FILE_OPEN_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred when trying to open the log file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetlogfilesize
     * @since windows5.1.2600
     */
    static PdhGetLogFileSize(hLog, llSize) {
        hLog := hLog is Win32Handle ? NumGet(hLog, "ptr") : hLog

        result := DllCall("pdh.dll\PdhGetLogFileSize", "ptr", hLog, "int64*", llSize, "uint")
        return result
    }

    /**
     * Closes the specified log file.
     * @param {PDH_HLOG} hLog Handle to the log file to be closed. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenloga">PdhOpenLog</a> function.
     * @param {Integer} dwFlags You can specify the following flag. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDH_FLAGS_CLOSE_QUERY"></a><a id="pdh_flags_close_query"></a><dl>
     * <dt><b>PDH_FLAGS_CLOSE_QUERY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Closes the query associated with the specified log file handle. See the <i>hQuery</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenloga">PdhOpenLog</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS and closes and deletes the query.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following is a possible value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The log file handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhcloselog
     * @since windows5.1.2600
     */
    static PdhCloseLog(hLog, dwFlags) {
        hLog := hLog is Win32Handle ? NumGet(hLog, "ptr") : hLog

        result := DllCall("pdh.dll\PdhCloseLog", "ptr", hLog, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Displays a dialog window that prompts the user to specify the source of the performance data.
     * @param {HWND} hWndOwner Owner of the dialog window. This can be <b>NULL</b> if there is no owner (the desktop becomes the owner).
     * @param {Integer} dwFlags 
     * @param {PWSTR} szDataSource Caller-allocated buffer that receives a <b>null</b>-terminated string that contains the name of a log file that the user selected. The log file name is truncated to the size of the buffer if the buffer is too small.
     * 
     * If the user selected a real time source, the buffer is empty.
     * @param {Pointer<UInt32>} pcchBufferLength Maximum size of the <i>szDataSource</i> buffer, in <b>TCHARs</b>.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length of the buffer passed in the <i>pcchBufferLength</i> is not equal to the actual length of the <i>szDataSource</i> buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A zero-length buffer was passed in the <i>szDataSource</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhselectdatasourcew
     * @since windows5.1.2600
     */
    static PdhSelectDataSourceW(hWndOwner, dwFlags, szDataSource, pcchBufferLength) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        hWndOwner := hWndOwner is Win32Handle ? NumGet(hWndOwner, "ptr") : hWndOwner

        result := DllCall("pdh.dll\PdhSelectDataSourceW", "ptr", hWndOwner, "uint", dwFlags, "ptr", szDataSource, "uint*", pcchBufferLength, "uint")
        return result
    }

    /**
     * Displays a dialog window that prompts the user to specify the source of the performance data.
     * @param {HWND} hWndOwner Owner of the dialog window. This can be <b>NULL</b> if there is no owner (the desktop becomes the owner).
     * @param {Integer} dwFlags 
     * @param {PSTR} szDataSource Caller-allocated buffer that receives a <b>null</b>-terminated string that contains the name of a log file that the user selected. The log file name is truncated to the size of the buffer if the buffer is too small.
     * 
     * If the user selected a real time source, the buffer is empty.
     * @param {Pointer<UInt32>} pcchBufferLength Maximum size of the <i>szDataSource</i> buffer, in <b>TCHARs</b>.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length of the buffer passed in the <i>pcchBufferLength</i> is not equal to the actual length of the <i>szDataSource</i> buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A zero-length buffer was passed in the <i>szDataSource</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhselectdatasourcea
     * @since windows5.1.2600
     */
    static PdhSelectDataSourceA(hWndOwner, dwFlags, szDataSource, pcchBufferLength) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        hWndOwner := hWndOwner is Win32Handle ? NumGet(hWndOwner, "ptr") : hWndOwner

        result := DllCall("pdh.dll\PdhSelectDataSourceA", "ptr", hWndOwner, "uint", dwFlags, "ptr", szDataSource, "uint*", pcchBufferLength, "uint")
        return result
    }

    /**
     * Determines if the specified query is a real-time query.
     * @param {PDH_HQUERY} hQuery Handle to the query. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a> function returns this handle.
     * @returns {BOOL} If the query is a real-time query, the return value is <b>TRUE</b>.
     * 						
     * 
     * If the query is not a real-time query, the return value is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhisrealtimequery
     * @since windows5.1.2600
     */
    static PdhIsRealTimeQuery(hQuery) {
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("pdh.dll\PdhIsRealTimeQuery", "ptr", hQuery, "ptr")
        return result
    }

    /**
     * Limits the samples that you can read from a log file to those within the specified time range, inclusively.
     * @param {PDH_HQUERY} hQuery Handle to the query. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a> function returns this handle.
     * @param {Pointer<PDH_TIME_INFO>} pInfo A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_time_info">PDH_TIME_INFO</a> structure that specifies the time range. Specify the time as local file time. The end time must be greater than the start time. You can specify 0 for the start time and the maximum 64-bit value for the end time if you want to read all records.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ending time range value must be greater than the starting time range value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhsetquerytimerange
     * @since windows5.1.2600
     */
    static PdhSetQueryTimeRange(hQuery, pInfo) {
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery

        result := DllCall("pdh.dll\PdhSetQueryTimeRange", "ptr", hQuery, "ptr", pInfo, "uint")
        return result
    }

    /**
     * Determines the time range, number of entries and, if applicable, the size of the buffer containing the performance data from the specified input source. To use handles to data sources, use the PdhGetDataSourceTimeRangeH function.
     * @param {PWSTR} szDataSource Null-terminated string that specifies the name of a log file from which the time range information is retrieved.
     * @param {Pointer<UInt32>} pdwNumEntries Number of structures in the <i>pInfo</i> buffer. This function collects information for only one time range, so the value is typically 1, or zero if an error occurred.
     * @param {Pointer<PDH_TIME_INFO>} pInfo A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_time_info">PDH_TIME_INFO</a> structure that receives the time range.
     * @param {Pointer<UInt32>} pdwBufferSize Size of the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_time_info">PDH_TIME_INFO</a> structure, in bytes.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_DATA_SOURCE_IS_REAL_TIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current data source is a real-time data source.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetdatasourcetimerangew
     * @since windows5.1.2600
     */
    static PdhGetDataSourceTimeRangeW(szDataSource, pdwNumEntries, pInfo, pdwBufferSize) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource

        result := DllCall("pdh.dll\PdhGetDataSourceTimeRangeW", "ptr", szDataSource, "uint*", pdwNumEntries, "ptr", pInfo, "uint*", pdwBufferSize, "uint")
        return result
    }

    /**
     * Determines the time range, number of entries and, if applicable, the size of the buffer containing the performance data from the specified input source. To use handles to data sources, use the PdhGetDataSourceTimeRangeH function.
     * @param {PSTR} szDataSource Null-terminated string that specifies the name of a log file from which the time range information is retrieved.
     * @param {Pointer<UInt32>} pdwNumEntries Number of structures in the <i>pInfo</i> buffer. This function collects information for only one time range, so the value is typically 1, or zero if an error occurred.
     * @param {Pointer<PDH_TIME_INFO>} pInfo A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_time_info">PDH_TIME_INFO</a> structure that receives the time range.
     * @param {Pointer<UInt32>} pdwBufferSize Size of the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_time_info">PDH_TIME_INFO</a> structure, in bytes.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_DATA_SOURCE_IS_REAL_TIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current data source is a real-time data source.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetdatasourcetimerangea
     * @since windows5.1.2600
     */
    static PdhGetDataSourceTimeRangeA(szDataSource, pdwNumEntries, pInfo, pdwBufferSize) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource

        result := DllCall("pdh.dll\PdhGetDataSourceTimeRangeA", "ptr", szDataSource, "uint*", pdwNumEntries, "ptr", pInfo, "uint*", pdwBufferSize, "uint")
        return result
    }

    /**
     * Uses a separate thread to collect the current raw data value for all counters in the specified query. The function then signals the application-defined event and waits the specified time interval before returning.
     * @param {PDH_HQUERY} hQuery Handle of the query. The query identifies the counters that you want to collect. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenquerya">PdhOpenQuery</a> function returns this handle.
     * @param {Integer} dwIntervalTime Time interval to wait, in seconds.
     * @param {HANDLE} hNewDataEvent Handle to the event that you want PDH to signal after the time interval expires. To create an event object, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_NO_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The query does not currently have any counters.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhcollectquerydataex
     * @since windows5.1.2600
     */
    static PdhCollectQueryDataEx(hQuery, dwIntervalTime, hNewDataEvent) {
        hQuery := hQuery is Win32Handle ? NumGet(hQuery, "ptr") : hQuery
        hNewDataEvent := hNewDataEvent is Win32Handle ? NumGet(hNewDataEvent, "ptr") : hNewDataEvent

        result := DllCall("pdh.dll\PdhCollectQueryDataEx", "ptr", hQuery, "uint", dwIntervalTime, "ptr", hNewDataEvent, "uint")
        return result
    }

    /**
     * Computes a displayable value for the given raw counter values.
     * @param {Integer} dwCounterType Type of counter. Typically, you call <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetcounterinfoa">PdhGetCounterInfo</a> to retrieve the counter type at the time you call <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetrawcountervalue">PdhGetRawCounterValue</a> to retrieve the raw counter value.
     * 
     * For a list of counter types, see the Counter Types section of the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc776490(v=ws.10)">Windows Server 2003 Deployment Kit</a>. (The constant values are defined in Winperf.h.)
     * 
     * Note that you cannot specify base types, for example, PERF_LARGE_RAW_BASE.
     * @param {Integer} dwFormat 
     * @param {Pointer<Int64>} pTimeBase Pointer to the time base, if necessary for the format conversion. If time base information is not necessary for the format conversion, the value of this parameter is ignored. To retrieve the time base of the counter, call <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetcountertimebase">PdhGetCounterTimeBase</a>.
     * @param {Pointer<PDH_RAW_COUNTER>} pRawValue1 Raw counter value used to compute the displayable counter value. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_raw_counter">PDH_RAW_COUNTER</a>.
     * @param {Pointer<PDH_RAW_COUNTER>} pRawValue2 Raw counter value used to compute the displayable counter value. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_raw_counter">PDH_RAW_COUNTER</a>. Some counters, for example, rate counters, require two raw values to calculate a displayable value. If the counter type does not require a second value, set this parameter to <b>NULL</b>. This value must be the older of the two raw values.
     * @param {Pointer<PDH_FMT_COUNTERVALUE>} pFmtValue A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_fmt_countervalue">PDH_FMT_COUNTERVALUE</a> structure that receives the calculated counter value.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhformatfromrawvalue
     * @since windows5.1.2600
     */
    static PdhFormatFromRawValue(dwCounterType, dwFormat, pTimeBase, pRawValue1, pRawValue2, pFmtValue) {
        result := DllCall("pdh.dll\PdhFormatFromRawValue", "uint", dwCounterType, "uint", dwFormat, "int64*", pTimeBase, "ptr", pRawValue1, "ptr", pRawValue2, "ptr", pFmtValue, "uint")
        return result
    }

    /**
     * Returns the time base of the specified counter.
     * @param {PDH_HCOUNTER} hCounter Handle to the counter. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhaddcountera">PdhAddCounter</a> function returns this handle.
     * @param {Pointer<Int64>} pTimeBase Time base that specifies the number of performance values a counter samples per second.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified counter does not use a time base.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetcountertimebase
     * @since windows5.1.2600
     */
    static PdhGetCounterTimeBase(hCounter, pTimeBase) {
        result := DllCall("pdh.dll\PdhGetCounterTimeBase", "ptr", hCounter, "int64*", pTimeBase, "uint")
        return result
    }

    /**
     * Reads the information in the specified binary trace log file.
     * @param {PDH_HLOG} hLog Handle to the log file. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhopenloga">PdhOpenLog</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function returns this handle.
     * @param {FILETIME} ftRecord Time stamp of the record to be read. If the time stamp does not match a record in the log file, the function returns the record that has a time stamp closest to (but not greater than) the given time stamp.
     * @param {Pointer<PDH_RAW_LOG_RECORD>} pRawLogRecord Caller-allocated buffer that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_raw_log_record">PDH_RAW_LOG_RECORD</a> structure; the structure contains the log file record information. Set to <b>NULL</b> if <i>pdwBufferLength</i> is zero.
     * @param {Pointer<UInt32>} pdwBufferLength Size of the <i>pRawLogRecord</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pRawLogRecord</i> buffer is too small to contain the path elements. This return value is expected if <i>pdwBufferLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory in order to complete the function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhreadrawlogrecord
     * @since windows5.1.2600
     */
    static PdhReadRawLogRecord(hLog, ftRecord, pRawLogRecord, pdwBufferLength) {
        hLog := hLog is Win32Handle ? NumGet(hLog, "ptr") : hLog

        result := DllCall("pdh.dll\PdhReadRawLogRecord", "ptr", hLog, "ptr", ftRecord, "ptr", pRawLogRecord, "uint*", pdwBufferLength, "uint")
        return result
    }

    /**
     * Specifies the source of the real-time data.
     * @param {Integer} dwDataSourceId 
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following is a possible value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhsetdefaultrealtimedatasource
     * @since windows5.1.2600
     */
    static PdhSetDefaultRealTimeDataSource(dwDataSourceId) {
        result := DllCall("pdh.dll\PdhSetDefaultRealTimeDataSource", "uint", dwDataSourceId, "uint")
        return result
    }

    /**
     * Binds one or more binary log files together for reading log data.
     * @param {Pointer<PDH_HLOG>} phDataSource Handle to the bound data sources.
     * @param {PWSTR} LogFileNameList <b>Null</b>-terminated string that contains one or more binary log files to bind together. Terminate each log file name with a <b>null</b>-terminator character and the list with one additional <b>null</b>-terminator character. The log file names can contain absolute or relative paths. You cannot specify more than 32 log files.
     * 
     * If <b>NULL</b>, the source is a real-time data source.
     * @returns {Integer} Returns ERROR_SUCCESS if the function succeeds.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhbindinputdatasourcew
     * @since windows5.1.2600
     */
    static PdhBindInputDataSourceW(phDataSource, LogFileNameList) {
        LogFileNameList := LogFileNameList is String ? StrPtr(LogFileNameList) : LogFileNameList

        result := DllCall("pdh.dll\PdhBindInputDataSourceW", "ptr", phDataSource, "ptr", LogFileNameList, "uint")
        return result
    }

    /**
     * Binds one or more binary log files together for reading log data.
     * @param {Pointer<PDH_HLOG>} phDataSource Handle to the bound data sources.
     * @param {PSTR} LogFileNameList <b>Null</b>-terminated string that contains one or more binary log files to bind together. Terminate each log file name with a <b>null</b>-terminator character and the list with one additional <b>null</b>-terminator character. The log file names can contain absolute or relative paths. You cannot specify more than 32 log files.
     * 
     * If <b>NULL</b>, the source is a real-time data source.
     * @returns {Integer} Returns ERROR_SUCCESS if the function succeeds.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhbindinputdatasourcea
     * @since windows5.1.2600
     */
    static PdhBindInputDataSourceA(phDataSource, LogFileNameList) {
        LogFileNameList := LogFileNameList is String ? StrPtr(LogFileNameList) : LogFileNameList

        result := DllCall("pdh.dll\PdhBindInputDataSourceA", "ptr", phDataSource, "ptr", LogFileNameList, "uint")
        return result
    }

    /**
     * Creates a new query that is used to manage the collection of performance data. This function is identical to the PdhOpenQuery function, except that it supports the use of handles to data sources.
     * @param {PDH_HLOG} hDataSource Handle to a data source returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function.
     * @param {Pointer} dwUserData User-defined value to associate with this query. To retrieve the user data later, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhgetcounterinfoa">PdhGetCounterInfo</a> function and access the <b>dwQueryUserData</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_counter_info_a">PDH_COUNTER_INFO</a>.
     * @param {Pointer<PDH_HQUERY>} phQuery Handle to the query. You use this handle in subsequent calls.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhopenqueryh
     * @since windows5.1.2600
     */
    static PdhOpenQueryH(hDataSource, dwUserData, phQuery) {
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhOpenQueryH", "ptr", hDataSource, "ptr", dwUserData, "ptr", phQuery, "uint")
        return result
    }

    /**
     * Returns a list of the computer names associated with counters in a log file.
     * @param {PDH_HLOG} hDataSource Handle to a data source returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function.
     * @param {PWSTR} mszMachineList Caller-allocated buffer to receive the list of <b>null</b>-terminated strings that contain the computer names. The list is terminated with two <b>null</b>-terminator characters. Set to <b>NULL</b> if <i>pcchBufferLength</i> is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>mszMachineNameList</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszMachineNameList</i> buffer is too small to contain all the data. This return value is expected if <i>pcchBufferLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenummachineshw
     * @since windows5.1.2600
     */
    static PdhEnumMachinesHW(hDataSource, mszMachineList, pcchBufferSize) {
        mszMachineList := mszMachineList is String ? StrPtr(mszMachineList) : mszMachineList
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhEnumMachinesHW", "ptr", hDataSource, "ptr", mszMachineList, "uint*", pcchBufferSize, "uint")
        return result
    }

    /**
     * Returns a list of the computer names associated with counters in a log file.
     * @param {PDH_HLOG} hDataSource Handle to a data source returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function.
     * @param {PSTR} mszMachineList Caller-allocated buffer to receive the list of <b>null</b>-terminated strings that contain the computer names. The list is terminated with two <b>null</b>-terminator characters. Set to <b>NULL</b> if <i>pcchBufferLength</i> is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>mszMachineNameList</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszMachineNameList</i> buffer is too small to contain all the data. This return value is expected if <i>pcchBufferLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenummachinesha
     * @since windows5.1.2600
     */
    static PdhEnumMachinesHA(hDataSource, mszMachineList, pcchBufferSize) {
        mszMachineList := mszMachineList is String ? StrPtr(mszMachineList) : mszMachineList
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhEnumMachinesHA", "ptr", hDataSource, "ptr", mszMachineList, "uint*", pcchBufferSize, "uint")
        return result
    }

    /**
     * Returns a list of objects available on the specified computer or in the specified log file.This function is identical to PdhEnumObjects, except that it supports the use of handles to data sources.
     * @param {PDH_HLOG} hDataSource Handle to a data source returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function.
     * @param {PWSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer used to enumerate the performance objects. 
     * 
     * 
     * Include the leading slashes in the computer name, for example, \\computername.
     * 
     * If <i>szDataSource</i> is <b>NULL</b>, you can set <i>szMachineName</i> to <b>NULL</b> to specify the local computer.
     * @param {PWSTR} mszObjectList Caller-allocated buffer that receives the list of object names. Each object name in this list is terminated by a <b>null</b> character. The list is terminated with two <b>null</b>-terminator characters. Set to <b>NULL</b> if <i>pcchBufferLength</i> is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>mszObjectList</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * <b>Windows XP:  </b>Add one to the required buffer size.
     * @param {Integer} dwDetailLevel 
     * @param {BOOL} bRefresh 
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszObjectList</i> buffer is too small to hold the list of objects. This return value is expected if <i>pcchBufferLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenumobjectshw
     * @since windows5.1.2600
     */
    static PdhEnumObjectsHW(hDataSource, szMachineName, mszObjectList, pcchBufferSize, dwDetailLevel, bRefresh) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        mszObjectList := mszObjectList is String ? StrPtr(mszObjectList) : mszObjectList
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhEnumObjectsHW", "ptr", hDataSource, "ptr", szMachineName, "ptr", mszObjectList, "uint*", pcchBufferSize, "uint", dwDetailLevel, "ptr", bRefresh, "uint")
        return result
    }

    /**
     * Returns a list of objects available on the specified computer or in the specified log file.This function is identical to PdhEnumObjects, except that it supports the use of handles to data sources.
     * @param {PDH_HLOG} hDataSource Handle to a data source returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function.
     * @param {PSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer used to enumerate the performance objects. 
     * 
     * 
     * Include the leading slashes in the computer name, for example, \\computername.
     * 
     * If <i>szDataSource</i> is <b>NULL</b>, you can set <i>szMachineName</i> to <b>NULL</b> to specify the local computer.
     * @param {PSTR} mszObjectList Caller-allocated buffer that receives the list of object names. Each object name in this list is terminated by a <b>null</b> character. The list is terminated with two <b>null</b>-terminator characters. Set to <b>NULL</b> if <i>pcchBufferLength</i> is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>mszObjectList</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * <b>Windows XP:  </b>Add one to the required buffer size.
     * @param {Integer} dwDetailLevel 
     * @param {BOOL} bRefresh 
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszObjectList</i> buffer is too small to hold the list of objects. This return value is expected if <i>pcchBufferLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenumobjectsha
     * @since windows5.1.2600
     */
    static PdhEnumObjectsHA(hDataSource, szMachineName, mszObjectList, pcchBufferSize, dwDetailLevel, bRefresh) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        mszObjectList := mszObjectList is String ? StrPtr(mszObjectList) : mszObjectList
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhEnumObjectsHA", "ptr", hDataSource, "ptr", szMachineName, "ptr", mszObjectList, "uint*", pcchBufferSize, "uint", dwDetailLevel, "ptr", bRefresh, "uint")
        return result
    }

    /**
     * Returns the specified object's counter and instance names that exist on the specified computer or in the specified log file. This function is identical to the PdhEnumObjectItems function, except that it supports the use of handles to data sources.
     * @param {PDH_HLOG} hDataSource Handle to a data source returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function.
     * @param {PWSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer that contains the counter and instance names that you want to enumerate. 
     * 
     * 
     * Include the leading slashes in the computer name, for example, \\computername.
     * 
     * If the <i>szDataSource</i> parameter is <b>NULL</b>, you can set <i>szMachineName</i> to <b>NULL</b> to specify the local computer.
     * @param {PWSTR} szObjectName <b>Null</b>-terminated string that specifies the name of the object whose counter and instance names you want to enumerate.
     * @param {PWSTR} mszCounterList Caller-allocated buffer that receives a list of <b>null</b>-terminated counter names provided by the specified object. The list contains unique counter names. The list is terminated by two <b>NULL</b> characters. Set to <b>NULL</b> if the <i>pcchCounterListLength</i> parameter is zero.
     * @param {Pointer<UInt32>} pcchCounterListLength Size of the <i>mszCounterList</i> buffer, in <b>TCHARs</b>. If zero on input and the object exists, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {PWSTR} mszInstanceList Caller-allocated buffer that receives a list of <b>null</b>-terminated instance names provided by the specified object. The list contains unique instance names. The list is terminated by two <b>NULL</b> characters. Set to <b>NULL</b> if the <i>pcchInstanceListLength</i> parameter is zero.
     * @param {Pointer<UInt32>} pcchInstanceListLength Size of the <i>mszInstanceList</i> buffer, in <b>TCHARs</b>. If zero on input and the object exists, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * If the specified object does not support variable instances, then the returned value will be zero. If the specified object does support variable instances, but does not currently have any instances, then the value returned is 2, which is the size of an empty MULTI_SZ list string.
     * @param {Integer} dwDetailLevel 
     * @param {Integer} dwFlags This parameter must be zero.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the buffers is too small to contain the list of names. This return value is expected if <i>pcchCounterListLength</i> or <i>pcchInstanceListLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object could not be found on the specified computer or in the specified log file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenumobjectitemshw
     * @since windows5.1.2600
     */
    static PdhEnumObjectItemsHW(hDataSource, szMachineName, szObjectName, mszCounterList, pcchCounterListLength, mszInstanceList, pcchInstanceListLength, dwDetailLevel, dwFlags) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szObjectName := szObjectName is String ? StrPtr(szObjectName) : szObjectName
        mszCounterList := mszCounterList is String ? StrPtr(mszCounterList) : mszCounterList
        mszInstanceList := mszInstanceList is String ? StrPtr(mszInstanceList) : mszInstanceList
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhEnumObjectItemsHW", "ptr", hDataSource, "ptr", szMachineName, "ptr", szObjectName, "ptr", mszCounterList, "uint*", pcchCounterListLength, "ptr", mszInstanceList, "uint*", pcchInstanceListLength, "uint", dwDetailLevel, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Returns the specified object's counter and instance names that exist on the specified computer or in the specified log file. This function is identical to the PdhEnumObjectItems function, except that it supports the use of handles to data sources.
     * @param {PDH_HLOG} hDataSource Handle to a data source returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function.
     * @param {PSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer that contains the counter and instance names that you want to enumerate. 
     * 
     * 
     * Include the leading slashes in the computer name, for example, \\computername.
     * 
     * If the <i>szDataSource</i> parameter is <b>NULL</b>, you can set <i>szMachineName</i> to <b>NULL</b> to specify the local computer.
     * @param {PSTR} szObjectName <b>Null</b>-terminated string that specifies the name of the object whose counter and instance names you want to enumerate.
     * @param {PSTR} mszCounterList Caller-allocated buffer that receives a list of <b>null</b>-terminated counter names provided by the specified object. The list contains unique counter names. The list is terminated by two <b>NULL</b> characters. Set to <b>NULL</b> if the <i>pcchCounterListLength</i> parameter is zero.
     * @param {Pointer<UInt32>} pcchCounterListLength Size of the <i>mszCounterList</i> buffer, in <b>TCHARs</b>. If zero on input and the object exists, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @param {PSTR} mszInstanceList Caller-allocated buffer that receives a list of <b>null</b>-terminated instance names provided by the specified object. The list contains unique instance names. The list is terminated by two <b>NULL</b> characters. Set to <b>NULL</b> if the <i>pcchInstanceListLength</i> parameter is zero.
     * @param {Pointer<UInt32>} pcchInstanceListLength Size of the <i>mszInstanceList</i> buffer, in <b>TCHARs</b>. If zero on input and the object exists, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * If the specified object does not support variable instances, then the returned value will be zero. If the specified object does support variable instances, but does not currently have any instances, then the value returned is 2, which is the size of an empty MULTI_SZ list string.
     * @param {Integer} dwDetailLevel 
     * @param {Integer} dwFlags This parameter must be zero.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the buffers is too small to contain the list of names. This return value is expected if <i>pcchCounterListLength</i> or <i>pcchInstanceListLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object could not be found on the specified computer or in the specified log file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenumobjectitemsha
     * @since windows5.1.2600
     */
    static PdhEnumObjectItemsHA(hDataSource, szMachineName, szObjectName, mszCounterList, pcchCounterListLength, mszInstanceList, pcchInstanceListLength, dwDetailLevel, dwFlags) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szObjectName := szObjectName is String ? StrPtr(szObjectName) : szObjectName
        mszCounterList := mszCounterList is String ? StrPtr(mszCounterList) : mszCounterList
        mszInstanceList := mszInstanceList is String ? StrPtr(mszInstanceList) : mszInstanceList
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhEnumObjectItemsHA", "ptr", hDataSource, "ptr", szMachineName, "ptr", szObjectName, "ptr", mszCounterList, "uint*", pcchCounterListLength, "ptr", mszInstanceList, "uint*", pcchInstanceListLength, "uint", dwDetailLevel, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Examines the specified computer or log file and returns those counter paths that match the given counter path which contains wildcard characters.This function is identical to the PdhExpandWildCardPath function, except that it supports the use of handles to data sources.
     * @param {PDH_HLOG} hDataSource Handle to a data source returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function.
     * @param {PWSTR} szWildCardPath <b>Null</b>-terminated string that specifies the counter path to expand. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * 
     * If <i>hDataSource</i> is a real time data source, the function searches the computer specified in the path for matches. If the path does not specify a computer, the function searches the local computer.
     * @param {PWSTR} mszExpandedPathList Caller-allocated buffer that receives a list of <b>null</b>-terminated counter paths that match the wildcard specification in the <i>szWildCardPath</i>. The list is terminated by two <b>NULL</b> characters. Set to <b>NULL</b> if <i>pcchPathListLength</i> is zero.
     * @param {Pointer<UInt32>} pcchPathListLength Size of the <i>mszExpandedPathList</i> buffer, in <b>TCHARs</b>. If zero on input and the object exists, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * <div class="alert"><b>Note</b>  You must add one to the required size on Windows XP.</div>
     * <div> </div>
     * @param {Integer} dwFlags Flags that indicate which wildcard characters not to expand. You can specify one or more flags. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDH_NOEXPANDCOUNTERS"></a><a id="pdh_noexpandcounters"></a><dl>
     * <dt><b>PDH_NOEXPANDCOUNTERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not expand the counter name if the path contains a wildcard character for counter name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDH_NOEXPANDINSTANCES"></a><a id="pdh_noexpandinstances"></a><dl>
     * <dt><b>PDH_NOEXPANDINSTANCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not expand the instance name if the path contains a wildcard character for parent instance, instance name, or instance index.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszExpandedPathList</i> buffer is not large enough to contain the list of paths. This return value is expected if <i>pcchPathListLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the specified object on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhexpandwildcardpathhw
     * @since windows5.1.2600
     */
    static PdhExpandWildCardPathHW(hDataSource, szWildCardPath, mszExpandedPathList, pcchPathListLength, dwFlags) {
        szWildCardPath := szWildCardPath is String ? StrPtr(szWildCardPath) : szWildCardPath
        mszExpandedPathList := mszExpandedPathList is String ? StrPtr(mszExpandedPathList) : mszExpandedPathList
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhExpandWildCardPathHW", "ptr", hDataSource, "ptr", szWildCardPath, "ptr", mszExpandedPathList, "uint*", pcchPathListLength, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Examines the specified computer or log file and returns those counter paths that match the given counter path which contains wildcard characters.This function is identical to the PdhExpandWildCardPath function, except that it supports the use of handles to data sources.
     * @param {PDH_HLOG} hDataSource Handle to a data source returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function.
     * @param {PSTR} szWildCardPath <b>Null</b>-terminated string that specifies the counter path to expand. The maximum length of a counter path is PDH_MAX_COUNTER_PATH.
     * 
     * If <i>hDataSource</i> is a real time data source, the function searches the computer specified in the path for matches. If the path does not specify a computer, the function searches the local computer.
     * @param {PSTR} mszExpandedPathList Caller-allocated buffer that receives a list of <b>null</b>-terminated counter paths that match the wildcard specification in the <i>szWildCardPath</i>. The list is terminated by two <b>NULL</b> characters. Set to <b>NULL</b> if <i>pcchPathListLength</i> is zero.
     * @param {Pointer<UInt32>} pcchPathListLength Size of the <i>mszExpandedPathList</i> buffer, in <b>TCHARs</b>. If zero on input and the object exists, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * <div class="alert"><b>Note</b>  You must add one to the required size on Windows XP.</div>
     * <div> </div>
     * @param {Integer} dwFlags Flags that indicate which wildcard characters not to expand. You can specify one or more flags. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDH_NOEXPANDCOUNTERS"></a><a id="pdh_noexpandcounters"></a><dl>
     * <dt><b>PDH_NOEXPANDCOUNTERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not expand the counter name if the path contains a wildcard character for counter name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PDH_NOEXPANDINSTANCES"></a><a id="pdh_noexpandinstances"></a><dl>
     * <dt><b>PDH_NOEXPANDINSTANCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not expand the instance name if the path contains a wildcard character for parent instance, instance name, or instance index.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>mszExpandedPathList</i> buffer is not large enough to contain the list of paths. This return value is expected if <i>pcchPathListLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the specified object on the computer or in the log file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhexpandwildcardpathha
     * @since windows5.1.2600
     */
    static PdhExpandWildCardPathHA(hDataSource, szWildCardPath, mszExpandedPathList, pcchPathListLength, dwFlags) {
        szWildCardPath := szWildCardPath is String ? StrPtr(szWildCardPath) : szWildCardPath
        mszExpandedPathList := mszExpandedPathList is String ? StrPtr(mszExpandedPathList) : mszExpandedPathList
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhExpandWildCardPathHA", "ptr", hDataSource, "ptr", szWildCardPath, "ptr", mszExpandedPathList, "uint*", pcchPathListLength, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Determines the time range, number of entries and, if applicable, the size of the buffer containing the performance data from the specified input source.This function is identical to the PdhGetDataSourceTimeRange function, except that it supports the use of handles to data sources.
     * @param {PDH_HLOG} hDataSource Handle to a data source returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhbindinputdatasourcea">PdhBindInputDataSource</a> function.
     * @param {Pointer<UInt32>} pdwNumEntries Number of structures in the <i>pInfo</i> buffer. This function collects information for only one time range, so the value is typically 1, or zero if an error occurred.
     * @param {Pointer<PDH_TIME_INFO>} pInfo A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_time_info">PDH_TIME_INFO</a> structure that receives the time range. The information spans all bound log files.
     * @param {Pointer<UInt32>} pdwBufferSize Size of the <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_time_info">PDH_TIME_INFO</a> structure, in bytes.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid or is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_DATA_SOURCE_IS_REAL_TIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current data source is a real-time data source.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetdatasourcetimerangeh
     * @since windows5.1.2600
     */
    static PdhGetDataSourceTimeRangeH(hDataSource, pdwNumEntries, pInfo, pdwBufferSize) {
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhGetDataSourceTimeRangeH", "ptr", hDataSource, "uint*", pdwNumEntries, "ptr", pInfo, "uint*", pdwBufferSize, "uint")
        return result
    }

    /**
     * Retrieves the name of the default object.
     * @param {PDH_HLOG} hDataSource Should be <b>NULL</b>. 
     * 
     * If you specify a log file handle, <i>szDefaultObjectName</i> will be a <b>null</b> string.
     * @param {PWSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer used to verify the object name. If <b>NULL</b>, the local computer is used to verify the name.
     * @param {PWSTR} szDefaultObjectName Caller-allocated buffer that receives the <b>null</b>-terminated default object name. Set to  <b>NULL</b> if <i>pcchBufferSize</i> is zero.
     * 
     * Note that PDH always returns Processor for the default object name.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>szDefaultObjectName</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szDefaultObjectName</i> buffer is too small to contain the object name. This return value is expected if <i>pcchBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory in order to complete the function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The default object name cannot be read or found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetdefaultperfobjecthw
     * @since windows5.1.2600
     */
    static PdhGetDefaultPerfObjectHW(hDataSource, szMachineName, szDefaultObjectName, pcchBufferSize) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szDefaultObjectName := szDefaultObjectName is String ? StrPtr(szDefaultObjectName) : szDefaultObjectName
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhGetDefaultPerfObjectHW", "ptr", hDataSource, "ptr", szMachineName, "ptr", szDefaultObjectName, "uint*", pcchBufferSize, "uint")
        return result
    }

    /**
     * Retrieves the name of the default object.
     * @param {PDH_HLOG} hDataSource Should be <b>NULL</b>. 
     * 
     * If you specify a log file handle, <i>szDefaultObjectName</i> will be a <b>null</b> string.
     * @param {PSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer used to verify the object name. If <b>NULL</b>, the local computer is used to verify the name.
     * @param {PSTR} szDefaultObjectName Caller-allocated buffer that receives the <b>null</b>-terminated default object name. Set to  <b>NULL</b> if <i>pcchBufferSize</i> is zero.
     * 
     * Note that PDH always returns Processor for the default object name.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>szDefaultObjectName</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szDefaultObjectName</i> buffer is too small to contain the object name. This return value is expected if <i>pcchBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory in order to complete the function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The default object name cannot be read or found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetdefaultperfobjectha
     * @since windows5.1.2600
     */
    static PdhGetDefaultPerfObjectHA(hDataSource, szMachineName, szDefaultObjectName, pcchBufferSize) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szDefaultObjectName := szDefaultObjectName is String ? StrPtr(szDefaultObjectName) : szDefaultObjectName
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhGetDefaultPerfObjectHA", "ptr", hDataSource, "ptr", szMachineName, "ptr", szDefaultObjectName, "uint*", pcchBufferSize, "uint")
        return result
    }

    /**
     * Retrieves the name of the default counter for the specified object.
     * @param {PDH_HLOG} hDataSource Should be <b>NULL</b>. 
     * 
     * If you specify a log file handle, <i>szDefaultCounterName</i> will be a <b>null</b> string.
     * @param {PWSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer used to verify the object name. If <b>NULL</b>, the local computer is used to verify the name.
     * @param {PWSTR} szObjectName <b>Null</b>-terminated string that specifies the name of the object whose default counter name you want to retrieve.
     * @param {PWSTR} szDefaultCounterName Caller-allocated buffer that receives the <b>null</b>-terminated default counter name. Set to <b>NULL</b> if <i>pcchBufferSize</i> is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>szDefaultCounterName</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szDefaultCounterName</i> buffer is too small to contain the counter name. This return value is expected if <i>pcchBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory in order to complete the function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The default counter name cannot be read or found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object did not specify a default counter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetdefaultperfcounterhw
     * @since windows5.1.2600
     */
    static PdhGetDefaultPerfCounterHW(hDataSource, szMachineName, szObjectName, szDefaultCounterName, pcchBufferSize) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szObjectName := szObjectName is String ? StrPtr(szObjectName) : szObjectName
        szDefaultCounterName := szDefaultCounterName is String ? StrPtr(szDefaultCounterName) : szDefaultCounterName
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhGetDefaultPerfCounterHW", "ptr", hDataSource, "ptr", szMachineName, "ptr", szObjectName, "ptr", szDefaultCounterName, "uint*", pcchBufferSize, "uint")
        return result
    }

    /**
     * Retrieves the name of the default counter for the specified object.
     * @param {PDH_HLOG} hDataSource Should be <b>NULL</b>. 
     * 
     * If you specify a log file handle, <i>szDefaultCounterName</i> will be a <b>null</b> string.
     * @param {PSTR} szMachineName <b>Null</b>-terminated string that specifies the name of the computer used to verify the object name. If <b>NULL</b>, the local computer is used to verify the name.
     * @param {PSTR} szObjectName <b>Null</b>-terminated string that specifies the name of the object whose default counter name you want to retrieve.
     * @param {PSTR} szDefaultCounterName Caller-allocated buffer that receives the <b>null</b>-terminated default counter name. Set to <b>NULL</b> if <i>pcchBufferSize</i> is zero.
     * @param {Pointer<UInt32>} pcchBufferSize Size of the <i>szDefaultCounterName</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>szDefaultCounterName</i> buffer is too small to contain the counter name. This return value is expected if <i>pcchBufferSize</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MEMORY_ALLOCATION_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory in order to complete the function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified computer is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The default counter name cannot be read or found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_OBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified object could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_CSTATUS_NO_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object did not specify a default counter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhgetdefaultperfcounterha
     * @since windows5.1.2600
     */
    static PdhGetDefaultPerfCounterHA(hDataSource, szMachineName, szObjectName, szDefaultCounterName, pcchBufferSize) {
        szMachineName := szMachineName is String ? StrPtr(szMachineName) : szMachineName
        szObjectName := szObjectName is String ? StrPtr(szObjectName) : szObjectName
        szDefaultCounterName := szDefaultCounterName is String ? StrPtr(szDefaultCounterName) : szDefaultCounterName
        hDataSource := hDataSource is Win32Handle ? NumGet(hDataSource, "ptr") : hDataSource

        result := DllCall("pdh.dll\PdhGetDefaultPerfCounterHA", "ptr", hDataSource, "ptr", szMachineName, "ptr", szObjectName, "ptr", szDefaultCounterName, "uint*", pcchBufferSize, "uint")
        return result
    }

    /**
     * Displays a Browse Counters dialog box that the user can use to select one or more counters that they want to add to the query. This function is identical to the PdhBrowseCounters function, except that it supports the use of handles to data sources.
     * @param {Pointer<PDH_BROWSE_DLG_CONFIG_HW>} pBrowseDlgData A 
     * <a href="https://docs.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_ha">PDH_BROWSE_DLG_CONFIG_H</a> structure that specifies the behavior of the dialog box.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhbrowsecountershw
     * @since windows5.1.2600
     */
    static PdhBrowseCountersHW(pBrowseDlgData) {
        result := DllCall("pdh.dll\PdhBrowseCountersHW", "ptr", pBrowseDlgData, "uint")
        return result
    }

    /**
     * Displays a Browse Counters dialog box that the user can use to select one or more counters that they want to add to the query. This function is identical to the PdhBrowseCounters function, except that it supports the use of handles to data sources.
     * @param {Pointer<PDH_BROWSE_DLG_CONFIG_HA>} pBrowseDlgData A 
     * <a href="https://docs.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_ha">PDH_BROWSE_DLG_CONFIG_H</a> structure that specifies the behavior of the dialog box.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhbrowsecountersha
     * @since windows5.1.2600
     */
    static PdhBrowseCountersHA(pBrowseDlgData) {
        result := DllCall("pdh.dll\PdhBrowseCountersHA", "ptr", pBrowseDlgData, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} szDataSource 
     * @returns {Integer} 
     */
    static PdhVerifySQLDBW(szDataSource) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource

        result := DllCall("pdh.dll\PdhVerifySQLDBW", "ptr", szDataSource, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} szDataSource 
     * @returns {Integer} 
     */
    static PdhVerifySQLDBA(szDataSource) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource

        result := DllCall("pdh.dll\PdhVerifySQLDBA", "ptr", szDataSource, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} szDataSource 
     * @returns {Integer} 
     */
    static PdhCreateSQLTablesW(szDataSource) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource

        result := DllCall("pdh.dll\PdhCreateSQLTablesW", "ptr", szDataSource, "uint")
        return result
    }

    /**
     * 
     * @param {PSTR} szDataSource 
     * @returns {Integer} 
     */
    static PdhCreateSQLTablesA(szDataSource) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource

        result := DllCall("pdh.dll\PdhCreateSQLTablesA", "ptr", szDataSource, "uint")
        return result
    }

    /**
     * Enumerates the names of the log sets within the DSN.
     * @param {PWSTR} szDataSource <b>Null</b>-terminated string that specifies the DSN.
     * @param {PWSTR} mszDataSetNameList Caller-allocated buffer that receives the list of <b>null</b>-terminated log set names. The list is terminated with a <b>null</b>-terminator character. Set to <b>NULL</b> if the <i>pcchBufferLength</i> parameter is zero.
     * @param {Pointer<UInt32>} pcchBufferLength Size of the <i>mszLogSetNameList</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>mszLogSetNameList</i> buffer is too small to contain all the data. This return value is expected if <i>pcchBufferLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenumlogsetnamesw
     * @since windows5.1.2600
     */
    static PdhEnumLogSetNamesW(szDataSource, mszDataSetNameList, pcchBufferLength) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        mszDataSetNameList := mszDataSetNameList is String ? StrPtr(mszDataSetNameList) : mszDataSetNameList

        result := DllCall("pdh.dll\PdhEnumLogSetNamesW", "ptr", szDataSource, "ptr", mszDataSetNameList, "uint*", pcchBufferLength, "uint")
        return result
    }

    /**
     * Enumerates the names of the log sets within the DSN.
     * @param {PSTR} szDataSource <b>Null</b>-terminated string that specifies the DSN.
     * @param {PSTR} mszDataSetNameList Caller-allocated buffer that receives the list of <b>null</b>-terminated log set names. The list is terminated with a <b>null</b>-terminator character. Set to <b>NULL</b> if the <i>pcchBufferLength</i> parameter is zero.
     * @param {Pointer<UInt32>} pcchBufferLength Size of the <i>mszLogSetNameList</i> buffer, in <b>TCHARs</b>. If zero on input, the function returns PDH_MORE_DATA and sets this parameter to the required buffer size. If the buffer is larger than the required size, the function sets this parameter to the actual size of the buffer that was used. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * @returns {Integer} If the function succeeds, it returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a> or a 
     * <a href="/windows/desktop/PerfCtrs/pdh-error-codes">PDH error code</a>. The following are possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>mszLogSetNameList</i> buffer is too small to contain all the data. This return value is expected if <i>pcchBufferLength</i> is zero on input. If the specified size on input is greater than zero but less than the required size, you should not rely on the returned size to reallocate the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PDH_INVALID_ARGUMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid. For example, on some releases you could receive this error if the specified size on input is greater than zero but less than the required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pdh/nf-pdh-pdhenumlogsetnamesa
     * @since windows5.1.2600
     */
    static PdhEnumLogSetNamesA(szDataSource, mszDataSetNameList, pcchBufferLength) {
        szDataSource := szDataSource is String ? StrPtr(szDataSource) : szDataSource
        mszDataSetNameList := mszDataSetNameList is String ? StrPtr(mszDataSetNameList) : mszDataSetNameList

        result := DllCall("pdh.dll\PdhEnumLogSetNamesA", "ptr", szDataSource, "ptr", mszDataSetNameList, "uint*", pcchBufferLength, "uint")
        return result
    }

    /**
     * 
     * @param {PDH_HLOG} hLog 
     * @param {Pointer<Guid>} pGuid 
     * @param {Pointer<Int32>} pRunId 
     * @returns {Integer} 
     */
    static PdhGetLogSetGUID(hLog, pGuid, pRunId) {
        hLog := hLog is Win32Handle ? NumGet(hLog, "ptr") : hLog

        result := DllCall("pdh.dll\PdhGetLogSetGUID", "ptr", hLog, "ptr", pGuid, "int*", pRunId, "uint")
        return result
    }

    /**
     * 
     * @param {PDH_HLOG} hLog 
     * @param {Integer} RunId 
     * @returns {Integer} 
     */
    static PdhSetLogSetRunID(hLog, RunId) {
        hLog := hLog is Win32Handle ? NumGet(hLog, "ptr") : hLog

        result := DllCall("pdh.dll\PdhSetLogSetRunID", "ptr", hLog, "int", RunId, "uint")
        return result
    }

;@endregion Methods
}
