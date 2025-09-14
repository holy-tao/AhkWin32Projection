#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class Etw {

;@region Constants

    /**
     * @type {String}
     */
    static ALPCGuid => "{45d8cccd-539f-4b72-a8b7-5c683142609a}"

    /**
     * @type {String}
     */
    static DiskIoGuid => "{3d6fa8d4-fe05-11d0-9dda-00c04fd7ba7c}"

    /**
     * @type {String}
     */
    static EventTraceConfigGuid => "{01853a65-418f-4f36-aefc-dc0f1d2fd235}"

    /**
     * @type {String}
     */
    static FileIoGuid => "{90cbdc39-4a3e-11d1-84f4-0000f80464e3}"

    /**
     * @type {String}
     */
    static ImageLoadGuid => "{2cb15d1d-5fc1-11d2-abe1-00a0c911f518}"

    /**
     * @type {String}
     */
    static PageFaultGuid => "{3d6fa8d3-fe05-11d0-9dda-00c04fd7ba7c}"

    /**
     * @type {String}
     */
    static PerfInfoGuid => "{ce1dbfb4-137e-4da6-87b0-3f59aa102cbc}"

    /**
     * @type {String}
     */
    static ProcessGuid => "{3d6fa8d0-fe05-11d0-9dda-00c04fd7ba7c}"

    /**
     * @type {String}
     */
    static RegistryGuid => "{ae53722e-c863-11d2-8659-00c04fa321a1}"

    /**
     * @type {String}
     */
    static SplitIoGuid => "{d837ca92-12b9-44a5-ad6a-3a65b3578aa8}"

    /**
     * @type {String}
     */
    static TcpIpGuid => "{9a280ac0-c8e0-11d1-84e2-00c04fb998a2}"

    /**
     * @type {String}
     */
    static ThreadGuid => "{3d6fa8d1-fe05-11d0-9dda-00c04fd7ba7c}"

    /**
     * @type {String}
     */
    static UdpIpGuid => "{bf3a50c5-a9c9-4988-a005-2df0b7c80f80}"

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_ALL_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_SINGLE_INSTANCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_SINGLE_ITEM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_EVENT_ITEM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_FIXED_INSTANCE_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_TOO_SMALL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_INSTANCES_SAME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_STATIC_INSTANCE_NAMES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_INTERNAL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_USE_TIMESTAMP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_PERSIST_EVENT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_EVENT_REFERENCE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_ANSI_INSTANCENAMES => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_METHOD_ITEM => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_PDO_INSTANCE_NAMES => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_TRACED_GUID => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_LOG_WNODE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_USE_GUID_PTR => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_USE_MOF_PTR => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_NO_HEADER => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_SEND_DATA_BLOCK => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_VERSIONED_PROPERTIES => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static WNODE_FLAG_SEVERITY_MASK => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_FLAG_EXPENSIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_FLAG_INSTANCE_LIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_FLAG_INSTANCE_BASENAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_FLAG_INSTANCE_PDO => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_FLAG_REMOVE_GUID => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_FLAG_RESERVED1 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_FLAG_RESERVED2 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_FLAG_TRACED_GUID => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_FLAG_TRACE_CONTROL_GUID => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WMIREG_FLAG_EVENT_ONLY_GUID => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WMI_GUIDTYPE_TRACECONTROL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WMI_GUIDTYPE_TRACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WMI_GUIDTYPE_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WMI_GUIDTYPE_EVENT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WMIGUID_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WMIGUID_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WMIGUID_NOTIFICATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WMIGUID_READ_DESCRIPTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WMIGUID_EXECUTE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TRACELOG_CREATE_REALTIME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TRACELOG_CREATE_ONDISK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TRACELOG_GUID_ENABLE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TRACELOG_ACCESS_KERNEL_LOGGER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TRACELOG_LOG_EVENT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TRACELOG_CREATE_INPROC => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TRACELOG_ACCESS_REALTIME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TRACELOG_REGISTER_GUIDS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TRACELOG_JOIN_GROUP => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WMI_GLOBAL_LOGGER_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PAYLOAD_PREDICATES => 8

    /**
     * @type {String}
     */
    static EventTraceGuid => "{68fdd900-4a3e-11d1-84f4-0000f80464e3}"

    /**
     * @type {String}
     */
    static SystemTraceControlGuid => "{9e814aad-3204-11d2-9a82-006008a86939}"

    /**
     * @type {String}
     */
    static DefaultTraceSecurityGuid => "{0811c1af-7a07-4a06-82ed-869455cdf713}"

    /**
     * @type {String}
     */
    static PrivateLoggerNotificationGuid => "{3595ab5c-042a-4c8e-b942-2d059bfeb1b1}"

    /**
     * @type {String}
     */
    static SystemIoFilterProviderGuid => "{fbd09363-9e22-4661-b8bf-e7a34b535b8c}"

    /**
     * @type {String}
     */
    static SystemObjectProviderGuid => "{febd7460-3d1d-47eb-af49-c9eeb1e146f2}"

    /**
     * @type {String}
     */
    static SystemPowerProviderGuid => "{c134884a-32d5-4488-80e5-14ed7abb8269}"

    /**
     * @type {String}
     */
    static SystemHypervisorProviderGuid => "{bafa072a-918a-4bed-b622-bc152097098f}"

    /**
     * @type {String}
     */
    static SystemLockProviderGuid => "{721ddfd3-dacc-4e1e-b26a-a2cb31d4705a}"

    /**
     * @type {String}
     */
    static SystemConfigProviderGuid => "{fef3a8b6-318d-4b67-a96a-3b0f6b8f18fe}"

    /**
     * @type {String}
     */
    static SystemCpuProviderGuid => "{c6c5265f-eae8-4650-aae4-9d48603d8510}"

    /**
     * @type {String}
     */
    static SystemSchedulerProviderGuid => "{599a2a76-4d91-4910-9ac7-7d33f2e97a6c}"

    /**
     * @type {String}
     */
    static SystemProfileProviderGuid => "{bfeb0324-1cee-496f-a409-2ac2b48a6322}"

    /**
     * @type {String}
     */
    static SystemIoProviderGuid => "{3d5c43e3-0f1c-4202-b817-174c0070dc79}"

    /**
     * @type {String}
     */
    static SystemMemoryProviderGuid => "{82958ca9-b6cd-47f8-a3a8-03ae85a4bc24}"

    /**
     * @type {String}
     */
    static SystemRegistryProviderGuid => "{16156bd9-fab4-4cfa-a232-89d1099058e3}"

    /**
     * @type {String}
     */
    static SystemProcessProviderGuid => "{151f55dc-467d-471f-83b5-5f889d46ff66}"

    /**
     * @type {String}
     */
    static SystemAlpcProviderGuid => "{fcb9baaf-e529-4980-92e9-ced1a6aadfdf}"

    /**
     * @type {String}
     */
    static SystemSyscallProviderGuid => "{434286f7-6f1b-45bb-b37e-95f623046c7c}"

    /**
     * @type {String}
     */
    static SystemInterruptProviderGuid => "{d4bbee17-b545-4888-858b-744169015b25}"

    /**
     * @type {String}
     */
    static SystemTimerProviderGuid => "{4f061568-e215-499f-ab2e-eda0ae890a5b}"

    /**
     * @type {String}
     */
    static KERNEL_LOGGER_NAMEW => "NT Kernel Logger"

    /**
     * @type {String}
     */
    static GLOBAL_LOGGER_NAMEW => "GlobalLogger"

    /**
     * @type {String}
     */
    static EVENT_LOGGER_NAMEW => "EventLog"

    /**
     * @type {String}
     */
    static DIAG_LOGGER_NAMEW => "DiagLog"

    /**
     * @type {String}
     */
    static KERNEL_LOGGER_NAMEA => "NT Kernel Logger"

    /**
     * @type {String}
     */
    static GLOBAL_LOGGER_NAMEA => "GlobalLogger"

    /**
     * @type {String}
     */
    static EVENT_LOGGER_NAMEA => "EventLog"

    /**
     * @type {String}
     */
    static DIAG_LOGGER_NAMEA => "DiagLog"

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_MOF_FIELDS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_EVENT_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_INFO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_END => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_STOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_DC_START => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_DC_END => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_EXTENSION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REPLY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_DEQUEUE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_RESUME => 7

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CHECKPOINT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_SUSPEND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_WINEVT_SEND => 9

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_WINEVT_RECEIVE => 240

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_LEVEL_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_LEVEL_CRITICAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_LEVEL_FATAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_LEVEL_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_LEVEL_WARNING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_LEVEL_INFORMATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_LEVEL_VERBOSE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_LEVEL_RESERVED6 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_LEVEL_RESERVED7 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_LEVEL_RESERVED8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_LEVEL_RESERVED9 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_LOAD => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_TERMINATE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_IO_READ => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_IO_WRITE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_IO_READ_INIT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_IO_WRITE_INIT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_IO_FLUSH => 14

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_IO_FLUSH_INIT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_IO_REDIRECTED_INIT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_MM_TF => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_MM_DZF => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_MM_COW => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_MM_GPF => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_MM_HPF => 14

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_MM_AV => 15

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_SEND => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_RECEIVE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONNECT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_DISCONNECT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_RETRANSMIT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_ACCEPT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_RECONNECT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONNFAIL => 17

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_COPY_TCP => 18

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_COPY_ARP => 19

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_ACKFULL => 20

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_ACKPART => 21

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_ACKDUP => 22

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_GUIDMAP => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_SIDINFO => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_SECURITY => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_DBGID_RSDS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGCREATE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGOPEN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGDELETE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGQUERY => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGSETVALUE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGDELETEVALUE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGQUERYVALUE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGENUMERATEKEY => 17

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGENUMERATEVALUEKEY => 18

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGQUERYMULTIPLEVALUE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGSETINFORMATION => 20

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGFLUSH => 21

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGKCBCREATE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGKCBDELETE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGKCBRUNDOWNBEGIN => 24

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGKCBRUNDOWNEND => 25

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGVIRTUALIZE => 26

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGCLOSE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGSETSECURITY => 28

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGQUERYSECURITY => 29

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGCOMMIT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGPREPARE => 31

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGROLLBACK => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_REGMOUNTHIVE => 33

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_CPU => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_PHYSICALDISK => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_LOGICALDISK => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_NIC => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_VIDEO => 14

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_SERVICES => 15

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_POWER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_NETINFO => 17

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_OPTICALMEDIA => 18

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_PHYSICALDISK_EX => 19

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_IRQ => 21

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_PNP => 22

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_IDECHANNEL => 23

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_NUMANODE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_PLATFORM => 25

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_PROCESSORGROUP => 26

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_PROCESSORNUMBER => 27

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_DPI => 28

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_CI_INFO => 29

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_MACHINEID => 30

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_DEFRAG => 31

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_MOBILEPLATFORM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_DEVICEFAMILY => 33

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_FLIGHTID => 34

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_PROCESSOR => 35

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_VIRTUALIZATION => 36

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_CONFIG_BOOT => 37

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_OPTICAL_IO_READ => 55

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_OPTICAL_IO_WRITE => 56

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_OPTICAL_IO_FLUSH => 57

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_OPTICAL_IO_READ_INIT => 58

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_OPTICAL_IO_WRITE_INIT => 59

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_OPTICAL_IO_FLUSH_INIT => 60

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_FLT_PREOP_INIT => 96

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_FLT_POSTOP_INIT => 97

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_FLT_PREOP_COMPLETION => 98

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_FLT_POSTOP_COMPLETION => 99

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_FLT_PREOP_FAILURE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_TYPE_FLT_POSTOP_FAILURE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_DEBUG_EVENTS => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_EXTENSION => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_FORWARD_WMI => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FLAG_ENABLE_RESERVE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FILE_MODE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FILE_MODE_SEQUENTIAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FILE_MODE_CIRCULAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FILE_MODE_APPEND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_REAL_TIME_MODE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_DELAY_OPEN_FILE_MODE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_BUFFERING_MODE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_PRIVATE_LOGGER_MODE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_ADD_HEADER_MODE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_USE_GLOBAL_SEQUENCE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_USE_LOCAL_SEQUENCE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_RELOG_MODE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_USE_PAGED_MEMORY => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FILE_MODE_NEWFILE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_FILE_MODE_PREALLOCATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_NONSTOPPABLE_MODE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_SECURE_MODE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_USE_KBYTES_FOR_SIZE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_PRIVATE_IN_PROC => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_MODE_RESERVED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_NO_PER_PROCESSOR_BUFFERING => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_SYSTEM_LOGGER_MODE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_ADDTO_TRIAGE_DUMP => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_STOP_ON_HYBRID_SHUTDOWN => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_PERSIST_ON_HYBRID_SHUTDOWN => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_INDEPENDENT_SESSION_MODE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_COMPRESSED_MODE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_CONTROL_INCREMENT_FILE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_CONTROL_CONVERT_TO_REALTIME => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_PERFORMANCE_TIMESTAMP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_POINTER32 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_POINTER64 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_FLAG_MASK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_USE_PROCTIME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_USE_NOCPUTIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_HEADER_FLAG_USE_TIMESTAMP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_HEADER_FLAG_TRACED_GUID => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_HEADER_FLAG_LOG_WNODE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_HEADER_FLAG_USE_GUID_PTR => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_HEADER_FLAG_USE_MOF_PTR => 1048576

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_ALPC_KW_GENERAL => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_CONFIG_KW_SYSTEM => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_CONFIG_KW_GRAPHICS => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_CONFIG_KW_STORAGE => 4

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_CONFIG_KW_NETWORK => 8

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_CONFIG_KW_SERVICES => 16

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_CONFIG_KW_PNP => 32

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_CONFIG_KW_OPTICAL => 64

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_CPU_KW_CONFIG => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_CPU_KW_CACHE_FLUSH => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_CPU_KW_SPEC_CONTROL => 4

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_HYPERVISOR_KW_PROFILE => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_HYPERVISOR_KW_CALLOUTS => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_HYPERVISOR_KW_VTL_CHANGE => 4

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_INTERRUPT_KW_GENERAL => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_INTERRUPT_KW_CLOCK_INTERRUPT => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_INTERRUPT_KW_DPC => 4

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_INTERRUPT_KW_DPC_QUEUE => 8

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_INTERRUPT_KW_WDF_DPC => 16

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_INTERRUPT_KW_WDF_INTERRUPT => 32

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_INTERRUPT_KW_IPI => 64

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IO_KW_DISK => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IO_KW_DISK_INIT => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IO_KW_FILENAME => 4

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IO_KW_SPLIT => 8

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IO_KW_FILE => 16

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IO_KW_OPTICAL => 32

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IO_KW_OPTICAL_INIT => 64

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IO_KW_DRIVERS => 128

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IO_KW_CC => 256

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IO_KW_NETWORK => 512

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IOFILTER_KW_GENERAL => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IOFILTER_KW_INIT => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IOFILTER_KW_FASTIO => 4

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IOFILTER_KW_FAILURE => 8

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_LOCK_KW_SPINLOCK => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_LOCK_KW_SPINLOCK_COUNTERS => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_LOCK_KW_SYNC_OBJECTS => 4

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_GENERAL => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_HARD_FAULTS => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_ALL_FAULTS => 4

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_POOL => 8

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_MEMINFO => 16

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_PFSECTION => 32

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_MEMINFO_WS => 64

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_HEAP => 128

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_WS => 256

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_CONTMEM_GEN => 512

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_VIRTUAL_ALLOC => 1024

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_FOOTPRINT => 2048

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_SESSION => 4096

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_REFSET => 8192

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_VAMAP => 16384

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_MEMORY_KW_NONTRADEABLE => 32768

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_OBJECT_KW_GENERAL => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_OBJECT_KW_HANDLE => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_POWER_KW_GENERAL => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_POWER_KW_HIBER_RUNDOWN => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_POWER_KW_PROCESSOR_IDLE => 4

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_POWER_KW_IDLE_SELECTION => 8

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_POWER_KW_PPM_EXIT_LATENCY => 16

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_GENERAL => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_INSWAP => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_FREEZE => 4

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_PERF_COUNTER => 8

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_WAKE_COUNTER => 16

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_WAKE_DROP => 32

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_WAKE_EVENT => 64

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_DEBUG_EVENTS => 128

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_DBGPRINT => 256

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_JOB => 512

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_WORKER_THREAD => 1024

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_THREAD => 2048

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROCESS_KW_LOADER => 4096

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROFILE_KW_GENERAL => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_PROFILE_KW_PMC_PROFILE => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_REGISTRY_KW_GENERAL => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_REGISTRY_KW_HIVE => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_REGISTRY_KW_NOTIFICATION => 4

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_XSCHEDULER => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_DISPATCHER => 2

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_KERNEL_QUEUE => 4

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_SHOULD_YIELD => 8

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_ANTI_STARVATION => 16

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_LOAD_BALANCER => 32

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_AFFINITY => 64

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_PRIORITY => 128

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_IDEAL_PROCESSOR => 256

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_CONTEXT_SWITCH => 512

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_COMPACT_CSWITCH => 1024

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SYSCALL_KW_GENERAL => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_TIMER_KW_GENERAL => 1

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_TIMER_KW_CLOCK_TIMER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_MEMORY_POOL_FILTER_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_NULL_TYPE_VALUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_OBJECT_TYPE_VALUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_STRING_TYPE_VALUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_SBYTE_TYPE_VALUE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_BYTE_TYPE_VALUE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_INT16_TYPE_VALUE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_UINT16_TYPE_VALUE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_INT32_TYPE_VALUE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_UINT32_TYPE_VALUE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_INT64_TYPE_VALUE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_UINT64_TYPE_VALUE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_CHAR_TYPE_VALUE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_SINGLE_TYPE_VALUE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_DOUBLE_TYPE_VALUE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_BOOLEAN_TYPE_VALUE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_DECIMAL_TYPE_VALUE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_GUID_TYPE_VALUE => 101

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_ASCIICHAR_TYPE_VALUE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_ASCIISTRING_TYPE_VALUE => 103

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_COUNTED_STRING_TYPE_VALUE => 104

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_POINTER_TYPE_VALUE => 105

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_SIZET_TYPE_VALUE => 106

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_HIDDEN_TYPE_VALUE => 107

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_BOOL_TYPE_VALUE => 108

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_COUNTED_ANSISTRING_TYPE_VALUE => 109

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_REVERSED_COUNTED_STRING_TYPE_VALUE => 110

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_REVERSED_COUNTED_ANSISTRING_TYPE_VALUE => 111

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_NON_NULL_TERMINATED_STRING_TYPE_VALUE => 112

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_REDUCED_ANSISTRING_TYPE_VALUE => 113

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_REDUCED_STRING_TYPE_VALUE => 114

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_SID_TYPE_VALUE => 115

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_VARIANT_TYPE_VALUE => 116

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_PTVECTOR_TYPE_VALUE => 117

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_WMITIME_TYPE_VALUE => 118

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_DATETIME_TYPE_VALUE => 119

    /**
     * @type {Integer (UInt32)}
     */
    static ETW_REFRENCE_TYPE_VALUE => 120

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_PROVIDER_FLAG_LEGACY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_PROVIDER_FLAG_PRE_ENABLE => 2

    /**
     * @type {String}
     */
    static KERNEL_LOGGER_NAME => "NT Kernel Logger"

    /**
     * @type {String}
     */
    static GLOBAL_LOGGER_NAME => "GlobalLogger"

    /**
     * @type {String}
     */
    static EVENT_LOGGER_NAME => "EventLog"

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_TRACE_PARAMETERS_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENABLE_TRACE_PARAMETERS_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_MIN_LEVEL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_MAX_LEVEL => 255

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ACTIVITY_CTRL_GET_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ACTIVITY_CTRL_SET_ID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ACTIVITY_CTRL_CREATE_ID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ACTIVITY_CTRL_GET_SET_ID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ACTIVITY_CTRL_CREATE_SET_ID => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_EVENT_DATA_DESCRIPTORS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_EVENT_FILTER_DATA_SIZE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_EVENT_FILTER_PAYLOAD_SIZE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_EVENT_FILTER_EVENT_NAME_SIZE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_EVENT_FILTERS_COUNT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_EVENT_FILTER_PID_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_EVENT_FILTER_EVENT_ID_COUNT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_SCHEMATIZED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_SYSTEM_FLAGS => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_TRACEHANDLE => 2147483650

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_PID => 2147483652

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_EXECUTABLE_NAME => 2147483656

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_PACKAGE_ID => 2147483664

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_PACKAGE_APP_ID => 2147483680

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_PAYLOAD => 2147483904

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_EVENT_ID => 2147484160

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_EVENT_NAME => 2147484672

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_STACKWALK => 2147487744

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_STACKWALK_NAME => 2147491840

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_STACKWALK_LEVEL_KW => 2147500032

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_FILTER_TYPE_CONTAINER => 2147516416

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_DATA_DESCRIPTOR_TYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_DATA_DESCRIPTOR_TYPE_EVENT_METADATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_DATA_DESCRIPTOR_TYPE_PROVIDER_METADATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_DATA_DESCRIPTOR_TYPE_TIMESTAMP_OVERRIDE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_WRITE_FLAG_NO_FAULTING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_WRITE_FLAG_INPRIVATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_RELATED_ACTIVITYID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_SID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_TS_ID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_INSTANCE_INFO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_STACK_TRACE32 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_STACK_TRACE64 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_PEBS_INDEX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_PMC_COUNTERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_PSM_KEY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_EVENT_KEY => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_EVENT_SCHEMA_TL => 11

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_PROV_TRAITS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_PROCESS_START_KEY => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_CONTROL_GUID => 14

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_QPC_DELTA => 15

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_CONTAINER_ID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_STACK_KEY32 => 17

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_STACK_KEY64 => 18

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_EXT_TYPE_MAX => 19

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_PROPERTY_XML => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_PROPERTY_FORWARDED_XML => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_PROPERTY_LEGACY_EVENTLOG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_PROPERTY_RELOGGABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_FLAG_EXTENDED_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_FLAG_PRIVATE_SESSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_FLAG_STRING_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_FLAG_TRACE_MESSAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_FLAG_NO_CPUTIME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_FLAG_32_BIT_HEADER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_FLAG_64_BIT_HEADER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_FLAG_DECODE_GUID => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_FLAG_CLASSIC_HEADER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_HEADER_FLAG_PROCESSOR_INDEX => 512

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ENABLE_PROPERTY_SID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ENABLE_PROPERTY_TS_ID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ENABLE_PROPERTY_STACK_TRACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ENABLE_PROPERTY_PSM_KEY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ENABLE_PROPERTY_IGNORE_KEYWORD_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ENABLE_PROPERTY_PROVIDER_GROUP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ENABLE_PROPERTY_ENABLE_KEYWORD_0 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ENABLE_PROPERTY_PROCESS_START_KEY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ENABLE_PROPERTY_EVENT_KEY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ENABLE_PROPERTY_EXCLUDE_INPRIVATE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ENABLE_PROPERTY_ENABLE_SILOS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_ENABLE_PROPERTY_SOURCE_CONTAINER_TRACKING => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_TRACE_MODE_REAL_TIME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_TRACE_MODE_RAW_TIMESTAMP => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_TRACE_MODE_EVENT_RECORD => 268435456

    /**
     * @type {String}
     */
    static CLSID_TraceRelogger => "{7b40792d-05ff-44c4-9058-f440c71f17d4}"
;@endregion Constants

;@region Methods
    /**
     * The StartTrace function starts an event tracing session. (Unicode)
     * @remarks
     * Event trace controllers call this function.
     * 
     * The session remains active until the session is stopped, the computer is
     * restarted, an I/O error occurs, or the maximum file size is reached for
     * non-circular logs. To stop an event tracing session, call the
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) function
     * and set the _ControlCode_ parameter to **EVENT_TRACE_CONTROL_STOP**.
     * 
     * You cannot start more than one session with the same session GUID (as specified
     * by `Properties.Wnode.Guid`). In most cases, you will set `Properties.Wnode.Guid`
     * to all-zero (i.e. **GUID_NULL**) to allow the ETW system to generate a new GUID
     * for the session.
     * 
     * To specify a private logger session, set **Wnode.Guid** member of _Properties_
     * to the provider's control GUID, not the private logger session's control GUID.
     * The provider must have registered the GUID before you call **StartTrace**.
     * 
     * You do not use this function to start a global logger session (deprecated). For
     * details on starting a global logger session, see
     * [Configuring and Starting the Global Logger Session](/windows/win32/etw/configuring-and-starting-the-global-logger-session).
     * @param {Pointer<UInt64>} TraceHandle Receives the handle to the event tracing session for subsequent use with APIs
     * such as [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew).
     * 
     * Do not use this handle if the function fails. Do not compare the session handle
     * to INVALID_HANDLE_VALUE. The session handle is 0 if the handle is not valid.
     * @param {Pointer<PWSTR>} InstanceName Null-terminated string that contains the name of the event tracing session. The
     * session name is limited to 1,024 characters, is case-insensitive, and must be
     * unique.
     * 
     * > [!Important]
     * > Use a descriptive name for your session so that the session's
     * > ownership and usage can be determined from the session name. Do not use a GUID
     * > or other non-deterministic or non-descriptive value. Do not append random
     * > digits to make your session name unique. ETW sessions are a limited resource
     * > so your component should not be starting multiple sessions. If your
     * > component's session is already running when your component starts, your
     * > component should clean up the orphaned session rather than creating a second
     * > session.
     * 
     * This function copies the session name that you provide to the offset that the
     * **LoggerNameOffset** member of _Properties_ points to.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an
     * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * structure that specifies the behavior of the session. The following are key
     * members of the structure to set:
     * 
     * - **Wnode.BufferSize**
     * - **Wnode.Guid**
     * - **Wnode.ClientContext**
     * - **Wnode.Flags**
     * - **LogFileMode**
     * - **LogFileNameOffset**
     * - **LoggerNameOffset**
     * 
     * Depending on the type of log file you choose to create, you may also need to
     * specify a value for **MaximumFileSize**. See the Remarks section for more
     * information on setting the _Properties_ parameter and the behavior of the
     * session.
     * 
     * **Starting with Windows 10, version 1703:** For better performance in cross
     * process scenarios, you can now pass filtering in to **StartTrace** when starting
     * system wide private loggers. You will need to pass in the new
     * [EVENT_TRACE_PROPERTIES_V2](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties_v2)
     * structure to include filtering information. See
     * [Configuring and Starting a Private Logger Session](/windows/win32/etw/configuring-and-starting-a-private-logger-session)
     * for more details.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   One of the following is true:
     * 
     *   - The **Wnode.BufferSize** member of _Properties_ specifies an incorrect size.
     *   - _Properties_ does not have sufficient space allocated to hold a copy of
     *     _InstanceName_.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _Properties_ is **NULL**.
     *   - _TraceHandle_ is **NULL**.
     *   - The **LogFileNameOffset** member of _Properties_ is not valid.
     *   - The **LoggerNameOffset** member of _Properties_ is not valid.
     *   - The **LogFileMode** member of _Properties_ specifies a combination of flags
     *     that is not valid.
     *   - The **Wnode.Guid** member is **SystemTraceControlGuid**, but the
     *     _InstanceName_ parameter is not **KERNEL_LOGGER_NAME**.
     * 
     * - **ERROR_ALREADY_EXISTS**
     * 
     *   A session with the same name or GUID is already running.
     * 
     * - **ERROR_BAD_PATHNAME**
     * 
     *   You can receive this error for one of the following reasons:
     * 
     *   - Another session is already using the file name specified by the
     *     **LogFileNameOffset** member of the _Properties_ structure.
     *   - Both **LogFileMode** and **LogFileNameOffset** are zero.
     * 
     * - **ERROR_DISK_FULL**
     * 
     *   There is not enough free space on the drive for the log file. This occurs if:
     * 
     *   - **MaximumFileSize** is nonzero and there is not **MaximumFileSize** bytes
     *     available for the log file
     *   - the drive is a system drive and there is not an additional 200 MB available
     *   - **MaximumFileSize** is zero and there is not an additional 200 MB available
     * 
     *   Choose a drive with more space, or decrease the size specified in
     *   **MaximumFileSize** (if used).
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users with administrative privileges, users in the Performance Log Users
     *   group, and services running as LocalSystem, LocalService, NetworkService can
     *   control event tracing sessions. To grant a restricted user the ability to
     *   control trace sessions, add them to the Performance Log Users group. Only
     *   users with administrative privileges and services running as LocalSystem can
     *   control an NT Kernel Logger session.
     * 
     *   If the user is a member of the Performance Log Users group, they may not have
     *   permission to create the log file in the specified folder.
     * 
     * - **ERROR_NO_SYSTEM_RESOURCES**
     * 
     *   One of the following is true:
     * 
     *   - The logging session uses the **EVENT_TRACE_SYSTEM_LOGGER_MODE** flag and the
     *     maximum number of system loggers (8) has been reached.
     * 
     *   - The maximum number of logging sessions on the system has been reached. No
     *     new loggers can be created until a logging session has been stopped. On most
     *     systems, the maximum number of logging sessions is 64.
     * 
     *     You can change the maximum number of logging sessions for a system by
     *     editing the **REG_DWORD** key at
     *     `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI@EtwMaxLoggers`.
     *     Permissible values are 32 through 256, inclusive. A reboot is required for
     *     any change to take effect.
     * 
     *     Note that Loggers use system resources. Increasing the number of loggers on
     *     the system will come at a performance cost if those slots are filled. This
     *     limit exists to prevent excessive use of system resources.
     * 
     *     > [!Important]
     *     > The limit should only be manually adjusted by a system
     *     > administrator to enable specific scenarios. The EtwMaxLoggers setting must
     *     > not be automatically modified by a program or driver.
     * 
     *     Prior to Windows 10, version 1709, this is a fixed cap of 64 loggers for
     *     non-private loggers.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-starttracew
     * @since windows5.0
     */
    static StartTraceW(TraceHandle, InstanceName, Properties) {
        result := DllCall("ADVAPI32.dll\StartTraceW", "ptr", TraceHandle, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The StartTrace function starts an event tracing session. (ANSI)
     * @remarks
     * Event trace controllers call this function.
     * 
     * The session remains active until the session is stopped, the computer is
     * restarted, an I/O error occurs, or the maximum file size is reached for
     * non-circular logs. To stop an event tracing session, call the
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracea) function
     * and set the _ControlCode_ parameter to **EVENT_TRACE_CONTROL_STOP**.
     * 
     * You cannot start more than one session with the same session GUID (as specified
     * by `Properties.Wnode.Guid`). In most cases, you will set `Properties.Wnode.Guid`
     * to all-zero (i.e. **GUID_NULL**) to allow the ETW system to generate a new GUID
     * for the session.
     * 
     * To specify a private logger session, set **Wnode.Guid** member of _Properties_
     * to the provider's control GUID, not the private logger session's control GUID.
     * The provider must have registered the GUID before you call **StartTrace**.
     * 
     * You do not use this function to start a global logger session (deprecated). For
     * details on starting a global logger session, see
     * [Configuring and Starting the Global Logger Session](/windows/win32/etw/configuring-and-starting-the-global-logger-session).
     * @param {Pointer<UInt64>} TraceHandle Receives the handle to the event tracing session for subsequent use with APIs
     * such as [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracea).
     * 
     * Do not use this handle if the function fails. Do not compare the session handle
     * to INVALID_HANDLE_VALUE. The session handle is 0 if the handle is not valid.
     * @param {Pointer<PSTR>} InstanceName Null-terminated string that contains the name of the event tracing session. The
     * session name is limited to 1,024 characters, is case-insensitive, and must be
     * unique.
     * 
     * > [!Important]
     * > Use a descriptive name for your session so that the session's
     * > ownership and usage can be determined from the session name. Do not use a GUID
     * > or other non-deterministic or non-descriptive value. Do not append random
     * > digits to make your session name unique. ETW sessions are a limited resource
     * > so your component should not be starting multiple sessions. If your
     * > component's session is already running when your component starts, your
     * > component should clean up the orphaned session rather than creating a second
     * > session.
     * 
     * This function copies the session name that you provide to the offset that the
     * **LoggerNameOffset** member of _Properties_ points to.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an
     * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * structure that specifies the behavior of the session. The following are key
     * members of the structure to set:
     * 
     * - **Wnode.BufferSize**
     * - **Wnode.Guid**
     * - **Wnode.ClientContext**
     * - **Wnode.Flags**
     * - **LogFileMode**
     * - **LogFileNameOffset**
     * - **LoggerNameOffset**
     * 
     * Depending on the type of log file you choose to create, you may also need to
     * specify a value for **MaximumFileSize**. See the Remarks section for more
     * information on setting the _Properties_ parameter and the behavior of the
     * session.
     * 
     * **Starting with Windows 10, version 1703:** For better performance in cross
     * process scenarios, you can now pass filtering in to **StartTrace** when starting
     * system wide private loggers. You will need to pass in the new
     * [EVENT_TRACE_PROPERTIES_V2](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties_v2)
     * structure to include filtering information. See
     * [Configuring and Starting a Private Logger Session](/windows/win32/etw/configuring-and-starting-a-private-logger-session)
     * for more details.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   One of the following is true:
     * 
     *   - The **Wnode.BufferSize** member of _Properties_ specifies an incorrect size.
     *   - _Properties_ does not have sufficient space allocated to hold a copy of
     *     _InstanceName_.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _Properties_ is **NULL**.
     *   - _TraceHandle_ is **NULL**.
     *   - The **LogFileNameOffset** member of _Properties_ is not valid.
     *   - The **LoggerNameOffset** member of _Properties_ is not valid.
     *   - The **LogFileMode** member of _Properties_ specifies a combination of flags
     *     that is not valid.
     *   - The **Wnode.Guid** member is **SystemTraceControlGuid**, but the
     *     _InstanceName_ parameter is not **KERNEL_LOGGER_NAME**.
     * 
     * - **ERROR_ALREADY_EXISTS**
     * 
     *   A session with the same name or GUID is already running.
     * 
     * - **ERROR_BAD_PATHNAME**
     * 
     *   You can receive this error for one of the following reasons:
     * 
     *   - Another session is already using the file name specified by the
     *     **LogFileNameOffset** member of the _Properties_ structure.
     *   - Both **LogFileMode** and **LogFileNameOffset** are zero.
     * 
     * - **ERROR_DISK_FULL**
     * 
     *   There is not enough free space on the drive for the log file. This occurs if:
     * 
     *   - **MaximumFileSize** is nonzero and there is not **MaximumFileSize** bytes
     *     available for the log file
     *   - the drive is a system drive and there is not an additional 200 MB available
     *   - **MaximumFileSize** is zero and there is not an additional 200 MB available
     * 
     *   Choose a drive with more space, or decrease the size specified in
     *   **MaximumFileSize** (if used).
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users with administrative privileges, users in the Performance Log Users
     *   group, and services running as LocalSystem, LocalService, NetworkService can
     *   control event tracing sessions. To grant a restricted user the ability to
     *   control trace sessions, add them to the Performance Log Users group. Only
     *   users with administrative privileges and services running as LocalSystem can
     *   control an NT Kernel Logger session.
     * 
     *   If the user is a member of the Performance Log Users group, they may not have
     *   permission to create the log file in the specified folder.
     * 
     * - **ERROR_NO_SYSTEM_RESOURCES**
     * 
     *   One of the following is true:
     * 
     *   - The logging session uses the **EVENT_TRACE_SYSTEM_LOGGER_MODE** flag and the
     *     maximum number of system loggers (8) has been reached.
     * 
     *   - The maximum number of logging sessions on the system has been reached. No
     *     new loggers can be created until a logging session has been stopped. On most
     *     systems, the maximum number of logging sessions is 64.
     * 
     *     You can change the maximum number of logging sessions for a system by
     *     editing the **REG_DWORD** key at
     *     `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI@EtwMaxLoggers`.
     *     Permissible values are 32 through 256, inclusive. A reboot is required for
     *     any change to take effect.
     * 
     *     Note that Loggers use system resources. Increasing the number of loggers on
     *     the system will come at a performance cost if those slots are filled. This
     *     limit exists to prevent excessive use of system resources.
     * 
     *     > [!Important]
     *     > The limit should only be manually adjusted by a system
     *     > administrator to enable specific scenarios. The EtwMaxLoggers setting must
     *     > not be automatically modified by a program or driver.
     * 
     *     Prior to Windows 10, version 1709, this is a fixed cap of 64 loggers for
     *     non-private loggers.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-starttracea
     * @since windows5.0
     */
    static StartTraceA(TraceHandle, InstanceName, Properties) {
        result := DllCall("ADVAPI32.dll\StartTraceA", "ptr", TraceHandle, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The StopTraceW (Unicode) function (evntrace.h) stops the specified event tracing session. The ControlTrace function supersedes this function.
     * @remarks
     * Event trace controllers call this function.
     * 
     * This function is obsolete. Instead, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) with
     * _ControlCode_ set to **EVENT_TRACE_CONTROL_STOP**.
     * 
     * If **LogFileMode** contains **EVENT_TRACE_FILE_MODE_PREALLOCATE**,
     * [StartTrace](/windows/desktop/ETW/starttrace) extends the log file to
     * **MaximumFileSize** bytes. The file occupies the entire space during logging,
     * for both circular and sequential logs. When you stop the logger, the log file is
     * reduced to the size needed.
     * 
     * Do not call **StopTrace** from DllMain (may cause deadlock).
     * 
     * > [!NOTE]
     * > The evntrace.h header defines StopTrace as an alias which
     * > automatically selects the ANSI or Unicode version of this function based on
     * > the definition of the UNICODE preprocessor constant. Mixing usage of the
     * > encoding-neutral alias with code that not encoding-neutral can lead to
     * > mismatches that result in compilation or runtime errors. For more information,
     * > see
     * > [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} TraceHandle Handle to the event tracing session to be stopped, or 0. You must specify a
     * non-zero _TraceHandle_ if _InstanceName_ is **NULL**. This parameter will be
     * used only if _InstanceName_ is **NULL**. The handle is returned by the
     * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew).
     * @param {Pointer<PWSTR>} InstanceName Name of the event tracing session to be stopped, or **NULL**. You must specify
     * _InstanceName_ if _TraceHandle_ is 0.
     * 
     * To specify the NT Kernel Logger session, set _InstanceName_ to
     * **KERNEL_LOGGER_NAME**.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure
     * that receives the final properties and statistics for the session.
     * 
     * If you are using a newly initialized structure, you only need to set the
     * **Wnode.BufferSize**, **Wnode.Guid**, **LoggerNameOffset**, and
     * **LogFileNameOffset** members of the structure. You can use the maximum session
     * name (1024 characters) and maximum log file name (1024 characters) lengths to
     * calculate the buffer size and offsets if not known.
     * 
     * **Starting with Windows 10, version 1703:** For better performance in cross
     * process scenarios, you can now pass filtering in to **StopTrace** for system
     * wide private loggers. You will need to pass in the new
     * [EVENT_TRACE_PROPERTIES_V2](/windows/desktop/ETW/event-trace-properties-v2)
     * structure to include filtering information. See
     * [Configuring and Starting a Private Logger Session](/windows/desktop/ETW/configuring-and-starting-a-private-logger-session)
     * for more details.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   One of the following is true:
     * 
     *   - The **Wnode.BufferSize** member of _Properties_ specifies an incorrect size.
     *   - _Properties_ does not have sufficient space allocated to hold a copy of the
     *     session name and log file name (if used).
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _Properties_ is **NULL**.
     *   - _InstanceName_ and _TraceHandle_ are both **NULL**.
     *   - _InstanceName_ is **NULL** and _TraceHandle_ is not a valid handle.
     * 
     * - **ERROR_ACCESS_DENIED** Only users with administrative privileges, users in
     *   the Performance Log Users group, and services running as LocalSystem,
     *   LocalService, NetworkService can control event tracing sessions. To grant a
     *   restricted user the ability to control trace sessions, add them to the
     *   Performance Log Users group.
     * 
     *   **Windows XP and Windows 2000:** Anyone can control a trace session.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-stoptracew
     * @since windows5.0
     */
    static StopTraceW(TraceHandle, InstanceName, Properties) {
        result := DllCall("ADVAPI32.dll\StopTraceW", "uint", TraceHandle, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The StopTraceA (ANSI) function (evntrace.h) stops the specified event tracing session. The ControlTrace function supersedes this function.
     * @remarks
     * Event trace controllers call this function.
     * 
     * This function is obsolete. Instead, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracea) with
     * _ControlCode_ set to **EVENT_TRACE_CONTROL_STOP**.
     * 
     * If **LogFileMode** contains **EVENT_TRACE_FILE_MODE_PREALLOCATE**,
     * [StartTrace](/windows/desktop/ETW/starttrace) extends the log file to
     * **MaximumFileSize** bytes. The file occupies the entire space during logging,
     * for both circular and sequential logs. When you stop the logger, the log file is
     * reduced to the size needed.
     * 
     * Do not call **StopTrace** from DllMain (may cause deadlock).
     * 
     * > [!NOTE]
     * > The evntrace.h header defines StopTrace as an alias which
     * > automatically selects the ANSI or Unicode version of this function based on
     * > the definition of the UNICODE preprocessor constant. Mixing usage of the
     * > encoding-neutral alias with code that not encoding-neutral can lead to
     * > mismatches that result in compilation or runtime errors. For more information,
     * > see
     * > [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} TraceHandle Handle to the event tracing session to be stopped, or 0. You must specify a
     * non-zero _TraceHandle_ if _InstanceName_ is **NULL**. This parameter will be
     * used only if _InstanceName_ is **NULL**. The handle is returned by the
     * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea).
     * @param {Pointer<PSTR>} InstanceName Name of the event tracing session to be stopped, or **NULL**. You must specify
     * _InstanceName_ if _TraceHandle_ is 0.
     * 
     * To specify the NT Kernel Logger session, set _InstanceName_ to
     * **KERNEL_LOGGER_NAME**.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure
     * that receives the final properties and statistics for the session.
     * 
     * If you are using a newly initialized structure, you only need to set the
     * **Wnode.BufferSize**, **Wnode.Guid**, **LoggerNameOffset**, and
     * **LogFileNameOffset** members of the structure. You can use the maximum session
     * name (1024 characters) and maximum log file name (1024 characters) lengths to
     * calculate the buffer size and offsets if not known.
     * 
     * **Starting with Windows 10, version 1703:** For better performance in cross
     * process scenarios, you can now pass filtering in to **StopTrace** for system
     * wide private loggers. You will need to pass in the new
     * [EVENT_TRACE_PROPERTIES_V2](/windows/desktop/ETW/event-trace-properties-v2)
     * structure to include filtering information. See
     * [Configuring and Starting a Private Logger Session](/windows/desktop/ETW/configuring-and-starting-a-private-logger-session)
     * for more details.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   One of the following is true:
     * 
     *   - The **Wnode.BufferSize** member of _Properties_ specifies an incorrect size.
     *   - _Properties_ does not have sufficient space allocated to hold a copy of the
     *     session name and log file name (if used).
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _Properties_ is **NULL**.
     *   - _InstanceName_ and _TraceHandle_ are both **NULL**.
     *   - _InstanceName_ is **NULL** and _TraceHandle_ is not a valid handle.
     * 
     * - **ERROR_ACCESS_DENIED** Only users with administrative privileges, users in
     *   the Performance Log Users group, and services running as LocalSystem,
     *   LocalService, NetworkService can control event tracing sessions. To grant a
     *   restricted user the ability to control trace sessions, add them to the
     *   Performance Log Users group.
     * 
     *   **Windows XP and Windows 2000:** Anyone can control a trace session.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-stoptracea
     * @since windows5.0
     */
    static StopTraceA(TraceHandle, InstanceName, Properties) {
        result := DllCall("ADVAPI32.dll\StopTraceA", "uint", TraceHandle, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The QueryTraceW (Unicode) function (evntrace.h) retrieves the property settings and session statistics for the specified event tracing session.
     * @remarks
     * Event trace controllers call this function.
     * 
     * This function is obsolete. Instead, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) with
     * _ControlCode_ set to **EVENT_TRACE_CONTROL_QUERY**.
     * 
     * > [!NOTE]
     * > The evntrace.h header defines QueryTrace as an alias which
     * > automatically selects the ANSI or Unicode version of this function based on
     * > the definition of the UNICODE preprocessor constant. Mixing usage of the
     * > encoding-neutral alias with code that not encoding-neutral can lead to
     * > mismatches that result in compilation or runtime errors. For more information,
     * > see
     * > [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} TraceHandle Handle to the event tracing session to be queried, or 0. You must specify a
     * non-zero _TraceHandle_ if _InstanceName_ is **NULL**. This parameter will be
     * used only if _InstanceName_ is **NULL**. The handle is returned by the
     * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew).
     * @param {Pointer<PWSTR>} InstanceName Name of the event tracing session to be queried, or **NULL**. You must specify
     * _InstanceName_ if _TraceHandle_ is 0.
     * 
     * To specify the NT Kernel Logger session, set _InstanceName_ to
     * **KERNEL_LOGGER_NAME**.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an initialized
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure.
     * 
     * You only need to set the **Wnode.BufferSize** member of the
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure.
     * You can use the maximum session name (1024 characters) and maximum log file name
     * (1024 characters) lengths to calculate the buffer size and offsets if not known.
     * 
     * On output, the structure members contain the property settings and session
     * statistics for the event tracing session.
     * 
     * **Starting with Windows 10, version 1703:** For better performance in cross
     * process scenarios, you can now pass filtering into **QueryTrace** for system
     * wide private loggers. You will need to pass in the new
     * [EVENT_TRACE_PROPERTIES_V2](/windows/desktop/ETW/event-trace-properties-v2)
     * structure to include filtering information. See
     * [Configuring and Starting a Private Logger Session](/windows/desktop/ETW/configuring-and-starting-a-private-logger-session)
     * for more details.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   One of the following is true:
     * 
     *   - The **Wnode.BufferSize** member of _Properties_ specifies an incorrect size.
     *   - _Properties_ does not have sufficient space allocated to hold a copy of the
     *     session name and log file name (if used).
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _Properties_ is **NULL**.
     *   - _InstanceName_ and _TraceHandle_ are both **NULL**.
     *   - _InstanceName_ is **NULL** and _TraceHandle_ is not a valid handle.
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users running with elevated administrative privileges, users in the
     *   Performance Log Users group, and services running as LocalSystem,
     *   LocalService, NetworkService can query event tracing sessions. To grant a
     *   restricted user the ability to query trace sessions, add them to the
     *   Performance Log Users group or see
     *   [EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol).
     * 
     *   **Windows XP and Windows 2000:** Anyone can control a trace session.
     * 
     * - **ERROR_WMI_INSTANCE_NOT_FOUND**
     * 
     *   The given session is not running.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-querytracew
     * @since windows5.0
     */
    static QueryTraceW(TraceHandle, InstanceName, Properties) {
        result := DllCall("ADVAPI32.dll\QueryTraceW", "uint", TraceHandle, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The QueryTraceA (ANSI) function (evntrace.h) retrieves the property settings and session statistics for the specified event tracing session.
     * @remarks
     * Event trace controllers call this function.
     * 
     * This function is obsolete. Instead, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracea) with
     * _ControlCode_ set to **EVENT_TRACE_CONTROL_QUERY**.
     * 
     * > [!NOTE]
     * > The evntrace.h header defines QueryTrace as an alias which
     * > automatically selects the ANSI or Unicode version of this function based on
     * > the definition of the UNICODE preprocessor constant. Mixing usage of the
     * > encoding-neutral alias with code that not encoding-neutral can lead to
     * > mismatches that result in compilation or runtime errors. For more information,
     * > see
     * > [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} TraceHandle Handle to the event tracing session to be queried, or 0. You must specify a
     * non-zero _TraceHandle_ if _InstanceName_ is **NULL**. This parameter will be
     * used only if _InstanceName_ is **NULL**. The handle is returned by the
     * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea).
     * @param {Pointer<PSTR>} InstanceName Name of the event tracing session to be queried, or **NULL**. You must specify
     * _InstanceName_ if _TraceHandle_ is 0.
     * 
     * To specify the NT Kernel Logger session, set _InstanceName_ to
     * **KERNEL_LOGGER_NAME**.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an initialized
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure.
     * 
     * You only need to set the **Wnode.BufferSize** member of the
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure.
     * You can use the maximum session name (1024 characters) and maximum log file name
     * (1024 characters) lengths to calculate the buffer size and offsets if not known.
     * 
     * On output, the structure members contain the property settings and session
     * statistics for the event tracing session.
     * 
     * **Starting with Windows 10, version 1703:** For better performance in cross
     * process scenarios, you can now pass filtering into **QueryTrace** for system
     * wide private loggers. You will need to pass in the new
     * [EVENT_TRACE_PROPERTIES_V2](/windows/desktop/ETW/event-trace-properties-v2)
     * structure to include filtering information. See
     * [Configuring and Starting a Private Logger Session](/windows/desktop/ETW/configuring-and-starting-a-private-logger-session)
     * for more details.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   One of the following is true:
     * 
     *   - The **Wnode.BufferSize** member of _Properties_ specifies an incorrect size.
     *   - _Properties_ does not have sufficient space allocated to hold a copy of the
     *     session name and log file name (if used).
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _Properties_ is **NULL**.
     *   - _InstanceName_ and _TraceHandle_ are both **NULL**.
     *   - _InstanceName_ is **NULL** and _TraceHandle_ is not a valid handle.
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users running with elevated administrative privileges, users in the
     *   Performance Log Users group, and services running as LocalSystem,
     *   LocalService, NetworkService can query event tracing sessions. To grant a
     *   restricted user the ability to query trace sessions, add them to the
     *   Performance Log Users group or see
     *   [EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol).
     * 
     *   **Windows XP and Windows 2000:** Anyone can control a trace session.
     * 
     * - **ERROR_WMI_INSTANCE_NOT_FOUND**
     * 
     *   The given session is not running.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-querytracea
     * @since windows5.0
     */
    static QueryTraceA(TraceHandle, InstanceName, Properties) {
        result := DllCall("ADVAPI32.dll\QueryTraceA", "uint", TraceHandle, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The UpdateTraceW (Unicode) function (evntrace.h) updates the property setting of the specified event tracing session.
     * @remarks
     * Event trace controllers call this function.
     * 
     * This function is obsolete. Instead, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) with
     * _ControlCode_ set to **EVENT_TRACE_CONTROL_UPDATE**.
     * 
     * On input, the members must specify the new values for the properties to update.
     * You can update the following properties.
     * 
     * - **EnableFlags**: Set this member to 0 to disable all kernel providers.
     *   Otherwise, you must specify the kernel providers that you want to enable or
     *   keep enabled. Applies only to system logger sessions.
     * 
     * - **FlushTimer**: Set this member if you want to change the time to wait before
     *   flushing buffers. If this member is 0, the member is not updated.
     * 
     * - **LogFileNameOffset**: Set this member if you want to switch to another log
     *   file. If this member is 0, the file name is not updated. If the offset is not
     *   zero and you do not change the log file name, the function returns an error.
     * 
     * - **LogFileMode**: Set this member if you want to turn
     *   **EVENT_TRACE_REAL_TIME_MODE** on and off. To turn real time consuming off,
     *   set this member to 0. To turn real time consuming on, set this member to
     *   **EVENT_TRACE_REAL_TIME_MODE** and it will be OR'd with the current modes.
     * 
     * - **MaximumBuffers**: Set set this member if you want to change the maximum
     *   number of buffers that ETW uses. If this member is 0, the member is not
     *   updated.
     * 
     * For private logger sessions, you can only update **LogFileNameOffset** and
     * **FlushTimer**.
     * 
     * If you are using a newly initialized
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure,
     * the only members you need to specify, other than the members you are updating,
     * are **Wnode.BufferSize**, **Wnode.Guid**, and **Wnode.Flags**.
     * 
     * If you use the property structure you passed to
     * [StartTrace](/windows/desktop/ETW/starttrace), make sure the
     * **LogFileNameOffset** member is 0 unless you are changing the log file name.
     * 
     * If you call the [ControlTrace](/windows/desktop/ETW/controltrace) function to
     * query the current session properties and then update those properties to update
     * the session, make sure you set **LogFileNameOffset** to 0 (unless you are
     * changing the log file name) and set
     * [EVENT_TRACE_PROPERTIES.Wnode.Flags](/windows/desktop/ETW/event-trace-properties)
     * to **WNODE_FLAG_TRACED_GUID**.
     * 
     * To obtain the property settings and session statistics for an event tracing
     * session, call the [ControlTrace](/windows/desktop/ETW/controltrace) function.
     * @param {Integer} TraceHandle Handle to the event tracing session to be updated, or 0. You must specify a
     * non-zero _TraceHandle_ if _InstanceName_ is **NULL**. This parameter will be
     * used only if _InstanceName_ is **NULL**. The handle is returned by the
     * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew).
     * @param {Pointer<PWSTR>} InstanceName Name of the event tracing session to be updated, or **NULL**. You must specify
     * _InstanceName_ if _TraceHandle_ is 0.
     * 
     * To specify the NT Kernel Logger session, set _InstanceName_ to
     * **KERNEL_LOGGER_NAME**.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an initialized
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure.
     * 
     * On input, the members must specify the new values for the properties to update.
     * For information on which properties you can update, see Remarks.
     * 
     * On output, the structure members contains the updated settings and statistics
     * for the event tracing session.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * table includes some common errors and their causes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   The **BufferSize** member of the **Wnode** member of _Properties_ specifies an
     *   incorrect size.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _Properties_ is **NULL**.
     *   - _InstanceName_ and _TraceHandle_ are both **NULL**.
     *   - _InstanceName_ is **NULL** and _TraceHandle_ is not a valid handle.
     *   - The **LogFileNameOffset** member of _Properties_ is not valid.
     *   - The **LoggerNameOffset** member of _Properties_ is not valid.
     * 
     *   **Windows Server 2003 and Windows XP:** The **Guid** member of the **Wnode**
     *   structure is SystemTraceControlGuid, but the _InstanceName_ parameter is not
     *   KERNEL_LOGGER_NAME.
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users with administrative privileges, users in the Performance Log Users
     *   group, and services running as LocalSystem, LocalService, NetworkService can
     *   control event tracing sessions. To grant a restricted user the ability to
     *   control trace sessions, add them to the Performance Log Users group.
     * 
     *   **Windows XP and Windows 2000:** Anyone can control a trace session.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-updatetracew
     * @since windows5.0
     */
    static UpdateTraceW(TraceHandle, InstanceName, Properties) {
        result := DllCall("ADVAPI32.dll\UpdateTraceW", "uint", TraceHandle, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The UpdateTraceA (ANSI) function (evntrace.h) updates the property setting of the specified event tracing session.
     * @remarks
     * Event trace controllers call this function.
     * 
     * This function is obsolete. Instead, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracea) with
     * _ControlCode_ set to **EVENT_TRACE_CONTROL_UPDATE**.
     * 
     * On input, the members must specify the new values for the properties to update.
     * You can update the following properties.
     * 
     * - **EnableFlags**: Set this member to 0 to disable all kernel providers.
     *   Otherwise, you must specify the kernel providers that you want to enable or
     *   keep enabled. Applies only to system logger sessions.
     * 
     * - **FlushTimer**: Set this member if you want to change the time to wait before
     *   flushing buffers. If this member is 0, the member is not updated.
     * 
     * - **LogFileNameOffset**: Set this member if you want to switch to another log
     *   file. If this member is 0, the file name is not updated. If the offset is not
     *   zero and you do not change the log file name, the function returns an error.
     * 
     * - **LogFileMode**: Set this member if you want to turn
     *   **EVENT_TRACE_REAL_TIME_MODE** on and off. To turn real time consuming off,
     *   set this member to 0. To turn real time consuming on, set this member to
     *   **EVENT_TRACE_REAL_TIME_MODE** and it will be OR'd with the current modes.
     * 
     * - **MaximumBuffers**: Set set this member if you want to change the maximum
     *   number of buffers that ETW uses. If this member is 0, the member is not
     *   updated.
     * 
     * For private logger sessions, you can only update **LogFileNameOffset** and
     * **FlushTimer**.
     * 
     * If you are using a newly initialized
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure,
     * the only members you need to specify, other than the members you are updating,
     * are **Wnode.BufferSize**, **Wnode.Guid**, and **Wnode.Flags**.
     * 
     * If you use the property structure you passed to
     * [StartTrace](/windows/desktop/ETW/starttrace), make sure the
     * **LogFileNameOffset** member is 0 unless you are changing the log file name.
     * 
     * If you call the [ControlTrace](/windows/desktop/ETW/controltrace) function to
     * query the current session properties and then update those properties to update
     * the session, make sure you set **LogFileNameOffset** to 0 (unless you are
     * changing the log file name) and set
     * [EVENT_TRACE_PROPERTIES.Wnode.Flags](/windows/desktop/ETW/event-trace-properties)
     * to **WNODE_FLAG_TRACED_GUID**.
     * 
     * To obtain the property settings and session statistics for an event tracing
     * session, call the [ControlTrace](/windows/desktop/ETW/controltrace) function.
     * @param {Integer} TraceHandle Handle to the event tracing session to be updated, or 0. You must specify a
     * non-zero _TraceHandle_ if _InstanceName_ is **NULL**. This parameter will be
     * used only if _InstanceName_ is **NULL**. The handle is returned by the
     * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea).
     * @param {Pointer<PSTR>} InstanceName Name of the event tracing session to be updated, or **NULL**. You must specify
     * _InstanceName_ if _TraceHandle_ is 0.
     * 
     * To specify the NT Kernel Logger session, set _InstanceName_ to
     * **KERNEL_LOGGER_NAME**.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an initialized
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure.
     * 
     * On input, the members must specify the new values for the properties to update.
     * For information on which properties you can update, see Remarks.
     * 
     * On output, the structure members contains the updated settings and statistics
     * for the event tracing session.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * table includes some common errors and their causes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   The **BufferSize** member of the **Wnode** member of _Properties_ specifies an
     *   incorrect size.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _Properties_ is **NULL**.
     *   - _InstanceName_ and _TraceHandle_ are both **NULL**.
     *   - _InstanceName_ is **NULL** and _TraceHandle_ is not a valid handle.
     *   - The **LogFileNameOffset** member of _Properties_ is not valid.
     *   - The **LoggerNameOffset** member of _Properties_ is not valid.
     * 
     *   **Windows Server 2003 and Windows XP:** The **Guid** member of the **Wnode**
     *   structure is SystemTraceControlGuid, but the _InstanceName_ parameter is not
     *   KERNEL_LOGGER_NAME.
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users with administrative privileges, users in the Performance Log Users
     *   group, and services running as LocalSystem, LocalService, NetworkService can
     *   control event tracing sessions. To grant a restricted user the ability to
     *   control trace sessions, add them to the Performance Log Users group.
     * 
     *   **Windows XP and Windows 2000:** Anyone can control a trace session.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-updatetracea
     * @since windows5.0
     */
    static UpdateTraceA(TraceHandle, InstanceName, Properties) {
        result := DllCall("ADVAPI32.dll\UpdateTraceA", "uint", TraceHandle, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The FlushTraceW (Unicode) function (evntrace.h) causes an event tracing session to immediately deliver buffered events for the specified session.
     * @remarks
     * Event trace controllers call this function.
     * 
     * This function is obsolete. Instead, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) with
     * _ControlCode_ set to **EVENT_TRACE_CONTROL_FLUSH**.
     * 
     * This function can be used with an in-memory session (a session started with the
     * **EVENT_TRACE_BUFFERING_MODE** flag) to write the data from the trace to a file.
     * 
     * You do not normally need to flush file-based or real-time sessions because ETW
     * will automatically flush a buffer when it is full (i.e. when it does not have
     * room for the next event), when the trace session's FlushTimer expires, or when
     * the trace session is closed.
     * 
     * Do not call **FlushTrace** from DllMain (may cause deadlock).
     * 
     * > [!NOTE]
     * > The evntrace.h header defines FlushTrace as an alias which
     * > automatically selects the ANSI or Unicode version of this function based on
     * > the definition of the UNICODE preprocessor constant. Mixing usage of the
     * > encoding-neutral alias with code that not encoding-neutral can lead to
     * > mismatches that result in compilation or runtime errors. For more information,
     * > see
     * > [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} TraceHandle Handle to the event tracing session to be flushed, or 0. You must specify a
     * non-zero _TraceHandle_ if _InstanceName_ is **NULL**. This parameter will be
     * used only if _InstanceName_ is **NULL**. The handle is returned by the
     * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew).
     * @param {Pointer<PWSTR>} InstanceName Name of the event tracing session to be flushed, or **NULL**. You must specify
     * _InstanceName_ if _TraceHandle_ is 0.
     * 
     * To specify the NT Kernel Logger session, set _InstanceName_ to
     * **KERNEL_LOGGER_NAME**.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an initialized
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure.
     * 
     * If you are using a newly initialized structure, you only need to set the
     * **Wnode.BufferSize**, **Wnode.Guid**, **LoggerNameOffset**, and
     * **LogFileNameOffset** members of the structure. You can use the maximum session
     * name (1024 characters) and maximum log file name (1024 characters) lengths to
     * calculate the buffer size and offsets if not known.
     * 
     * On output, the structure receives the property settings and session statistics
     * of the event tracing session, which reflect the state of the session after the
     * flush.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * table includes some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _Properties_ is **NULL**.
     *   - _InstanceName_ and _TraceHandle_ are both **NULL**.
     *   - _InstanceName_ is **NULL** and _TraceHandle_ is not a valid handle.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   One of the following is true:
     * 
     *   - The **Wnode.BufferSize** member of _Properties_ specifies an incorrect size.
     *   - _Properties_ does not have sufficient space allocated to hold a copy of the
     *     session name and log file name (if used).
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users with administrative privileges, users in the Performance Log Users
     *   group, and services running as LocalSystem, LocalService, NetworkService can
     *   control event tracing sessions. To grant a restricted user the ability to
     *   control trace sessions, add them to the Performance Log Users group.
     * 
     *   **Windows XP and Windows 2000:** Anyone can control a trace session.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-flushtracew
     * @since windows5.1.2600
     */
    static FlushTraceW(TraceHandle, InstanceName, Properties) {
        result := DllCall("ADVAPI32.dll\FlushTraceW", "uint", TraceHandle, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The FlushTraceA (ANSI) function (evntrace.h) causes an event tracing session to immediately deliver buffered events for the specified session.
     * @remarks
     * Event trace controllers call this function.
     * 
     * This function is obsolete. Instead, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracea) with
     * _ControlCode_ set to **EVENT_TRACE_CONTROL_FLUSH**.
     * 
     * This function can be used with an in-memory session (a session started with the
     * **EVENT_TRACE_BUFFERING_MODE** flag) to write the data from the trace to a file.
     * 
     * You do not normally need to flush file-based or real-time sessions because ETW
     * will automatically flush a buffer when it is full (i.e. when it does not have
     * room for the next event), when the trace session's FlushTimer expires, or when
     * the trace session is closed.
     * 
     * Do not call **FlushTrace** from DllMain (may cause deadlock).
     * 
     * > [!NOTE]
     * > The evntrace.h header defines FlushTrace as an alias which
     * > automatically selects the ANSI or Unicode version of this function based on
     * > the definition of the UNICODE preprocessor constant. Mixing usage of the
     * > encoding-neutral alias with code that not encoding-neutral can lead to
     * > mismatches that result in compilation or runtime errors. For more information,
     * > see
     * > [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} TraceHandle Handle to the event tracing session to be flushed, or 0. You must specify a
     * non-zero _TraceHandle_ if _InstanceName_ is **NULL**. This parameter will be
     * used only if _InstanceName_ is **NULL**. The handle is returned by the
     * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea).
     * @param {Pointer<PSTR>} InstanceName Name of the event tracing session to be flushed, or **NULL**. You must specify
     * _InstanceName_ if _TraceHandle_ is 0.
     * 
     * To specify the NT Kernel Logger session, set _InstanceName_ to
     * **KERNEL_LOGGER_NAME**.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an initialized
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure.
     * 
     * If you are using a newly initialized structure, you only need to set the
     * **Wnode.BufferSize**, **Wnode.Guid**, **LoggerNameOffset**, and
     * **LogFileNameOffset** members of the structure. You can use the maximum session
     * name (1024 characters) and maximum log file name (1024 characters) lengths to
     * calculate the buffer size and offsets if not known.
     * 
     * On output, the structure receives the property settings and session statistics
     * of the event tracing session, which reflect the state of the session after the
     * flush.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * table includes some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _Properties_ is **NULL**.
     *   - _InstanceName_ and _TraceHandle_ are both **NULL**.
     *   - _InstanceName_ is **NULL** and _TraceHandle_ is not a valid handle.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   One of the following is true:
     * 
     *   - The **Wnode.BufferSize** member of _Properties_ specifies an incorrect size.
     *   - _Properties_ does not have sufficient space allocated to hold a copy of the
     *     session name and log file name (if used).
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users with administrative privileges, users in the Performance Log Users
     *   group, and services running as LocalSystem, LocalService, NetworkService can
     *   control event tracing sessions. To grant a restricted user the ability to
     *   control trace sessions, add them to the Performance Log Users group.
     * 
     *   **Windows XP and Windows 2000:** Anyone can control a trace session.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-flushtracea
     * @since windows5.1.2600
     */
    static FlushTraceA(TraceHandle, InstanceName, Properties) {
        result := DllCall("ADVAPI32.dll\FlushTraceA", "uint", TraceHandle, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The ControlTraceW (Unicode) function (evntrace.h) flushes, queries, updates, or stops the specified event tracing session.
     * @remarks
     * Event trace controllers call this function.
     * 
     * This function supersedes the
     * [FlushTrace](/windows/win32/api/evntrace/nf-evntrace-flushtracew),
     * [QueryTrace](/windows/win32/api/evntrace/nf-evntrace-querytracew),
     * [StopTrace](/windows/win32/api/evntrace/nf-evntrace-stoptracew), and
     * [UpdateTrace](/windows/win32/api/evntrace/nf-evntrace-updatetracew) functions.
     * 
     * > [!NOTE]
     * > The evntrace.h header defines ControlTrace as an alias which
     * > automatically selects the ANSI or Unicode version of this function based on
     * > the definition of the UNICODE preprocessor constant. Mixing usage of the
     * > encoding-neutral alias with code that not encoding-neutral can lead to
     * > mismatches that result in compilation or runtime errors. For more information,
     * > see
     * > [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} TraceHandle Handle to an event tracing session, or 0. You must specify a non-zero
     * _TraceHandle_ if _InstanceName_ is **NULL**. ETW ignores the handle if
     * _InstanceName_ is not **NULL**.
     * 
     * The [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew) function
     * returns this handle when a new trace is started. To obtain the handle of an
     * existing trace, use **ControlTrace** to query the trace properties based on the
     * trace's name and then get the handle from the **Wnode.HistoricalContext** field
     * of the returned `EVENT_TRACE_PROPERTIES` data.
     * @param {Pointer<PWSTR>} InstanceName Name of an event tracing session, or **NULL**. You must specify _InstanceName_
     * if _TraceHandle_ is 0.
     * 
     * To specify the NT Kernel Logger session, set _InstanceName_ to
     * **KERNEL_LOGGER_NAME**.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an initialized
     * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * structure. This structure should be zeroed-out before setting any fields.
     * 
     * If _ControlCode_ specifies **EVENT_TRACE_CONTROL_STOP**,
     * **EVENT_TRACE_CONTROL_QUERY** or **EVENT_TRACE_CONTROL_FLUSH**, you only need to
     * set the **Wnode.BufferSize**, **Wnode.Guid**, **LoggerNameOffset**, and
     * **LogFileNameOffset** members of the
     * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * structure. If the session is a private session, you also need to set
     * **LogFileMode**. You can use the maximum session name (1024 characters) and
     * maximum log file name (1024 characters) lengths to calculate the buffer size and
     * offsets if not known.
     * 
     * If _ControlCode_ specifies **EVENT_TRACE_CONTROL_UPDATE**, on input, the members
     * must specify the new values for the properties to update. On output,
     * _Properties_ contains the properties and statistics for the event tracing
     * session. You can update the following properties.
     * 
     * - **EnableFlags**: Set this member to 0 to disable all system providers. Set
     *   this to a non-zero value to specify the system providers that you want to
     *   enable or keep enabled. This may be non-zero only for
     *   [system loggers](/windows/win32/api/evntrace/nf-evntrace-starttracew#system-loggers).
     * 
     * - **FlushTimer**: Set this member if you want to change the time to wait before
     *   flushing buffers. If this member is 0, the member is not updated.
     * 
     * - **LogFileNameOffset**: Set this member if you want to switch to another log
     *   file or to flush a buffering-mode trace to a new log file. If this member is
     *   0, the file name is not updated. If the offset is not zero and you do not
     *   change the log file name, the function returns an error.
     * 
     * - **LogFileMode**: Set this member if you want to turn
     *   **EVENT_TRACE_REAL_TIME_MODE** on and off. To turn real time consuming off,
     *   set this member to 0. To turn real time consuming on (creating a session that
     *   records to disk as well as delivering events in real-time), set this member to
     *   **EVENT_TRACE_REAL_TIME_MODE** and it will be OR'd with the current modes.
     * 
     * - **MaximumBuffers**: Set this member if you want to change the maximum number
     *   of buffers that ETW uses. If this member is 0, the member is not updated.
     * 
     * For private logger sessions, you can update only the **LogFileNameOffset** and
     * **FlushTimer** members.
     * 
     * If you are using a newly initialized
     * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * structure, zero-out the structure, then set **Wnode.BufferSize**,
     * **Wnode.Guid**, and **Wnode.Flags**, and the values you want to update.
     * 
     * If you are reusing a **EVENT_TRACE_PROPERTIES** structure (i.e. using a
     * structure that you previously passed to
     * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracew) or
     * **ControlTrace**), be sure to set the **LogFileNameOffset** member to 0 unless
     * you are changing the log file name, and be sure to set
     * [EVENT_TRACE_PROPERTIES.Wnode.Flags](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * to **WNODE_FLAG_TRACED_GUID**.
     * 
     * > **Starting with Windows 10, version 1703:** For better performance in cross
     * > process scenarios, you can now pass filtering information to **ControlTrace**
     * > for system wide private loggers. You will need to use the
     * > [EVENT_TRACE_PROPERTIES_V2](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties_v2)
     * > structure to include filtering information. See
     * > [Configuring and Starting a Private Logger Session](/windows/win32/etw/configuring-and-starting-a-private-logger-session)
     * > for more details.
     * @param {Integer} ControlCode 
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   One of the following is true:
     * 
     *   - The **Wnode.BufferSize** member of _Properties_ specifies an incorrect size.
     *   - _Properties_ does not have sufficient space allocated to hold a copy of the
     *     session name and log file name (if used).
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _Properties_ is **NULL**.
     *   - _InstanceName_ and _TraceHandle_ are both **NULL**.
     *   - _InstanceName_ is **NULL** and _TraceHandle_ is not a valid handle.
     *   - The **LogFileNameOffset** member of _Properties_ is not valid.
     *   - The **LoggerNameOffset** member of _Properties_ is not valid.
     *   - The **LogFileMode** member of _Properties_ specifies a combination of flags
     *     that is not valid.
     *   - The **Wnode.Guid** member of _Properties_ is **SystemTraceControlGuid**, but
     *     the _InstanceName_ parameter is not `KERNEL_LOGGER_NAME`.
     * 
     * - **ERROR_BAD_PATHNAME**
     * 
     *   Another session is already using the file name specified by the
     *   **LogFileNameOffset** member of the _Properties_ structure.
     * 
     * - **ERROR_MORE_DATA**
     * 
     *   The buffer for
     *   [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     *   is too small to hold all the information for the session. If you do not need
     *   the session's property information, you can ignore this error. If you receive
     *   this error when stopping the session, ETW will have already stopped the
     *   session before generating this error.
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users running with elevated administrative privileges, users in the
     *   Performance Log Users group, and services running as LocalSystem,
     *   LocalService, NetworkService can control event tracing sessions. To grant a
     *   restricted user the ability to control trace sessions, add them to the
     *   Performance Log Users group. Only users with administrative privileges and
     *   services running as LocalSystem can control an NT Kernel Logger session.
     * 
     *   **Windows XP and Windows 2000:** Anyone can control a trace session.
     * 
     * - **ERROR_WMI_INSTANCE_NOT_FOUND**
     * 
     *   The given session is not running.
     *   
     * - **ERROR_ACTIVE_CONNECTIONS**
     * 
     *   When returned from a EVENT_TRACE_CONTROL_STOP call, this indicates that
     *   the session is already in the process of stopping.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-controltracew
     * @since windows5.0
     */
    static ControlTraceW(TraceHandle, InstanceName, Properties, ControlCode) {
        result := DllCall("ADVAPI32.dll\ControlTraceW", "uint", TraceHandle, "ptr", InstanceName, "ptr", Properties, "uint", ControlCode, "uint")
        return result
    }

    /**
     * The ControlTraceA (ANSI) function (evntrace.h) flushes, queries, updates, or stops the specified event tracing session.
     * @remarks
     * Event trace controllers call this function.
     * 
     * This function supersedes the
     * [FlushTrace](/windows/win32/api/evntrace/nf-evntrace-flushtracea),
     * [QueryTrace](/windows/win32/api/evntrace/nf-evntrace-querytracea),
     * [StopTrace](/windows/win32/api/evntrace/nf-evntrace-stoptracea), and
     * [UpdateTrace](/windows/win32/api/evntrace/nf-evntrace-updatetracea) functions.
     * 
     * > [!NOTE]
     * > The evntrace.h header defines ControlTrace as an alias which
     * > automatically selects the ANSI or Unicode version of this function based on
     * > the definition of the UNICODE preprocessor constant. Mixing usage of the
     * > encoding-neutral alias with code that not encoding-neutral can lead to
     * > mismatches that result in compilation or runtime errors. For more information,
     * > see
     * > [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} TraceHandle Handle to an event tracing session, or 0. You must specify a non-zero
     * _SessionHandle_ if _SessionName_ is **NULL**. ETW ignores the handle if
     * _SessionName_ is not **NULL**.
     * 
     * The [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) function
     * returns this handle when a new trace is started. To obtain the handle of an
     * existing trace, use **ControlTrace** to query the trace properties based on the
     * trace's name and then get the handle from the **Wnode.HistoricalContext** field
     * of the returned `EVENT_TRACE_PROPERTIES` data.
     * @param {Pointer<PSTR>} InstanceName Name of an event tracing session, or **NULL**. You must specify _InstanceName_
     * if _TraceHandle_ is 0.
     * 
     * To specify the NT Kernel Logger session, set _InstanceName_ to
     * **KERNEL_LOGGER_NAME**.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an initialized
     * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * structure. This structure should be zeroed-out before setting any fields.
     * 
     * If _ControlCode_ specifies **EVENT_TRACE_CONTROL_STOP**,
     * **EVENT_TRACE_CONTROL_QUERY** or **EVENT_TRACE_CONTROL_FLUSH**, you only need to
     * set the **Wnode.BufferSize**, **Wnode.Guid**, **LoggerNameOffset**, and
     * **LogFileNameOffset** members of the
     * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * structure. If the session is a private session, you also need to set
     * **LogFileMode**. You can use the maximum session name (1024 characters) and
     * maximum log file name (1024 characters) lengths to calculate the buffer size and
     * offsets if not known.
     * 
     * If _ControlCode_ specifies **EVENT_TRACE_CONTROL_UPDATE**, on input, the members
     * must specify the new values for the properties to update. On output,
     * _Properties_ contains the properties and statistics for the event tracing
     * session. You can update the following properties.
     * 
     * - **EnableFlags**: Set this member to 0 to disable all system providers. Set
     *   this to a non-zero value to specify the system providers that you want to
     *   enable or keep enabled. This may be non-zero only for
     *   [system loggers](/windows/win32/api/evntrace/nf-evntrace-starttracea#system-loggers).
     * 
     * - **FlushTimer**: Set this member if you want to change the time to wait before
     *   flushing buffers. If this member is 0, the member is not updated.
     * 
     * - **LogFileNameOffset**: Set this member if you want to switch to another log
     *   file or to flush a buffering-mode trace to a new log file. If this member is
     *   0, the file name is not updated. If the offset is not zero and you do not
     *   change the log file name, the function returns an error.
     * 
     * - **LogFileMode**: Set this member if you want to turn
     *   **EVENT_TRACE_REAL_TIME_MODE** on and off. To turn real time consuming off,
     *   set this member to 0. To turn real time consuming on (creating a session that
     *   records to disk as well as delivering events in real-time), set this member to
     *   **EVENT_TRACE_REAL_TIME_MODE** and it will be OR'd with the current modes.
     * 
     * - **MaximumBuffers**: Set this member if you want to change the maximum number
     *   of buffers that ETW uses. If this member is 0, the member is not updated.
     * 
     * For private logger sessions, you can update only the **LogFileNameOffset** and
     * **FlushTimer** members.
     * 
     * If you are using a newly initialized
     * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * structure, zero-out the structure, then set **Wnode.BufferSize**,
     * **Wnode.Guid**, and **Wnode.Flags**, and the values you want to update.
     * 
     * If you are reusing a **EVENT_TRACE_PROPERTIES** structure (i.e. using a
     * structure that you previously passed to
     * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) or
     * **ControlTrace**), be sure to set the **LogFileNameOffset** member to 0 unless
     * you are changing the log file name, and be sure to set
     * [EVENT_TRACE_PROPERTIES.Wnode.Flags](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * to **WNODE_FLAG_TRACED_GUID**.
     * 
     * > **Starting with Windows 10, version 1703:** For better performance in cross
     * > process scenarios, you can now pass filtering information to **ControlTrace**
     * > for system wide private loggers. You will need to use the
     * > [EVENT_TRACE_PROPERTIES_V2](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties_v2)
     * > structure to include filtering information. See
     * > [Configuring and Starting a Private Logger Session](/windows/win32/etw/configuring-and-starting-a-private-logger-session)
     * > for more details.
     * @param {Integer} ControlCode 
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   One of the following is true:
     * 
     *   - The **Wnode.BufferSize** member of _Properties_ specifies an incorrect size.
     *   - _Properties_ does not have sufficient space allocated to hold a copy of the
     *     session name and log file name (if used).
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _Properties_ is **NULL**.
     *   - _InstanceName_ and _TraceHandle_ are both **NULL**.
     *   - _InstanceName_ is **NULL** and _TraceHandle_ is not a valid handle.
     *   - The **LogFileNameOffset** member of _Properties_ is not valid.
     *   - The **LoggerNameOffset** member of _Properties_ is not valid.
     *   - The **LogFileMode** member of _Properties_ specifies a combination of flags
     *     that is not valid.
     *   - The **Wnode.Guid** member of _Properties_ is **SystemTraceControlGuid**, but
     *     the _InstanceName_ parameter is not `KERNEL_LOGGER_NAME`.
     * 
     * - **ERROR_BAD_PATHNAME**
     * 
     *   Another session is already using the file name specified by the
     *   **LogFileNameOffset** member of the _Properties_ structure.
     * 
     * - **ERROR_MORE_DATA**
     * 
     *   The buffer for
     *   [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     *   is too small to hold all the information for the session. If you do not need
     *   the session's property information, you can ignore this error. If you receive
     *   this error when stopping the session, ETW will have already stopped the
     *   session before generating this error.
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users running with elevated administrative privileges, users in the
     *   Performance Log Users group, and services running as LocalSystem,
     *   LocalService, NetworkService can control event tracing sessions. To grant a
     *   restricted user the ability to control trace sessions, add them to the
     *   Performance Log Users group. Only users with administrative privileges and
     *   services running as LocalSystem can control an NT Kernel Logger session.
     * 
     *   **Windows XP and Windows 2000:** Anyone can control a trace session.
     * 
     * - **ERROR_WMI_INSTANCE_NOT_FOUND**
     * 
     *   The given session is not running.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-controltracea
     * @since windows5.0
     */
    static ControlTraceA(TraceHandle, InstanceName, Properties, ControlCode) {
        result := DllCall("ADVAPI32.dll\ControlTraceA", "uint", TraceHandle, "ptr", InstanceName, "ptr", Properties, "uint", ControlCode, "uint")
        return result
    }

    /**
     * The QueryAllTracesW (Unicode) function (evntrace.h) function retrieves the properties and statistics for all event tracing sessions that the caller can query.
     * @remarks
     * Event trace controllers call this function.
     * 
     * This function retrieves the trace sessions that the caller has permissions to
     * query. Users running with elevated administrative privileges, users in the
     * Performance Log Users group, and services running as LocalSystem, LocalService,
     * NetworkService can view all tracing sessions.
     * 
     * This function does not return private logging sessions.
     * 
     * To retrieve information for a single session, use the
     * [ControlTrace](/windows/desktop/ETW/controltrace) function and set the
     * _ControlCode_ parameter to **EVENT_TRACE_CONTROL_QUERY**.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} PropertyArray An array of pointers to
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structures
     * that receive session properties and statistics for the event tracing sessions.
     * 
     * You only need to set the **Wnode.BufferSize**, **LoggerNameOffset** , and
     * **LogFileNameOffset** members of the
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure.
     * The other members should all be set to zero.
     * @param {Integer} PropertyArrayCount Number of structures in the _PropertyArray_ array. This value must be less than
     * or equal to 64, the maximum number of event tracing sessions that ETW supports.
     * 
     * **Windows 10:** _PropertyArrayCount_ may be larger than 64 and some systems may
     * support more than 64 tracing sessions.
     * @param {Pointer<UInt32>} LoggerCount Actual number of event tracing sessions started on the computer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _PropertyArrayCount_ is zero or greater than the maximum number of supported
     *     sessions
     *   - _PropertyArray_ is **NULL**
     * 
     * - **ERROR_MORE_DATA**
     * 
     *   The property array is too small to receive information for all sessions
     *   (_SessionCount_ is greater than _PropertyArrayCount_). The function fills the
     *   property array with the number of property structures specified in
     *   _PropertyArrayCount_.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-queryalltracesw
     * @since windows5.0
     */
    static QueryAllTracesW(PropertyArray, PropertyArrayCount, LoggerCount) {
        result := DllCall("ADVAPI32.dll\QueryAllTracesW", "ptr", PropertyArray, "uint", PropertyArrayCount, "ptr", LoggerCount, "uint")
        return result
    }

    /**
     * The QueryAllTracesA (ANSI) function (evntrace.h) function retrieves the properties and statistics for all event tracing sessions that the caller can query.
     * @remarks
     * Event trace controllers call this function.
     * 
     * This function retrieves the trace sessions that the caller has permissions to
     * query. Users running with elevated administrative privileges, users in the
     * Performance Log Users group, and services running as LocalSystem, LocalService,
     * NetworkService can view most tracing sessions.
     * 
     * This function does not return private logging sessions.
     * 
     * To retrieve information for a single session, use the
     * [ControlTrace](/windows/desktop/ETW/controltrace) function and set the
     * _ControlCode_ parameter to **EVENT_TRACE_CONTROL_QUERY**.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} PropertyArray An array of pointers to
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structures
     * that receive session properties and statistics for the event tracing sessions.
     * 
     * You only need to set the **Wnode.BufferSize**, **LoggerNameOffset** , and
     * **LogFileNameOffset** members of the
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure.
     * The other members should all be set to zero.
     * @param {Integer} PropertyArrayCount Number of structures in the _PropertyArray_ array. This value must be less than
     * or equal to 64, the maximum number of event tracing sessions that ETW supports.
     * 
     * **Windows 10:** _PropertyArrayCount_ may be larger than 64 and some systems may
     * support more than 64 tracing sessions.
     * @param {Pointer<UInt32>} LoggerCount Receives the number of traces for which data is returned. This may differ from
     * the actual number of running event tracing sessions running if the caller does
     * not have permissions to query all sessions.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _PropertyArrayCount_ is zero or greater than the maximum number of supported
     *     sessions
     *   - _PropertyArray_ is **NULL**
     * 
     * - **ERROR_MORE_DATA**
     * 
     *   The property array is too small to receive information for all sessions
     *   (_SessionCount_ is greater than _PropertyArrayCount_). The function fills the
     *   property array with the number of property structures specified in
     *   _PropertyArrayCount_.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-queryalltracesa
     * @since windows5.0
     */
    static QueryAllTracesA(PropertyArray, PropertyArrayCount, LoggerCount) {
        result := DllCall("ADVAPI32.dll\QueryAllTracesA", "ptr", PropertyArray, "uint", PropertyArrayCount, "ptr", LoggerCount, "uint")
        return result
    }

    /**
     * A trace session controller calls EnableTrace to configure how an ETW event provider logs events to a trace session. The EnableTraceEx2 function supersedes this function.
     * @remarks
     * Event trace controllers call this function to configure the event providers that
     * write events to the session. For example, a controller might call this function
     * to begin collecting events from a provider, to adjust the level or keywords of
     * the events being collected from a provider, or to stop collecting events from a
     * provider.
     * 
     * This function is obsolete. For additional functionality, new code should use
     * [EnableTraceEx2](/windows/win32/api/evntrace/nf-evntrace-enabletraceex2).
     * 
     * The following two function calls are equivalent:
     * 
     * ```C
     * // Obsolete:
     * Status = EnableTrace(
     *     Enable,
     *     EnableFlag,
     *     EnableLevel,
     *     ControlGuid,
     *     TraceHandle);
     * 
     * // Updated equivalent code:
     * Status = EnableTraceEx2(
     *     TraceHandle,
     *     ControlGuid,
     *     Enable,      // ControlCode
     *     EnableLevel,
     *     EnableFlag,  // MatchAnyKeyword
     *     0,           // MatchAllKeyword
     *     0,           // Timeout
     *     NULL);       // EnableParameters
     * ```
     * 
     * For additional details on the semantics of configuring providers for a session,
     * refer to the documentation for
     * [EnableTraceEx2](/windows/win32/api/evntrace/nf-evntrace-enabletraceex2).
     * @param {Integer} Enable Set to 1 to enable receiving events from the provider or to adjust the settings
     * used when receiving events from the provider (e.g. to change level and
     * keywords). Set to 0 to disable receiving events from the provider.
     * @param {Integer} EnableFlag 32-bit bitmask of keywords that determine the categories of events that you want
     * the provider to write. The provider typically writes an event if the event's
     * keyword bits match **any** of the bits set in this value or if the event has no
     * keyword bits set, in addition to meeting the _EnableLevel_ critera.
     * 
     * > [!Note]
     * > EventRegister-based providers support 64-bit keywords. Use
     * > **EnableTraceEx2** to enable providers using a 64-bit _MatchAnyKeyword_ mask.
     * @param {Integer} EnableLevel A value that indicates the maximum level of events that you want the provider to
     * write. The provider typically writes an event if the event's level is less than
     * or equal to this value, in addition to meeting the _EnableFlag_ criteria.
     * 
     * This value should be in the range 1 to 255. Microsoft defines the semantics of
     * levels 1-5 as shown below. Lower values indicate more-severe events. Each value
     * of _EnableLevel_ enables the specified level and all more-severe levels. For
     * example, if you specify `TRACE_LEVEL_WARNING`, your consumer will receive
     * warning, error, and critical events.
     * 
     * | Value                           | Meaning                                    |
     * | ------------------------------- | ------------------------------------------ |
     * | **TRACE_LEVEL_CRITICAL** (1)    | Abnormal exit or termination events        |
     * | **TRACE_LEVEL_ERROR** (2)       | Severe error events                        |
     * | **TRACE_LEVEL_WARNING** (3)     | Warning events such as allocation failures |
     * | **TRACE_LEVEL_INFORMATION** (4) | Non-error informational events             |
     * | **TRACE_LEVEL_VERBOSE** (5)     | Detailed diagnostic events                 |
     * 
     * The `TRACE_LEVEL` constants are defined in _evntrace.h_. Equivalent
     * `WINMETA_LEVEL` constants are defined in _winmeta.h_.
     * @param {Pointer<Guid>} ControlGuid The control GUID (provider ID) of the event provider that you want to enable or
     * disable.
     * @param {Integer} TraceHandle Handle of the event tracing session for which you are configuring the provider.
     * The [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) function
     * returns this handle when a new trace is started. To obtain the handle of an
     * existing trace, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) to query
     * the trace properties based on the trace's name and then get the handle from the
     * **Wnode.HistoricalContext** field of the returned `EVENT_TRACE_PROPERTIES` data.
     * @returns {Integer} If the function is successful, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _ControlGuid_ is **NULL**.
     *   - _TraceHandle_ is **NULL**.
     * 
     * - **ERROR_INVALID_FUNCTION**
     * 
     *   You cannot change the enable flags and level when the provider is not
     *   registered.
     * 
     * - **ERROR_WMI_GUID_NOT_FOUND**
     * 
     *   The provider is not registered. Occurs when KB307331 or Windows 2000 Service
     *   Pack 4 is installed and the provider is not registered. To avoid this error,
     *   the provider must first be registered.
     * 
     * - **ERROR_NO_SYSTEM_RESOURCES**
     * 
     *   Exceeded the number of trace sessions that can enable the provider.
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users with administrative privileges, users in the
     *   `Performance Log Users` group, and services running as `LocalSystem`,
     *   `LocalService`, or `NetworkService` can enable event providers to a
     *   cross-process session. To grant a restricted user the ability to enable an
     *   event provider, add them to the `Performance Log Users` group or see
     *   [EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol).
     * 
     *   **Windows XP and Windows 2000:** Anyone can enable an event provider.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-enabletrace
     * @since windows5.0
     */
    static EnableTrace(Enable, EnableFlag, EnableLevel, ControlGuid, TraceHandle) {
        result := DllCall("ADVAPI32.dll\EnableTrace", "uint", Enable, "uint", EnableFlag, "uint", EnableLevel, "ptr", ControlGuid, "uint", TraceHandle, "uint")
        return result
    }

    /**
     * A trace session controller calls EnableTraceEx to configure how an ETW event provider logs events to a trace session. The EnableTraceEx2 function supersedes this function.
     * @remarks
     * Event trace controllers call this function to configure the event providers that
     * write events to the session. For example, a controller might call this function
     * to begin collecting events from a provider, to adjust the level or keywords of
     * the events being collected from a provider, or to stop collecting events from a
     * provider.
     * 
     * This function is obsolete. For additional functionality, new code should use
     * [EnableTraceEx2](/windows/win32/api/evntrace/nf-evntrace-enabletraceex2).
     * 
     * In most cases, a call to **EnableTraceEx** can be converted to
     * **EnableTraceEx2** as follows:
     * 
     * ```C
     * // Obsolete:
     * Status =
     * EnableTraceEx(
     *     ProviderId,
     *     NULL,           // SourceId
     *     TraceHandle,
     *     IsEnabled,
     *     Level,
     *     MatchAnyKeyword,
     *     MatchAllKeyword,
     *     0,              // EnableProperty
     *     NULL);          // EnableFilterDesc
     * 
     * // Updated equivalent code:
     * Status = EnableTraceEx2(
     *     TraceHandle,
     *     ProviderId,
     *     IsEnabled,
     *     Level,
     *     MatchAnyKeyword,
     *     MatchAllKeyword,
     *     0,              // Timeout
     *     NULL);          // EnableParameters
     * ```
     * 
     * In more complex scenarios, a call to **EnableTraceEx** can be converted to
     * **EnableTraceEx2** as follows:
     * 
     * ```C
     * // Obsolete:
     * Status =
     * EnableTraceEx(
     *     ProviderId,
     *     SourceId,
     *     TraceHandle,
     *     IsEnabled,
     *     Level,
     *     MatchAnyKeyword,
     *     MatchAllKeyword,
     *     EnableProperty,
     *     EnableFilterDesc);
     * 
     * // Updated equivalent code:
     * ENABLE_TRACE_PARAMETERS EnableParameters = {
     *     ENABLE_TRACE_PARAMETERS_VERSION_2,
     *     EnableProperty,
     *     0,                 // ControlFlags
     *     SourceId ? *SourceId : GUID_NULL,
     *     EnableFilterDesc,
     *     EnableFilterDesc ? 1 : 0 };
     * Status = EnableTraceEx2(
     *     TraceHandle,
     *     ProviderId,
     *     IsEnabled,
     *     Level,
     *     MatchAnyKeyword,
     *     MatchAllKeyword,
     *     0,                 // Timeout
     *     &EnableParameters);
     * ```
     * 
     * For additional details on the semantics of configuring providers for a session,
     * refer to the documentation for
     * [EnableTraceEx2](/windows/win32/api/evntrace/nf-evntrace-enabletraceex2).
     * @param {Pointer<Guid>} ProviderId The provider ID (control GUID) of the event provider that you want to configure.
     * @param {Pointer<Guid>} SourceId A GUID that can uniquely identify the source of this configuration request, or
     * **NULL** if no source identity is needed (equivalent to setting _SourceId_ to
     * `&GUID_NULL`). If specified, this value is used as the _SourceId_ parameter when
     * invoking the provider's
     * [EnableCallback](/windows/win32/api/evntprov/nc-evntprov-penablecallback).
     * 
     * > [!Note]
     * > There is not always a direct mapping between a call to **EnableTrace**
     * > and a corresponding call to the provider's **EnableCallback**. For example, if
     * > **EnableTrace** is called for a provider that has not yet been registered, the
     * > call to **EnableCallback** will be deferred until the registration occurs, and
     * > if a trace consumer session is stopped, ETW will invoke **EnableCallback**
     * > even though there was no corresponding call to **EnableTrace**. In such cases,
     * > **EnableTrace** will be invoked with _SourceId_ set to **GUID_NULL**.
     * @param {Integer} TraceHandle Handle of the event tracing session for which you are configuring the provider.
     * The [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) function
     * returns this handle when a new trace is started. To obtain the handle of an
     * existing trace, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) to query
     * the trace properties based on the trace's name and then get the handle from the
     * **Wnode.HistoricalContext** field of the returned `EVENT_TRACE_PROPERTIES` data.
     * @param {Integer} IsEnabled Set to 1 to enable receiving events from the provider or to adjust the settings
     * used when receiving events from the provider (e.g. to change level and
     * keywords). Set to 0 to disable receiving events from the provider.
     * @param {Integer} Level A value that indicates the maximum level of events that you want the provider to
     * write. The provider typically writes an event if the event's level is less than
     * or equal to this value, in addition to meeting the _MatchAnyKeyword_ and
     * _MatchAllKeyword_ criteria.
     * 
     * Microsoft defines the semantics of levels 1-5 as shown below. Lower values
     * indicate more-severe events. Each value of _EnableLevel_ enables the specified
     * level and all more-severe levels. For example, if you specify
     * `TRACE_LEVEL_WARNING`, your consumer will receive warning, error, and critical
     * events.
     * 
     * | Value                           | Meaning                                    |
     * | ------------------------------- | ------------------------------------------ |
     * | **TRACE_LEVEL_CRITICAL** (1)    | Abnormal exit or termination events        |
     * | **TRACE_LEVEL_ERROR** (2)       | Severe error events                        |
     * | **TRACE_LEVEL_WARNING** (3)     | Warning events such as allocation failures |
     * | **TRACE_LEVEL_INFORMATION** (4) | Non-error informational events             |
     * | **TRACE_LEVEL_VERBOSE** (5)     | Detailed diagnostic events                 |
     * 
     * The `TRACE_LEVEL` constants are defined in _evntrace.h_. Equivalent
     * `WINMETA_LEVEL` constants are defined in _winmeta.h_.
     * @param {Integer} MatchAnyKeyword 64-bit bitmask of keywords that determine the categories of events that you want
     * the provider to write. The provider typically writes an event if the event's
     * keyword bits match **any** of the bits set in this value or if the event has no
     * keyword bits set, in addition to meeting the _Level_ and _MatchAllKeyword_
     * criteria.
     * @param {Integer} MatchAllKeyword 64-bit bitmask of keywords that restricts the events that you want the provider
     * to write. The provider typically writes an event if the event's keyword bits
     * match **all** of the bits set in this value or if the event has no keyword bits
     * set, in addition to meeting the _Level_ and _MatchAnyKeyword_ criteria.
     * 
     * This value is frequently set to 0.
     * @param {Integer} EnableProperty Flags specifying special behaviors that the ETW runtime should enable when
     * collecting events from this provider. To enable special behaviors, specify one
     * or more of the following flags. Otherwise, set _EnableProperty_ to 0.
     * 
     * > [!Note]
     * > Several of these flags indicate that ETW should include extra
     * > information into each event. The data is written to the
     * > [extended data item](/windows/win32/api/evntcons/ns-evntcons-event_header_extended_data_item)
     * > section of the event.
     * 
     * | Value                                      | Meaning                                                                 |
     * | ------------------------------------------ | ----------------------------------------------------------------------- |
     * | **EVENT_ENABLE_PROPERTY_SID**              | Include the security identifier (SID) of the user in the extended data. |
     * | **EVENT_ENABLE_PROPERTY_TS_ID**            | Include the terminal session identifier in the extended data.           |
     * | **EVENT_ENABLE_PROPERTY_IGNORE_KEYWORD_0** | The trace session should not record events that have a keyword of 0.    |
     * @param {Pointer<EVENT_FILTER_DESCRIPTOR>} EnableFilterDesc An
     * [EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor)
     * structure that points to the filter data. The provider uses this to filter data
     * to prevent events that do not match the filter criteria from being written to
     * the session. The provider determines the layout of the data and how it applies
     * the filter to the event's data. A session can pass only one filter to the
     * provider.
     * 
     * A session can call the
     * [TdhEnumerateProviderFilters](/windows/desktop/api/tdh/nf-tdh-tdhenumerateproviderfilters)
     * function to look up the filters for which a provider has registered support.
     * @returns {Integer} If the function is successful, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _ProviderId_ is **NULL**.
     *   - _TraceHandle_ is **NULL**.
     * 
     * - **ERROR_INVALID_FUNCTION**
     * 
     *   You cannot update the level when the provider is not registered.
     * 
     * - **ERROR_NO_SYSTEM_RESOURCES**
     * 
     *   Exceeded the number of trace sessions that can enable the provider.
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users with administrative privileges, users in the
     *   `Performance Log Users` group, and services running as `LocalSystem`,
     *   `LocalService`, or `NetworkService` can enable event providers to a
     *   cross-process session. To grant a restricted user the ability to enable an
     *   event provider, add them to the `Performance Log Users` group or see
     *   [EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol).
     * 
     *   **Windows XP and Windows 2000:** Anyone can enable an event provider.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-enabletraceex
     * @since windows6.0.6000
     */
    static EnableTraceEx(ProviderId, SourceId, TraceHandle, IsEnabled, Level, MatchAnyKeyword, MatchAllKeyword, EnableProperty, EnableFilterDesc) {
        result := DllCall("ADVAPI32.dll\EnableTraceEx", "ptr", ProviderId, "ptr", SourceId, "uint", TraceHandle, "uint", IsEnabled, "char", Level, "uint", MatchAnyKeyword, "uint", MatchAllKeyword, "uint", EnableProperty, "ptr", EnableFilterDesc, "uint")
        return result
    }

    /**
     * A trace session controller calls EnableTraceEx2 to configure how an ETW event provider logs events to a trace session.
     * @remarks
     * Event trace controllers call this function to configure the event providers that
     * write events to the session. For example, a controller might call this function
     * to begin collecting events from a provider, to adjust the level or keywords of
     * the events being collected from a provider, or to stop collecting events from a
     * provider.
     * 
     * The enablement behavior for a provider depends on which APIs the provider uses.
     * 
     * - A provider that uses
     *   [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
     *   (e.g. a provider using TMF-based WPP or MOF) uses the legacy enablement system
     *   (sometimes called "classic ETW"). When a legacy provider is enabled or
     *   reconfigured for a session, the ETW runtime notifies the provider and provides
     *   access to the level, the low 32 bits of the MatchAnyKeyword mask, and the
     *   session ID. The provider then uses its own logic to decide which events should
     *   be enabled and sends those events directly to the specified session. The event
     *   data sent to ETW at runtime includes the event's decode GUID and message ID
     *   but does not include the event's control GUID, level or keywords. ETW verifies
     *   that the provider has the necessary permissions and then adds the event data
     *   to the specified session.
     *   - Because the events are sent directly to a specific session with no control
     *     GUID, level or keyword information, ETW cannot perform any additional
     *     filtering or routing for providers that use the legacy enablement system.
     *     Each event can be routed to no more than one session.
     * - A provider that uses
     *   [EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister) (e.g. a
     *   manifest-based provider or a TraceLogging provider) uses the modern enablement
     *   system (sometimes called "crimson ETW"). When a modern provider is enabled or
     *   reconfigured for a session, the ETW runtime notifies the provider with the
     *   level, the 64-bit MatchAnyKeyword mask, the 64-bit MatchAllKeyword mask, and
     *   any custom provider-side filtering data specified by the trace controller. The
     *   provider then uses its own logic to decide which events should be enabled,
     *   though most providers just duplicate the logic of
     *   [EventProviderEnabled](/windows/win32/api/evntprov/nf-evntprov-eventproviderenabled).
     *   The provider sends the enabled events to ETW for routing. The event data sent
     *   to ETW includes the event's control GUID, message ID, level, and keywords. ETW
     *   then performs additional filtering as appropriate, routing the event to the
     *   appropriate session(s).
     *   - Because the events are sent to ETW with descriptive information, ETW can
     *     perform additional filtering and routing before adding the event to the
     *     session. Events can be routed to more than one session if appropriate.
     * 
     * For providers that use the modern enablement system (i.e. providers using
     * **EventRegister**), ETW supports several features that can be requested by the
     * trace session controller via **EnableTraceEx2** _EnableParameters_. (See
     * [EVENT_FILTER_DESCRIPTOR](/windows/win32/api/evntprov/ns-evntprov-event_filter_descriptor)
     * for details.)
     * 
     * - **Schematized filtering** - This is the traditional filtering setup, also
     *   called provider-side filtering. The controller defines a custom set of filters
     *   as a binary object that is passed to the provider in
     *   [EnableCallback](/windows/win32/api/evntprov/nc-evntprov-penablecallback)
     *   _FilterData_. It is incumbent on the controller and provider to define and
     *   interpret these filters. The provider can then use the
     *   [EventWriteEx](/windows/win32/api/evntprov/nf-evntprov-eventwriteex) _Filter_
     *   parameter to indicate sessions to which an event should not be sent due to the
     *   provider-side filtering. This requires a close coupling of the controller and
     *   provider since the type and format of the binary object of what can be
     *   filtered is not defined. The
     *   [TdhEnumerateProviderFilters](/windows/desktop/api/tdh/nf-tdh-tdhenumerateproviderfilters)
     *   function can be used to retrieve the filters defined in a manifest.
     * - **Scope filtering** - Certain providers are enabled or not enabled to a
     *   session based on whether or not they meet the criteria specified by the scope
     *   filters. There are several types of scope filters that allow filtering based
     *   on the process ID (PID), executable filename, the app ID, and the app package
     *   name. This feature is supported on Windows 8.1, Windows Server 2012 R2, and
     *   later.
     * - **Stackwalk filtering** - This notifies ETW to only perform a stack walk for a
     *   given set of event IDs or (for TraceLogging events) event names. This feature
     *   is supported on Windows 8.1, Windows Server 2012 R2, and later.
     * - **Attribute filtering** - For manifest providers, events can be filtered based
     *   on event attributes such as level, keyword, event ID, or event name.
     * - **Event payload filtering** - For manifest providers, events can be filtered
     *   on-the-fly based on whether or not they satisfy a logical expression based on
     *   one or more predicates.
     * 
     * > [!Note]
     * > Even though ETW supports powerful payload and attribute filtering,
     * > events should primarily be filtered based scope filters or via control GUID,
     * > level, and keyword. Providers usually perform control GUID, level, and keyword
     * > filtering directly in the provider's code before the event is generated or
     * > sent to ETW. In most providers, events that are disabled by level or keyword
     * > have almost no impact on system performance. Similarly, providers disabled by
     * > scope filters are have almost no impact on system performance. Other kinds of
     * > filtering (based on payload or attributes other than level and keyword) are
     * > usually performed after the provider has generated the event and sent it to
     * > the ETW runtime, meaning the event has impact on system performance (the CPU
     * > time spent preparing the event and sending it to ETW) even if the ETW
     * > filtering determines that the event should not be recorded by any sessions.
     * > This kind of filtering is only effective in reducing trace data volume and is
     * > not as effective for reducing trace CPU overhead.
     * 
     * Every time **EnableTraceEx2** is called, the filters for the provider in that
     * session are replaced by the new parameters defined by the parameters passed to
     * the **EnableTraceEx2** function. Multiple filters passed in a single
     * **EnableTraceEx2** call can be combined with an additive effect, but filters
     * passed in a subsequent call will replace the previous set of filters.
     * 
     * To disable filtering and thereby enable all providers/events in the logging
     * session, call **EnableTraceEx2** with the _EnableParameters_ parameter pointing
     * at an
     * [ENABLE_TRACE_PARAMETERS](/windows/win32/api/evntrace/ns-evntrace-enable_trace_parameters)
     * structure with the **FilterDescCount** member set to 0.
     * 
     * Each filter passed to the **EnableTraceEx2** function is specified by a **Type**
     * member in the
     * [EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor).
     * An array of **EVENT_FILTER_DESCRIPTOR** structures is passed in the
     * [ENABLE_TRACE_PARAMETERS](/windows/win32/api/evntrace/ns-evntrace-enable_trace_parameters)
     * structure passed in the **EnableParameters** parameter to the **EnableTraceEx2**
     * function.
     * 
     * Each type of filter (a specific **Type** member) may only appear once in a call
     * to the **EnableTraceEx2** function. Some filter types allow multiple conditions
     * to be included in a single filter. The maximum number of filters that can be
     * included in a call to **EnableTraceEx2** is set by **MAX_EVENT_FILTERS_COUNT**
     * (defined in the _Evntprov.h_ header file; value may change in future versions of
     * the Windows SDK).
     * 
     * Each filter type has its own size or entity limits based on the specific
     * **Type** member in the
     * [EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor)
     * structure. The list below indicates these limits.
     * 
     * - **EVENT_FILTER_TYPE_SCHEMATIZED**
     * 
     *   - Filter size limit: **MAX_EVENT_FILTER_DATA_SIZE** (1024)
     *   - Number of elements allowed: Defined by provider and controller
     * 
     * - **EVENT_FILTER_TYPE_PID**
     * 
     *   - Filter size limit: **MAX_EVENT_FILTER_DATA_SIZE** (1024)
     *   - Number of elements allowed: **MAX_EVENT_FILTER_PID_COUNT** (8)
     * 
     * - **EVENT_FILTER_TYPE_EXECUTABLE_NAME**
     * 
     *   - Filter size limit: **MAX_EVENT_FILTER_DATA_SIZE** (1024)
     *   - Number of elements allowed: A single string that can contain multiple
     *     executable file names separated by semicolons.
     * 
     * - **EVENT_FILTER_TYPE_PACKAGE_ID**
     * 
     *   - Filter size limit: **MAX_EVENT_FILTER_DATA_SIZE** (1024)
     *   - Number of elements allowed: A single string that can contain multiple
     *     package IDs separated by semicolons.
     * 
     * - **EVENT_FILTER_TYPE_PACKAGE_APP_ID**
     * 
     *   - Filter size limit: **MAX_EVENT_FILTER_DATA_SIZE** (1024)
     *   - Number of elements allowed: A single string that can contain multiple
     *     package relative app IDs (PRAIDs) separated by semicolons.
     * 
     * - **EVENT_FILTER_TYPE_PAYLOAD**
     * 
     *   - Filter size limit: **MAX_EVENT_FILTER_PAYLOAD_SIZE** (4096)
     *   - Number of elements allowed: 1
     * 
     * - **EVENT_FILTER_TYPE_EVENT_ID**
     * 
     *   - Filter size limit: Not defined
     *   - Number of elements allowed: **MAX_EVENT_FILTER_EVENT_ID_COUNT** (64)
     * 
     * - **EVENT_FILTER_TYPE_STACKWALK**
     *   - Filter size limit: Not defined
     *   - Number of elements allowed: **MAX_EVENT_FILTER_EVENT_ID_COUNT** (64)
     * 
     * Keywords define event categories. For example, if the provider defines
     * InitializationKeyword = `0x1` (keyword bit 0), FileOperationKeyword = `0x2`
     * (keyword bit 1), and CalculationKeyword = `0x4` (keyword bit 2), you can set
     * _MatchAnyKeyword_ to (InitializationKeyword | CalculationKeyword) = 5 to receive
     * initialization and calculation events but not file events.
     * 
     * When used with modern
     * ([manifest-based](/windows/desktop/ETW/about-event-tracing) or
     * [TraceLogging](/windows/desktop/tracelogging/trace-logging-about)) providers, a
     * _MatchAnyKeyword_ value of `0` is treated the same as a _MatchAnyKeyword_ value
     * of `0xFFFFFFFFFFFFFFFF`, i.e. it enables all event keywords. However, this
     * behavior does not apply to legacy
     * ([MOF or TMF-based WPP](/windows/desktop/ETW/about-event-tracing)) providers. To
     * enable all event keywords from a legacy provider, set _MatchAnyKeyword_ to
     * `0xFFFFFFFF`. To enable all event keywords from both legacy and modern
     * providers, set _MatchAnyKeyword_ to `0xFFFFFFFFFFFFFFFF`.
     * 
     * If an event's keyword is zero, the provider will write the event to the session
     * regardless of the _MatchAnyKeyword_ and _MatchAllKeyword_ masks. (This behavior
     * can be disabled by using the
     * [EVENT_ENABLE_PROPERTY_IGNORE_KEYWORD_0](/windows/win32/api/evntrace/ns-evntrace-enable_trace_parameters)
     * flag.)
     * 
     * To indicate that you wish to enable a Provider Group, use the
     * `EVENT_ENABLE_PROPERTY_PROVIDER_GROUP` flag on the **EnableProperty** member of
     * _EnableParameters_.
     * 
     * When you call **EnableTraceEx2**, the provider may or may not already be
     * registered. If the provider is already registered, ETW calls the provider's
     * callback function (if any), and the session begins receiving events. If the
     * provider is not already registered, ETW will call the provider's callback
     * function (if any) immediately after the provider registers and the session will
     * then begin receiving events. If the provider is not already registered, the
     * provider's callback function will not receive the source ID.
     * 
     * If the provider is registered and already enabled to your session, you can call
     * **EnableTraceEx2** again to update the _Level_, _MatchAnyKeyword_,
     * _MatchAllKeyword_ parameters and the **EnableProperty** and **EnableFilterDesc**
     * members of _EnableParameters_.
     * 
     * On Windows 8.1, Windows Server 2012 R2, and later, event payload, scope, and
     * stack walk filters can be used by the **EnableTraceEx2** function and the
     * [ENABLE_TRACE_PARAMETERS](/windows/win32/api/evntrace/ns-evntrace-enable_trace_parameters)
     * and
     * [EVENT_FILTER_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor)
     * structures to filter on specific conditions in a logger session. For more
     * information on event payload filters, see the
     * [TdhCreatePayloadFilter](/windows/desktop/api/tdh/nf-tdh-tdhcreatepayloadfilter),
     * and
     * [TdhAggregatePayloadFilters](/windows/desktop/api/tdh/nf-tdh-tdhaggregatepayloadfilters)
     * functions and the **ENABLE_TRACE_PARAMETERS**, **EVENT_FILTER_DESCRIPTOR**, and
     * [PAYLOAD_FILTER_PREDICATE](/windows/desktop/api/tdh/ns-tdh-payload_filter_predicate)
     * structures.
     * 
     * Special system trace provider events cannot be enabled or disabled by
     * **EnableTraceEx2**. They can only be enabled via the _EnableFlags_ field of
     * [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties)
     * when the trace is first started by
     * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea).
     * 
     * Starting with Windows 11,
     * [system trace provider events can be enabled using EnableTraceEx2](/windows/win32/etw/system-providers).
     * 
     * Up to eight trace sessions can enable and receive events from the same modern
     * ([manifest-based](/windows/desktop/ETW/about-event-tracing) or
     * [TraceLogging](/windows/desktop/tracelogging/trace-logging-about)) provider.
     * However, only one trace session can enable a legacy (MOF, TMF-based WPP)
     * provider. If more than one session tries to enable a legacy provider, the first
     * session would stop receiving events when the second session enables the same
     * provider. For example, if Session A enabled a legacy provider and then Session B
     * enabled the same provider, only Session B would receive events from that
     * provider.
     * 
     * A provider remains enabled for the session until the session disables the
     * provider. If the application that started the session ends without disabling the
     * provider, the provider remains enabled.
     * 
     * To determine the level and keywords used to enable a manifest-based provider,
     * use one of the following commands:
     * 
     * - logman query providers _provider-name_
     * - wevtutil gp _provider-name_
     * 
     * For classic providers, it is up to the provider to document and make available
     * to potential controllers the severity levels or enable flags that it supports.
     * If the provider wants to be enabled by any controller, the provider should
     * accept 0 for the severity level and enable flags and interpret 0 as a request to
     * perform default logging (whatever that may be).
     * 
     * If you use **EnableTraceEx2** to enable a classic provider, the following
     * translation occurs:
     * 
     * - The _Level_ parameter is the same as setting the _EnableLevel_ parameter in
     *   [EnableTrace](/windows/desktop/ETW/enabletrace).
     * - The _MatchAnyKeyword_ is the same as setting the _EnableFlag_ parameter in
     *   [EnableTrace](/windows/desktop/ETW/enabletrace) except that the keyword value
     *   is truncated from a 64-bit value to a 32-bit value.
     * - In the [ControlCallback](/windows/desktop/ETW/controlcallback) callback, the
     *   provider can call
     *   [GetTraceEnableLevel](/windows/desktop/ETW/gettraceenablelevel) to get the
     *   level and [GetTraceEnableFlags](/windows/desktop/ETW/gettraceenableflags) to
     *   get the enable flag.
     * - The other parameter are not used.
     * @param {Integer} TraceHandle Handle of the event tracing session for which you are configuring the provider.
     * The [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) function
     * returns this handle when a new trace is started. To obtain the handle of an
     * existing trace, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) to query
     * the trace properties based on the trace's name and then get the handle from the
     * **Wnode.HistoricalContext** field of the returned `EVENT_TRACE_PROPERTIES` data.
     * @param {Pointer<Guid>} ProviderId The provider ID (control GUID) of the event provider that you want to configure.
     * @param {Integer} ControlCode You can specify one of the following control codes:
     * 
     * | Value                                   | Meaning                                                                                               |
     * | --------------------------------------- | ----------------------------------------------------------------------------------------------------- |
     * | **EVENT_CONTROL_CODE_DISABLE_PROVIDER** | Update the session configuration so that the session does not receive events from the provider.       |
     * | **EVENT_CONTROL_CODE_ENABLE_PROVIDER**  | Update the session configuration so that the session receives the requested events from the provider. |
     * | **EVENT_CONTROL_CODE_CAPTURE_STATE**    | Requests that the provider log its state information.                                                 |
     * @param {Integer} Level A value that indicates the maximum level of events that you want the provider to
     * write. The provider typically writes an event if the event's level is less than
     * or equal to this value, in addition to meeting the _MatchAnyKeyword_ and
     * _MatchAllKeyword_ criteria.
     * 
     * Microsoft defines the semantics of levels 1-5 as shown below. Lower values
     * indicate more-severe events. Each value of _Level_ enables the specified level
     * and all more-severe levels. For example, if you specify `TRACE_LEVEL_WARNING`,
     * your consumer will receive warning, error, and critical events.
     * 
     * | Value                           | Meaning                                    |
     * | ------------------------------- | ------------------------------------------ |
     * | **TRACE_LEVEL_CRITICAL** (1)    | Abnormal exit or termination events        |
     * | **TRACE_LEVEL_ERROR** (2)       | Severe error events                        |
     * | **TRACE_LEVEL_WARNING** (3)     | Warning events such as allocation failures |
     * | **TRACE_LEVEL_INFORMATION** (4) | Non-error informational events             |
     * | **TRACE_LEVEL_VERBOSE** (5)     | Detailed diagnostic events                 |
     * 
     * The `TRACE_LEVEL` constants are defined in _evntrace.h_. Equivalent
     * `WINMETA_LEVEL` constants are defined in _winmeta.h_.
     * @param {Integer} MatchAnyKeyword 64-bit bitmask of keywords that determine the categories of events that you want
     * the provider to write. The provider typically writes an event if the event's
     * keyword bits match **any** of the bits set in this value or if the event has no
     * keyword bits set, in addition to meeting the _Level_ and _MatchAllKeyword_
     * criteria.
     * @param {Integer} MatchAllKeyword 64-bit bitmask of keywords that restricts the events that you want the provider
     * to write. The provider typically writes an event if the event's keyword bits
     * match **all** of the bits set in this value or if the event has no keyword bits
     * set, in addition to meeting the _Level_ and _MatchAnyKeyword_ criteria.
     * 
     * This value is frequently set to 0.
     * @param {Integer} Timeout If _Timeout_ is 0, this function will start configuring the provider
     * asynchronously and will return immediately (i.e. it will return without waiting
     * for provider callbacks to complete).
     * 
     * Otherwise, this function will start configuring the provider and will then begin
     * waiting for the configuration to complete, including waiting for all provider
     * callbacks to complete. If configuration completes before the specified timeout,
     * this function will return **ERROR_SUCCESS**. Otherwise, this function will
     * return **ERROR_TIMEOUT**.
     * 
     * To wait forever, set to **INFINITE**.
     * @param {Pointer<ENABLE_TRACE_PARAMETERS>} EnableParameters The trace parameters used to enable the provider. For details, see
     * [ENABLE_TRACE_PARAMETERS](/windows/win32/api/evntrace/ns-evntrace-enable_trace_parameters).
     * @returns {Integer} If the function is successful, the return value is **ERROR_SUCCESS**.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following are
     * some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   A parameter is incorrect.
     * 
     *   This can occur if any of the following are true:
     * 
     *   - The _ProviderId_ is **NULL**.
     *   - The _TraceHandle_ is **0**.
     * 
     * - **ERROR_TIMEOUT**
     * 
     *   The timeout value expired before the enable callback completed. For details,
     *   see the _Timeout_ parameter.
     * 
     * - **ERROR_INVALID_FUNCTION**
     * 
     *   You cannot update the level when the provider is not registered.
     * 
     * - **ERROR_NO_SYSTEM_RESOURCES**
     * 
     *   Exceeded the number of trace sessions that can enable the provider.
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users with administrative privileges, users in the
     *   `Performance Log Users` group, and services running as `LocalSystem`,
     *   `LocalService`, or `NetworkService` can enable event providers to a
     *   cross-process session. To grant a restricted user the ability to enable an
     *   event provider, add them to the `Performance Log Users` group or see
     *   [EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol).
     * 
     *   **Windows XP and Windows 2000:** Anyone can enable an event provider.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-enabletraceex2
     * @since windows6.1
     */
    static EnableTraceEx2(TraceHandle, ProviderId, ControlCode, Level, MatchAnyKeyword, MatchAllKeyword, Timeout, EnableParameters) {
        result := DllCall("ADVAPI32.dll\EnableTraceEx2", "uint", TraceHandle, "ptr", ProviderId, "uint", ControlCode, "char", Level, "uint", MatchAnyKeyword, "uint", MatchAllKeyword, "uint", Timeout, "ptr", EnableParameters, "uint")
        return result
    }

    /**
     * Retrieves information about event trace providers that are currently running on the computer.
     * @remarks
     * This function returns information about event trace providers that have been
     * started (via
     * [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
     * or [EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister)) and
     * have not yet been stopped.
     * 
     * > [!Note]
     * > To get information about provider manifests that have been registered
     * > on the system (i.e. manifests registered via `wevtutil`), use
     * > [TdhEnumerateProviders](/windows/win32/api/tdh/nf-tdh-tdhenumerateproviders).
     * 
     * If _TraceQueryInfoClass_ is **TraceGuidQueryInfo**, ETW returns the data in a
     * [TRACE_GUID_INFO](/windows/win32/api/evntrace/ns-evntrace-trace_guid_info) block
     * that is a header to the information. The info block contains a
     * [TRACE_PROVIDER_INSTANCE_INFO](/windows/win32/api/evntrace/ns-evntrace-trace_provider_instance_info)
     * block for each provider that uses the same GUID. Each instance info block
     * contains a
     * [TRACE_ENABLE_INFO](/windows/win32/api/evntrace/ns-evntrace-trace_enable_info)
     * structure for each session that enabled the provider.
     * @param {Integer} TraceQueryInfoClass Determines the type of information to return. For possible values, see the
     * [TRACE_QUERY_INFO_CLASS](/windows/win32/api/evntrace/ne-evntrace-trace_query_info_class)
     * enumeration.
     * @param {Pointer<Void>} InBuffer GUID of the provider or provider group whose information you want to retrieve.
     * Specify the GUID only if _TraceQueryInfoClass_ is **TraceGuidQueryInfo** or
     * **TraceGroupQueryInfo**.
     * @param {Integer} InBufferSize Size, in bytes, of the data _InBuffer_.
     * @param {Pointer<Void>} OutBuffer Application-allocated buffer that contains the enumerated information. The
     * format of the information depends on the value of _TraceQueryInfoClass_.
     * @param {Integer} OutBufferSize Size, in bytes, of the _OutBuffer_ buffer. If the function succeeds, the
     * _ReturnLength_ parameter receives the size of the buffer used. If the buffer is
     * too small, the function returns `ERROR_INSUFFICIENT_BUFFER` and the
     * _ReturnLength_ parameter receives the required buffer size. If the buffer size
     * is zero on input, no data is returned in the buffer and the _ReturnLength_
     * parameter receives the required buffer size.
     * @param {Pointer<UInt32>} ReturnLength Actual size of the data in _OutBuffer_, in bytes.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following are
     * some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the parameters is not valid.
     * 
     * - **ERROR_INSUFFICIENT_BUFFER**
     * 
     *   The _OutBuffer_ buffer is too small to receive information for all registered
     *   providers. Reallocate the buffer using the size returned in _ReturnLength_.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-enumeratetraceguidsex
     * @since windows6.0.6000
     */
    static EnumerateTraceGuidsEx(TraceQueryInfoClass, InBuffer, InBufferSize, OutBuffer, OutBufferSize, ReturnLength) {
        result := DllCall("ADVAPI32.dll\EnumerateTraceGuidsEx", "int", TraceQueryInfoClass, "ptr", InBuffer, "uint", InBufferSize, "ptr", OutBuffer, "uint", OutBufferSize, "ptr", ReturnLength, "uint")
        return result
    }

    /**
     * Configures event tracing session settings.
     * @remarks
     * Call this function after calling [StartTrace](/windows/desktop/ETW/starttrace).
     * 
     * If the _InformationClass_ parameter is set to **TraceStackTracingInfo**, calling
     * this function enables stack tracing of the specified kernel events. Subsequent
     * calls to this function overwrites the previous list of kernel events for which
     * stack tracing is enabled. To disable stack tracing, call this function with
     * _InformationClass_ set to **TraceStackTracingInfo** and _InformationLength_ set
     * to 0.
     * 
     * The extended data section of the event will include the call stack. The
     * [StackWalk_Event](/windows/desktop/ETW/stackwalk-event) MOF class defines the
     * layout of the extended data.
     * 
     * Typically, on 64-bit computers, you cannot capture the kernel stack in certain
     * contexts when page faults are not allowed. To enable walking the kernel stack on
     * x64, set the `DisablePagingExecutive` Memory Management registry value to 1. The
     * `DisablePagingExecutive` registry value is located under the following registry
     * key:
     * `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management`.
     * This should only be done for temporary diagnosis purposes because it increases
     * memory usage of the system.
     * @param {Integer} SessionHandle Handle of the event tracing session to be configured. The
     * [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) function
     * returns this handle when a new trace is started. To obtain the handle of an
     * existing trace, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) to query
     * the trace properties based on the trace's name and then get the handle from the
     * **Wnode.HistoricalContext** field of the returned `EVENT_TRACE_PROPERTIES` data.
     * @param {Integer} InformationClass The information class to enable or disable. The information that the class
     * captures is included in the extended data section of the event. For a list of
     * information classes that you can enable, see the
     * [TRACE_QUERY_INFO_CLASS](/windows/win32/api/evntrace/ne-evntrace-trace_query_info_class)
     * enumeration.
     * @param {Pointer<Void>} TraceInformation A pointer to information class specific data. The information class determines
     * the contents of this parameter.
     * @param {Integer} InformationLength The size, in bytes, of the data in the _TraceInformation_ buffer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   The program issued a command but the command length is incorrect. This error
     *   is returned if the _InformationLength_ parameter is less than a minimum size.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   The parameter is incorrect.
     * 
     * - **ERROR_NOT_SUPPORTED**
     * 
     *   The request is not supported.
     * 
     * - **Other**
     * 
     *   Use [FormatMessage](/windows/desktop/api/winbase/nf-winbase-formatmessage) to
     *   obtain the message string for the returned error.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-tracesetinformation
     * @since windows6.1
     */
    static TraceSetInformation(SessionHandle, InformationClass, TraceInformation, InformationLength) {
        result := DllCall("ADVAPI32.dll\TraceSetInformation", "uint", SessionHandle, "int", InformationClass, "ptr", TraceInformation, "uint", InformationLength, "uint")
        return result
    }

    /**
     * Provides information about an event tracing session.
     * @remarks
     * The **TraceQueryInformation** function queries event tracing session settings
     * from a trace session. Call this function after calling
     * [StartTrace](/windows/desktop/ETW/starttrace).
     * @param {Integer} SessionHandle Handle of the event tracing session for which you are collecting information.
     * The [StartTrace](/windows/win32/api/evntrace/nf-evntrace-starttracea) function
     * returns this handle when a new trace is started. To obtain the handle of an
     * existing trace, use
     * [ControlTrace](/windows/win32/api/evntrace/nf-evntrace-controltracew) to query
     * the trace properties based on the trace's name and then get the handle from the
     * **Wnode.HistoricalContext** field of the returned `EVENT_TRACE_PROPERTIES` data.
     * @param {Integer} InformationClass The information class to query. The information that the class captures is
     * included in the extended data section of the event. For a list of information
     * classes that you can query, see the
     * [TRACE_QUERY_INFO_CLASS](/windows/desktop/ETW/trace-info-class) enumeration.
     * @param {Pointer<Void>} TraceInformation A pointer to a buffer to receive the returned information class specific data.
     * The information class determines the contents of this parameter. For example,
     * for the **TraceStackTracingInfo** information class, this parameter is an array
     * of [CLASSIC_EVENT_ID](/windows/desktop/ETW/classic-event-id) structures. The
     * structures specify the event GUIDs for which stack tracing is enabled. The array
     * is limited to 256 elements.
     * @param {Integer} InformationLength The size, in bytes, of the data returned in the _TraceInformation_ buffer. If
     * the function fails, this value indicates the required size of the
     * _TraceInformation_ buffer that is needed.
     * @param {Pointer<UInt32>} ReturnLength A pointer a value that receives the size, in bytes, of the specific data
     * returned in the _TraceInformation_ buffer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   The program issued a command but the command length is incorrect. This error
     *   is returned if the _InformationLength_ parameter is less than a minimum size.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   The parameter is incorrect.
     * 
     * - **ERROR_NOT_SUPPORTED**
     * 
     *   The request is not supported.
     * 
     * - **Other**
     * 
     *   Use [FormatMessage](/windows/desktop/api/winbase/nf-winbase-formatmessage) to
     *   obtain the message string for the returned error.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-tracequeryinformation
     * @since windows8.0
     */
    static TraceQueryInformation(SessionHandle, InformationClass, TraceInformation, InformationLength, ReturnLength) {
        result := DllCall("ADVAPI32.dll\TraceQueryInformation", "uint", SessionHandle, "int", InformationClass, "ptr", TraceInformation, "uint", InformationLength, "ptr", ReturnLength, "uint")
        return result
    }

    /**
     * A RegisterTraceGuids-based ("Classic") event provider uses the CreateTraceInstanceId function to create a unique transaction identifier and map it to a registration handle. The provider can then use the transaction identifier when calling the TraceEventInstance function.
     * @remarks
     * RegisterTraceGuids-based ("Classic") providers call this function. Use
     * [EventActivityIdControl](/windows/win32/api/evntprov/nf-evntprov-eventactivityidcontrol)
     * for similar functionality with an EventRegister-based ("Crimson") provider.
     * 
     * ETW creates the identifier in the user-mode process, so it might return the same
     * number for different instances in different processes. The value starts over at
     * `1` when **InstanceId** reaches the maximum value for a **ULONG**. Only
     * user-mode providers can call the **CreateTraceInstanceId** function (drivers
     * cannot call this function).
     * @param {Pointer<HANDLE>} RegHandle Handle to a registered event trace class. The
     * [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
     * function returns this handle in the **RegHandle** member of the
     * [TRACE_GUID_REGISTRATION](/windows/desktop/ETW/trace-guid-registration)
     * structure.
     * @param {Pointer<EVENT_INSTANCE_INFO>} InstInfo Pointer to an [EVENT_INSTANCE_INFO](/windows/desktop/ETW/event-instance-info)
     * structure. The **InstanceId** member of this structure contains the transaction
     * identifier.
     * @returns {Integer} If the function is successful, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following are
     * some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _RegHandle_ is **NULL**.
     *   - _pInstInfo_ is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-createtraceinstanceid
     * @since windows5.0
     */
    static CreateTraceInstanceId(RegHandle, InstInfo) {
        result := DllCall("ADVAPI32.dll\CreateTraceInstanceId", "ptr", RegHandle, "ptr", InstInfo, "uint")
        return result
    }

    /**
     * A RegisterTraceGuids-based ("Classic") event provider uses the TraceEvent function to send a structured event to an event tracing session.
     * @remarks
     * MOF-based ETW providers call this function.
     * 
     * > [!Note]
     * > Most developers will not call this function. This API supports
     * > MOF-based ETW, but MOF-based ETW is deprecated in favor of manifest-based ETW.
     * > In addition, most MOF-based providers use wrapper functions generated by
     * > MC.exe instead of directly calling ETW APIs.
     * 
     * Before the provider can call this function, the provider
     * 
     * - Must call the
     *   [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
     *   function to register itself and the event trace class.
     * - Must be enabled. A controller calls the
     *   [EnableTrace](/windows/desktop/ETW/enabletrace) function to enable a provider.
     * 
     * The event is either written to a log file, sent to event trace consumers in real
     * time, or both. The **LogFileMode** member of the
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure
     * passed to the [StartTrace](/windows/desktop/ETW/starttrace) defines where the
     * event is sent.
     * 
     * The trace events are written in the order in which they occur.
     * 
     * To trace a set of related events, use the
     * [TraceEventInstance](/windows/desktop/ETW/traceeventinstance) function.
     * 
     * On Windows Vista, you should use the
     * [EventWrite](/windows/desktop/api/evntprov/nf-evntprov-eventwrite) function to
     * log events.
     * @param {Integer} TraceHandle Handle to the event tracing session that records the event. The provider obtains
     * the handle when it calls the
     * [GetTraceLoggerHandle](/windows/desktop/ETW/gettraceloggerhandle) function in
     * its [ControlCallback](/windows/desktop/ETW/controlcallback) implementation.
     * @param {Pointer<EVENT_TRACE_HEADER>} EventTrace Pointer to an [EVENT_TRACE_HEADER](/windows/desktop/ETW/event-trace-header)
     * structure. Event-specific data is optionally appended to the structure. The
     * largest event you can log is slightly less than 64K. You must specify values for
     * the following members of the **EVENT_TRACE_HEADER** structure.
     * 
     * - **Size**
     * - **Guid** or **GuidPtr**
     * - **Flags**
     * 
     * Depending on the complexity of the information your provider provides, you
     * should also consider specifying values for the following members.
     * 
     * - **Class.Type**
     * - **Class.Level**
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_INVALID_FLAG_NUMBER**
     * 
     *   The **Flags** member of the
     *   [EVENT_TRACE_HEADER](/windows/desktop/ETW/event-trace-header) structure is
     *   incorrect.
     * 
     * - **ERROR_INVALID_HANDLE**
     * 
     *   _TraceHandle_ is not valid or specifies the NT Kernel Logger session handle.
     * 
     * - **ERROR_NOT_ENOUGH_MEMORY**
     * 
     *   The session ran out of free buffers to write to. This can occur during high
     *   event rates because the disk subsystem is overloaded or the number of buffers
     *   is too small. Rather than blocking until more buffers become available,
     *   [TraceEvent](/windows/desktop/ETW/traceevent) discards the event.
     * 
     *   Consider increasing the number and size of the buffers for the session, or
     *   reducing the number of events written or the size of the events.
     * 
     *   **Windows 2000:** Not supported.
     * 
     * - **ERROR_OUTOFMEMORY**
     * 
     *   The event is discarded because, although the buffer pool has not reached its
     *   maximum size, there is insufficient available memory to allocate an additional
     *   buffer and there is no buffer available to receive the event.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _TraceHandle_ is **NULL**.
     *   - _EventTrace_ is **NULL**.
     *   - The **Size** member of the
     *     [EVENT_TRACE_HEADER](/windows/desktop/ETW/event-trace-header) structure is
     *     incorrect.
     * 
     * - **ERROR_MORE_DATA**
     * 
     *   Data from a single event cannot span multiple buffers. A trace event is
     *   limited to the size of the event tracing session's buffer minus the size of
     *   the [EVENT_TRACE_HEADER](/windows/desktop/ETW/event-trace-header) structure.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-traceevent
     * @since windows5.0
     */
    static TraceEvent(TraceHandle, EventTrace) {
        result := DllCall("ADVAPI32.dll\TraceEvent", "uint", TraceHandle, "ptr", EventTrace, "uint")
        return result
    }

    /**
     * A RegisterTraceGuids-based ("Classic") event provider uses the TraceEventInstance function to send a structured event to an event tracing session with an instance identifier.
     * @remarks
     * MOF-based ETW providers call this function.
     * 
     * > [!Note]
     * > Most developers will not call this function. This API supports
     * > MOF-based ETW, but MOF-based ETW is deprecated in favor of manifest-based ETW.
     * > In addition, most MOF-based providers use wrapper functions generated by
     * > MC.exe instead of directly calling ETW APIs.
     * 
     * Before the provider can call this function, the provider
     * 
     * - Must call the
     *   [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa)
     *   function to register itself and the event trace class.
     * - Must call the
     *   [CreateTraceInstanceId](/windows/desktop/ETW/createtraceinstanceid) function
     *   to create an instance identifier for the registered event trace class.
     * - Must be enabled. A controller calls the
     *   [EnableTrace](/windows/desktop/ETW/enabletrace) function to enable a provider.
     * 
     * The event is either written to a log file, sent to event trace consumers in real
     * time, or both. The **LogFileMode** member of the
     * [EVENT_TRACE_PROPERTIES](/windows/desktop/ETW/event-trace-properties) structure
     * passed to the [StartTrace](/windows/desktop/ETW/starttrace) defines where the
     * event is sent.
     * 
     * The trace events are written in the order in which they occur.
     * 
     * To trace unrelated events, use the [TraceEvent](/windows/desktop/ETW/traceevent)
     * function.
     * 
     * **Windows XP:** Does not work correctly.
     * @param {Integer} TraceHandle Handle to the event tracing session that records the event instance. The
     * provider obtains the handle when it calls the
     * [GetTraceLoggerHandle](/windows/desktop/ETW/gettraceloggerhandle) function in
     * its [ControlCallback](/windows/desktop/ETW/controlcallback) implementation.
     * @param {Pointer<EVENT_INSTANCE_HEADER>} EventTrace Pointer to an
     * [EVENT_INSTANCE_HEADER](/windows/desktop/ETW/event-instance-header) structure.
     * Event-specific data is optionally appended to the structure. The largest event
     * you can log is 64K. You must specify values for the following members of the
     * **EVENT_INSTANCE_HEADER** structure.
     * 
     * - **Size**
     * - **Flags**
     * - **RegHandle**
     * 
     * Depending on the complexity of the information your provider provides, you
     * should also consider specifying values for the following members.
     * 
     * - **Class.Type**
     * - **Class.Level**
     * 
     * To trace hierarchical relationships between related events, also set the
     * **ParentRegHandle** member.
     * @param {Pointer<EVENT_INSTANCE_INFO>} InstInfo Pointer to an [EVENT_INSTANCE_INFO](/windows/desktop/ETW/event-instance-info)
     * structure, which contains the registration handle for this event trace class and
     * the instance identifier. Use the
     * [CreateTraceInstanceId](/windows/desktop/ETW/createtraceinstanceid) function to
     * initialize the structure.
     * @param {Pointer<EVENT_INSTANCE_INFO>} ParentInstInfo Pointer to an [EVENT_INSTANCE_INFO](/windows/desktop/ETW/event-instance-info)
     * structure, which contains the registration handle for the parent event trace
     * class and its instance identifier. Use the
     * [CreateTraceInstanceId](/windows/desktop/ETW/createtraceinstanceid) function to
     * initialize the structure. Set to **NULL** if you are not tracing a hierarchical
     * relationship.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_INVALID_FLAGS**
     * 
     *   The **Flags** member of the
     *   [EVENT_INSTANCE_HEADER](/windows/desktop/ETW/event-instance-header) does not
     *   contain **WNODE_FLAG_TRACED_GUID**.
     * 
     * - **ERROR_OUTOFMEMORY**
     * 
     *   There was insufficient memory to complete the function call. The causes for
     *   this error code are described in the following Remarks section.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _EventTrace_ is **NULL**.
     *   - _pInstInfo_ is **NULL**.
     *   - The members of _pInstInfo_ are **NULL**.
     *   - _TraceHandle_ is **NULL**.
     *   - The **Size** member of the
     *     [EVENT_INSTANCE_HEADER](/windows/desktop/ETW/event-instance-header) is
     *     incorrect.
     * 
     * - **ERROR_INVALID_HANDLE**
     * 
     *   _TraceHandle_ is not valid or specifies the NT Kernel Logger session handle.
     * 
     * - **ERROR_NOT_ENOUGH_MEMORY**
     * 
     *   The session ran out of free buffers to write to. This can occur during high
     *   event rates because the disk subsystem is overloaded or the number of buffers
     *   is too small. Rather than blocking until more buffers become available,
     *   [TraceEvent](/windows/desktop/ETW/traceevent) discards the event.
     * 
     *   **Windows 2000 and Windows XP:** Not supported.
     * 
     * - **ERROR_OUTOFMEMORY**
     * 
     *   The event is discarded because, although the buffer pool has not reached its
     *   maximum size, there is insufficient available memory to allocate an additional
     *   buffer and there is no buffer available to receive the event.
     * 
     * - **ERROR_MORE_DATA**
     * 
     *   Data from a single event cannot span multiple buffers. A trace event is
     *   limited to the size of the event tracing session's buffer minus the size of
     *   the [EVENT_INSTANCE_HEADER](/windows/desktop/ETW/event-instance-header)
     *   structure.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-traceeventinstance
     * @since windows5.0
     */
    static TraceEventInstance(TraceHandle, EventTrace, InstInfo, ParentInstInfo) {
        result := DllCall("ADVAPI32.dll\TraceEventInstance", "uint", TraceHandle, "ptr", EventTrace, "ptr", InstInfo, "ptr", ParentInstInfo, "uint")
        return result
    }

    /**
     * The RegisterTraceGuidsW (Unicode) function (evntrace.h) is an obsolete function, and new code should use the provided alternative.
     * @remarks
     * > [!Note]
     * > Most developers will not call this function directly. Instead,
     * > developers will typically use an ETW framework. For example, TMF-based WPP
     * > manages the calls to **RegisterTraceGuids**, **TraceMessage**, and
     * > **UnregisterTraceGuids** on your behalf.
     * 
     * This function opens a [Classic](/windows/win32/etw/tracing-events) (Windows
     * 2000-style) event provider handle that can be used to write MOF and TMF-based
     * WPP ETW events via
     * [TraceEvent](/windows/win32/api/evntrace/nf-evntrace-traceevent),
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance),
     * [TraceMessage](/windows/win32/api/evntrace/nf-evntrace-tracemessage), and
     * [TraceMessageVa](/windows/win32/api/evntrace/nf-evntrace-tracemessageva).
     * 
     * > [!Note]
     * > To open a
     * > [Windows Vista-style](/windows/win32/etw/writing-manifest-based-events)
     * > provider handle that writes manifest-based or TraceLogging-based ETW events
     * > via [EventWrite](/windows/win32/api/evntprov/nf-evntprov-eventwrite), use
     * > [EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister).
     * 
     * If the provider's _ControlGuid_ has been previously registered and enabled,
     * subsequent registrations that reference the same _ControlGuid_ are automatically
     * enabled.
     * 
     * A process can register up to 1,024 provider GUIDs; however, you should limit the
     * number of providers that your process registers to one or two. This limit
     * includes those registered using this function and the
     * [EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister) function.
     * 
     * **Prior to Windows Vista:** There is no limit to the number of providers that a
     * process can register.
     * @param {Pointer<WMIDPREQUEST>} RequestAddress Pointer to a
     * [ControlCallback](/windows/win32/api/evntrace/nc-evntrace-wmidprequest) function
     * that receives notification when the provider is enabled or disabled by an event
     * tracing session. The
     * [EnableTrace](/windows/win32/api/evntrace/nf-evntrace-enabletrace) function
     * triggers this callback.
     * @param {Pointer<Void>} RequestContext Pointer to an optional provider-defined context that ETW passes to the function
     * specified by _RequestAddress_.
     * @param {Pointer<Guid>} ControlGuid Control GUID (Provider ID) of the registering provider.
     * @param {Integer} GuidCount Number of elements in the _TraceGuidReg_ array. If _TraceGuidReg_ is **NULL**,
     * set this parameter to 0.
     * @param {Pointer<TRACE_GUID_REGISTRATION>} TraceGuidReg Pointer to an array of  
     * [TRACE_GUID_REGISTRATION](/windows/win32/api/evntrace/ns-evntrace-trace_guid_registration)
     * structures.
     * 
     * Each element identifies a category of events that the provider provides.
     * 
     * On input, the **Guid** member of each structure contains an event trace class
     * GUID assigned by the registering provider. The class GUID identifies a category
     * of events that the provider provides. Providers use the same class GUID to set
     * the Guid member of
     * [EVENT_TRACE_HEADER](/windows/win32/api/evntrace/ns-evntrace-event_trace_header)
     * when calling the
     * [TraceEvent](/windows/win32/api/evntrace/nf-evntrace-traceevent) function to log
     * the event.
     * 
     * On output, the **RegHandle** member receives a handle to the event's class GUID
     * registration. If the provider calls the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function, use the **RegHandle** member of
     * [TRACE_GUID_REGISTRATION](/windows/win32/api/evntrace/ns-evntrace-trace_guid_registration)
     * to set the **RegHandle** member of
     * [EVENT_INSTANCE_HEADER](/windows/win32/api/evntrace/ns-evntrace-event_instance_header).
     * 
     * This parameter can be **NULL** if the provider calls only the
     * [TraceEvent](/windows/win32/api/evntrace/nf-evntrace-traceevent) function to log
     * events. If the provider calls the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function to log events, this parameter cannot be **NULL**.
     * @param {Pointer<PWSTR>} MofImagePath This parameter is not supported. Set to **NULL**. You should use Mofcomp.exe to
     * register the MOF resource during the setup of your application. For more
     * information see,
     * [Publishing Your Event Schema](/windows/win32/etw/publishing-your-event-schema).
     * 
     * **Windows XP with SP1, Windows XP and Windows 2000:** Pointer to an optional
     * string that specifies the path of the DLL or executable program that contains
     * the resource specified by _MofResourceName_. This parameter can be **NULL** if
     * the event provider and consumer use another mechanism to share information about
     * the event trace classes used by the provider.
     * @param {Pointer<PWSTR>} MofResourceName This parameter is not supported. Set to **NULL**. You should use Mofcomp.exe to
     * register the MOF resource during the setup of your application. For more
     * information see,
     * [Publishing Your Event Schema](/windows/win32/etw/publishing-your-event-schema).
     * 
     * **Windows XP with SP1, Windows XP and Windows 2000:** Pointer to an optional
     * string that specifies the string resource of _MofImagePath_. The string resource
     * contains the name of the binary MOF file that describes the event trace classes
     * supported by the provider.
     * @param {Pointer<UInt64>} RegistrationHandle Receives the provider's registration handle. Use the returned handle when you
     * call the
     * [UnregisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-unregistertraceguids)
     * function.
     * 
     * > [!Important]
     * > All registration handles created by a DLL or driver must be
     * > unregistered before the DLL or driver unloads. If the provider is not
     * > unregistered, a crash will occur when ETW tries to invoke the provider's
     * > callback.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following are
     * some common errors and their causes.
     * 
     * > [!Important]
     * > This function can also return the value returned by
     * > [ControlCallback](/windows/win32/api/evntrace/nc-evntrace-wmidprequest) if a
     * > controller calls
     * > [EnableTrace](/windows/win32/api/evntrace/nf-evntrace-enabletrace) to enable
     * > the provider and the provider has not yet called **RegisterTraceGuids**. When
     * > this occurs, **RegisterTraceGuids** will return the return value of the
     * > callback if the registration was successful.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _RequestAddress_ is **NULL**.
     *   - _ControlGuid_ is **NULL**.
     *   - _RegistrationHandle_ is **NULL**.
     * 
     *   **Windows XP and Windows 2000:** _TraceGuidReg_ is **NULL** or _GuidCount_ is
     *   less than or equal to zero.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-registertraceguidsw
     * @since windows5.0
     */
    static RegisterTraceGuidsW(RequestAddress, RequestContext, ControlGuid, GuidCount, TraceGuidReg, MofImagePath, MofResourceName, RegistrationHandle) {
        result := DllCall("ADVAPI32.dll\RegisterTraceGuidsW", "ptr", RequestAddress, "ptr", RequestContext, "ptr", ControlGuid, "uint", GuidCount, "ptr", TraceGuidReg, "ptr", MofImagePath, "ptr", MofResourceName, "ptr", RegistrationHandle, "uint")
        return result
    }

    /**
     * The RegisterTraceGuidsA (ANSI) function (evntrace.h) is an obsolete function, and new code should use the provided alternative.
     * @remarks
     * > [!Note]
     * > Most developers will not call this function directly. Instead,
     * > developers will typically use an ETW framework. For example, TMF-based WPP
     * > manages the calls to **RegisterTraceGuids**, **TraceMessage**, and
     * > **UnregisterTraceGuids** on your behalf.
     * 
     * This function opens a [Classic](/windows/win32/etw/tracing-events) (Windows
     * 2000-style) event provider handle that can be used to write MOF and TMF-based
     * WPP ETW events via
     * [TraceEvent](/windows/win32/api/evntrace/nf-evntrace-traceevent),
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance),
     * [TraceMessage](/windows/win32/api/evntrace/nf-evntrace-tracemessage), and
     * [TraceMessageVa](/windows/win32/api/evntrace/nf-evntrace-tracemessageva).
     * 
     * > [!Note]
     * > To open a
     * > [Windows Vista-style](/windows/win32/etw/writing-manifest-based-events)
     * > provider handle that writes manifest-based or TraceLogging-based ETW events
     * > via [EventWrite](/windows/win32/api/evntprov/nf-evntprov-eventwrite), use
     * > [EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister).
     * 
     * If the provider's _ControlGuid_ has been previously registered and enabled,
     * subsequent registrations that reference the same _ControlGuid_ are automatically
     * enabled.
     * 
     * A process can register up to 1,024 provider GUIDs; however, you should limit the
     * number of providers that your process registers to one or two. This limit
     * includes those registered using this function and the
     * [EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister) function.
     * 
     * **Prior to Windows Vista:** There is no limit to the number of providers that a
     * process can register.
     * @param {Pointer<WMIDPREQUEST>} RequestAddress Pointer to a
     * [ControlCallback](/windows/win32/api/evntrace/nc-evntrace-wmidprequest) function
     * that receives notification when the provider is enabled or disabled by an event
     * tracing session. The
     * [EnableTrace](/windows/win32/api/evntrace/nf-evntrace-enabletrace) function
     * triggers this callback.
     * @param {Pointer<Void>} RequestContext Pointer to an optional provider-defined context that ETW passes to the function
     * specified by _RequestAddress_.
     * @param {Pointer<Guid>} ControlGuid Control GUID (Provider ID) of the registering provider.
     * @param {Integer} GuidCount Number of elements in the _TraceGuidReg_ array. If _TraceGuidReg_ is **NULL**,
     * set this parameter to 0.
     * @param {Pointer<TRACE_GUID_REGISTRATION>} TraceGuidReg Pointer to an array of  
     * [TRACE_GUID_REGISTRATION](/windows/win32/api/evntrace/ns-evntrace-trace_guid_registration)
     * structures.
     * 
     * Each element identifies a category of events that the provider provides.
     * 
     * On input, the **Guid** member of each structure contains an event trace class
     * GUID assigned by the registering provider. The class GUID identifies a category
     * of events that the provider provides. Providers use the same class GUID to set
     * the Guid member of
     * [EVENT_TRACE_HEADER](/windows/win32/api/evntrace/ns-evntrace-event_trace_header)
     * when calling the
     * [TraceEvent](/windows/win32/api/evntrace/nf-evntrace-traceevent) function to log
     * the event.
     * 
     * On output, the **RegHandle** member receives a handle to the event's class GUID
     * registration. If the provider calls the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function, use the **RegHandle** member of
     * [TRACE_GUID_REGISTRATION](/windows/win32/api/evntrace/ns-evntrace-trace_guid_registration)
     * to set the **RegHandle** member of
     * [EVENT_INSTANCE_HEADER](/windows/win32/api/evntrace/ns-evntrace-event_instance_header).
     * 
     * This parameter can be **NULL** if the provider calls only the
     * [TraceEvent](/windows/win32/api/evntrace/nf-evntrace-traceevent) function to log
     * events. If the provider calls the
     * [TraceEventInstance](/windows/win32/api/evntrace/nf-evntrace-traceeventinstance)
     * function to log events, this parameter cannot be **NULL**.
     * @param {Pointer<PSTR>} MofImagePath This parameter is not supported. Set to **NULL**. You should use Mofcomp.exe to
     * register the MOF resource during the setup of your application. For more
     * information see,
     * [Publishing Your Event Schema](/windows/win32/etw/publishing-your-event-schema).
     * 
     * **Windows XP with SP1, Windows XP and Windows 2000:** Pointer to an optional
     * string that specifies the path of the DLL or executable program that contains
     * the resource specified by _MofResourceName_. This parameter can be **NULL** if
     * the event provider and consumer use another mechanism to share information about
     * the event trace classes used by the provider.
     * @param {Pointer<PSTR>} MofResourceName This parameter is not supported. Set to **NULL**. You should use Mofcomp.exe to
     * register the MOF resource during the setup of your application. For more
     * information see,
     * [Publishing Your Event Schema](/windows/win32/etw/publishing-your-event-schema).
     * 
     * **Windows XP with SP1, Windows XP and Windows 2000:** Pointer to an optional
     * string that specifies the string resource of _MofImagePath_. The string resource
     * contains the name of the binary MOF file that describes the event trace classes
     * supported by the provider.
     * @param {Pointer<UInt64>} RegistrationHandle Receives the provider's registration handle. Use the returned handle when you
     * call the
     * [UnregisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-unregistertraceguids)
     * function.
     * 
     * > [!Important]
     * > All registration handles created by a DLL or driver must be
     * > unregistered before the DLL or driver unloads. If the provider is not
     * > unregistered, a crash will occur when ETW tries to invoke the provider's
     * > callback.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following are
     * some common errors and their causes.
     * 
     * > [!Important]
     * > This function can also return the value returned by
     * > [ControlCallback](/windows/win32/api/evntrace/nc-evntrace-wmidprequest) if a
     * > controller calls
     * > [EnableTrace](/windows/win32/api/evntrace/nf-evntrace-enabletrace) to enable
     * > the provider and the provider has not yet called **RegisterTraceGuids**. When
     * > this occurs, **RegisterTraceGuids** will return the return value of the
     * > callback if the registration was successful.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _RequestAddress_ is **NULL**.
     *   - _ControlGuid_ is **NULL**.
     *   - _RegistrationHandle_ is **NULL**.
     * 
     *   **Windows XP and Windows 2000:** _TraceGuidReg_ is **NULL** or _GuidCount_ is
     *   less than or equal to zero.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa
     * @since windows5.0
     */
    static RegisterTraceGuidsA(RequestAddress, RequestContext, ControlGuid, GuidCount, TraceGuidReg, MofImagePath, MofResourceName, RegistrationHandle) {
        result := DllCall("ADVAPI32.dll\RegisterTraceGuidsA", "ptr", RequestAddress, "ptr", RequestContext, "ptr", ControlGuid, "uint", GuidCount, "ptr", TraceGuidReg, "ptr", MofImagePath, "ptr", MofResourceName, "ptr", RegistrationHandle, "uint")
        return result
    }

    /**
     * Retrieves information about event trace providers that are currently running on the computer. The EnumerateTraceGuidsEx function supersedes this function.
     * @remarks
     * This function returns information about event trace providers that have been
     * started (via
     * [RegisterTraceGuids](/windows/win32/api/evntrace/nf-evntrace-registertraceguidsa),
     * [EventRegister](/windows/win32/api/evntprov/nf-evntprov-eventregister)) and have
     * not yet been stopped.
     * 
     * > [!Note]
     * > To get information about provider manifests that have been registered
     * > on the system (i.e. manifests registered via `wevtutil`), use
     * > [TdhEnumerateProviders](/windows/win32/api/tdh/nf-tdh-tdhenumerateproviders).
     * 
     * You can use the
     * [TRACE_GUID_PROPERTIES](ns-evntrace-trace_guid_properties.md).LoggerId member to
     * determine which session most recently enabled the provider if
     * **TRACE_GUID_PROPERTIES.IsEnable** is **TRUE**.
     * 
     * The list will not include the SystemTraceProvider providers.
     * @param {Pointer<TRACE_GUID_PROPERTIES>} GuidPropertiesArray An array of pointers to
     * [TRACE_GUID_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-trace_guid_properties)
     * structures. Each pointer in the array must point at a buffer with room to store
     * a **TRACE_GUID_PROPERTIES** structure.
     * @param {Integer} PropertyArrayCount Number of pointers in the _GuidPropertiesArray_ array.
     * @param {Pointer<UInt32>} GuidCount Receives the actual number of event tracing providers registered on the
     * computer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following are
     * some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _PropertyArrayCount_ is zero
     *   - _GuidPropertiesArray_ is **NULL**
     * 
     * - **ERROR_MORE_DATA**
     * 
     *   The property array is too small to receive information for all registered
     *   providers (_GuidCount_ is greater than _PropertyArrayCount_). The function
     *   fills _GuidPropertiesArray_ with the number of structures specified in
     *   _PropertyArrayCount_.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-enumeratetraceguids
     * @since windows5.1.2600
     */
    static EnumerateTraceGuids(GuidPropertiesArray, PropertyArrayCount, GuidCount) {
        result := DllCall("ADVAPI32.dll\EnumerateTraceGuids", "ptr", GuidPropertiesArray, "uint", PropertyArrayCount, "ptr", GuidCount, "uint")
        return result
    }

    /**
     * Unregisters a "Classic" (Windows 2000-style) ETW event trace provider that was registered using RegisterTraceGuids.
     * @remarks
     * Providers call this function.
     * 
     * The event trace provider must have been registered previously by calling the
     * [RegisterTraceGuids](/windows/desktop/ETW/registertraceguids) function.
     * 
     * > [!Important]
     * > All registration handles created by a DLL or driver must be
     * > unregistered before the DLL or driver unloads. If the provider is not
     * > unregistered, a crash will occur when ETW tries to invoke the provider's
     * > callback.
     * @param {Integer} RegistrationHandle Handle to the event trace provider, obtained from an earlier call to the
     * [RegisterTraceGuids](/windows/desktop/ETW/registertraceguids) function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   The _RegistrationHandle_ parameter does not specify the handle to a registered
     *   provider or is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-unregistertraceguids
     * @since windows5.0
     */
    static UnregisterTraceGuids(RegistrationHandle) {
        result := DllCall("ADVAPI32.dll\UnregisterTraceGuids", "uint", RegistrationHandle, "uint")
        return result
    }

    /**
     * A RegisterTraceGuids-based ("Classic") event provider uses the GetTraceLoggerHandle function to retrieve the handle of the event tracing session to which it should write events. Providers call this function from their ControlCallback function.
     * @remarks
     * You use the handle when calling the
     * [GetTraceEnableFlags](/windows/desktop/ETW/gettraceenableflags) and
     * [GetTraceEnableLevel](/windows/desktop/ETW/gettraceenablelevel) functions to
     * retrieve the enable flags and level values passed to the
     * [EnableTrace](/windows/desktop/ETW/enabletrace) function.
     * @param {Pointer<Void>} Buffer Pointer to a [WNODE_HEADER](/windows/desktop/ETW/wnode-header) structure. ETW
     * passes this structure to the provider's
     * [ControlCallback](/windows/desktop/ETW/controlcallback) function in the _Buffer_
     * parameter.
     * 
     * The **HistoricalContext** member of
     * [WNODE_HEADER](/windows/desktop/ETW/wnode-header) contains the session's handle.
     * @returns {Integer} If the function succeeds, it returns the event tracing session handle.
     * 
     * If the function fails, it returns **INVALID_HANDLE_VALUE**. To get extended
     * error information, call the
     * [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror)
     * function.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-gettraceloggerhandle
     * @since windows5.0
     */
    static GetTraceLoggerHandle(Buffer) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetTraceLoggerHandle", "ptr", Buffer, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A RegisterTraceGuids-based ("Classic") event provider uses the GetTraceEnableLevel function to retrieve the enable level specified by the trace controller to indicate which level of events to trace. Providers call this function from their ControlCallback function.
     * @remarks
     * Providers use this value to control the severity of events that it generates.
     * For example, providers can use this value to determine if it should generate
     * informational, warning, or error events.
     * @param {Integer} TraceHandle Handle to an event tracing session, obtained by calling the
     * [GetTraceLoggerHandle](/windows/desktop/ETW/gettraceloggerhandle) function.
     * @returns {Integer} Returns the value the controller specified in the _EnableLevel_ parameter when
     * calling the [EnableTrace](/windows/desktop/ETW/enabletrace) function.
     * 
     * To determine if the function failed or the controller set the enable flags to 0,
     * follow these steps:
     * 
     * 1. Call the
     *    [SetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror)
     *    function to set the last error to **ERROR_SUCCESS**.
     * 1. Call the **GetTraceEnableLevel** function to retrieve the enable level.
     * 1. If the enable level value is 0, call the
     *    [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror)
     *    function to retrieve the last known error.
     * 1. If the last known error is **ERROR_SUCCESS**, the controller set the enable
     *    level to 0; otherwise, the **GetTraceEnableLevel** function failed with the
     *    last known error.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-gettraceenablelevel
     * @since windows5.0
     */
    static GetTraceEnableLevel(TraceHandle) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetTraceEnableLevel", "uint", TraceHandle, "char")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A RegisterTraceGuids-based ("Classic") event provider uses the GetTraceEnableFlags function to retrieve the enable flags specified by the trace controller to indicate which category of events to trace. Providers call this function from their ControlCallback function.
     * @remarks
     * Providers can use this value to control which events that it generates. For
     * example, a provider can group events into logical categories of events and use
     * this value to enable or disable their generation.
     * @param {Integer} TraceHandle Handle to an event tracing session, obtained by calling the
     * [GetTraceLoggerHandle](/windows/desktop/ETW/gettraceloggerhandle) function.
     * @returns {Integer} Returns the value the controller specified in the _EnableFlag_ parameter when
     * calling the [EnableTrace](/windows/desktop/ETW/enabletrace) function.
     * 
     * To determine if the function failed or the controller set the enable flags to 0,
     * follow these steps:
     * 
     * 1. Call the
     *    [SetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror)
     *    function to set the last error to **ERROR_SUCCESS**.
     * 1. Call the **GetTraceEnableFlags** function to retrieve the enable flags.
     * 1. If the enable flags value is 0, call the
     *    [GetLastError](/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror)
     *    function to retrieve the last known error.
     * 1. If the last known error is **ERROR_SUCCESS**, the controller set the enable
     *    flags to 0; otherwise, the **GetTraceEnableFlags** function failed with the
     *    last known error.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-gettraceenableflags
     * @since windows5.0
     */
    static GetTraceEnableFlags(TraceHandle) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetTraceEnableFlags", "uint", TraceHandle, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The OpenTraceW (Unicode) function (evntrace.h) opens an ETW trace processing handle for consuming events from an ETW real-time trace session or an ETW log file.
     * @remarks
     * Trace consumers call this function to open a trace processing session.
     * 
     * After calling **OpenTrace**, call the
     * [ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace) function to
     * process the events. When you have finished processing events, call the
     * [CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace) function to
     * close the trace processing handle.
     * @param {Pointer<EVENT_TRACE_LOGFILEW>} Logfile Pointer to an
     * [EVENT_TRACE_LOGFILE](/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilew)
     * structure. The structure specifies the source from which to consume events (from
     * an ETW log file or a real-time ETW session) and specifies the callbacks the
     * consumer wants to use to receive the events. On success, **OpenTrace** will
     * update the structure with information from the opened file or session.
     * @returns {Integer} If the function succeeds, it returns the trace processing handle. The handle
     * should be closed using
     * [CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace).
     * 
     * If the function fails, it returns **INVALID_PROCESSTRACE_HANDLE**.
     * (**INVALID_PROCESSTRACE_HANDLE** is equivalent to `(UINT64)UINTPTR_MAX`.)
     * 
     * > [!Note]
     * > Prior to Windows Vista, OpenTrace returned `UINT64_MAX` in case of
     * > failure. If your code supports both older operating systems (Windows XP or
     * > Windows Server 2003) and newer versions of Windows (Windows Vista and later),
     * > you must determine the operating system on which you are running and compare
     * > the return value to the appropriate value.
     * 
     * | Operating system       | Process Type  | Value indicating failure                     |
     * | ---------------------- | ------------- | -------------------------------------------- |
     * | Prior to Windows Vista | 32- or 64-bit | `0XFFFFFFFFFFFFFFFF` = `UINT64_MAX`          |
     * | Windows Vista or later | 32-bit        | `0x00000000FFFFFFFF` = `(UINT64)UINTPTR_MAX` |
     * | Windows Vista or later | 64-bit        | `0XFFFFFFFFFFFFFFFF` = `(UINT64)UINTPTR_MAX` |
     * 
     * If the function fails, you can use the
     * [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
     * function to obtain extended error information. The following are some common
     * errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   The _Logfile_ parameter is **NULL**.
     * 
     * - **ERROR_BAD_PATHNAME**
     * 
     *   If you did not specify the **LoggerName** member of
     *   [EVENT_TRACE_LOGFILE](/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilew),
     *   you must specify a valid log file name.
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users with administrative privileges, users in the Performance Log Users
     *   group, and services running as LocalSystem, LocalService, NetworkService can
     *   consume events in real time. To grant a restricted user the ability to consume
     *   events in real time, add them to the Performance Log Users group.
     * 
     *   **Windows XP and Windows 2000:** Anyone can consume real time events.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-opentracew
     * @since windows5.0
     */
    static OpenTraceW(Logfile) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenTraceW", "ptr", Logfile, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Delivers events from one or more trace processing sessions to the consumer.
     * @remarks
     * Trace consumers call this function to process the events from one or more trace
     * processing sessions. This function blocks until processing ends.
     * 
     * Before calling **ProcessTrace**, use
     * [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) to open handles
     * to trace processing sessions.
     * 
     * The **ProcessTrace** function delivers the events from the sessions by invoking
     * the consumer's
     * [BufferCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_trace_buffer_callbacka),
     * [EventCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_callback), and
     * [EventRecordCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_record_callback)
     * callback functions.
     * 
     * The **ProcessTrace** function attempts to deliver events in order based on the
     * event's timestamp (i.e. it tries to deliver events oldest to newest). In certain
     * cases, **ProcessTrace** might deliver events out of order.
     * 
     * - If the clock used for the event timestamps is adjusted backwards during trace
     *   collection, the delivery order of the events is unpredictable. To avoid this
     *   issue, [use the QPC clock](/windows/win32/etw/wnode-header) instead of the
     *   system time clock when collecting the trace.
     * - If multiple events are collected with the same timestamp on different CPUs,
     *   the delivery order of the events is unpredictable.
     * - If an event has an invalid timestamp (e.g. due to file corruption), the
     *   delivery order of that event and other events in the trace may be
     *   unpredictable.
     * 
     * The **ProcessTrace** function blocks the thread until it delivers all events,
     * the
     * [BufferCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_trace_buffer_callbacka)
     * function returns **FALSE**, or you call
     * [CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace). In addition,
     * if the consumer is consuming events in real time, the **ProcessTrace** function
     * returns after the controller stops the trace session. (Note that there may be a
     * delay of several seconds before the function returns.)
     * 
     * **Windows Server 2003:** You can call
     * [CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace) only after
     * **ProcessTrace** returns.
     * @param {Pointer<UInt64>} HandleArray Pointer to an array of trace processing session handles obtained from earlier
     * calls to the [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea)
     * function.
     * 
     * The array can contain up to 64 handles to file processing sessions or it can
     * contain one handle to a real-time processing session. The array cannot contain
     * both file processing session handles and real-time processing session handles.
     * @param {Integer} HandleCount Number of elements in _HandleArray_.
     * @param {Pointer<FILETIME>} StartTime Pointer to an optional
     * [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) structure that
     * specifies the beginning time period for which you want to receive events. The
     * function does not deliver events with timestamps prior to _StartTime_.
     * @param {Pointer<FILETIME>} EndTime Pointer to an optional
     * [FILETIME](/windows/win32/api/minwinbase/ns-minwinbase-filetime) structure that
     * specifies the ending time period for which you want to receive events. The
     * function does not deliver events with timestamps after _EndTime_.
     * 
     * **Windows Server 2003:** This value is ignored for real-time event delivery.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following are
     * some common errors and their causes.
     * 
     * - **ERROR_BAD_LENGTH**
     * 
     *   _HandleCount_ is not valid or the number of handles is greater than 64.
     * 
     * - **ERROR_INVALID_HANDLE**
     * 
     *   An element of _HandleArray_ is not a valid event tracing session handle.
     * 
     * - **ERROR_INVALID_TIME**
     * 
     *   _EndTime_ is less than _StartTime_.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   _HandleArray_ is **NULL**, contains both file processing sessions and
     *   real-time processing sessions, or contains more than one real-time processing
     *   session.
     * 
     * - **ERROR_NOACCESS**
     * 
     *   An exception occurred in one of the callback functions that receives the
     *   events.
     * 
     * - **ERROR_CANCELLED**
     * 
     *   Indicates the consumer canceled processing by returning **FALSE** in their
     *   [BufferCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_trace_buffer_callbacka)
     *   function.
     * 
     * - **ERROR_WMI_INSTANCE_NOT_FOUND**
     * 
     *   The trace collection session from which you are trying to consume events in
     *   real time is not running or does not have the real-time trace mode enabled.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-processtrace
     * @since windows5.0
     */
    static ProcessTrace(HandleArray, HandleCount, StartTime, EndTime) {
        result := DllCall("ADVAPI32.dll\ProcessTrace", "ptr", HandleArray, "uint", HandleCount, "ptr", StartTime, "ptr", EndTime, "uint")
        return result
    }

    /**
     * The CloseTrace function closes a trace processing session that was created with OpenTrace.
     * @remarks
     * Consumers call this function to close a trace handle returned by **OpenTrace**.
     * 
     * > [!Important]
     * > Do not use this function to close the trace handle returned by
     * > **StartTrace**.
     * 
     * If you are processing events from a log file, you call this function only after
     * the [ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace)
     * function returns. However, if you are processing real-time events, you can call
     * this function before **ProcessTrace** returns. (Another way to stop trace
     * processing is to return FALSE from
     * [BufferCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_trace_buffer_callbacka).)
     * 
     * If you call this function before **ProcessTrace** returns, the **CloseTrace**
     * function returns ERROR_CTX_CLOSE_PENDING. The ERROR_CTX_CLOSE_PENDING code
     * indicates that the **CloseTrace** function call was successful; the
     * **ProcessTrace** function will stop processing events after it processes all
     * previously-queued events (**ProcessTrace** will not receive any new events after
     * you call the **CloseTrace** function). You can call the **CloseTrace** function
     * from your [BufferCallback](/windows/desktop/ETW/buffercallback),
     * [EventCallback](/windows/desktop/ETW/eventcallback), or
     * [EventClassCallback](/windows/desktop/ETW/eventclasscallback) callback.
     * 
     * > **Prior to Windows Vista:** You can call **CloseTrace** only after
     * > [ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace) returns.
     * @param {Integer} TraceHandle Handle to the trace processing session to close. The
     * [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) function returns
     * this handle.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_INVALID_HANDLE**
     * 
     *   One of the following is true:
     * 
     *   - _TraceHandle_ is **0**.
     *   - _TraceHandle_ is **INVALID_PROCESSTRACE_HANDLE**.
     *   - _TraceHandle_ is not a valid handle.
     * 
     * - **ERROR_BUSY**
     * 
     *   Prior to Windows Vista, you cannot close the trace until the
     *   [ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace) function
     *   completes.
     * 
     * - **ERROR_CTX_CLOSE_PENDING**
     * 
     *   The call was successful. The
     *   [ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace) function
     *   will stop after it has processed all real-time events in its buffers (it will
     *   not receive any new events).
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-closetrace
     * @since windows5.0
     */
    static CloseTrace(TraceHandle) {
        result := DllCall("ADVAPI32.dll\CloseTrace", "uint", TraceHandle, "uint")
        return result
    }

    /**
     * Creates a trace processing session that is not directly attached to any file or active session.
     * @remarks
     * The caller is expected to supply the data for the trace by calling [ProcessTraceAddBufferToBufferStream](nf-evntrace-processtraceaddbuffertobufferstream.md). This is typically used for remote real-time trace processing: a remote system uses [OpenTraceFromRealTimeLogger](nf-evntrace-opentracefromrealtimelogger.md) and [ProcessTrace](nf-evntrace-processtrace.md) with a [BufferCallback](nc-evntrace-petw_buffer_callback.md) that sends buffers over the network to a local system, then the local system calls [OpenTraceFromBufferStream](nf-evntrace-opentracefrombufferstream.md) and [ProcessTrace](nf-evntrace-processtrace.md), receives buffers from the network and feeds them to the local trace processor using [ProcessTraceAddBufferToBufferStream](nf-evntrace-processtraceaddbuffertobufferstream.md).
     * 
     * This processing mode requires that the buffers be provided in the same order that the buffers were received from [ProcessTrace](nf-evntrace-processtrace.md) (for example, the first buffer contains header information and subsequent buffers are ordered by flush time). The only supported means to generate buffers in this way is from the [BufferCallback](nc-evntrace-petw_buffer_callback.md) from another [OpenTraceFromBufferStream](nf-evntrace-opentracefrombufferstream.md), [OpenTraceFromFile](nf-evntrace-opentracefromfile.md), [OpenTraceFromRealTimeLogger](nf-evntrace-opentracefromrealtimelogger.md), [OpenTraceFromRealTimeLoggerWithAllocationOptions](nf-evntrace-opentracefromrealtimeloggerwithallocationoptions.md) processing session.
     * @param {Pointer<ETW_OPEN_TRACE_OPTIONS>} Options Configuration options for this processing session. See [ETW_OPEN_TRACE_OPTIONS](ns-evntrace-etw_open_trace_options.md) for more details
     * @param {Pointer<PETW_BUFFER_COMPLETION_CALLBACK>} BufferCompletionCallback When the processing session is done with a buffer passed in from [ProcessTraceAddBufferToBufferStream](nf-evntrace-processtraceaddbuffertobufferstream.md), it will invoke this callback to allow for any freeing or other cleanup that may be required for that buffer.
     * @param {Pointer<Void>} BufferCompletionContext User-provided context that will be passed to the [BufferCompletionCallback](nc-evntrace-petw_buffer_completion_callback.md).
     * @returns {Integer} A TRACEHANDLE that is used to identify this processing session. Typically passed to [ProcessTrace](nf-evntrace-processtrace.md) to begin processing and to [CloseTrace](nf-evntrace-closetrace.md) to end processing.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-opentracefrombufferstream
     */
    static OpenTraceFromBufferStream(Options, BufferCompletionCallback, BufferCompletionContext) {
        result := DllCall("ADVAPI32.dll\OpenTraceFromBufferStream", "ptr", Options, "ptr", BufferCompletionCallback, "ptr", BufferCompletionContext, "uint")
        return result
    }

    /**
     * Opens an ETW trace processing handle for consuming events from an ETW real-time trace session or an ETW log file.
     * @remarks
     * Once [ProcessTrace](nf-evntrace-processtrace.md) is called on the returned **TRACEHANDLE**, this will receive buffers from the ETW session as they are flushed and immediately begin processing them and calling the callbacks specified in the *Options*.
     * @param {Pointer<PWSTR>} LoggerName Name of the real-time event tracing session, or **NULL** if processing data from a log file. Specify a value for this member if you are calling **OpenTraceFromRealTimeLogger** to consume data from a real-time session.
     * 
     * When calling **OpenTraceFromRealTimeLogger**, if _LogFileHeader_ is non-**NULL** then _LoggerName_ must be **NULL**.
     * 
     * You can only consume events in real time if the trace controller has set the **LogFileMode** member of [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) to include the **EVENT_TRACE_REAL_TIME_MODE** flag.
     * 
     * Only users with administrative privileges, users in the Performance Log Users group, and applications running as LocalSystem, LocalService, NetworkService can consume events in real time. To grant a restricted user the ability to consume events in real time, add them to the Performance Log Users group or call [EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol).
     * @param {Pointer<ETW_OPEN_TRACE_OPTIONS>} Options Configuration options for this processing session. See [ETW_OPEN_TRACE_OPTIONS](ns-evntrace-etw_open_trace_options.md) for more details.
     * @param {Pointer<TRACE_LOGFILE_HEADER>} LogFileHeader Header information for the log file. See [TRACE_LOGFILE_HEADER](ns-evntrace-trace_logfile_header.md) for more details.
     * @returns {Integer} A TRACEHANDLE that is used to identify this processing session. Typically passed to [ProcessTrace](nf-evntrace-processtrace.md) to begin processing and to [CloseTrace](nf-evntrace-closetrace.md) to end processing.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-opentracefromrealtimelogger
     */
    static OpenTraceFromRealTimeLogger(LoggerName, Options, LogFileHeader) {
        result := DllCall("ADVAPI32.dll\OpenTraceFromRealTimeLogger", "ptr", LoggerName, "ptr", Options, "ptr", LogFileHeader, "uint")
        return result
    }

    /**
     * Creates a trace processing session attached to an active real-time ETW session.
     * @remarks
     * Once [ProcessTrace](nf-evntrace-processtrace.md) is called on the returned **TRACEHANDLE**, this will receive buffers from the ETW session as they are flushed and immediately begin processing them and calling the callbacks specified in the Options. This is identical to OpenTraceFromRealTime except that it allows customization of memory allocations for the processing session.
     * @param {Pointer<PWSTR>} LoggerName Name of the real-time event tracing session, or **NULL** if processing data from a log file. Specify a value for this member if you are calling **OpenTraceFromRealTimeLoggerWithAllocationOptions** to consume data from a real-time session.
     * 
     * When calling **OpenTraceFromRealTimeLoggerWithAllocationOptions**, if _LogFileHeader_ is non-**NULL** then _LoggerName_ must be **NULL**.
     * 
     * You can only consume events in real time if the trace controller has set the **LogFileMode** member of [EVENT_TRACE_PROPERTIES](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) to include the **EVENT_TRACE_REAL_TIME_MODE** flag.
     * 
     * Only users with administrative privileges, users in the Performance Log Users group, and applications running as LocalSystem, LocalService, NetworkService can consume events in real time. To grant a restricted user the ability to consume events in real time, add them to the Performance Log Users group or call [EventAccessControl](/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol).
     * @param {Pointer<ETW_OPEN_TRACE_OPTIONS>} Options Configuration options for this processing session. See [ETW_OPEN_TRACE_OPTIONS](ns-evntrace-etw_open_trace_options.md) for more details.
     * @param {Pointer} AllocationSize The size, in bytes, of the memory that will be pre-allocated to store ETW buffers during processing. A larger allocation will reduce the need for individual allocation/free calls at the cost of higher consistent memory usage. This will be adjusted upward to a minimum of the total buffer space of the underlying Real-Time ETW session to ensure enough is allocated for basic functioning. If 0, the default size will be used.
     * @param {Pointer<HANDLE>} MemoryPartitionHandle The handle to the Memory Partition that should be used for memory allocations for this processing session. If NULL, the Memory Partition of the process will be used. See [MemExtendedParameterPartitionHandle](../winnt/ne-winnt-mem_extended_parameter_type.md) for more details.
     * @param {Pointer<TRACE_LOGFILE_HEADER>} LogFileHeader Header information for the log file. See [TRACE_LOGFILE_HEADER](ns-evntrace-trace_logfile_header.md) for more details.
     * @returns {Integer} A TRACEHANDLE that is used to identify this processing session. Typically passed to [ProcessTrace](nf-evntrace-processtrace.md) to begin processing and to [CloseTrace](nf-evntrace-closetrace.md) to end processing.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-opentracefromrealtimeloggerwithallocationoptions
     */
    static OpenTraceFromRealTimeLoggerWithAllocationOptions(LoggerName, Options, AllocationSize, MemoryPartitionHandle, LogFileHeader) {
        result := DllCall("ADVAPI32.dll\OpenTraceFromRealTimeLoggerWithAllocationOptions", "ptr", LoggerName, "ptr", Options, "ptr", AllocationSize, "ptr", MemoryPartitionHandle, "ptr", LogFileHeader, "uint")
        return result
    }

    /**
     * Creates a trace processing session to process a Tracelog .etl file.
     * @remarks
     * Once [ProcessTrace](nf-evntrace-processtrace.md) is called on the returned **TRACEHANDLE**, this will immediately begin processing the file and calling the callbacks specified in *Options*.
     * @param {Pointer<PWSTR>} LogFileName The path of the Tracelog .etl file to process.
     * @param {Pointer<ETW_OPEN_TRACE_OPTIONS>} Options Configuration options for this processing session. See [ETW_OPEN_TRACE_OPTIONS](ns-evntrace-etw_open_trace_options.md) for more details.
     * @param {Pointer<TRACE_LOGFILE_HEADER>} LogFileHeader Header information for the log file. See [TRACE_LOGFILE_HEADER](ns-evntrace-trace_logfile_header.md) for more details.
     * @returns {Integer} A TRACEHANDLE that is used to identify this processing session. Typically passed to [ProcessTrace](nf-evntrace-processtrace.md) to begin processing and to [CloseTrace](nf-evntrace-closetrace.md) to end processing.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-opentracefromfile
     */
    static OpenTraceFromFile(LogFileName, Options, LogFileHeader) {
        result := DllCall("ADVAPI32.dll\OpenTraceFromFile", "ptr", LogFileName, "ptr", Options, "ptr", LogFileHeader, "uint")
        return result
    }

    /**
     * Called during the BufferCallback on the provided Buffer to prevent it from being freed until the caller is done with it.
     * @remarks
     * If **ProcessTraceBufferIncrementReference** is not called on a Buffer during the [PETW_BUFFER_CALLBACK](nc-evntrace-petw_buffer_callback.md) then the memory is no longer accessible after the [PETW_BUFFER_CALLBACK](nc-evntrace-petw_buffer_callback.md) returns.
     * 
     * The caller is responsible for calling **ProcessTraceBufferDecrementReference** on the Buffer once they are done with it. [ProcessTrace](nf-evntrace-processtrace.md) will not return until this has been done for every buffer that was incremented.
     * 
     * **ProcessTraceBufferIncrementReference** is not supported for buffers provided by a processing session opened by [OpenTraceFromBufferStream](nf-evntrace-opentracefrombufferstream.md).
     * @param {Integer} TraceHandle The processing session that this *Buffer* came from.
     * @param {Pointer<ETW_BUFFER_HEADER>} Buffer The buffer to reference. This buffer must have been obtained by a call to the [PETW_BUFFER_CALLBACK](nc-evntrace-petw_buffer_callback.md) callback.
     * @returns {Integer} Win32 Error Code. Possible codes may include ERROR_INVALID_PARAMETER and ERROR_OUTOFMEMORY.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-processtracebufferincrementreference
     */
    static ProcessTraceBufferIncrementReference(TraceHandle, Buffer) {
        result := DllCall("ADVAPI32.dll\ProcessTraceBufferIncrementReference", "uint", TraceHandle, "ptr", Buffer, "uint")
        return result
    }

    /**
     * Releases a reference to a Buffer that was added by ProcessTraceBufferIncrementReference.
     * @param {Pointer<ETW_BUFFER_HEADER>} Buffer The buffer to decrement a reference from.
     * @returns {Integer} Win32 Error Code.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-processtracebufferdecrementreference
     */
    static ProcessTraceBufferDecrementReference(Buffer) {
        result := DllCall("ADVAPI32.dll\ProcessTraceBufferDecrementReference", "ptr", Buffer, "uint")
        return result
    }

    /**
     * Provides an ETW trace buffer to a processing session created by OpenTraceFromBufferStream.
     * @remarks
     * Buffers passed by **ProcessTraceAddBufferToBufferStream** must be in the same order as they were produced by [ProcessTrace](nf-evntrace-processtrace.md). Incorrect ordering of buffers may cause the function to return an error.
     * 
     * When the buffer is done processing, the *BufferCompletionCallback* specified in [OpenTraceFromBufferStream](nf-evntrace-opentracefrombufferstream.md) will be called to release it.
     * @param {Integer} TraceHandle The TRACEHANDLE for the processing session to add to.
     * @param {Pointer<ETW_BUFFER_HEADER>} Buffer A valid ETW buffer to process.
     * @param {Integer} BufferSize The ETW buffer size.
     * @returns {Integer} ERROR_SUCCESS or a Win32 error code to indicate that the buffer is invalid, out of time order, or that the TraceHandle is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-processtraceaddbuffertobufferstream
     */
    static ProcessTraceAddBufferToBufferStream(TraceHandle, Buffer, BufferSize) {
        result := DllCall("ADVAPI32.dll\ProcessTraceAddBufferToBufferStream", "uint", TraceHandle, "ptr", Buffer, "uint", BufferSize, "uint")
        return result
    }

    /**
     * Retrieves information about an ETW trace processing session opened by OpenTrace.
     * @param {Integer} ProcessingHandle A valid handle created with
     * [OpenTrace](/windows/win32/api/evntrace/nf-evntrace-opentracea) that the data
     * should be queried from.
     * @param {Integer} InformationClass An
     * [ETW_PROCESS_HANDLE_INFO_TYPE](/windows/win32/api/evntrace/ne-evntrace-etw_process_handle_info_type)
     * value that specifies what kind of operation will be done on the handle.
     * @param {Pointer<Void>} InBuffer Reserved for future use. May be null.
     * @param {Integer} InBufferSize Size in bytes of the _InBuffer_.
     * @param {Pointer<Void>} OutBuffer Buffer provided by the caller to receive output data.
     * @param {Integer} OutBufferSize Size in bytes of _OutBuffer._
     * @param {Pointer<UInt32>} ReturnLength The size in bytes of the data that the API wrote into _OutBuffer_. Used for
     * variable length returns.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes).
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-querytraceprocessinghandle
     * @since windows10.0.16299
     */
    static QueryTraceProcessingHandle(ProcessingHandle, InformationClass, InBuffer, InBufferSize, OutBuffer, OutBufferSize, ReturnLength) {
        result := DllCall("ADVAPI32.dll\QueryTraceProcessingHandle", "uint", ProcessingHandle, "int", InformationClass, "ptr", InBuffer, "uint", InBufferSize, "ptr", OutBuffer, "uint", OutBufferSize, "ptr", ReturnLength, "uint")
        return result
    }

    /**
     * The OpenTraceA (ANSI) function (evntrace.h) opens an ETW trace processing handle for consuming events from an ETW real-time trace session or an ETW log file.
     * @remarks
     * Trace consumers call this function to open a trace processing session.
     * 
     * After calling **OpenTrace**, call the
     * [ProcessTrace](/windows/win32/api/evntrace/nf-evntrace-processtrace) function to
     * process the events. When you have finished processing events, call the
     * [CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace) function to
     * close the trace processing handle.
     * @param {Pointer<EVENT_TRACE_LOGFILEA>} Logfile Pointer to an
     * [EVENT_TRACE_LOGFILE](/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilea)
     * structure. The structure specifies the source from which to consume events (from
     * an ETW log file or a real-time ETW session) and specifies the callbacks the
     * consumer wants to use to receive the events. On success, **OpenTrace** will
     * update the structure with information from the opened file or session.
     * @returns {Integer} If the function succeeds, it returns the trace processing handle. The handle
     * should be closed using
     * [CloseTrace](/windows/win32/api/evntrace/nf-evntrace-closetrace).
     * 
     * If the function fails, it returns **INVALID_PROCESSTRACE_HANDLE**.
     * (**INVALID_PROCESSTRACE_HANDLE** is equivalent to `(UINT64)UINTPTR_MAX`.)
     * 
     * > [!Note]
     * > Prior to Windows Vista, OpenTrace returned `UINT64_MAX` in case of
     * > failure. If your code supports both older operating systems (Windows XP or
     * > Windows Server 2003) and newer versions of Windows (Windows Vista and later),
     * > you must determine the operating system on which you are running and compare
     * > the return value to the appropriate value.
     * 
     * | Operating system       | Process Type  | Value indicating failure                     |
     * | ---------------------- | ------------- | -------------------------------------------- |
     * | Prior to Windows Vista | 32- or 64-bit | `0XFFFFFFFFFFFFFFFF` = `UINT64_MAX`          |
     * | Windows Vista or later | 32-bit        | `0x00000000FFFFFFFF` = `(UINT64)UINTPTR_MAX` |
     * | Windows Vista or later | 64-bit        | `0XFFFFFFFFFFFFFFFF` = `(UINT64)UINTPTR_MAX` |
     * 
     * If the function fails, you can use the
     * [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror)
     * function to obtain extended error information. The following are some common
     * errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   The _Logfile_ parameter is **NULL**.
     * 
     * - **ERROR_BAD_PATHNAME**
     * 
     *   If you did not specify the **LoggerName** member of
     *   [EVENT_TRACE_LOGFILE](/windows/win32/api/evntrace/ns-evntrace-event_trace_logfilea),
     *   you must specify a valid log file name.
     * 
     * - **ERROR_ACCESS_DENIED**
     * 
     *   Only users with administrative privileges, users in the Performance Log Users
     *   group, and services running as LocalSystem, LocalService, NetworkService can
     *   consume events in real time. To grant a restricted user the ability to consume
     *   events in real time, add them to the Performance Log Users group.
     * 
     *   **Windows XP and Windows 2000:** Anyone can consume real time events.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-opentracea
     * @since windows5.0
     */
    static OpenTraceA(Logfile) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenTraceA", "ptr", Logfile, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The SetTraceCallback function specifies an EventCallback function to process events for the specified event trace class. This function is obsolete.
     * @remarks
     * Consumers call this function.
     * 
     * You can only specify one callback function for an event trace class. If you
     * specify more than one callback function for the event trace class, the last
     * callback function receives the events for that event trace class.
     * 
     * To stop the callback function from receiving events for the event trace class,
     * call the [RemoveTraceCallback](/windows/desktop/ETW/removetracecallback)
     * function. The callback automatically stops receiving callbacks when you close
     * the trace.
     * 
     * You can use this function to receive events written using one of the
     * [TraceEvent](/windows/desktop/ETW/traceevent) functions. You cannot use this
     * function to consume events from a provider that used one of the
     * [EventWrite](/windows/desktop/api/evntprov/nf-evntprov-eventwrite) functions to
     * log events.
     * @param {Pointer<Guid>} pGuid Pointer to the class GUID of an event trace class for which you want to receive
     * events. For a list of kernel provider class GUIDs, see
     * [NT Kernel Logger Constants](/windows/desktop/ETW/nt-kernel-logger-constants).
     * @param {Pointer<PEVENT_CALLBACK>} EventCallback Pointer to an
     * [EventCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_callback)
     * function used to process events belonging to the event trace class.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   One of the following is true:
     * 
     *   - _pGuid_ is **NULL**.
     *   - _EventCallback_ is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-settracecallback
     * @since windows5.0
     */
    static SetTraceCallback(pGuid, EventCallback) {
        result := DllCall("ADVAPI32.dll\SetTraceCallback", "ptr", pGuid, "ptr", EventCallback, "uint")
        return result
    }

    /**
     * The RemoveTraceCallback function stops an EventCallback function from receiving events for an event trace class. This function is obsolete.
     * @remarks
     * Consumers call this function.
     * @param {Pointer<Guid>} pGuid Pointer to the class GUID of the event trace class for which the callback
     * receives events. Use the same class GUID that you passed to the
     * [SetTraceCallback](/windows/desktop/ETW/settracecallback) to begin receiving the
     * events.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   The _pGuid_ parameter is **NULL**.
     * 
     * - **ERROR_WMI_GUID_NOT_FOUND**
     * 
     *   There is no
     *   [EventCallback](/windows/win32/api/evntrace/nc-evntrace-pevent_callback)
     *   function associated with the event trace class.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-removetracecallback
     * @since windows5.0
     */
    static RemoveTraceCallback(pGuid) {
        result := DllCall("ADVAPI32.dll\RemoveTraceCallback", "ptr", pGuid, "uint")
        return result
    }

    /**
     * A RegisterTraceGuids-based ("Classic") event provider uses the TraceMessage function to send a message-based (TMF-based WPP) event to an event tracing session.
     * @remarks
     * TMF-based WPP providers call this function.
     * 
     * > [!Note]
     * > Most developers will not call this function directly. WPP providers
     * > use wrapper functions generated by tracewpp.exe instead of calling ETW APIs.
     * 
     * If you need to access message tracing functionality from a wrapper function,
     * call the [TraceMessageVa](/windows/desktop/ETW/tracemessageva) version of this
     * function.
     * 
     * Consumers will have to use the
     * [EventCallback](/windows/desktop/ETW/eventcallback) callback to receive and
     * process the events if the _MessageFlags_ parameter does not contain the
     * TRACE_MESSAGE_GUID flag. If you do not specify the TRACE_MESSAGE_GUID flag, the
     * consumer will not be able to use the
     * [EventClassCallback](/windows/desktop/ETW/eventclasscallback) because the
     * **Header.Guid** member of the [EVENT_TRACE](/windows/desktop/ETW/event-trace)
     * structure will not contain the event trace class GUID.
     * 
     * Note that the members of the [EVENT_TRACE](/windows/desktop/ETW/event-trace) and
     * [EVENT_TRACE_HEADER](/windows/desktop/ETW/event-trace-header) structures that
     * correspond to the _MessageFlags_ flags are set only if the corresponding flag is
     * specified. For example, the **ThreadId** and **ProcessId** members of
     * **EVENT_TRACE_HEADER** are populated only if you specify the
     * TRACE_MESSAGE_SYSTEMINFO flag.
     * @param {Integer} LoggerHandle Handle to the event tracing session that records the event. The provider obtains
     * the handle when it calls the
     * [GetTraceLoggerHandle](/windows/desktop/ETW/gettraceloggerhandle) function in
     * its [ControlCallback](/windows/desktop/ETW/controlcallback) implementation.
     * @param {Integer} MessageFlags Adds additional information to the beginning of the provider-specific data
     * section of the event. The provider-specific data section of the event will
     * contain data only for those flags that are set. The variable list of argument
     * data will follow this information. This parameter can be one or more of the
     * following values.
     * 
     * - **TRACE_MESSAGE_COMPONENTID**
     * 
     *   Include the component identifier in the message. The _MessageGuid_ parameter
     *   contains the component identifier.
     * 
     * - **TRACE_MESSAGE_GUID**
     * 
     *   Include the event trace class GUID in the message. The _MessageGuid_ parameter
     *   contains the event trace class GUID.
     * 
     * - **TRACE_MESSAGE_SEQUENCE**
     * 
     *   Include a sequence number in the message. The sequence number starts at one.
     *   To use this flag, the controller must have set the
     *   **EVENT_TRACE_USE_GLOBAL_SEQUENCE** or **EVENT_TRACE_USE_LOCAL_SEQUENCE** log
     *   file mode when creating the session.
     * 
     * - **TRACE_MESSAGE_SYSTEMINFO**
     * 
     *   Include the thread identifier and process identifier in the message.
     * 
     * - **TRACE_MESSAGE_TIMESTAMP**
     * 
     *   Include a time stamp in the message.
     * 
     * **TRACE_MESSAGE_COMPONENTID** and **TRACE_MESSAGE_GUID** are mutually exclusive.
     * 
     * The information is included in the event data in the following order:
     * 
     * - Sequence number
     * - Event trace class GUID (or component identifier)
     * - Time stamp
     * - Thread identifier
     * - Process identifier
     * @param {Pointer<Guid>} MessageGuid Class GUID or component ID that identifies the message. Depends if
     * _MessageFlags_ contains the **TRACE_MESSAGE_COMPONENTID** or
     * **TRACE_MESSAGE_GUID** flag.
     * @param {Integer} MessageNumber Number that uniquely identifies each occurrence of the message. You must define
     * the value specified for this parameter; the value should be meaningful to the
     * application.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * are some common errors and their causes.
     * 
     * - **ERROR_INVALID_HANDLE**
     * 
     *   Either the _LoggerHandle_ is **NULL** or specifies the NT Kernel Logger
     *   session handle.
     * 
     * - **ERROR_NOT_ENOUGH_MEMORY**
     * 
     *   The session ran out of free buffers to write to. This can occur during high
     *   event rates because the disk subsystem is overloaded or the number of buffers
     *   is too small. Rather than blocking until more buffers become available,
     *   [TraceMessage](/windows/desktop/ETW/tracemessage) discards the event.
     * 
     *   **Windows 2000 and Windows XP:** Not supported.
     * 
     * - **ERROR_OUTOFMEMORY**
     * 
     *   The event is discarded because, although the buffer pool has not reached its
     *   maximum size, there is insufficient available memory to allocate an additional
     *   buffer and there is no buffer available to receive the event.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   _MessageFlags_ contains a value that is not valid.
     * 
     * - **ERROR_MORE_DATA**
     * 
     *   Data from a single event cannot span multiple buffers. A trace event is
     *   limited to the size of the event tracing session's buffer minus the size of
     *   the [EVENT_TRACE_HEADER](/windows/desktop/ETW/event-trace-header) structure.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-tracemessage
     * @since windows5.1.2600
     */
    static TraceMessage(LoggerHandle, MessageFlags, MessageGuid, MessageNumber) {
        result := DllCall("ADVAPI32.dll\TraceMessage", "uint", LoggerHandle, "uint", MessageFlags, "ptr", MessageGuid, "ushort", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * A RegisterTraceGuids-based ("Classic") event provider uses the TraceMessageVa function to send a message-based (TMF-based WPP) event to an event tracing session using va_list parameters.
     * @remarks
     * TMF-based WPP providers call this function.
     * 
     * > [!Note]
     * > Most developers will not call this function directly. WPP providers
     * > use wrapper functions generated by tracewpp.exe instead of calling ETW APIs.
     * 
     * If you do not need to access the message tracing functionality from a wrapper
     * function, you can call the [TraceMessage](/windows/desktop/ETW/tracemessage)
     * version of this function.
     * 
     * Consumers will have to use the
     * [EventCallback](/windows/desktop/ETW/eventcallback) callback to receive and
     * process the events if the _MessageFlags_ parameter does not contain the
     * TRACE_MESSAGE_GUID flag. If you do not specify the TRACE_MESSAGE_GUID flag, the
     * consumer will not be able to use the
     * [EventClassCallback](/windows/desktop/ETW/eventclasscallback) because the
     * **Header.Guid** member of the [EVENT_TRACE](/windows/desktop/ETW/event-trace)
     * structure will not contain the event trace class GUID.
     * 
     * Note that the members of the [EVENT_TRACE](/windows/desktop/ETW/event-trace) and
     * [EVENT_TRACE_HEADER](/windows/desktop/ETW/event-trace-header) structures that
     * correspond to the _MessageFlags_ flags are set only if the corresponding flag is
     * specified. For example, the **ThreadId** and **ProcessId** members of
     * **EVENT_TRACE_HEADER** are populated only if you specify the
     * TRACE_MESSAGE_SYSTEMINFO flag.
     * @param {Integer} LoggerHandle Handle to the event tracing session that records the event. The provider obtains
     * the handle when it calls the
     * [GetTraceLoggerHandle](/windows/desktop/ETW/gettraceloggerhandle) function in
     * its [ControlCallback](/windows/desktop/ETW/controlcallback) implementation.
     * @param {Integer} MessageFlags Adds additional information to the beginning of the provider-specific data
     * section of the event. The provider-specific data section of the event will
     * contain data only for those flags that are set. The variable list of argument
     * data will follow this information. This parameter can be one or more of the
     * following values.
     * 
     * - **TRACE_MESSAGE_GUID**: Include the event trace class GUID in the message. The
     *   _MessageGuid_ parameter contains the event trace class GUID.
     * 
     * - **TRACE_MESSAGE_SEQUENCE**: Include a sequence number in the message. The
     *   sequence number starts at one. To use this flag, the controller must have set
     *   the **EVENT_TRACE_USE_GLOBAL_SEQUENCE** or **EVENT_TRACE_USE_LOCAL_SEQUENCE**
     *   log file mode when creating the session.
     * 
     * - **TRACE_MESSAGE_SYSTEMINFO**: Include the thread identifier and process
     *   identifier in the message.
     * 
     * - **TRACE_MESSAGE_TIMESTAMP**: Include a time stamp in the message.
     * 
     * The information is included in the event data in the following order:
     * 
     * - Sequence number
     * - Event trace class GUID
     * - Time stamp
     * - Thread identifier
     * - Process identifier
     * @param {Pointer<Guid>} MessageGuid Class GUID that identifies the event trace message.
     * @param {Integer} MessageNumber Number that uniquely identifies each occurrence of the message. You must define
     * the value specified for this parameter; the value should be meaningful to the
     * application.
     * @param {Pointer<SByte>} MessageArgList List of variable arguments to be appended to the message. The list must be
     * composed of pairs of arguments, as follows.
     * 
     * - **PVOID**: Pointer to the argument data.
     * - **size_t**: The size of the argument data, in bytes.
     * 
     * Terminate the list using an argument pair consisting of a pointer to **NULL**
     * and zero.
     * 
     * The caller must ensure that the sum of the sizes of the arguments + 72 does not
     * exceed the size of the event tracing session's buffer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the
     * [system error codes](/windows/win32/debug/system-error-codes). The following
     * table includes some common errors and their causes.
     * 
     * - **ERROR_INVALID_HANDLE**
     * 
     *   Either the _LoggerHandle_ is **NULL** or specifies the NT Kernel Logger
     *   session handle.
     * 
     * - **ERROR_NOT_ENOUGH_MEMORY**
     * 
     *   The session ran out of free buffers to write to. This can occur during high
     *   event rates because the disk subsystem is overloaded or the number of buffers
     *   is too small. Rather than blocking until more buffers become available,
     *   [TraceMessage](/windows/desktop/ETW/tracemessage) discards the event.
     * 
     *   **Windows 2000 and Windows XP:** Not supported.
     * 
     * - **ERROR_OUTOFMEMORY**
     * 
     *   The event is discarded because, although the buffer pool has not reached its
     *   maximum size, there is insufficient available memory to allocate an additional
     *   buffer and there is no buffer available to receive the event.
     * 
     * - **ERROR_INVALID_PARAMETER**
     * 
     *   _MessageFlags_ contains a value that is not valid.
     * 
     * - **ERROR_MORE_DATA**
     * 
     *   Data from a single event cannot span multiple buffers. A trace event is
     *   limited to the size of the event tracing session's buffer minus the size of
     *   the [EVENT_TRACE_HEADER](/windows/desktop/ETW/event-trace-header) structure.
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-tracemessageva
     * @since windows5.1.2600
     */
    static TraceMessageVa(LoggerHandle, MessageFlags, MessageGuid, MessageNumber, MessageArgList) {
        result := DllCall("ADVAPI32.dll\TraceMessageVa", "uint", LoggerHandle, "uint", MessageFlags, "ptr", MessageGuid, "ushort", MessageNumber, "ptr", MessageArgList, "uint")
        return result
    }

    /**
     * Registers an ETW event provider, creating a handle that can be used to write ETW events.
     * @remarks
     * **EventRegister** creates a handle that you can use to write ETW events via
     * [EventWrite](/windows/desktop/api/evntprov/nf-evntprov-eventwrite),
     * [EventWriteTransfer](/windows/win32/api/evntprov/nf-evntprov-eventwritetransfer),
     * or [EventWriteEx](/windows/win32/api/evntprov/nf-evntprov-eventwriteex).
     * 
     * > [!Note]
     * > Most event providers will not call **EventRegister** directly.
     * > Instead, most event providers are implemented using an ETW framework that
     * > wraps the calls to **EventRegister**, **EventWrite**, and **EventUnregister**.
     * > For example, you might
     * > [write an event manifest](/windows/win32/etw/writing-manifest-based-events)
     * > and then use the
     * > [Message Compiler](/windows/win32/wes/message-compiler--mc-exe-) to generate
     * > C/C++ code for the events, or you might use
     * > [TraceLogging](/windows/win32/tracelogging/trace-logging-portal) to avoid the
     * > need for a manifest.
     * 
     * Registration of an event provider should not be confused with installation of an
     * event provider's manifest.
     * 
     * - The **EventRegister** API performs registration of an event provider to create
     *   a provider handle. This is a process-scope operation (the handle is valid only
     *   within the process). The handle can be used to write ETW events. All events
     *   written using the handle will be tagged with the _ProviderId_ that was
     *   specified during provider registration. It is not necessary to install a
     *   manifest to write events or capture traces (though installing the manifest may
     *   be necessary for decoding the provider's events or for the provider to work
     *   with Event Log).
     * - The [wevtutil.exe](/windows-server/administration/windows-commands/wevtutil)
     *   tool is used to install or uninstall an event provider's manifest.
     *   Installation of an event provider manifest means that information from the
     *   manifest is recorded on the system. The recorded information is system-global
     *   and persists until the manifest is uninstalled. The recorded information
     *   includes the names, GUIDs, channels, and resource DLL paths of the providers
     *   defined in the manifest. The information from the manifest is used by trace
     *   decoding tools and Event Log.
     * 
     * Most components will register their event provider at component initialization
     * and will unregister their event provider at component shutdown. For example, an
     * application (EXE) might register during application startup and unregister
     * during application exit. A dynamic library (DLL) might register in `DllMain`
     * during process attach and might unregister in `DllMain` during process detach.
     * 
     * Since event tracing is a debugging/diagnostic concern and is not normally
     * application-critical functionality, most retail applications should silently
     * ignore failures returned by **EventRegister**. In case of failure,
     * **EventRegister** will set the _RegHandle_ parameter to zero so that subsequent
     * uses of the RegHandle (i.e. in calls to **EventWrite** and **EventUnregister**)
     * will have no effect.
     * 
     * Each process can register up to 1,024 providers. However, you should limit the
     * number of providers that your component registers to one or two. This limit
     * includes providers registered using this function and providers registered using
     * [RegisterTraceGuids](/windows/desktop/ETW/registertraceguids).
     * 
     * **Prior to Windows Vista:** There is no specific limit to the number of
     * providers that a process can register.
     * @param {Pointer<Guid>} ProviderId GUID that uniquely identifies the provider, sometimes called a control GUID.
     * This must be a stable identifier so that trace controllers can use the GUID to
     * subscribe to events from this provider.
     * @param {Pointer<PENABLECALLBACK>} EnableCallback Optional
     * [EnableCallback](/windows/win32/api/evntprov/nc-evntprov-penablecallback) that
     * ETW will invoke when a trace session enables or disables this provider. Use
     * `NULL` if no callback is needed.
     * @param {Pointer<Void>} CallbackContext Optional context data that ETW will provide when invoking _EnableCallback_. Use
     * `NULL` if no callback context is needed.
     * @param {Pointer<Int64>} RegHandle Receives the event provider registration handle. The handle is used in
     * subsequent calls to provider APIs such as **EventWrite**,
     * **EventProviderEnabled**, and **EventRegister**.
     * 
     * Before your provider unloads or exits, free the provider registration handle by
     * calling
     * [EventUnregister](/windows/desktop/api/evntprov/nf-evntprov-eventunregister). A
     * DLL that unloads without freeing all of the provider handles that it registered
     * may cause the process to crash.
     * @returns {Integer} Returns **ERROR_SUCCESS** if successful.
     * 
     * The error code returned by **EventRegister** is primarily intended for use in
     * debugging and diagnostic scenarios. Most production code should continue to run
     * even if an ETW provider failed to register, so release builds should usually
     * ignore the error code returned by **EventRegister**.
     * @see https://learn.microsoft.com/windows/win32/api/evntprov/nf-evntprov-eventregister
     * @since windows6.0.6000
     */
    static EventRegister(ProviderId, EnableCallback, CallbackContext, RegHandle) {
        result := DllCall("ADVAPI32.dll\EventRegister", "ptr", ProviderId, "ptr", EnableCallback, "ptr", CallbackContext, "ptr", RegHandle, "uint")
        return result
    }

    /**
     * Unregisters an ETW event provider.
     * @remarks
     * If **EventRegister** fails, it returns a zero-valued RegHandle. ETW APIs such as
     * **EventWrite** and **EventUnregister** will safely accept a zero-valued
     * RegHandle value, do nothing, and return immediately. Callers do not need to
     * check for a zero-valued RegHandle before calling **EventWrite** or
     * **EventUnregister**.
     * @param {Integer} RegHandle Event provider registration handle returned by
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister).
     * @returns {Integer} Returns **ERROR_SUCCESS** if successful.
     * @see https://learn.microsoft.com/windows/win32/api/evntprov/nf-evntprov-eventunregister
     * @since windows6.0.6000
     */
    static EventUnregister(RegHandle) {
        result := DllCall("ADVAPI32.dll\EventUnregister", "int64", RegHandle, "uint")
        return result
    }

    /**
     * Configures an ETW event provider.
     * @param {Integer} RegHandle Event provider registration handle. This is a handle returned by
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister).
     * @param {Integer} InformationClass [EVENT_INFO_CLASS](/windows/desktop/api/evntprov/ne-evntprov-event_info_class)
     * value that specifies the configuration operation to be performed on the event
     * provider.
     * @param {Pointer<Void>} EventInformation Pointer to a buffer that contains data to be used when configuring the event
     * provider. The format of the data in this buffer depends on the value specified
     * in the _InformationClass_ parameter.
     * 
     * This value may be `NULL` if _InformationLength_ is zero.
     * @param {Integer} InformationLength The size (in bytes) of the data in the _EventInformation_ buffer.
     * @returns {Integer} If the function succeeds, the return value is **ERROR_SUCCESS**.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * - **ERROR_INVALID_PARAMETER**: The parameter is incorrect. For example, this
     *   error is returned if the _RegHandle_ parameter is not a valid provider
     *   registration handle, if _EventInformation_ is **NULL** but _InformationLength_
     *   is nonzero, or if the specified _InformationLength_ is not valid for the given
     *   _InformationClass_.
     * - **ERROR_NOT_SUPPORTED**: The request is not supported. This error is returned
     *   if the _InformationClass_ parameter is not a recognized value.
     * - **Other**: Use
     *   [FormatMessage](/windows/desktop/api/winbase/nf-winbase-formatmessage) to
     *   obtain the message string for the returned error.
     * @see https://learn.microsoft.com/windows/win32/api/evntprov/nf-evntprov-eventsetinformation
     * @since windows8.0
     */
    static EventSetInformation(RegHandle, InformationClass, EventInformation, InformationLength) {
        result := DllCall("ADVAPI32.dll\EventSetInformation", "int64", RegHandle, "int", InformationClass, "ptr", EventInformation, "uint", InformationLength, "uint")
        return result
    }

    /**
     * Determines whether an event provider should generate a particular event based on the event's EVENT_DESCRIPTOR.
     * @remarks
     * This API provides a simple way to determine whether an event is enabled (i.e.
     * whether any event consumer sessions are interested in receiving the event) based
     * on the provider handle and the event descriptor.
     * 
     * > [!Note]
     * > This API performs a conservative quick test. It is possible for this
     * > API to return true in certain cases where subsequent in-depth filtering would
     * > determine that no sessions need to record the event.
     * 
     * This API provides functionality similar to the functionality provided by
     * [EventProviderEnabled](/windows/desktop/api/evntprov/nf-evntprov-eventproviderenabled).
     * When a provider has access to an event's complete
     * [EVENT_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_descriptor),
     * the provider should use **EventEnabled**. When a provider has access only to the
     * event's Level and Keyword, the provider should use **EventProviderEnabled**.
     * 
     * Most event providers will not call **EventEnabled** directly:
     * 
     * - The **EventWrite** APIs include their own **EventEnabled** test and return
     *   immediately if the event is not enabled.
     * - Most ETW providers use an ETW framework (e.g. manifests or TraceLogging)
     *   instead of directly calling **EventWrite** or **EventEnabled**. ETW frameworks
     *   generally provide their own event-enabled API which should be used instead of
     *   calling **EventEnabled**.
     * - ETW framework implementations usually check their own provider state rather
     *   than calling **EventEnabled**.
     * @param {Integer} RegHandle Registration handle of the provider. The handle comes from
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister).
     * 
     * If _RegHandle_ is **NULL**, **EventEnabled** will return **FALSE**.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor [EVENT_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_descriptor)
     * that provides information that will be used to determine whether the event is
     * enabled. This includes the event's Level (severity) and Keyword (categories).
     * @returns {Integer} Returns **FALSE** if the provider should skip generating the event, i.e. returns
     * **FALSE** if ETW can quickly determine that no event collection session would
     * record an event from the given provider with the specified descriptor. Otherwise
     * returns **TRUE**, indicating that the provider should generate the event.
     * @see https://learn.microsoft.com/windows/win32/api/evntprov/nf-evntprov-eventenabled
     * @since windows6.0.6000
     */
    static EventEnabled(RegHandle, EventDescriptor) {
        result := DllCall("ADVAPI32.dll\EventEnabled", "int64", RegHandle, "ptr", EventDescriptor, "char")
        return result
    }

    /**
     * Determines whether an event provider should generate a particular event based on the event's Level and Keyword.
     * @remarks
     * This API provides a simple way to determine whether an event is enabled (i.e.
     * whether any event consumer sessions are interested in receiving the event) based
     * on the provider handle, the event level, and the event keyword.
     * 
     * > [!Note]
     * > This API performs a conservative quick test. It is possible for this
     * > API to return true in certain cases where subsequent in-depth filtering would
     * > determine that no sessions need to record the event.
     * 
     * This API provides functionality similar to the functionality provided by
     * [EventEnabled](/windows/desktop/api/evntprov/nf-evntprov-eventenabled). When a
     * provider has access to an event's complete
     * [EVENT_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_descriptor),
     * the provider should use **EventEnabled**. When a provider has access only to the
     * event's Level and Keyword, the provider should use **EventProviderEnabled**.
     * 
     * Most event providers will not call **EventProviderEnabled** directly:
     * 
     * - The **EventWrite** APIs include their own **EventProviderEnabled** test and
     *   return immediately if the event is not enabled.
     * - Most ETW providers use an ETW framework (e.g. manifests or TraceLogging)
     *   instead of directly calling **EventWrite** or **EventProviderEnabled**. ETW
     *   frameworks generally provide their own event-enabled API which should be used
     *   instead of calling **EventProviderEnabled**.
     * - ETW framework implementations usually check their own provider state rather
     *   than calling **EventProviderEnabled**.
     * 
     * For additional details, see
     * [EventEnabled](/windows/desktop/api/evntprov/nf-evntprov-eventenabled).
     * @param {Integer} RegHandle Registration handle of the provider. The handle comes from
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister).
     * 
     * If _RegHandle_ is **NULL**, **EventProviderEnabled** will return **FALSE**.
     * @param {Integer} Level An 8-bit number used to describe an event's severity or importance. See
     * [EVENT_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_descriptor)
     * for more information about event level values.
     * @param {Integer} Keyword A 64-bit bitmask used to indicate an event's membership in a set of event
     * categories. See
     * [EVENT_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_descriptor)
     * for more information about event keyword values.
     * @returns {Integer} Returns **FALSE** if ETW can quickly determine that no session is listening for a specified event from the given provider. Otherwise returns **TRUE**.
     * @see https://learn.microsoft.com/windows/win32/api/evntprov/nf-evntprov-eventproviderenabled
     * @since windows6.0.6000
     */
    static EventProviderEnabled(RegHandle, Level, Keyword) {
        result := DllCall("ADVAPI32.dll\EventProviderEnabled", "int64", RegHandle, "char", Level, "uint", Keyword, "char")
        return result
    }

    /**
     * Writes an ETW event that uses the current thread's activity ID.
     * @remarks
     * Most event providers will not call **EventWrite** directly. Instead, most event
     * providers are implemented using an ETW framework that wraps the calls to
     * **EventRegister**, **EventWrite**, and **EventUnregister**. For example, you
     * might
     * [write an event manifest](/windows/win32/etw/writing-manifest-based-events) and
     * then use the [Message Compiler](/windows/win32/wes/message-compiler--mc-exe-) to
     * generate C/C++ code for the events, or you might use
     * [TraceLogging](/windows/win32/tracelogging/trace-logging-portal) to avoid the
     * need for a manifest.
     * 
     * **EventWrite** will route the event to the appropriate trace sessions based on
     * the ProviderId (determined from the _RegHandle_), Level, Keyword, and other
     * event characteristics. If no trace sessions are recording this event, this
     * function will do nothing and return **ERROR_SUCCESS**.
     * 
     * To reduce the performance impact of events that are not recorded by any trace
     * session, you can call
     * [EventEnabled](/windows/win32/api/evntprov/nf-evntprov-eventenabled) to
     * determine whether any trace session is recording your event before preparing the
     * data and calling **EventWrite**.
     * 
     * **EventWrite** sets the event's activity ID to the current thread's activity ID.
     * **EventWrite** does not include a related activity ID in the event. To specify a
     * different activity ID or to add a related activity ID, use
     * [EventWriteTransfer](/windows/win32/api/evntprov/nf-evntprov-eventwritetransfer).
     * 
     * **EventWrite** is equivalent to
     * [EventWriteEx](/windows/win32/api/evntprov/nf-evntprov-eventwriteex) with 0 for
     * _Filter_, 0 for _Flags_, **NULL** for _ActivityId_, and **NULL** for
     * _RelatedActivityId_.
     * @param {Integer} RegHandle Registration handle of the provider. The handle comes from
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister). The
     * generated event will use the ProviderId associated with the handle.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor [EVENT_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_descriptor)
     * with event information (metadata) including ID, Version, Level, Keyword,
     * Channel, Opcode, and Task.
     * 
     * > [!Important]
     * > ProviderId, Level and Keyword are the primary means for
     * > filtering events. Other kinds of filtering are possible but have much higher
     * > overhead. Always assign a nonzero level and keyword to every event.
     * @param {Integer} UserDataCount Number of
     * [EVENT_DATA_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_data_descriptor)
     * structures in _UserData_. The maximum number is 128.
     * @param {Pointer<EVENT_DATA_DESCRIPTOR>} UserData An array of _UserDataCount_
     * [EVENT_DATA_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_data_descriptor)
     * structures that describe the data to be included in the event. _UserData_ may be
     * **NULL** if _UserDataCount_ is zero.
     * 
     * Each **EVENT_DATA_DESCRIPTOR** describes one block of memory to be included in
     * the event. The specified blocks will be concatenated in order with no padding or
     * alignment to form the event content. If using manifest-based decoding, the event
     * content must match the layout specified in the template associated with the
     * event in the manifest.
     * @returns {Integer} Returns **ERROR_SUCCESS** if successful or an error code. Possible error codes
     * include the following:
     * 
     * - **ERROR_INVALID_PARAMETER**: One or more of the parameters is not valid.
     * - **ERROR_INVALID_HANDLE**: The registration handle of the provider is not
     *   valid.
     * - **ERROR_ARITHMETIC_OVERFLOW**: The event size is larger than the allowed
     *   maximum (64KB - header).
     * - **ERROR_MORE_DATA**: The session buffer size is too small for the event.
     * - **ERROR_NOT_ENOUGH_MEMORY**: Occurs when filled buffers are trying to flush to
     *   disk, but disk IOs are not happening fast enough. This happens when the disk
     *   is slow and event traffic is heavy. Eventually, there are no more free (empty)
     *   buffers and the event is dropped.
     * - **STATUS_LOG_FILE_FULL**: The real-time playback file is full. Events are not
     *   logged to the session until a real-time consumer consumes the events from the
     *   playback file.
     * 
     * The error code is primarily intended for use in debugging and diagnostic
     * scenarios. Most production code should continue to run and continue to report
     * events even if an ETW event could not be written, so release builds should
     * usually ignore the error code.
     * @see https://learn.microsoft.com/windows/win32/api/evntprov/nf-evntprov-eventwrite
     * @since windows6.0.6000
     */
    static EventWrite(RegHandle, EventDescriptor, UserDataCount, UserData) {
        result := DllCall("ADVAPI32.dll\EventWrite", "int64", RegHandle, "ptr", EventDescriptor, "uint", UserDataCount, "ptr", UserData, "uint")
        return result
    }

    /**
     * Writes an ETW event with an activity ID and an optional related activity ID.
     * @remarks
     * Most event providers will not call **EventWriteTransfer** directly. Instead,
     * most event providers are implemented using an ETW framework that wraps the calls
     * to **EventRegister**, **EventWriteTransfer**, and **EventUnregister**. For
     * example, you might
     * [write an event manifest](/windows/win32/etw/writing-manifest-based-events) and
     * then use the [Message Compiler](/windows/win32/wes/message-compiler--mc-exe-) to
     * generate C/C++ code for the events, or you might use
     * [TraceLogging](/windows/win32/tracelogging/trace-logging-portal) to avoid the
     * need for a manifest.
     * 
     * **EventWriteTransfer** will route the event to the appropriate trace sessions
     * based on the ProviderId (determined from the _RegHandle_), Level, Keyword, and
     * other event characteristics. If no trace sessions are recording this event, this
     * function will do nothing and return **ERROR_SUCCESS**.
     * 
     * To reduce the performance impact of events that are not recorded by any trace
     * session, you can call
     * [EventEnabled](/windows/win32/api/evntprov/nf-evntprov-eventenabled) to
     * determine whether any trace session is recording your event before preparing the
     * data and calling **EventWriteTransfer**.
     * 
     * **EventWriteTransfer** is equivalent to
     * [EventWriteEx](/windows/win32/api/evntprov/nf-evntprov-eventwriteex) with 0 for
     * _Filter_ and 0 for _Flags_.
     * @param {Integer} RegHandle Registration handle of the provider. The handle comes from
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister). The
     * generated event will use the ProviderId associated with the handle.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor [EVENT_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_descriptor)
     * with event information (metadata) including ID, Version, Level, Keyword,
     * Channel, Opcode, and Task.
     * 
     * > [!Important]
     * > ProviderId, Level and Keyword are the primary means for
     * > filtering events. Other kinds of filtering are possible but have much higher
     * > overhead. Always assign a nonzero level and keyword to every event.
     * @param {Pointer<Guid>} ActivityId An optional pointer to a 128-bit activity ID for this event. If this is
     * non-NULL, **EventWriteTransfer** will use the specified value for the event's
     * activity ID. If this is NULL, **EventWriteTransfer** will use the current
     * thread's activity ID.
     * 
     * Trace processing tools can use the event's activity ID to organize events into
     * groups called activities. For additional information about the activity ID, see
     * [EventActivityIdControl](/windows/desktop/api/evntprov/nf-evntprov-eventactivityidcontrol).
     * @param {Pointer<Guid>} RelatedActivityId An optional pointer to a 128-bit activity ID that is the parent of this event's
     * activity. If this is non-NULL, **EventWriteTransfer** will use the specified
     * value for the event's related activity ID. If this is NULL, the event will not
     * have a related activity ID. The related activity ID is usually set on the
     * activity's START event (the first event of the activity, logged with Opcode =
     * START).
     * 
     * Trace processing tools can use the event's related activity ID to determine the
     * relationship between activities, e.g. the related activity is the parent of the
     * newly-started activity. For additional information about the related activity
     * ID, see
     * [EventActivityIdControl](/windows/desktop/api/evntprov/nf-evntprov-eventactivityidcontrol).
     * @param {Integer} UserDataCount Number of
     * [EVENT_DATA_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_data_descriptor)
     * structures in _UserData_. The maximum number is 128.
     * @param {Pointer<EVENT_DATA_DESCRIPTOR>} UserData An array of _UserDataCount_
     * [EVENT_DATA_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_data_descriptor)
     * structures that describe the data to be included in the event. _UserData_ may be
     * **NULL** if _UserDataCount_ is zero.
     * 
     * Each **EVENT_DATA_DESCRIPTOR** describes one block of memory to be included in
     * the event. The specified blocks will be concatenated in order with no padding or
     * alignment to form the event content. If using manifest-based decoding, the event
     * content must match the layout specified in the template associated with the
     * event in the manifest.
     * @returns {Integer} Returns **ERROR_SUCCESS** if successful or an error code. Possible error codes
     * include the following:
     * 
     * - **ERROR_INVALID_PARAMETER**: One or more of the parameters is not valid.
     * - **ERROR_INVALID_HANDLE**: The registration handle of the provider is not
     *   valid.
     * - **ERROR_ARITHMETIC_OVERFLOW**: The event size is larger than the allowed
     *   maximum (64KB - header).
     * - **ERROR_MORE_DATA**: The session buffer size is too small for the event.
     * - **ERROR_NOT_ENOUGH_MEMORY**: Occurs when filled buffers are trying to flush to
     *   disk, but disk IOs are not happening fast enough. This happens when the disk
     *   is slow and event traffic is heavy. Eventually, there are no more free (empty)
     *   buffers and the event is dropped.
     * - **STATUS_LOG_FILE_FULL**: The real-time playback file is full. Events are not
     *   logged to the session until a real-time consumer consumes the events from the
     *   playback file.
     * 
     * The error code is primarily intended for use in debugging and diagnostic
     * scenarios. Most production code should continue to run and continue to report
     * events even if an ETW event could not be written, so release builds should
     * usually ignore the error code.
     * @see https://learn.microsoft.com/windows/win32/api/evntprov/nf-evntprov-eventwritetransfer
     * @since windows6.0.6000
     */
    static EventWriteTransfer(RegHandle, EventDescriptor, ActivityId, RelatedActivityId, UserDataCount, UserData) {
        result := DllCall("ADVAPI32.dll\EventWriteTransfer", "int64", RegHandle, "ptr", EventDescriptor, "ptr", ActivityId, "ptr", RelatedActivityId, "uint", UserDataCount, "ptr", UserData, "uint")
        return result
    }

    /**
     * Writes an ETW event with an activity ID, an optional related activity ID, session filters, and special options.
     * @remarks
     * Most event providers will not call **EventWriteEx** directly. Instead, most
     * event providers are implemented using an ETW framework that wraps the calls to
     * **EventRegister**, **EventWriteEx**, and **EventUnregister**. For example, you
     * might
     * [write an event manifest](/windows/win32/etw/writing-manifest-based-events) and
     * then use the [Message Compiler](/windows/win32/wes/message-compiler--mc-exe-) to
     * generate C/C++ code for the events, or you might use
     * [TraceLogging](/windows/win32/tracelogging/trace-logging-portal) to avoid the
     * need for a manifest.
     * 
     * **EventWriteEx** will route the event to the appropriate trace sessions based on
     * the ProviderId (determined from the _RegHandle_), Level, Keyword, and other
     * event characteristics. If no trace sessions are recording this event, this
     * function will do nothing and return **ERROR_SUCCESS**.
     * 
     * To reduce the performance impact of events that are not recorded by any trace
     * session, you can call
     * [EventEnabled](/windows/win32/api/evntprov/nf-evntprov-eventenabled) to
     * determine whether any trace session is recording your event before preparing the
     * data and calling **EventWriteEx**.
     * 
     * A provider can define filters that a session uses to filter events based on
     * event data. The core filters are based on level and keywords. Event providers
     * can support more-complex filters. The event provider can receive filter
     * information from the _FilterData_ parameter of
     * [EnableCallback](/windows/desktop/api/evntprov/nc-evntprov-penablecallback). The
     * provider can evaluate the filter and use the _Filter_ parameter of
     * **EventWriteEx** to indicate that certain trace sessions did not pass the filter
     * and should therefore not receive the event.
     * @param {Integer} RegHandle Registration handle of the provider. The handle comes from
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister). The
     * generated event will use the ProviderId associated with the handle.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor [EVENT_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_descriptor)
     * with event information (metadata) including ID, Version, Level, Keyword,
     * Channel, Opcode, and Task.
     * 
     * > [!Important]
     * > ProviderId, Level and Keyword are the primary means for
     * > filtering events. Other kinds of filtering are possible but have much higher
     * > overhead. Always assign a nonzero level and keyword to every event.
     * @param {Integer} Filter A 64-bit bitmask value. Each set bit indicates that this event should be
     * excluded from a particular trace session.
     * 
     * The _Filter_ parameter is used with event providers that perform custom event
     * filtering based on the _FilterData_ from
     * [EnableCallback](/windows/desktop/api/evntprov/nc-evntprov-penablecallback).
     * 
     * Set _Filter_ to zero if you do not support custom event filters or if the event
     * should be written to all trace sessions. Otherwise, set _Filter_ to the
     * bitwise-OR of the identifiers of sessions that should NOT receive the event.
     * @param {Integer} Flags Set _Flags_ to zero for normal event handling.
     * 
     * Set _Flags_ to a combination of **EVENT_WRITE_FLAG** values for special event
     * handling.
     * 
     * - **EVENT_WRITE_FLAG_INPRIVATE** (0x2)
     * 
     *   Indicates that this event should be excluded from any logger that has set the
     *   **EVENT_ENABLE_PROPERTY_EXCLUDE_INPRIVATE** option.
     * @param {Pointer<Guid>} ActivityId An optional pointer to a 128-bit activity ID for this event. If this is
     * non-NULL, **EventWriteEx** will use the specified value for the event's activity
     * ID. If this is NULL, **EventWriteEx** will use the current thread's activity ID.
     * 
     * Trace processing tools can use the event's activity ID to organize events into
     * groups called activities. For additional information about the activity ID, see
     * [EventActivityIdControl](/windows/desktop/api/evntprov/nf-evntprov-eventactivityidcontrol).
     * @param {Pointer<Guid>} RelatedActivityId An optional pointer to a 128-bit activity ID that is the parent of this event's
     * activity. If this is non-NULL, **EventWriteEx** will use the specified value for
     * the event's related activity ID. If this is NULL, the event will not have a
     * related activity ID. The related activity ID is usually set on the activity's
     * START event (the first event of the activity, logged with Opcode = START).
     * 
     * Trace processing tools can use the event's related activity ID to determine the
     * relationship between activities, e.g. the related activity is the parent of the
     * newly-started activity. For additional information about the related activity
     * ID, see
     * [EventActivityIdControl](/windows/desktop/api/evntprov/nf-evntprov-eventactivityidcontrol).
     * @param {Integer} UserDataCount Number of
     * [EVENT_DATA_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_data_descriptor)
     * structures in _UserData_. The maximum number is 128.
     * @param {Pointer<EVENT_DATA_DESCRIPTOR>} UserData An array of _UserDataCount_
     * [EVENT_DATA_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_data_descriptor)
     * structures that describe the data to be included in the event. _UserData_ may be
     * **NULL** if _UserDataCount_ is zero.
     * 
     * Each **EVENT_DATA_DESCRIPTOR** describes one block of memory to be included in
     * the event. The specified blocks will be concatenated in order with no padding or
     * alignment to form the event content. If using manifest-based decoding, the event
     * content must match the layout specified in the template associated with the
     * event in the manifest.
     * @returns {Integer} Returns **ERROR_SUCCESS** if successful or an error code. Possible error codes
     * include the following:
     * 
     * - **ERROR_INVALID_PARAMETER**: One or more of the parameters is not valid.
     * - **ERROR_INVALID_HANDLE**: The registration handle of the provider is not
     *   valid.
     * - **ERROR_ARITHMETIC_OVERFLOW**: The event size is larger than the allowed
     *   maximum (64KB - header).
     * - **ERROR_MORE_DATA**: The session buffer size is too small for the event.
     * - **ERROR_NOT_ENOUGH_MEMORY**: Occurs when filled buffers are trying to flush to
     *   disk, but disk IOs are not happening fast enough. This happens when the disk
     *   is slow and event traffic is heavy. Eventually, there are no more free (empty)
     *   buffers and the event is dropped.
     * - **STATUS_LOG_FILE_FULL**: The real-time playback file is full. Events are not
     *   logged to the session until a real-time consumer consumes the events from the
     *   playback file.
     * 
     * The error code is primarily intended for use in debugging and diagnostic
     * scenarios. Most production code should continue to run and continue to report
     * events even if an ETW event could not be written, so release builds should
     * usually ignore the error code.
     * @see https://learn.microsoft.com/windows/win32/api/evntprov/nf-evntprov-eventwriteex
     * @since windows6.1
     */
    static EventWriteEx(RegHandle, EventDescriptor, Filter, Flags, ActivityId, RelatedActivityId, UserDataCount, UserData) {
        result := DllCall("ADVAPI32.dll\EventWriteEx", "int64", RegHandle, "ptr", EventDescriptor, "uint", Filter, "uint", Flags, "ptr", ActivityId, "ptr", RelatedActivityId, "uint", UserDataCount, "ptr", UserData, "uint")
        return result
    }

    /**
     * Writes an ETW event that contains a string as its data. This function should not be used.
     * @remarks
     * This API is not useful and should not be used.
     * 
     * - Most ETW analysis tools do not correctly support string-only events without a
     *   manifest.
     * - Without a manifest, important information about the event (e.g. the provider
     *   name, event id, and event name) are unavailable so the resulting events are
     *   hard to use even when the analysis tool supports string-only events.
     * - With a manifest, this function behaves almost exactly like the code from a
     *   manifest-based event with a single string field. However, the manifest-based
     *   event is better-supported by trace analysis tools. In addition, the code
     *   generated by [MC.exe](/windows/win32/wes/message-compiler--mc-exe-) for an
     *   event with a single string field is more efficient than the
     *   **EventWriteString** function.
     * 
     * Instead of using this API, consider the following alternatives:
     * 
     * - [Use TraceLoggingProvider.h](/windows/win32/api/_tracelogging) to write events
     *   that are well-supported by ETW analysis tools, work without a manifest, and
     *   include metadata like provider name and event name.
     * - [Write an instrumentation manifest](/windows/win32/wes/writing-an-instrumentation-manifest).
     *   Create a simple event with a single NUL-terminated string value. You can write
     *   and collect events even without a manifest. You will only need the manifest
     *   for decoding the collected trace.
     * 
     * **EventWriteString** writes an event with a data payload consisting of the
     * specified string. This API is nearly equivalent to the following code:
     * 
     * ```c
     * EVENT_DESCRIPTOR eventDescriptor;
     * EVENT_DATA_DESCRIPTOR dataDescriptor;
     * EventDescCreate(&eventDescriptor, 0, 0, 0, Level, 0, 0, Keyword);
     * EventDataDescCreate(&dataDescriptor, String, (wcslen(String) + 1) * sizeof(WCHAR));
     * return EventWrite(RegHandle, &eventDescriptor, 1, &dataDescriptor);
     * ```
     * 
     * The resulting event is the same as any other event generated by **EventWrite**
     * except that the resulting event has the **EVENT_HEADER_FLAG_STRING_ONLY** flag
     * set (see [EVENT_HEADER](/windows/win32/api/evntcons/ns-evntcons-event_header)
     * for information about event flags).
     * 
     * Note that the event is written with ID, Version, Opcode, Task, and Channel set
     * to 0.
     * 
     * Note that the event uses the current thread's activity ID.
     * 
     * ETW analysis tools that are aware of the **EVENT_HEADER_FLAG_STRING_ONLY** flag
     * can extract the string value even when the decoder cannot locate any other
     * decoding information for the event provider. However, without a manifest, the
     * tools will not be able to determine the event's provider name.
     * @param {Integer} RegHandle Registration handle of the provider. The handle comes from
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister). The
     * generated event will use the ProviderId associated with the handle.
     * @param {Integer} Level An 8-bit number used to describe an event's severity or importance.
     * 
     * > [!Important]
     * > ProviderId, Level and Keyword are the primary means for
     * > filtering events. Other kinds of filtering are possible but have much higher
     * > overhead. Always assign a nonzero level and keyword to every event.
     * 
     * See [EVENT_DESCRIPTOR](nf-evntprov-eventdatadesccreate.md) for details about the
     * event level.
     * @param {Integer} Keyword A 64-bit bitmask used to indicate an event's membership in a set of event
     * categories.
     * 
     * > [!Important]
     * > ProviderId, Level and Keyword are the primary means for
     * > filtering events. Other kinds of filtering are possible but have much higher
     * > overhead. Always assign a nonzero level and keyword to every event.
     * 
     * See [EVENT_DESCRIPTOR](nf-evntprov-eventdatadesccreate.md) for details about the
     * event keyword.
     * @param {Pointer<PWSTR>} String NUL-terminated string to write as the event data.
     * @returns {Integer} Returns **ERROR_SUCCESS** if successful or an error code. Possible error codes
     * include the following:
     * 
     * - **ERROR_INVALID_PARAMETER**: One or more of the parameters is not valid.
     * - **ERROR_INVALID_HANDLE**: The registration handle of the provider is not
     *   valid.
     * - **ERROR_ARITHMETIC_OVERFLOW**: The event size is larger than the allowed
     *   maximum (64KB - header).
     * - **ERROR_MORE_DATA**: The session buffer size is too small for the event.
     * - **ERROR_NOT_ENOUGH_MEMORY**: Occurs when filled buffers are trying to flush to
     *   disk, but disk IOs are not happening fast enough. This happens when the disk
     *   is slow and event traffic is heavy. Eventually, there are no more free (empty)
     *   buffers and the event is dropped.
     * - **STATUS_LOG_FILE_FULL**: The real-time playback file is full. Events are not
     *   logged to the session until a real-time consumer consumes the events from the
     *   playback file.
     * 
     * The error code is primarily intended for use in debugging and diagnostic
     * scenarios. Most production code should continue to run and continue to report
     * events even if an ETW event could not be written, so release builds should
     * usually ignore the error code.
     * @see https://learn.microsoft.com/windows/win32/api/evntprov/nf-evntprov-eventwritestring
     * @since windows6.0.6000
     */
    static EventWriteString(RegHandle, Level, Keyword, String) {
        result := DllCall("ADVAPI32.dll\EventWriteString", "int64", RegHandle, "char", Level, "uint", Keyword, "ptr", String, "uint")
        return result
    }

    /**
     * Creates, queries, and sets activity identifiers for use in ETW events.
     * @remarks
     * ETW events written using one of the **EventWrite** APIs will contain a 128-bit
     * "activity ID" field and can optionally contain a 128-bit "related activity ID"
     * field. Trace processing tools can use the values of these fields to organize
     * events into groups called activities.
     * 
     * - All events with an activity ID of zero (i.e. **GUID_NULL**) are assumed to not
     *   be a part of any activity.
     * - All events that have a particular non-zero activity ID are assumed to be a
     *   part of the same activity.
     * - To indicate the beginning of the activity, the provider should set Opcode to
     *   **WINEVENT_OPCODE_START** for the first event with a particular non-zero
     *   activity ID (the _start_ event). If the activity is logically nested within
     *   another activity, the provider should set the _start_ event's related activity
     *   ID field to the ID of the parent activity.
     * - To indicate the end of the activity, the provider should set Opcode to
     *   **WINEVENT_OPCODE_STOP** for the last event with a particular non-zero
     *   activity ID (the _stop_ event).
     * 
     * For activity IDs to be useful, newly-generated activity IDs must be
     * locally-unique, i.e. the same ID must not be generated twice within the trace.
     * 
     * You can create activity IDs using **EventActivityIdControl**, which generates
     * locally-unique IDs that are guaranteed to be unique across all processes on the
     * local system until the system reboots. You can also use a GUID (globally-unique
     * identifier) as an activity ID. You can create a GUID using an API such as
     * [UuidCreate](../rpcdce/nf-rpcdce-uuidcreate.md).
     * 
     * User-mode threads have a thread-local 128-bit activity ID value (the thread's
     * activity ID). The thread activity ID is initialized to 0 (i.e. **GUID_NULL**)
     * when the thread is created. The thread activity ID can be read or updated using
     * **EventActivityIdControl**. The thread activity ID will be used as the activity
     * ID for all events written by **EventWrite** and for all events written by
     * **EventWriteTransfer** or **EventWriteEx** where the _ActivityId_ parameter is
     * **NULL**.
     * 
     * > [!Important]
     * > A function that alters a thread's activity ID should be careful
     * > to restore the original activity ID before exiting. Otherwise, the function's
     * > changes to the thread's activity ID will interfere with the activities of
     * > components that call the function.
     * @param {Integer} ControlCode A control code that specifies the operation to perform.
     * 
     * - **EVENT_ACTIVITY_CTRL_GET_ID**
     * 
     *   Sets the _ActivityId_ parameter to the value of the current thread's activity
     *   ID.
     * 
     * - **EVENT_ACTIVITY_CTRL_SET_ID**
     * 
     *   Sets the current thread's activity ID to the value of the _ActivityId_
     *   parameter.
     * 
     * - **EVENT_ACTIVITY_CTRL_CREATE_ID**
     * 
     *   Sets the _ActivityId_ parameter to the value of a newly-generated
     *   locally-unique activity ID.
     * 
     * - **EVENT_ACTIVITY_CTRL_GET_SET_ID**
     * 
     *   Swaps the values of the _ActivityId_ parameter and the current thread's
     *   activity ID. (Saves the value of the current thread's activity ID, then sets
     *   the current thread's activity ID to the value of the _ActivityId_ parameter,
     *   then sets the _ActivityId_ parameter to the saved value.)
     * 
     * - **EVENT_ACTIVITY_CTRL_CREATE_SET_ID**
     * 
     *   Sets the _ActivityId_ parameter to the value of the current thread's activity
     *   ID, then sets the current thread's activity ID to the value of a
     *   newly-generated locally-unique activity ID.
     * @param {Pointer<Guid>} ActivityId A pointer to a buffer that contains a 128-bit activity ID. This buffer may be
     * read-from and/or written-to, depending on the value of the _ControlCode_
     * parameter.
     * @returns {Integer} Returns **ERROR_SUCCESS** if successful.
     * @see https://learn.microsoft.com/windows/win32/api/evntprov/nf-evntprov-eventactivityidcontrol
     * @since windows6.0.6000
     */
    static EventActivityIdControl(ControlCode, ActivityId) {
        result := DllCall("ADVAPI32.dll\EventActivityIdControl", "uint", ControlCode, "ptr", ActivityId, "uint")
        return result
    }

    /**
     * Adds or modifies the permissions of the specified provider or session.
     * @remarks
     * By default, only the administrator of the computer, users in the Performance Log Users group, and services 
     *      running as LocalSystem, LocalService, NetworkService can control trace sessions and provide and consume event 
     *      data. Only users with administrative privileges and services running as LocalSystem can start and control an 
     *      NT Kernel Logger session.
     * 
     * <b>Windows Server 2003:  </b>Only users with administrator privileges can control trace sessions and consume event data; any user can provide event data.
     * 
     * <b>Windows XP and Windows 2000:  </b>Any user can control trace sessions and provide and consume event data.
     * 
     * Users with administrator privileges can control trace sessions if the tool that they use to control the session 
     *      is started from a Command Prompt window that is opened with 
     *      <b>Run as administrator...</b>.
     * 
     * To grant a restricted user the ability to control trace sessions, you can add them to the Performance Log Users 
     *     group or call this function to grant them permission. For example, you can grant user A permission to start and 
     *     stop a trace session and grant user B permission to only query the session.
     * 
     * To restrict who can log events to the session, see the TRACELOG_LOG_EVENT permission.
     * 
     * The ACL on the log file determines who can consume event data from the log file. To consume events from a 
     *     session in real-time, you must grant the user TRACELOG_ACCESS_REALTIME permission or the user must be a member of 
     *     the Performance Log Users group.
     * 
     * You can also specify the provider's GUID to restrict who can register the provider and who can enable the 
     *     provider.
     * @param {Pointer<Guid>} Guid GUID that uniquely identifies the provider or session whose permissions you want to add or modify.
     * @param {Integer} Operation Type of operation to perform, for example, add a DACL to the session's GUID or provider's GUID. For 
     *       possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ne-evntcons-eventsecurityoperation">EVENTSECURITYOPERATION</a> 
     *       enumeration.
     * @param {Pointer<PSID>} Sid The security identifier (SID) of the user  or group to whom you want to grant or deny permissions.
     * @param {Integer} Rights You can specify one or more of the following permissions:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WMIGUID_QUERY"></a><a id="wmiguid_query"></a><dl>
     * <dt><b>WMIGUID_QUERY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the user to query information about the trace session. Set this permission on the session's 
     *         GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACELOG_CREATE_REALTIME"></a><a id="tracelog_create_realtime"></a><dl>
     * <dt><b>TRACELOG_CREATE_REALTIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the user to start or update a real-time session. Set this permission on the session's GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACELOG_CREATE_ONDISK"></a><a id="tracelog_create_ondisk"></a><dl>
     * <dt><b>TRACELOG_CREATE_ONDISK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the user to start or update a session that writes events  to a log file. Set this permission on 
     *         the session's GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACELOG_GUID_ENABLE"></a><a id="tracelog_guid_enable"></a><dl>
     * <dt><b>TRACELOG_GUID_ENABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the user to enable the provider. Set this permission on the provider's GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACELOG_ACCESS_KERNEL_LOGGER"></a><a id="tracelog_access_kernel_logger"></a><dl>
     * <dt><b>TRACELOG_ACCESS_KERNEL_LOGGER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACELOG_LOG_EVENT"></a><a id="tracelog_log_event"></a><dl>
     * <dt><b>TRACELOG_LOG_EVENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the user to log events to a trace session if session is running in  SECURE mode (the session set 
     *         the EVENT_TRACE_SECURE_MODE flag in the LogFileMode member of EVENT_TRACE_PROPERTIES).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACELOG_ACCESS_REALTIME"></a><a id="tracelog_access_realtime"></a><dl>
     * <dt><b>TRACELOG_ACCESS_REALTIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows a user to consume events in real-time. Set this permission on the session's GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACELOG_REGISTER_GUIDS"></a><a id="tracelog_register_guids"></a><dl>
     * <dt><b>TRACELOG_REGISTER_GUIDS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the user to register the provider.  Set this permission on the provider's GUID.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} AllowOrDeny If <b>TRUE</b>, grant the user permissions to the session or provider; otherwise, deny 
     *       permissions. This value is ignored if the value of <i>Operation</i> is EventSecuritySetSACL 
     *       or EventSecurityAddSACL.
     * @returns {Integer} Returns ERROR_SUCCESS if successful.
     * @see https://learn.microsoft.com/windows/win32/api/evntcons/nf-evntcons-eventaccesscontrol
     * @since windows6.0.6000
     */
    static EventAccessControl(Guid, Operation, Sid, Rights, AllowOrDeny) {
        result := DllCall("ADVAPI32.dll\EventAccessControl", "ptr", Guid, "uint", Operation, "ptr", Sid, "uint", Rights, "char", AllowOrDeny, "uint")
        return result
    }

    /**
     * Retrieves the permissions for the specified controller or provider.
     * @remarks
     * If the GUID does not exist in the registry, ETW returns the default permissions for a provider or controller. For details on specifying the GUID in the registry, see <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol">EventAccessControl</a>.
     * 
     * For information on accessing the components of the security descriptor, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/getting-information-from-an-acl">Getting Information from an ACL</a>, the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getsecuritydescriptordacl">GetSecurityDescriptorDacl</a>, <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getsecuritydescriptorsacl">GetSecurityDescriptorSacl</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getace">GetAce</a> functions, and the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace">ACE</a> structure.
     * @param {Pointer<Guid>} Guid GUID that uniquely identifies the provider or session.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} Buffer Application-allocated buffer that will contain the security descriptor of the controller or provider.
     * @param {Pointer<UInt32>} BufferSize Size of the security descriptor buffer, in bytes. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_MORE_DATA and this parameter receives the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
     * @returns {Integer} Returns ERROR_SUCCESS if successful.
     * 
     * The function returns the following return code if an error occurs:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to receive the security descriptor. Reallocate the buffer using the size returned in <i>BufferSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/evntcons/nf-evntcons-eventaccessquery
     * @since windows6.0.6000
     */
    static EventAccessQuery(Guid, Buffer, BufferSize) {
        result := DllCall("ADVAPI32.dll\EventAccessQuery", "ptr", Guid, "ptr", Buffer, "ptr", BufferSize, "uint")
        return result
    }

    /**
     * Removes the permissions defined in the registry for the specified provider or session.
     * @remarks
     * After removing the permission from the registry, the default permissions apply to the provider or session. For 
     *     details on the default permissions, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol">EventAccessControl</a>.
     * @param {Pointer<Guid>} Guid GUID that uniquely identifies the provider or session whose permissions you want to remove from the 
     *       registry.
     * @returns {Integer} Returns ERROR_SUCCESS if successful.
     * @see https://learn.microsoft.com/windows/win32/api/evntcons/nf-evntcons-eventaccessremove
     * @since windows6.0.6000
     */
    static EventAccessRemove(Guid) {
        result := DllCall("ADVAPI32.dll\EventAccessRemove", "ptr", Guid, "uint")
        return result
    }

    /**
     * Creates a single filter for a single payload to be used with the EnableTraceEx2 function.
     * @remarks
     * On Windows 8.1,Windows Server 2012 R2, and later, event payload filters can be used by the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function to filter on the specific content of  event in a logger session. 
     * 
     * The <b>TdhCreatePayloadFilter</b> function is used to create a single payload filter for a single payload to be used with the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function.  The <b>TdhCreatePayloadFilter</b> allocates and fills in an opaque data structure for a single payload filter. When the payload filter is no longer needed, the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhdeletepayloadfilter">TdhDeletePayloadFilter</a> function is used to free memory allocated for a payload filter. 
     * 
     * For a single provider, multiple events can have distinct payload filters.  There can also be multiple filters for the same event, with a payload being passed to the session if any or all of the event's filters pass it.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function takes an array of <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structures in  the <a href="https://docs.microsoft.com/windows/desktop/ETW/enable-trace-parameters">ENABLE_TRACE_PARAMETERS</a> structures passed in the <i>EnableParameters</i> parameter. There can only be one entry in the array for each event filter type. The <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhaggregatepayloadfilters">TdhAggregatePayloadFilters</a> function can be used  to aggregate a list of  payload filters for a single provider created using the <b>TdhCreatePayloadFilter</b> into a single data structure and return an <b>EVENT_FILTER_DESCRIPTOR</b> for use with the <b>EnableTraceEx2</b> function.
     * @param {Pointer<Guid>} ProviderGuid A GUID that identifies the manifest provider of the <i>EventDescriptor</i> parameter.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor A pointer to the event descriptor whose payload will be filtered.
     * @param {Integer} EventMatchANY A Boolean value that indicates how events are handled when multiple conditions are specified.
     * 
     * When this parameter is <b>TRUE</b>, an event will be written to a session if any of
     *         the specified conditions specified in the filter are  <b>TRUE</b>.
     * 
     * When this parameter is <b>FALSE</b>, an event will be written to a session only if all of
     *         the specified conditions specified in the filter are  <b>TRUE</b>.
     * @param {Integer} PayloadPredicateCount The number of conditions specified in the filter.
     *         This value must be less than or equal to the <b>ETW_MAX_PAYLOAD_PREDICATES</b> constant defined in the <i>Tdh.h</i> header file.
     * @param {Pointer<PAYLOAD_FILTER_PREDICATE>} PayloadPredicates A pointer to an array of  <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-payload_filter_predicate">PAYLOAD_FILTER_PREDICATE</a> structures that contain the list conditions that the filter specifies.
     * @param {Pointer<Void>} PayloadFilter On success, this parameter returns a pointer to a single payload filter that is properly sized and built for the specified conditions.
     * 
     * When the caller is finished using the returned payload filter with the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function,  the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhdeletepayloadfilter">TdhDeletePayloadFilter</a> function should be called to free the allocated memory.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The metadata for the provider was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resulting payload filter would not fit within
     *         the <b>MAX_EVENT_FILTER_PAYLOAD_SIZE</b> limit imposed by the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function
     *         on the <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structures in a payload.
     * 
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
     * Unable to allocate memory to create the payload filter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The schema information for supplied provider GUID was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhcreatepayloadfilter
     * @since windows8.1
     */
    static TdhCreatePayloadFilter(ProviderGuid, EventDescriptor, EventMatchANY, PayloadPredicateCount, PayloadPredicates, PayloadFilter) {
        result := DllCall("tdh.dll\TdhCreatePayloadFilter", "ptr", ProviderGuid, "ptr", EventDescriptor, "char", EventMatchANY, "uint", PayloadPredicateCount, "ptr", PayloadPredicates, "ptr", PayloadFilter, "uint")
        return result
    }

    /**
     * Frees the memory allocated for a single payload filter by the TdhCreatePayloadFilter function.
     * @remarks
     * On Windows 8.1,Windows Server 2012 R2, and later, event payload filters can be used by the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function to filter on the specific  content of the event in a logger session. 
     * 
     * The <b>TdhDeletePayloadFilter</b> function is used to free memory allocated for a single payload filter that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhcreatepayloadfilter">TdhCreatePayloadFilter</a> function.
     * @param {Pointer<Void>} PayloadFilter A pointer to a single payload filter allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhcreatepayloadfilter">TdhCreatePayloadFilter</a> function.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhdeletepayloadfilter
     * @since windows8.1
     */
    static TdhDeletePayloadFilter(PayloadFilter) {
        result := DllCall("tdh.dll\TdhDeletePayloadFilter", "ptr", PayloadFilter, "uint")
        return result
    }

    /**
     * Aggregates multiple payload filters for a single provider into a single data structure for use with the EnableTraceEx2 function.
     * @remarks
     * On Windows 8.1,Windows Server 2012 R2, and later, event payload filters can be used by the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function to filter on the specific content of the event in a logger session. 
     * 
     * The <b>TdhAggregatePayloadFilters</b> function aggregates payload filters for a single provider into a single data structure for use with the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function. The <b>TdhAggregatePayloadFilters</b> allocates and fills in an opaque data structure for an aggregated payload filter. When the aggregated payload filter is no longer needed, the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhcleanuppayloadeventfilterdescriptor">TdhCleanupPayloadEventFilterDescriptor</a> function is used to free memory allocated for the aggregated  payload filter in the  <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structure returned.
     * @param {Integer} PayloadFilterCount The count of payload filters.
     * @param {Pointer<Void>} PayloadFilterPtrs An array of event payload single filters, each created by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhcreatepayloadfilter">TdhCreatePayloadFilter</a>  function.
     * @param {Pointer<Byte>} EventMatchALLFlags An array of Boolean values  that correspond to each payload filter passed in the <i>PayloadFilterPtrs</i> parameter and indicates how events are handled when multiple conditions are specified..  This parameter only affects situations where multiple payload filters are being specified for the same event.  
     * 
     * When a Boolean value is <b>TRUE</b>, an event will be written to a session if any of the specified conditions specified in the filter are  <b>TRUE</b>. If this flag is set to <b>TRUE</b> on one or more filters for the same event Id or event version, then the event is only written if all the flagged filters for the event are satisfied.
     * 
     * When a Boolean value is <b>FALSE</b>, an event will be written to a session only if all of the specified conditions specified in the filter are  <b>TRUE</b>. If this flag is set to <b>FALSE</b> on one or more filters for the same event Id or event version, then the event is written if any of the non-flagged filters are satisfied.
     * @param {Pointer<EVENT_FILTER_DESCRIPTOR>} EventFilterDescriptor A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structure to be used with the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function.  The <b>EVENT_FILTER_DESCRIPTOR</b> structure will contain a pointer to the aggregated payload filters, which have been allocated by this function.  
     * 
     * When the caller is finished using this <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structure with the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function,  the  <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhcleanuppayloadeventfilterdescriptor">TdhCleanupPayloadEventFilterDescriptor</a>  function should be called to free the allocated memory.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
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
     * Unable to allocate memory to create the aggregated payload filter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhaggregatepayloadfilters
     * @since windows8.1
     */
    static TdhAggregatePayloadFilters(PayloadFilterCount, PayloadFilterPtrs, EventMatchALLFlags, EventFilterDescriptor) {
        result := DllCall("tdh.dll\TdhAggregatePayloadFilters", "uint", PayloadFilterCount, "ptr", PayloadFilterPtrs, "ptr", EventMatchALLFlags, "ptr", EventFilterDescriptor, "uint")
        return result
    }

    /**
     * Frees the aggregated structure of payload filters created using the TdhAggregatePayloadFilters function.
     * @remarks
     * On Windows 8.1,Windows Server 2012 R2, and later, event payload filters can be used by the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function to filter on specific content of the event in a logger session. 
     * 
     * The <b>TdhCleanupPayloadEventFilterDescriptor</b> function is used to free memory allocated that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhaggregatepayloadfilters">TdhAggregatePayloadFilters</a> function.
     * @param {Pointer<EVENT_FILTER_DESCRIPTOR>} EventFilterDescriptor A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structure that contains aggregated filters where the allocated memory is to be freed. The <b>EVENT_FILTER_DESCRIPTOR</b> structure  passed was created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhaggregatepayloadfilters">TdhAggregatePayloadFilters</a> function.  
     * 
     * If the call is successful, allocated memory is released for the aggregated filters and the fields in the returned <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structure are re-initialized
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhcleanuppayloadeventfilterdescriptor
     * @since windows8.1
     */
    static TdhCleanupPayloadEventFilterDescriptor(EventFilterDescriptor) {
        result := DllCall("tdh.dll\TdhCleanupPayloadEventFilterDescriptor", "ptr", EventFilterDescriptor, "uint")
        return result
    }

    /**
     * Retrieves metadata about an event.
     * @remarks
     * If the event is a WPP or legacy ETW event, you can specify context information that is used to help parse the event information. The event is a WPP event if the EVENT_HEADER_FLAG_TRACE_MESSAGE flag is set in the <b>Flags</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header">EVENT_HEADER</a> (see the <b>EventHeader</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a>). The event is a legacy ETW event if the EVENT_HEADER_FLAG_CLASSIC_HEADER flag is set.
     * @param {Pointer<EVENT_RECORD>} Event The event record passed to your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a> structure.
     * @param {Integer} TdhContextCount Number of elements in <i>pTdhContext</i>.
     * @param {Pointer<TDH_CONTEXT>} TdhContext Array of context values for WPP or classic ETW events only; otherwise, <b>NULL</b>. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-tdh_context">TDH_CONTEXT</a> structure.  The array must not contain duplicate context types.
     * @param {Pointer<TRACE_EVENT_INFO>} Buffer User-allocated buffer to receive the event information. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-trace_event_info">TRACE_EVENT_INFO</a> structure.
     * @param {Pointer<UInt32>} BufferSize Size, in bytes, of the <i>pBuffer</i> buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>pBuffer</i> buffer is too small. Use the required buffer size set in <i>pBufferSize</i> to allocate a new buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The schema for the event was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>resourceFileName</b> attribute in the manifest contains the location of the provider binary. When you register the manifest, the location is written to the registry. TDH was unable to find the binary based on the registered location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_SERVER_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WMI service is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhgeteventinformation
     * @since windows6.0.6000
     */
    static TdhGetEventInformation(Event, TdhContextCount, TdhContext, Buffer, BufferSize) {
        result := DllCall("TDH.dll\TdhGetEventInformation", "ptr", Event, "uint", TdhContextCount, "ptr", TdhContext, "ptr", Buffer, "ptr", BufferSize, "uint")
        return result
    }

    /**
     * Retrieves information about the event map contained in the event.
     * @remarks
     * You cannot use this function to retrieve event map information for WPP events.
     * 
     * For maps defined in a manifest, the string will contain a space at the end of the string. For example, if the value is mapped to "Monday" in the manifest, the string is returned as "Monday ".
     * @param {Pointer<EVENT_RECORD>} pEvent The event record passed to your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a> structure.
     * @param {Pointer<PWSTR>} pMapName Null-terminated Unicode string that contains the name of the map attribute value. The name comes from the <b>MapNameOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structure.
     * @param {Pointer<EVENT_MAP_INFO>} pBuffer User-allocated buffer to receive the event map. The map could be a value map, bitmap, or pattern map. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_map_info">EVENT_MAP_INFO</a> structure.
     * @param {Pointer<UInt32>} pBufferSize Size, in bytes, of the <i>pBuffer</i> buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>pBuffer</i> buffer is too small. Use the required buffer size set in <i>pBufferSize</i> to allocate a new buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The schema for the event was not found or the specified map was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>resourceFileName</b> attribute in the manifest contains the location of the provider binary. When you register the manifest, the location is written to the registry. TDH was unable to find the binary based on the registered location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_SERVER_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WMI service is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhgeteventmapinformation
     * @since windows6.0.6000
     */
    static TdhGetEventMapInformation(pEvent, pMapName, pBuffer, pBufferSize) {
        result := DllCall("TDH.dll\TdhGetEventMapInformation", "ptr", pEvent, "ptr", pMapName, "ptr", pBuffer, "ptr", pBufferSize, "uint")
        return result
    }

    /**
     * Retrieves the size of one or more property values in the event data.
     * @remarks
     * If the event is a WPP or classic ETW event, you can specify context information that is used to help parse the event information. The event is a WPP event if the EVENT_HEADER_FLAG_TRACE_MESSAGE flag is set in the <b>Flags</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header">EVENT_HEADER</a> (see the <b>EventHeader</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a>). The event is a legacy ETW event if the EVENT_HEADER_FLAG_CLASSIC_HEADER flag is set.
     * @param {Pointer<EVENT_RECORD>} pEvent The event record passed to your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a> structure.
     * @param {Integer} TdhContextCount Number of elements in <i>pTdhContext</i>.
     * @param {Pointer<TDH_CONTEXT>} pTdhContext Array of context values for WPP or classic ETW events only, otherwise, <b>NULL</b>. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-tdh_context">TDH_CONTEXT</a> structure.  The array must not contain duplicate context types.
     * @param {Integer} PropertyDataCount Number of data descriptor structures in <i>pPropertyData</i>.
     * @param {Pointer<PROPERTY_DATA_DESCRIPTOR>} pPropertyData Array of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-property_data_descriptor">PROPERTY_DATA_DESCRIPTOR</a> structures that define the property whose size you want to retrieve.
     * 
     * You can pass this same array  to the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgetproperty">TdhGetProperty</a> function to retrieve the property data.
     * 
     * If you are retrieving the size of a property that is not a member of a structure, you can specify a single data descriptor. If you are retrieving the size of a property that is a member of a structure, specify an array of two  data descriptors (structures cannot contain or reference other structures). For more information on specifying this parameter, see the example code below.
     * @param {Pointer<UInt32>} pPropertySize Size of the property, in bytes. Use this value to allocate the buffer passed in the <i>pBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgetproperty">TdhGetProperty</a> function.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The schema for the event was not found or the specified map was not found.
     * 
     * If you used a MOF class to define your event, TDH looks for the schema in the WMI repository. If you used a manifest to define your event, TDH looks in the provider's resources. If you use a manifest, the <b>resourceFileName</b> attribute of the <b>provider</b> element defines the location where TDH expects to find the resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>resourceFileName</b> attribute in the manifest contains the location of the provider binary. When you register the manifest, the location is written to the registry. TDH was unable to find the binary based on the registered location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_SERVER_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WMI service is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhgetpropertysize
     * @since windows6.0.6000
     */
    static TdhGetPropertySize(pEvent, TdhContextCount, pTdhContext, PropertyDataCount, pPropertyData, pPropertySize) {
        result := DllCall("TDH.dll\TdhGetPropertySize", "ptr", pEvent, "uint", TdhContextCount, "ptr", pTdhContext, "uint", PropertyDataCount, "ptr", pPropertyData, "ptr", pPropertySize, "uint")
        return result
    }

    /**
     * Retrieves a property value from the event data.
     * @remarks
     * If the event is a WPP or classic ETW event, you can specify context information that is used to help parse the event information. The event is a WPP event if the EVENT_HEADER_FLAG_TRACE_MESSAGE flag is set in the <b>Flags</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header">EVENT_HEADER</a> (see the <b>EventHeader</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a>). The event is a legacy ETW event if the EVENT_HEADER_FLAG_CLASSIC_HEADER flag is set.
     * 
     * For a list of properties for WPP events and their data types, see <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-property_data_descriptor">PROPERTY_DATA_DESCRIPTOR</a>.
     * @param {Pointer<EVENT_RECORD>} pEvent The event record passed to your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a> structure.
     * @param {Integer} TdhContextCount Number of elements in <i>pTdhContext</i>.
     * @param {Pointer<TDH_CONTEXT>} pTdhContext Array of context values for WPP or classic ETW events only; otherwise, <b>NULL</b>. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-tdh_context">TDH_CONTEXT</a> structure.  The array must not contain duplicate context types.
     * @param {Integer} PropertyDataCount Number of data descriptor structures in <i>pPropertyData</i>.
     * @param {Pointer<PROPERTY_DATA_DESCRIPTOR>} pPropertyData Array of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-property_data_descriptor">PROPERTY_DATA_DESCRIPTOR</a> structures that defines the property to retrieve. 
     * 
     * If you called  the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgetpropertysize">TdhGetPropertySize</a> function to retrieve the required buffer size for the property, you can use the same data descriptors.
     * 
     * If you are retrieving a property that is not a member of a structure, you can specify a single data descriptor. If you are retrieving a property that is a member of a structure, specify an array of two  data descriptors (structures cannot contain or reference other structures).
     * @param {Integer} BufferSize Size of the <i>pBuffer</i> buffer, in bytes. You can get this value from the <i>pPropertySize</i> parameter when calling <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgetpropertysize">TdhGetPropertySize</a> function.
     * @param {Pointer<Byte>} pBuffer User-allocated buffer that receives the property data.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The schema for the event was not found or the specified property was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pBuffer buffer is too small. To get the required buffer size, call <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgetpropertysize">TdhGetPropertySize</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>resourceFileName</b> attribute in the manifest contains the location of the provider binary. When you register the manifest, the location is written to the registry. TDH was unable to find the binary based on the registered location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_SERVER_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The WMI service is not available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhgetproperty
     * @since windows6.0.6000
     */
    static TdhGetProperty(pEvent, TdhContextCount, pTdhContext, PropertyDataCount, pPropertyData, BufferSize, pBuffer) {
        result := DllCall("TDH.dll\TdhGetProperty", "ptr", pEvent, "uint", TdhContextCount, "ptr", pTdhContext, "uint", PropertyDataCount, "ptr", pPropertyData, "uint", BufferSize, "ptr", pBuffer, "uint")
        return result
    }

    /**
     * Retrieves a list of providers that have registered a MOF class or manifest file on the computer.
     * @remarks
     * Call [TdhEnumerateProvidersForDecodingSource function](nf-tdh-tdhenumerateprovidersfordecodingsource.md) to retrieve a list of providers that have registered a MOF class or manifest file on the computer.
     * 
     * Because the number of registered event providers may fluctuate between calls to  this function, you should place this function in a loop that loops until the returned value is no longer ERROR_INSUFFICIENT_BUFFER.
     * @param {Pointer<PROVIDER_ENUMERATION_INFO>} pBuffer Array of providers that publicly define  their events on the computer. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_enumeration_info">PROVIDER_ENUMERATION_INFO</a> structure.
     * @param {Pointer<UInt32>} pBufferSize Size, in bytes, of the *pBuffer* buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * | Return code | Description |
     * | -- | -- |
     * | **ERROR_INSUFFICIENT_BUFFER**   | The size of the *pBuffer* buffer is too small. Use the required buffer size set in *pBufferSize* to allocate a new buffer.   |
     * | **ERROR_INVALID_PARAMETER** | One or more of the parameters is not valid. |
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhenumerateproviders
     * @since windows6.0.6000
     */
    static TdhEnumerateProviders(pBuffer, pBufferSize) {
        result := DllCall("TDH.dll\TdhEnumerateProviders", "ptr", pBuffer, "ptr", pBufferSize, "uint")
        return result
    }

    /**
     * Retrieves a list of providers that have registered a MOF class or manifest file on the computer.
     * @remarks
     * Use [TdhEnumerateProviders](nf-tdh-tdhenumerateproviders.md) to retrieve all providers that have registered on the computer.
     * @param {Integer} filter One or more values from [DECODING_SOURCE enumeration](ne-tdh-decoding_source.md).
     * @param {Pointer<PROVIDER_ENUMERATION_INFO>} buffer Array of providers that publicly define their events on the computer. For details, see the [PROVIDER_ENUMERATION_INFO structure](ns-tdh-provider_enumeration_info.md).
     * @param {Integer} bufferSize Size, in bytes, of the *pBuffer* buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
     * @param {Pointer<UInt32>} bufferRequired The buffer required.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * | Return code | Description |
     * | -- | -- |
     * | **ERROR_INSUFFICIENT_BUFFER**   | The size of the *pBuffer* buffer is too small. Use the required buffer size set in *pBufferSize* to allocate a new buffer.   |
     * | **ERROR_INVALID_PARAMETER** | One or more of the parameters is not valid. |
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhenumerateprovidersfordecodingsource
     */
    static TdhEnumerateProvidersForDecodingSource(filter, buffer, bufferSize, bufferRequired) {
        result := DllCall("tdh.dll\TdhEnumerateProvidersForDecodingSource", "int", filter, "ptr", buffer, "uint", bufferSize, "ptr", bufferRequired, "uint")
        return result
    }

    /**
     * Retrieves information for the specified field from the event descriptions for those field values that match the given value.
     * @remarks
     * This function uses the XML manifest or WMI MOF class to retrieve the information.
     * @param {Pointer<Guid>} pGuid GUID that identifies the provider whose information you want to retrieve.
     * @param {Integer} EventFieldValue Retrieve information about the field if the field's value matches this value. If the field type is a keyword, the information is retrieved for each event keyword bit contained in the mask.
     * @param {Integer} EventFieldType Specify the type of field for which you want to retrieve information. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-event_field_type">EVENT_FIELD_TYPE</a> enumeration.
     * @param {Pointer<PROVIDER_FIELD_INFOARRAY>} pBuffer User-allocated buffer to receive the field information. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_field_infoarray">PROVIDER_FIELD_INFOARRAY</a> structure.
     * @param {Pointer<UInt32>} pBufferSize Size, in bytes, of the <i>pBuffer</i> buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>pBuffer</i> buffer is too small. Use the required buffer size set in <i>pBufferSize</i> to allocate a new buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested field type is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The manifest or MOF class was not found or does not contain information for the requested field type, or a field whose value matches the given value was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>resourceFileName</b> attribute in the manifest contains the location of the provider binary. When you register the manifest, the location is written to the registry. TDH was unable to find the binary based on the registered location.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhqueryproviderfieldinformation
     * @since windows6.0.6000
     */
    static TdhQueryProviderFieldInformation(pGuid, EventFieldValue, EventFieldType, pBuffer, pBufferSize) {
        result := DllCall("TDH.dll\TdhQueryProviderFieldInformation", "ptr", pGuid, "uint", EventFieldValue, "int", EventFieldType, "ptr", pBuffer, "ptr", pBufferSize, "uint")
        return result
    }

    /**
     * Retrieves the specified field metadata for a given provider.
     * @remarks
     * This function uses the XML manifest or WMI MOF class to retrieve the information.
     * @param {Pointer<Guid>} pGuid GUID that identifies the provider whose information you want to retrieve.
     * @param {Integer} EventFieldType Specify the type of field for which you want to retrieve information. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-event_field_type">EVENT_FIELD_TYPE</a> enumeration.
     * @param {Pointer<PROVIDER_FIELD_INFOARRAY>} pBuffer User-allocated buffer to receive the field information. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_field_infoarray">PROVIDER_FIELD_INFOARRAY</a> structure.
     * @param {Pointer<UInt32>} pBufferSize Size, in bytes, of the <i>pBuffer</i> buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>pBuffer</i> buffer is too small. Use the required buffer size set in <i>pBufferSize</i> to allocate a new buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested field type is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The manifest or MOF class was not found or does not contain information for the requested field type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>resourceFileName</b> attribute in the manifest contains the location of the provider binary. When you register the manifest, the location is written to the registry. TDH was unable to find the binary based on the registered location.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhenumerateproviderfieldinformation
     * @since windows6.0.6000
     */
    static TdhEnumerateProviderFieldInformation(pGuid, EventFieldType, pBuffer, pBufferSize) {
        result := DllCall("TDH.dll\TdhEnumerateProviderFieldInformation", "ptr", pGuid, "int", EventFieldType, "ptr", pBuffer, "ptr", pBufferSize, "uint")
        return result
    }

    /**
     * Enumerates the filters that the specified provider defined in the manifest.
     * @remarks
     * This function uses the XML manifest to retrieve the information.
     * @param {Pointer<Guid>} Guid GUID that identifies the provider whose filters you want to retrieve.
     * @param {Integer} TdhContextCount Not used.
     * @param {Pointer<TDH_CONTEXT>} TdhContext Not used.
     * @param {Pointer<UInt32>} FilterCount The number of filter structures that the <i>pBuffer</i> buffer contains. Is zero if the <i>pBuffer</i> buffer is insufficient.
     * @param {Pointer<PROVIDER_FILTER_INFO>} Buffer User-allocated buffer to receive the filter information. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_filter_info">PROVIDER_FILTER_INFO</a> structure.
     * @param {Pointer<UInt32>} BufferSize Size, in bytes, of the <i>pBuffer</i> buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>pBuffer</i> buffer is too small. Use the required buffer size set in <i>pBufferSize</i> to allocate a new buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The schema for the event was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>resourceFileName</b> attribute in the manifest contains the location of the provider binary. When you register the manifest, the location is written to the registry. TDH was unable to find the binary based on the registered location.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhenumerateproviderfilters
     * @since windows6.1
     */
    static TdhEnumerateProviderFilters(Guid, TdhContextCount, TdhContext, FilterCount, Buffer, BufferSize) {
        result := DllCall("tdh.dll\TdhEnumerateProviderFilters", "ptr", Guid, "uint", TdhContextCount, "ptr", TdhContext, "ptr", FilterCount, "ptr", Buffer, "ptr", BufferSize, "uint")
        return result
    }

    /**
     * Loads the manifest used to decode a log file.
     * @remarks
     * To consume events, TDH requires the provider's manifest. Typically, you decode the log file on a computer that contains the provider. Since the provider includes the manifest as a resource, TDH uses the provider to get the manifest. To decode the log file on a computer that does not contain the provider, you must first use the  TraceRpt.exe executable to export the manifest (see the –export switch) from the provider on a computer that does contain the provider. After you have the manifest file, you can decode the log file on a computer that does not contain the provider.
     * 
     * You need to call this function before decoding the first event. For example, you can call this function before calling the <a href="https://docs.microsoft.com/windows/desktop/ETW/opentrace">OpenTrace</a> function. After processing all the events, call the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhunloadmanifest">TdhUnloadManifest</a> function.
     * @param {Pointer<PWSTR>} Manifest The full path to the manifest.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The manifest file was not found at the specified path.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Manifest</i> parameter cannot be <b>NULL</b> and the path cannot exceed MAX_PATH.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_XML_PARSE_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The manifest did not pass validation. To determine the validation errors, run the manifest through the message compiler (mc.exe).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhloadmanifest
     * @since windows6.1
     */
    static TdhLoadManifest(Manifest) {
        result := DllCall("TDH.dll\TdhLoadManifest", "ptr", Manifest, "uint")
        return result
    }

    /**
     * Loads the manifest from memory.
     * @param {Pointer<Void>} pData Type: **const void***
     * 
     * Pointer to the data to be stored.
     * @param {Integer} cbData Type: **ULONG**
     * 
     * Size of the data in the buffer pointed to by *pData*, in bytes.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * | Return code | Description |
     * | -- | -- |
     * | **ERROR_INVALID_PARAMETER** | One or more of the parameters is not valid. |
     * | **ERROR_FILE_NOT_FOUND** | The file pointed to by *pData* was not found. |
     * | **ERROR_NOT_ENOUGH_MEMORY** | Memory allocations failed. |
     * | **ERROR_RESOURCE_NOT_FOUND** | The file does not contain any eventing metadata resources. |
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhloadmanifestfrommemory
     */
    static TdhLoadManifestFromMemory(pData, cbData) {
        result := DllCall("TDH.dll\TdhLoadManifestFromMemory", "ptr", pData, "uint", cbData, "uint")
        return result
    }

    /**
     * Unloads the manifest that was loaded by the TdhLoadManifest function.
     * @remarks
     * You must call this function after processing all the events. For example, you can call this function after calling <a href="https://docs.microsoft.com/windows/desktop/ETW/closetrace">CloseTrace</a>.
     * @param {Pointer<PWSTR>} Manifest The full path to the loaded manifest.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The manifest file was not found at the specified path.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Manifest</i> parameter cannot be <b>NULL</b> and the path cannot exceed MAX_PATH.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_XML_PARSE_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The manifest did not pass validation. To determine the validation errors, run the manifest through the message compiler (mc.exe).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhunloadmanifest
     * @since windows6.1
     */
    static TdhUnloadManifest(Manifest) {
        result := DllCall("TDH.dll\TdhUnloadManifest", "ptr", Manifest, "uint")
        return result
    }

    /**
     * Unloads the manifest from memory.
     * @param {Pointer<Void>} pData Type: **const void***
     * 
     * Pointer to the data to be stored.
     * @param {Integer} cbData Type: **ULONG**
     * 
     * Size of the data in the buffer pointed to by *pData*, in bytes.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * | Return code | Description |
     * | -- | -- |
     * | **ERROR_INVALID_PARAMETER** | One or more of the parameters is not valid. |
     * | **ERROR_FILE_NOT_FOUND** | The file pointed to by *pData* was not found. |
     * | **ERROR_NOT_ENOUGH_MEMORY** | Memory allocations failed. |
     * | **ERROR_RESOURCE_NOT_FOUND** | The file does not contain any eventing metadata resources. |
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhunloadmanifestfrommemory
     */
    static TdhUnloadManifestFromMemory(pData, cbData) {
        result := DllCall("TDH.dll\TdhUnloadManifestFromMemory", "ptr", pData, "uint", cbData, "uint")
        return result
    }

    /**
     * Formats a property value for display.
     * @remarks
     * Typically, you call this function in a loop. Use the [TRACE_EVENT_INFO.TopLevelPropertyCount](ns-tdh-trace_event_info.md) member to control the loop (the [TdhGetEventInformation function](nf-tdh-tdhgeteventinformation.md) returns the [TRACE_EVENT_INFO structure](ns-tdh-trace_event_info.md)). Before entering the loop, you set the *UserData* and *UserDataLength* parameters to the value of the **UserData** and **UserDataLength** members of the [EVENT_RECORD structure](../evntcons/ns-evntcons-event_record.md), respectively. The [EVENT_RECORD structure](../evntcons/ns-evntcons-event_record.md) is passed to your [PEVENT_RECORD_CALLBACK callback function].
     * 
     * Determine whether the property is an array. The property is an array if the [EVENT_PROPERTY_INFO.Flags](ns-tdh-event_property_info.md) member is set to PropertyParamCount or the [EVENT_PROPERTY_INFO.count](ns-tdh-event_property_info.md) member is greater than 1. Call the **TdhFormatProperty** function in a loop based on the number of elements in the array.
     * 
     * After calling the **TdhFormatProperty** function, use the *UserDataConsumed* parameter value to set the new values of the *UserData* and *UserDataLength* parameters (Subtract *UserDataConsumed* from *UserDataLength* and use *UserDataLength* to increment the *UserData* pointer).
     * 
     * If the property is an IP V6 address, you must set the *PropertyLength* parameter to the size of the **IN6_ADDR** structure. The property is considered an IP V6 address if the following conditions are met:
     * 
     * - The **InType** member of the [EVENT_PROPERTY_INFO structure](ns-tdh-event_property_info.md) is TDH_INTYPE_BINARY
     * - The **OutType** member of the [EVENT_PROPERTY_INFO structure](ns-tdh-event_property_info.md) is TDH_OUTTYPE_IPV6
     * - The **Length** member of the [EVENT_PROPERTY_INFO structure](ns-tdh-event_property_info.md) is 0
     * @param {Pointer<TRACE_EVENT_INFO>} EventInfo A [TRACE_EVENT_INFO structure](ns-tdh-trace_event_info.md) that contains the event information. To get this structure, call the [TdhGetEventInformation function](nf-tdh-tdhgeteventinformation.md).
     * @param {Pointer<EVENT_MAP_INFO>} MapInfo An [EVENT_MAP_INFO structure](ns-tdh-event_map_info.md) that maps integer and bit values to strings. To get this structure, call the [TdhGetEventMapInformation function](nf-tdh-tdhgeteventmapinformation.md). To get the name of the map, use the **MapNameOffset** member of the [EVENT_PROPERTY_INFO structure](ns-tdh-event_property_info.md). If you do not provide the map information for a mapped property, the function formats the integer or bit value.
     * @param {Integer} PointerSize The size of a pointer value in the event data. To get the size, access the [EVENT_RECORD.EventHeader.Flags](../evntcons/ns-evntcons-event_header.md) member. The pointer size is 4 bytes if the EVENT_HEADER_FLAG_32_BIT_HEADER flag is set; otherwise, it is 8 bytes if the EVENT_HEADER_FLAG_64_BIT_HEADER flag is set. The [EVENT_RECORD structure (evntcons.h)](../evntcons/ns-evntcons-event_record.md) is passed to your [PEVENT_RECORD_CALLBACK callback function].
     * @param {Integer} PropertyInType The input type of the property. Use the **InType** member of the [EVENT_PROPERTY_INFO structure](ns-tdh-event_property_info.md) to set this parameter.
     * @param {Integer} PropertyOutType The output type of the property. Use the **OutType** member of the [EVENT_PROPERTY_INFO structure](ns-tdh-event_property_info.md) to set this parameter.
     * @param {Integer} PropertyLength The length, in bytes, of the property. Use the **Length** member of the [EVENT_PROPERTY_INFO structure](ns-tdh-event_property_info.md) to set this parameter.
     * @param {Integer} UserDataLength The size, in bytes, of the *UserData* buffer. See Remarks.
     * @param {Pointer<Byte>} UserData The buffer that contains the event data. See Remarks.
     * @param {Pointer<UInt32>} BufferSize The size, in bytes, of the *Buffer* buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
     * @param {Pointer<PWSTR>} Buffer A caller-allocated buffer that contains the formatted property value. To determine the required buffer size, set this parameterto **NULL** and *BufferSize* to zero.
     * @param {Pointer<UInt16>} UserDataConsumed The length, in bytes, of the consumed event data. Use this value to adjust the values of the *UserData* and *UserDataLength* parameters. See Remarks.
     * @returns {Integer} Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * | Return code | Description |
     * | -- | -- |
     * | **ERROR_INSUFFICIENT_BUFFER** | The size of the *pBuffer* buffer is too small. Use the required buffer size set in *pBufferSize* to allocate a new buffer. |
     * | **ERROR_INVALID_PARAMETER** | One or more of the parameters is not valid. |
     * | **ERROR_EVT_INVALID_EVENT_DATA** | The event data does not match the event definition in the manifest. |
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhformatproperty
     * @since windows6.1
     */
    static TdhFormatProperty(EventInfo, MapInfo, PointerSize, PropertyInType, PropertyOutType, PropertyLength, UserDataLength, UserData, BufferSize, Buffer, UserDataConsumed) {
        result := DllCall("TDH.dll\TdhFormatProperty", "ptr", EventInfo, "ptr", MapInfo, "uint", PointerSize, "ushort", PropertyInType, "ushort", PropertyOutType, "ushort", PropertyLength, "ushort", UserDataLength, "ptr", UserData, "ptr", BufferSize, "ptr", Buffer, "ptr", UserDataConsumed, "uint")
        return result
    }

    /**
     * Opens a decoding handle.
     * @remarks
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhclosedecodinghandle">TdhCloseDecodingHandle</a> to free the returned handle.
     * @param {Pointer<IntPtr>} Handle Type: <b>PTDH_HANDLE</b>
     * 
     * A valid decoding handle.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is incorrect. This error is returned if the <i>Handle</i> parameter is <b>NULL</b>.
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
     * Memory allocations failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhopendecodinghandle
     * @since windows8.0
     */
    static TdhOpenDecodingHandle(Handle) {
        result := DllCall("tdh.dll\TdhOpenDecodingHandle", "ptr", Handle, "uint")
        return result
    }

    /**
     * Sets the value of a decoding parameter.
     * @param {Pointer} Handle Type: <b>TDH_HANDLE</b>
     * 
     * A valid decoding handle.
     * @param {Pointer<TDH_CONTEXT>} TdhContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-tdh_context">PTDH_CONTEXT</a></b>
     * 
     * Array of context values. The array must not contain duplicate context types.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is incorrect. This error is returned if the <i>Handle</i> or <i>TdhContext</i>   parameter is <b>NULL</b>. This error is also returned if the <b>ParameterValue</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-tdh_context">TDH_CONTEXT</a> struct pointed to by the <i>TdhContext</i>   parameter does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory allocations failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhsetdecodingparameter
     * @since windows8.0
     */
    static TdhSetDecodingParameter(Handle, TdhContext) {
        result := DllCall("tdh.dll\TdhSetDecodingParameter", "ptr", Handle, "ptr", TdhContext, "uint")
        return result
    }

    /**
     * Retrieves the value of a decoding parameter.
     * @param {Pointer} Handle Type: <b>TDH_HANDLE</b>
     * 
     * A valid decoding handle.
     * @param {Pointer<TDH_CONTEXT>} TdhContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-tdh_context">PTDH_CONTEXT</a></b>
     * 
     * Array of context values. The array must not contain duplicate context types.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is incorrect. This error is returned if the <i>Handle</i> or <i>TdhContext</i>   parameter is <b>NULL</b>. This error is also returned if the <b>ParameterValue</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-tdh_context">TDH_CONTEXT</a> struct pointed to by the <i>TdhContext</i>   parameter does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory allocations failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhgetdecodingparameter
     * @since windows8.0
     */
    static TdhGetDecodingParameter(Handle, TdhContext) {
        result := DllCall("tdh.dll\TdhGetDecodingParameter", "ptr", Handle, "ptr", TdhContext, "uint")
        return result
    }

    /**
     * Retrieves a specific property associated with a WPP message.
     * @remarks
     * To retrieve only the decoded event message without specifying a property name, call <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgetwppmessage">TdhGetWppMessage</a>.
     * @param {Pointer} Handle Type: <b>TDH_HANDLE</b>
     * 
     * A valid decoding handle.
     * @param {Pointer<EVENT_RECORD>} EventRecord Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">PEVENT_RECORD</a></b>
     * 
     * The event record passed to your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback.
     * @param {Pointer<PWSTR>} PropertyName Type: <b>PWSTR</b>
     * 
     * The name of the property to retrieve.
     * 
     * For a list of  possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-property_data_descriptor">PROPERTY_DATA_DESCRIPTOR</a>.
     * @param {Pointer<UInt32>} BufferSize Type: <b>PULONG</b>
     * 
     * Size of the <i>Buffer</i> parameter, in bytes.
     * @param {Pointer<Byte>} Buffer Type: <b>PBYTE</b>
     * 
     * User-allocated buffer that receives the property data.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified property was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>BufferSize</i> is too small. To get the required buffer size, call <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgetwppproperty">TdhGetWppProperty</a> twice, once with a null buffer and a pointer to retrieve the buffer size and then again with the correctly sized buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is incorrect. This error is returned if the <i>Handle</i>, <i>EventRecord</i>, <i>PropertyName</i>, or <i>Buffer</i>    parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhgetwppproperty
     * @since windows8.0
     */
    static TdhGetWppProperty(Handle, EventRecord, PropertyName, BufferSize, Buffer) {
        result := DllCall("tdh.dll\TdhGetWppProperty", "ptr", Handle, "ptr", EventRecord, "ptr", PropertyName, "ptr", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * Retrieves the formatted WPP message embedded into an EVENT_RECORD structure.
     * @remarks
     * To retrieve a specific property instead of the decoded event message without specifying a property name, call <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgetwppproperty">TdhGetWppProperty</a>.
     * @param {Pointer} Handle Type: <b>TDH_HANDLE</b>
     * 
     * A valid decoding handle.
     * @param {Pointer<EVENT_RECORD>} EventRecord Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">PEVENT_RECORD</a></b>
     * 
     * The event record passed to your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback.
     * @param {Pointer<UInt32>} BufferSize Type: <b>PULONG</b>
     * 
     * Size of the <i>Buffer</i> parameter, in bytes.
     * @param {Pointer<Byte>} Buffer Type: <b>PBYTE</b>
     * 
     * User-allocated buffer that receives the property data.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified property was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>BufferSize</i> is too small. To get the required buffer size, call <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgetpropertysize">TdhGetPropertySize</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhgetwppmessage
     * @since windows8.0
     */
    static TdhGetWppMessage(Handle, EventRecord, BufferSize, Buffer) {
        result := DllCall("tdh.dll\TdhGetWppMessage", "ptr", Handle, "ptr", EventRecord, "ptr", BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * Frees any resources associated with the input decoding handle.
     * @param {Pointer} Handle Type: <b>TDH_HANDLE</b>
     * 
     * The decoding handle to be closed.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * This function returns ERROR_SUCCESS on completion.
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhclosedecodinghandle
     * @since windows8.0
     */
    static TdhCloseDecodingHandle(Handle) {
        result := DllCall("tdh.dll\TdhCloseDecodingHandle", "ptr", Handle, "uint")
        return result
    }

    /**
     * Takes a NULL-terminated path to a binary file that contains metadata resources needed to decode a specific event provider.
     * @remarks
     * The GUIDs
     *     and BinaryPath string are cached.
     * 
     * When metadata is 
     *     requested for a given event or provider, but the provider is not installed in the system, the cache
     *     of binaries will be searched.
     * @param {Pointer<PWSTR>} BinaryPath Type: <b>PWSTR</b>
     * 
     * Path to the ETW provider binary that contains the metadata resources.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * Returns ERROR_SUCCESS if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * | Return code | Description |
     * | -- | -- |
     * | **ERROR_INVALID_PARAMETER** | One or more of the parameters is not valid. |
     * | **ERROR_FILE_NOT_FOUND** | The file pointed to by *BinaryPath* was not found. |
     * | **ERROR_NOT_ENOUGH_MEMORY** | Memory allocations failed. |
     * | **ERROR_RESOURCE_NOT_FOUND** | The file does not contain any eventing metadata resources. |
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhloadmanifestfrombinary
     * @since windows8.0
     */
    static TdhLoadManifestFromBinary(BinaryPath) {
        result := DllCall("tdh.dll\TdhLoadManifestFromBinary", "ptr", BinaryPath, "uint")
        return result
    }

    /**
     * Retrieves the list of events present in the provider manifest.
     * @param {Pointer<Guid>} ProviderGuid A GUID that identifies the manifest provider whose list of events you want to retrieve.
     * @param {Pointer<PROVIDER_EVENT_INFO>} Buffer A user-allocated buffer to receive the list of events. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_event_info">PROVIDER_EVENT_INFO</a>  structure.
     * @param {Pointer<UInt32>} BufferSize The size, in bytes, of the buffer pointed to by the <i>ProviderInfo</i> parameter. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns <b>ERROR_INSUFFICIENT_BUFFER</b> and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EMPTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no events defined for the provider GUID in the manifest.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The metadata for the provider was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the <i>ProviderInfo</i> buffer is too small. Use the required buffer size set in the <i>BufferSize</i> parameter to allocate a new buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The schema information for supplied provider GUID was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhenumeratemanifestproviderevents
     * @since windows8.1
     */
    static TdhEnumerateManifestProviderEvents(ProviderGuid, Buffer, BufferSize) {
        result := DllCall("TDH.dll\TdhEnumerateManifestProviderEvents", "ptr", ProviderGuid, "ptr", Buffer, "ptr", BufferSize, "uint")
        return result
    }

    /**
     * Retrieves metadata about an event in a manifest.
     * @param {Pointer<Guid>} ProviderGuid A GUID that identifies the manifest provider whose event metadata you want to retrieve.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor A pointer to the event descriptor that contains information such as event id, version, op-code, and keyword. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_descriptor">EVENT_DESCRIPTOR</a> structure
     * @param {Pointer<TRACE_EVENT_INFO>} Buffer A user-allocated buffer to receive the metadata about an event in  a provider manifest. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-trace_event_info">TRACE_EVENT_INFO</a> structure.
     * @param {Pointer<UInt32>} BufferSize The size, in bytes, of the buffer pointed to by the <i>Buffer</i> parameter. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns <b>ERROR_INSUFFICIENT_BUFFER</b> and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful. Otherwise, this function returns one of the following return codes in addition to others.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EMPTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no events defined for the provider GUID in the manifest.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The metadata for the provider was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the buffer pointed to by the <i>Buffer</i> parameter is too small. Use the required buffer size set in the <i>BufferSize</i> parameter to allocate a new buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The schema information for supplied provider GUID was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhgetmanifesteventinformation
     * @since windows8.1
     */
    static TdhGetManifestEventInformation(ProviderGuid, EventDescriptor, Buffer, BufferSize) {
        result := DllCall("TDH.dll\TdhGetManifestEventInformation", "ptr", ProviderGuid, "ptr", EventDescriptor, "ptr", Buffer, "ptr", BufferSize, "uint")
        return result
    }

    /**
     * A tracing function for publishing events when an attempted security vulnerability exploit is detected in your user-mode application.
     * @remarks
     * The CveEventWrite function publishes a CVE-based event. This function should be called only in scenarios where an attempt to exploit a known, patched vulnerability is detected by the application. Ideally, this function call should be added as part of the fix (update) itself.
     * 
     * The default consumer for this event is EventLog-Application. To enable another consumer, the provider can be added to the consumer session.
     * 
     * Provider GUID: 85a62a0d-7e17-485f-9d4f-749a287193a6
     * 
     * Source Name: Microsoft-Windows-Audit-CVE or Audit-CVE
     * @param {Pointer<PWSTR>} CveId A pointer to the CVE ID associated with the vulnerability for which this event is being raised.
     * @param {Pointer<PWSTR>} AdditionalDetails A pointer to a string giving additional details that the event producer may want to provide to the consumer of this event.
     * @returns {Integer} Returns ERROR_SUCCESS if successful or one of the following values on error.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ARITHMETIC_OVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The event size is larger than the allowed maximum (64k - header).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session buffer size is too small for the event.
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
     * Occurs when filled buffers are trying to flush to disk, but disk IOs are not happening fast enough. This 
     *         happens when the disk is slow and event traffic is heavy. Eventually, there are no more free (empty) buffers 
     *         and the event is dropped.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_LOG_FILE_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The real-time playback file is full. Events are not logged to the session until a real-time consumer 
     *         consumes the events from the playback file. Do not stop logging events based on this error code.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-cveeventwrite
     * @since windows10.0.10240
     */
    static CveEventWrite(CveId, AdditionalDetails) {
        result := DllCall("ADVAPI32.dll\CveEventWrite", "ptr", CveId, "ptr", AdditionalDetails, "int")
        return result
    }

;@endregion Methods
}
