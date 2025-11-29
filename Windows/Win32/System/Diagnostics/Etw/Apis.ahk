#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\PROCESSTRACE_HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class Etw {

;@region Constants

    /**
     * @type {Guid}
     */
    static ALPCGuid => Guid("{45d8cccd-539f-4b72-a8b7-5c683142609a}")

    /**
     * @type {Guid}
     */
    static DiskIoGuid => Guid("{3d6fa8d4-fe05-11d0-9dda-00c04fd7ba7c}")

    /**
     * @type {Guid}
     */
    static EventTraceConfigGuid => Guid("{01853a65-418f-4f36-aefc-dc0f1d2fd235}")

    /**
     * @type {Guid}
     */
    static FileIoGuid => Guid("{90cbdc39-4a3e-11d1-84f4-0000f80464e3}")

    /**
     * @type {Guid}
     */
    static ImageLoadGuid => Guid("{2cb15d1d-5fc1-11d2-abe1-00a0c911f518}")

    /**
     * @type {Guid}
     */
    static PageFaultGuid => Guid("{3d6fa8d3-fe05-11d0-9dda-00c04fd7ba7c}")

    /**
     * @type {Guid}
     */
    static PerfInfoGuid => Guid("{ce1dbfb4-137e-4da6-87b0-3f59aa102cbc}")

    /**
     * @type {Guid}
     */
    static ProcessGuid => Guid("{3d6fa8d0-fe05-11d0-9dda-00c04fd7ba7c}")

    /**
     * @type {Guid}
     */
    static RegistryGuid => Guid("{ae53722e-c863-11d2-8659-00c04fa321a1}")

    /**
     * @type {Guid}
     */
    static SplitIoGuid => Guid("{d837ca92-12b9-44a5-ad6a-3a65b3578aa8}")

    /**
     * @type {Guid}
     */
    static TcpIpGuid => Guid("{9a280ac0-c8e0-11d1-84e2-00c04fb998a2}")

    /**
     * @type {Guid}
     */
    static ThreadGuid => Guid("{3d6fa8d1-fe05-11d0-9dda-00c04fd7ba7c}")

    /**
     * @type {Guid}
     */
    static UdpIpGuid => Guid("{bf3a50c5-a9c9-4988-a005-2df0b7c80f80}")

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
     * @type {Guid}
     */
    static EventTraceGuid => Guid("{68fdd900-4a3e-11d1-84f4-0000f80464e3}")

    /**
     * @type {Guid}
     */
    static SystemTraceControlGuid => Guid("{9e814aad-3204-11d2-9a82-006008a86939}")

    /**
     * @type {Guid}
     */
    static DefaultTraceSecurityGuid => Guid("{0811c1af-7a07-4a06-82ed-869455cdf713}")

    /**
     * @type {Guid}
     */
    static PrivateLoggerNotificationGuid => Guid("{3595ab5c-042a-4c8e-b942-2d059bfeb1b1}")

    /**
     * @type {Guid}
     */
    static SystemIoFilterProviderGuid => Guid("{fbd09363-9e22-4661-b8bf-e7a34b535b8c}")

    /**
     * @type {Guid}
     */
    static SystemObjectProviderGuid => Guid("{febd7460-3d1d-47eb-af49-c9eeb1e146f2}")

    /**
     * @type {Guid}
     */
    static SystemPowerProviderGuid => Guid("{c134884a-32d5-4488-80e5-14ed7abb8269}")

    /**
     * @type {Guid}
     */
    static SystemHypervisorProviderGuid => Guid("{bafa072a-918a-4bed-b622-bc152097098f}")

    /**
     * @type {Guid}
     */
    static SystemLockProviderGuid => Guid("{721ddfd3-dacc-4e1e-b26a-a2cb31d4705a}")

    /**
     * @type {Guid}
     */
    static SystemConfigProviderGuid => Guid("{fef3a8b6-318d-4b67-a96a-3b0f6b8f18fe}")

    /**
     * @type {Guid}
     */
    static SystemCpuProviderGuid => Guid("{c6c5265f-eae8-4650-aae4-9d48603d8510}")

    /**
     * @type {Guid}
     */
    static SystemSchedulerProviderGuid => Guid("{599a2a76-4d91-4910-9ac7-7d33f2e97a6c}")

    /**
     * @type {Guid}
     */
    static SystemProfileProviderGuid => Guid("{bfeb0324-1cee-496f-a409-2ac2b48a6322}")

    /**
     * @type {Guid}
     */
    static SystemIoProviderGuid => Guid("{3d5c43e3-0f1c-4202-b817-174c0070dc79}")

    /**
     * @type {Guid}
     */
    static SystemMemoryProviderGuid => Guid("{82958ca9-b6cd-47f8-a3a8-03ae85a4bc24}")

    /**
     * @type {Guid}
     */
    static SystemRegistryProviderGuid => Guid("{16156bd9-fab4-4cfa-a232-89d1099058e3}")

    /**
     * @type {Guid}
     */
    static SystemProcessProviderGuid => Guid("{151f55dc-467d-471f-83b5-5f889d46ff66}")

    /**
     * @type {Guid}
     */
    static SystemAlpcProviderGuid => Guid("{fcb9baaf-e529-4980-92e9-ced1a6aadfdf}")

    /**
     * @type {Guid}
     */
    static SystemSyscallProviderGuid => Guid("{434286f7-6f1b-45bb-b37e-95f623046c7c}")

    /**
     * @type {Guid}
     */
    static SystemInterruptProviderGuid => Guid("{d4bbee17-b545-4888-858b-744169015b25}")

    /**
     * @type {Guid}
     */
    static SystemTimerProviderGuid => Guid("{4f061568-e215-499f-ab2e-eda0ae890a5b}")

    /**
     * @type {Guid}
     */
    static LastBranchRecordProviderGuid => Guid("{99134383-5248-43fc-834b-529454e75df3}")

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
    static SYSTEM_CPU_KW_DOMAIN_CHANGE => 8

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
    static SYSTEM_IO_KW_FILE_INIT => 1024

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_IO_KW_TIMER => 2048

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
    static SYSTEM_SCHEDULER_KW_SCHEDULE_THREAD => 2048

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_READY_QUEUE => 4096

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_CPU_PARTITION => 8192

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_THREAD_FEEDBACK_READ => 16384

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_WORKLOAD_CLASS_UPDATE => 32768

    /**
     * @type {Integer (UInt64)}
     */
    static SYSTEM_SCHEDULER_KW_AUTOBOOST => 65536

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
    static _typedef_TRACELOGGER_HANDLE => 1

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
     * @type {Integer (UInt32)}
     */
    static TRACE_LBR_EVENT_OPCODE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_LBR_MAXIMUM_EVENTS => 4

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
     * @type {Guid}
     */
    static CLSID_TraceRelogger => Guid("{7b40792d-05ff-44c4-9058-f440c71f17d4}")
;@endregion Constants

;@region Methods
    /**
     * The StartTrace function registers and starts an event tracing session.
     * @param {Pointer<Integer>} TraceId 
     * @param {PWSTR} InstanceName Null-terminated string that contains the name of the event tracing session. The session name is limited to 
     *        1,024 characters, is case-insensitive, and must be unique.
     * 
     * <b>Windows 2000:  </b>Session names are case-sensitive. As a result, duplicate session names are allowed. However, to reduce 
     *         confusion, you should make sure your session names are unique.
     * 
     * This function copies the session name that you provide to the offset that the 
     *        <b>LoggerNameOffset</b> member of <i>Properties</i> points to.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> 
     *        structure that specifies the behavior of the session. The following are key members of the structure to set:
     * 
     * <ul>
     * <li><b>Wnode.BufferSize</b></li>
     * <li><b>Wnode.Guid</b></li>
     * <li><b>Wnode.ClientContext</b></li>
     * <li><b>Wnode.Flags</b></li>
     * <li><b>LogFileMode</b></li>
     * <li><b>LogFileNameOffset</b></li>
     * <li><b>LoggerNameOffset</b></li>
     * </ul>
     * Depending on the type of log file you choose to create, you may also need to specify a value for <b>MaximumFileSize</b>. See the Remarks section for more information on setting the <i>Properties</i> parameter and the behavior of the session.
     * 
     * <b>Starting with Windows 10, version 1703:  </b>For better performance in cross process scenarios, you can now pass filtering in to <b>StartTrace</b> when starting system wide private loggers. You will need to pass in the new <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties-v2">EVENT_TRACE_PROPERTIES_V2</a> structure to include filtering information. See <a href="https://docs.microsoft.com/windows/desktop/ETW/configuring-and-starting-a-private-logger-session">Configuring and Starting a Private Logger Session</a> for more details.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     *       
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li>The <b>Wnode.BufferSize</b> member of  <i>Properties</i> specifies an incorrect size.</li>
     * <li><i>Properties</i> does not have sufficient space allocated to hold a copy of <i>SessionName</i>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li><i>Properties</i> is <b>NULL</b>.</li>
     * <li><i>SessionHandle</i> is <b>NULL</b>.</li>
     * <li>The <b>LogFileNameOffset</b> member of <i>Properties</i> is not valid.</li>
     * <li>The <b>LoggerNameOffset</b> member of <i>Properties</i> is not valid.</li>
     * <li>The <b>LogFileMode</b> member of <i>Properties</i> specifies a combination of flags that is not valid.</li>
     * <li>The <b>Wnode.Guid</b> member is <b>SystemTraceControlGuid</b>, but the <i>SessionName</i> parameter is not <b>KERNEL_LOGGER_NAME</b>.<b>Windows 2000:  </b>This case does not return an error.
     * 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A session with the same name or GUID is already running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PATHNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You can receive this error for one of the following reasons:
     * 
     * <ul>
     * <li>Another session is already using the file name specified by the 
     *           <b>LogFileNameOffset</b> member of the <i>Properties</i> 
     *           structure.</li>
     * <li>Both <b>LogFileMode</b> and <b>LogFileNameOffset</b> are 
     *           zero.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DISK_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough free space on the drive for the log file. This occurs if:
     * 
     * <ul>
     * <li><b>MaximumFileSize</b> is nonzero and there is not <b>MaximumFileSize</b> bytes available for the log file</li>
     * <li>the drive is a system drive and there is not an additional 200 MB available</li>
     * <li><b>MaximumFileSize</b> is zero and there is not an additional 200 MB available</li>
     * </ul>
     *   Choose a drive with more space, or decrease the size specified in <b>MaximumFileSize</b> (if used).
     * 
     * <b>Windows 2000:  </b>Does not require an additional 200 MB available disk space. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the Performance Log Users group, and services running 
     *          as LocalSystem, LocalService, NetworkService can control event tracing sessions. To grant a restricted user 
     *          the ability to control trace sessions, add them to the Performance Log Users group. Only users with 
     *          administrative privileges and services running as LocalSystem can control an NT Kernel Logger session.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can control a trace session.
     * 
     * If the user is a member of the  Performance Log Users group, they may not have permission to create the log 
     *          file in the specified folder.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum number of logging sessions on the system has been reached.  No new loggers can be created until a logging session has been stopped.  This value defaults to 64 on most systems.
     * 
     *   You can change this value by editing the <b>REG_DWORD</b> key at <b>HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI@EtwMaxLoggers</b>. Permissible values are 32 through 256, inclusive.  A reboot is required for any change to take effect.  
     * 
     * Note that Loggers use system resources.  Increasing the number of loggers on the system will come at a performance cost if those slots are filled.  
     * 
     * Prior to Windows 10, version 1709, this is a fixed cap of 64 loggers for non-private loggers.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-starttracew
     * @since windows5.0
     */
    static StartTraceW(TraceId, InstanceName, Properties) {
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        TraceIdMarshal := TraceId is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\StartTraceW", TraceIdMarshal, TraceId, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The StartTrace function registers and starts an event tracing session.
     * @param {Pointer<Integer>} TraceId 
     * @param {PSTR} InstanceName Null-terminated string that contains the name of the event tracing session. The session name is limited to 
     *        1,024 characters, is case-insensitive, and must be unique.
     * 
     * <b>Windows 2000:  </b>Session names are case-sensitive. As a result, duplicate session names are allowed. However, to reduce 
     *         confusion, you should make sure your session names are unique.
     * 
     * This function copies the session name that you provide to the offset that the 
     *        <b>LoggerNameOffset</b> member of <i>Properties</i> points to.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> 
     *        structure that specifies the behavior of the session. The following are key members of the structure to set:
     * 
     * <ul>
     * <li><b>Wnode.BufferSize</b></li>
     * <li><b>Wnode.Guid</b></li>
     * <li><b>Wnode.ClientContext</b></li>
     * <li><b>Wnode.Flags</b></li>
     * <li><b>LogFileMode</b></li>
     * <li><b>LogFileNameOffset</b></li>
     * <li><b>LoggerNameOffset</b></li>
     * </ul>
     * Depending on the type of log file you choose to create, you may also need to specify a value for <b>MaximumFileSize</b>. See the Remarks section for more information on setting the <i>Properties</i> parameter and the behavior of the session.
     * 
     * <b>Starting with Windows 10, version 1703:  </b>For better performance in cross process scenarios, you can now pass filtering in to <b>StartTrace</b> when starting system wide private loggers. You will need to pass in the new <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties-v2">EVENT_TRACE_PROPERTIES_V2</a> structure to include filtering information. See <a href="https://docs.microsoft.com/windows/desktop/ETW/configuring-and-starting-a-private-logger-session">Configuring and Starting a Private Logger Session</a> for more details.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     *       
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li>The <b>Wnode.BufferSize</b> member of  <i>Properties</i> specifies an incorrect size.</li>
     * <li><i>Properties</i> does not have sufficient space allocated to hold a copy of <i>SessionName</i>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li><i>Properties</i> is <b>NULL</b>.</li>
     * <li><i>SessionHandle</i> is <b>NULL</b>.</li>
     * <li>The <b>LogFileNameOffset</b> member of <i>Properties</i> is not valid.</li>
     * <li>The <b>LoggerNameOffset</b> member of <i>Properties</i> is not valid.</li>
     * <li>The <b>LogFileMode</b> member of <i>Properties</i> specifies a combination of flags that is not valid.</li>
     * <li>The <b>Wnode.Guid</b> member is <b>SystemTraceControlGuid</b>, but the <i>SessionName</i> parameter is not <b>KERNEL_LOGGER_NAME</b>.<b>Windows 2000:  </b>This case does not return an error.
     * 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A session with the same name or GUID is already running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PATHNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You can receive this error for one of the following reasons:
     * 
     * <ul>
     * <li>Another session is already using the file name specified by the 
     *           <b>LogFileNameOffset</b> member of the <i>Properties</i> 
     *           structure.</li>
     * <li>Both <b>LogFileMode</b> and <b>LogFileNameOffset</b> are 
     *           zero.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DISK_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough free space on the drive for the log file. This occurs if:
     * 
     * <ul>
     * <li><b>MaximumFileSize</b> is nonzero and there is not <b>MaximumFileSize</b> bytes available for the log file</li>
     * <li>the drive is a system drive and there is not an additional 200 MB available</li>
     * <li><b>MaximumFileSize</b> is zero and there is not an additional 200 MB available</li>
     * </ul>
     *   Choose a drive with more space, or decrease the size specified in <b>MaximumFileSize</b> (if used).
     * 
     * <b>Windows 2000:  </b>Does not require an additional 200 MB available disk space. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the Performance Log Users group, and services running 
     *          as LocalSystem, LocalService, NetworkService can control event tracing sessions. To grant a restricted user 
     *          the ability to control trace sessions, add them to the Performance Log Users group. Only users with 
     *          administrative privileges and services running as LocalSystem can control an NT Kernel Logger session.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can control a trace session.
     * 
     * If the user is a member of the  Performance Log Users group, they may not have permission to create the log 
     *          file in the specified folder.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum number of logging sessions on the system has been reached.  No new loggers can be created until a logging session has been stopped.  This value defaults to 64 on most systems.
     * 
     *   You can change this value by editing the <b>REG_DWORD</b> key at <b>HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI@EtwMaxLoggers</b>. Permissible values are 32 through 256, inclusive.  A reboot is required for any change to take effect.  
     * 
     * Note that Loggers use system resources.  Increasing the number of loggers on the system will come at a performance cost if those slots are filled.  
     * 
     * Prior to Windows 10, version 1709, this is a fixed cap of 64 loggers for non-private loggers.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-starttracea
     * @since windows5.0
     */
    static StartTraceA(TraceId, InstanceName, Properties) {
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        TraceIdMarshal := TraceId is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\StartTraceA", TraceIdMarshal, TraceId, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The StopTrace function stops the specified event tracing session. The ControlTrace function supersedes this function.
     * @param {Integer} TraceId 
     * @param {PWSTR} InstanceName Pointer to a null-terminated string that specifies the name of the event tracing session that you want to 
     *       stop, or <b>NULL</b>. You must specify <i>SessionName</i> if 
     *       <i>SessionHandle</i> is <b>NULL</b>.
     * 
     * To specify the NT Kernel Logger session, set <i>SessionName</i> to 
     *       <b>KERNEL_LOGGER_NAME</b>.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> 
     *       structure that receives the final properties and statistics for the session.
     * 
     * If you are using a newly 
     *       initialized structure, you only need to set the <b>Wnode.BufferSize</b>, 
     *       <b>Wnode.Guid</b>,  <b>LoggerNameOffset</b>, and 
     *       <b>LogFileNameOffset</b> members of the structure. You can use the maximum session name 
     *       (1024 characters) and maximum log file name (1024 characters) lengths to calculate the buffer size and offsets 
     *       if not known. 
     * 
     * <b>Starting with Windows 10, version 1703:  </b>For better performance in cross process scenarios, you can now pass filtering in to <b>StopTrace</b> for  system wide private loggers. You will need to pass in the new <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties-v2">EVENT_TRACE_PROPERTIES_V2</a> structure to include filtering information. See <a href="https://docs.microsoft.com/windows/desktop/ETW/configuring-and-starting-a-private-logger-session">Configuring and Starting a Private Logger Session</a> for more details.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     *       
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li>The <b>Wnode.BufferSize</b> member of <i>Properties</i> specifies an incorrect size.</li>
     * <li><i>Properties</i> does not have sufficient space allocated to hold a copy of the session name and log file name (if used).</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li><i>Properties</i> is <b>NULL</b>.</li>
     * <li><i>SessionName</i> and <i>SessionHandle</i> are both <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the Performance Log Users group, and services running as LocalSystem, LocalService, NetworkService can control event tracing sessions. To grant a restricted user the ability to control trace sessions, add them to the Performance Log Users group.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can control a trace session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-stoptracew
     * @since windows5.0
     */
    static StopTraceW(TraceId, InstanceName, Properties) {
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("ADVAPI32.dll\StopTraceW", "uint", TraceId, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The StopTrace function stops the specified event tracing session. The ControlTrace function supersedes this function.
     * @param {Integer} TraceId 
     * @param {PSTR} InstanceName Pointer to a null-terminated string that specifies the name of the event tracing session that you want to 
     *       stop, or <b>NULL</b>. You must specify <i>SessionName</i> if 
     *       <i>SessionHandle</i> is <b>NULL</b>.
     * 
     * To specify the NT Kernel Logger session, set <i>SessionName</i> to 
     *       <b>KERNEL_LOGGER_NAME</b>.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> 
     *       structure that receives the final properties and statistics for the session.
     * 
     * If you are using a newly 
     *       initialized structure, you only need to set the <b>Wnode.BufferSize</b>, 
     *       <b>Wnode.Guid</b>,  <b>LoggerNameOffset</b>, and 
     *       <b>LogFileNameOffset</b> members of the structure. You can use the maximum session name 
     *       (1024 characters) and maximum log file name (1024 characters) lengths to calculate the buffer size and offsets 
     *       if not known. 
     * 
     * <b>Starting with Windows 10, version 1703:  </b>For better performance in cross process scenarios, you can now pass filtering in to <b>StopTrace</b> for  system wide private loggers. You will need to pass in the new <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties-v2">EVENT_TRACE_PROPERTIES_V2</a> structure to include filtering information. See <a href="https://docs.microsoft.com/windows/desktop/ETW/configuring-and-starting-a-private-logger-session">Configuring and Starting a Private Logger Session</a> for more details.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     *       
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li>The <b>Wnode.BufferSize</b> member of <i>Properties</i> specifies an incorrect size.</li>
     * <li><i>Properties</i> does not have sufficient space allocated to hold a copy of the session name and log file name (if used).</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li><i>Properties</i> is <b>NULL</b>.</li>
     * <li><i>SessionName</i> and <i>SessionHandle</i> are both <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the Performance Log Users group, and services running as LocalSystem, LocalService, NetworkService can control event tracing sessions. To grant a restricted user the ability to control trace sessions, add them to the Performance Log Users group.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can control a trace session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-stoptracea
     * @since windows5.0
     */
    static StopTraceA(TraceId, InstanceName, Properties) {
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("ADVAPI32.dll\StopTraceA", "uint", TraceId, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The QueryTrace function retrieves the property settings and session statistics for the specified event tracing session. The ControlTrace function supersedes this function.
     * @param {Integer} TraceId 
     * @param {PWSTR} InstanceName Pointer to a null-terminated string that specifies the name of the event tracing session whose properties and statistics you want to query, or <b>NULL</b>. You must specify <i>SessionName</i> if <i>SessionHandle</i> is <b>NULL</b>.
     * 
     * To specify the NT Kernel Logger session, set <i>SessionName</i> to <b>KERNEL_LOGGER_NAME</b>.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an 
     * initialized <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. 
     * 
     * 
     * 
     * 
     * You only need to set the <b>Wnode.BufferSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. You can use the maximum session name (1024 characters) and maximum log file name (1024 characters) lengths to calculate the buffer size and offsets if not known. 
     * 
     * On output, the structure members contain the property settings and session statistics for the event tracing session. 
     * 
     * <b>Starting with Windows 10, version 1703:  </b>For better performance in cross process scenarios, you can now pass filtering in to <b>QueryTrace</b> for  system wide private loggers. You will need to pass in the new <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties-v2">EVENT_TRACE_PROPERTIES_V2</a> structure to include filtering information. See <a href="https://docs.microsoft.com/windows/desktop/ETW/configuring-and-starting-a-private-logger-session">Configuring and Starting a Private Logger Session</a> for more details.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li>The <b>Wnode.BufferSize</b> member of <i>Properties</i> specifies an incorrect size.</li>
     * <li><i>Properties</i> does not have sufficient space allocated to hold a copy of the session name and log file name (if used).</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>Properties</i> is <b>NULL</b>.</li>
     * <li><i>SessionName</i> and <i>SessionHandle</i> are both <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users running with elevated administrative privileges, users in the Performance Log Users group, and services running as LocalSystem, LocalService, NetworkService can query event tracing sessions. To grant a restricted user the ability to query trace sessions, add them to the Performance Log Users group or see <a href="/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol">EventAccessControl</a>.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can control a trace session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The given session is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-querytracew
     * @since windows5.0
     */
    static QueryTraceW(TraceId, InstanceName, Properties) {
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("ADVAPI32.dll\QueryTraceW", "uint", TraceId, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The QueryTrace function retrieves the property settings and session statistics for the specified event tracing session. The ControlTrace function supersedes this function.
     * @param {Integer} TraceId 
     * @param {PSTR} InstanceName Pointer to a null-terminated string that specifies the name of the event tracing session whose properties and statistics you want to query, or <b>NULL</b>. You must specify <i>SessionName</i> if <i>SessionHandle</i> is <b>NULL</b>.
     * 
     * To specify the NT Kernel Logger session, set <i>SessionName</i> to <b>KERNEL_LOGGER_NAME</b>.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an 
     * initialized <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. 
     * 
     * 
     * 
     * 
     * You only need to set the <b>Wnode.BufferSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. You can use the maximum session name (1024 characters) and maximum log file name (1024 characters) lengths to calculate the buffer size and offsets if not known. 
     * 
     * On output, the structure members contain the property settings and session statistics for the event tracing session. 
     * 
     * <b>Starting with Windows 10, version 1703:  </b>For better performance in cross process scenarios, you can now pass filtering in to <b>QueryTrace</b> for  system wide private loggers. You will need to pass in the new <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties-v2">EVENT_TRACE_PROPERTIES_V2</a> structure to include filtering information. See <a href="https://docs.microsoft.com/windows/desktop/ETW/configuring-and-starting-a-private-logger-session">Configuring and Starting a Private Logger Session</a> for more details.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li>The <b>Wnode.BufferSize</b> member of <i>Properties</i> specifies an incorrect size.</li>
     * <li><i>Properties</i> does not have sufficient space allocated to hold a copy of the session name and log file name (if used).</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>Properties</i> is <b>NULL</b>.</li>
     * <li><i>SessionName</i> and <i>SessionHandle</i> are both <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users running with elevated administrative privileges, users in the Performance Log Users group, and services running as LocalSystem, LocalService, NetworkService can query event tracing sessions. To grant a restricted user the ability to query trace sessions, add them to the Performance Log Users group or see <a href="/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol">EventAccessControl</a>.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can control a trace session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The given session is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-querytracea
     * @since windows5.0
     */
    static QueryTraceA(TraceId, InstanceName, Properties) {
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("ADVAPI32.dll\QueryTraceA", "uint", TraceId, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The UpdateTrace function updates the property setting of the specified event tracing session. The ControlTrace function supersedes this function.
     * @param {Integer} TraceId 
     * @param {PWSTR} InstanceName Pointer to a null-terminated string that specifies the name of the event tracing session to update, or <b>NULL</b>. You must specify <i>SessionName</i> if <i>SessionHandle</i> is <b>NULL</b>.
     * 
     * To specify the NT Kernel Logger session, set <i>SessionName</i> to <b>KERNEL_LOGGER_NAME</b>.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an 
     * initialized 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. 
     * 
     * On input, the members must specify the new values for the properties to update. For information on which properties you can update, see Remarks.
     * 
     * On output, the structure members contains the updated settings and statistics for the event tracing session.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>BufferSize</b> member of the <b>Wnode</b> member of <i>Properties</i> specifies an incorrect size.
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
     * One of the following is true:
     * 
     * <ul>
     * <li><i>SessionName</i> and <i>SessionHandle</i> are both <b>NULL</b>.</li>
     * <li><i>Properties</i> is <b>NULL</b>.</li>
     * <li>The <b>LogFileNameOffset</b> member of <i>Properties</i> is not valid.</li>
     * <li>The <b>LoggerNameOffset</b> member of <i>Properties</i> is not valid.</li>
     * </ul>
     * <b>Windows Server 2003 and Windows XP:  </b>The <b>Guid</b> member of the <b>Wnode</b> structure is SystemTraceControlGuid, but the <i>SessionName</i> parameter is not KERNEL_LOGGER_NAME.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the Performance Log Users group, and services running as LocalSystem, LocalService, NetworkService can control event tracing sessions. To grant a restricted user the ability to control trace sessions, add them to the Performance Log Users group.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can control a trace session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-updatetracew
     * @since windows5.0
     */
    static UpdateTraceW(TraceId, InstanceName, Properties) {
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("ADVAPI32.dll\UpdateTraceW", "uint", TraceId, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The UpdateTrace function updates the property setting of the specified event tracing session. The ControlTrace function supersedes this function.
     * @param {Integer} TraceId 
     * @param {PSTR} InstanceName Pointer to a null-terminated string that specifies the name of the event tracing session to update, or <b>NULL</b>. You must specify <i>SessionName</i> if <i>SessionHandle</i> is <b>NULL</b>.
     * 
     * To specify the NT Kernel Logger session, set <i>SessionName</i> to <b>KERNEL_LOGGER_NAME</b>.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an 
     * initialized 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. 
     * 
     * On input, the members must specify the new values for the properties to update. For information on which properties you can update, see Remarks.
     * 
     * On output, the structure members contains the updated settings and statistics for the event tracing session.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>BufferSize</b> member of the <b>Wnode</b> member of <i>Properties</i> specifies an incorrect size.
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
     * One of the following is true:
     * 
     * <ul>
     * <li><i>SessionName</i> and <i>SessionHandle</i> are both <b>NULL</b>.</li>
     * <li><i>Properties</i> is <b>NULL</b>.</li>
     * <li>The <b>LogFileNameOffset</b> member of <i>Properties</i> is not valid.</li>
     * <li>The <b>LoggerNameOffset</b> member of <i>Properties</i> is not valid.</li>
     * </ul>
     * <b>Windows Server 2003 and Windows XP:  </b>The <b>Guid</b> member of the <b>Wnode</b> structure is SystemTraceControlGuid, but the <i>SessionName</i> parameter is not KERNEL_LOGGER_NAME.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the Performance Log Users group, and services running as LocalSystem, LocalService, NetworkService can control event tracing sessions. To grant a restricted user the ability to control trace sessions, add them to the Performance Log Users group.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can control a trace session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-updatetracea
     * @since windows5.0
     */
    static UpdateTraceA(TraceId, InstanceName, Properties) {
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("ADVAPI32.dll\UpdateTraceA", "uint", TraceId, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The FlushTrace function causes an event tracing session to immediately deliver buffered events for the specified session.
     * @param {Integer} TraceId 
     * @param {PWSTR} InstanceName Pointer to a null-terminated string that specifies the name of the event tracing session whose buffers you want to flush, or <b>NULL</b>. You must specify <i>SessionName</i> if <i>SessionHandle</i> is <b>NULL</b>.
     * 
     * To specify the NT Kernel Logger session, set <i>SessionName</i> to <b>KERNEL_LOGGER_NAME</b>.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an 
     * initialized <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. 
     * 
     * 
     * 
     * 
     * If you are using a newly initialized structure, you only need to set the <b>Wnode.BufferSize</b>, <b>Wnode.Guid</b>,  <b>LoggerNameOffset</b>, and <b>LogFileNameOffset</b> members of the structure. You can use the maximum session name (1024 characters) and maximum log file name (1024 characters) lengths to calculate the buffer size and offsets if not known. 
     * 
     * On output, the structure receives the property settings and session statistics of the event tracing session, which  reflect the state of the session after the flush.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
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
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>Properties</i> is <b>NULL</b>.</li>
     * <li><i>SessionName</i> and <i>SessionHandle</i> are both <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li>The <b>Wnode.BufferSize</b> member of <i>Properties</i> specifies an incorrect size.</li>
     * <li><i>Properties</i> does not have sufficient space allocated to hold a copy of the session name and log file name (if used).</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the Performance Log Users group, and services running as LocalSystem, LocalService, NetworkService can control event tracing sessions. To grant a restricted user the ability to control trace sessions, add them to the Performance Log Users group.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can control a trace session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-flushtracew
     * @since windows5.1.2600
     */
    static FlushTraceW(TraceId, InstanceName, Properties) {
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("ADVAPI32.dll\FlushTraceW", "uint", TraceId, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The FlushTrace function causes an event tracing session to immediately deliver buffered events for the specified session.
     * @param {Integer} TraceId 
     * @param {PSTR} InstanceName Pointer to a null-terminated string that specifies the name of the event tracing session whose buffers you want to flush, or <b>NULL</b>. You must specify <i>SessionName</i> if <i>SessionHandle</i> is <b>NULL</b>.
     * 
     * To specify the NT Kernel Logger session, set <i>SessionName</i> to <b>KERNEL_LOGGER_NAME</b>.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an 
     * initialized <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. 
     * 
     * 
     * 
     * 
     * If you are using a newly initialized structure, you only need to set the <b>Wnode.BufferSize</b>, <b>Wnode.Guid</b>,  <b>LoggerNameOffset</b>, and <b>LogFileNameOffset</b> members of the structure. You can use the maximum session name (1024 characters) and maximum log file name (1024 characters) lengths to calculate the buffer size and offsets if not known. 
     * 
     * On output, the structure receives the property settings and session statistics of the event tracing session, which  reflect the state of the session after the flush.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
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
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>Properties</i> is <b>NULL</b>.</li>
     * <li><i>SessionName</i> and <i>SessionHandle</i> are both <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li>The <b>Wnode.BufferSize</b> member of <i>Properties</i> specifies an incorrect size.</li>
     * <li><i>Properties</i> does not have sufficient space allocated to hold a copy of the session name and log file name (if used).</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the Performance Log Users group, and services running as LocalSystem, LocalService, NetworkService can control event tracing sessions. To grant a restricted user the ability to control trace sessions, add them to the Performance Log Users group.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can control a trace session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-flushtracea
     * @since windows5.1.2600
     */
    static FlushTraceA(TraceId, InstanceName, Properties) {
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("ADVAPI32.dll\FlushTraceA", "uint", TraceId, "ptr", InstanceName, "ptr", Properties, "uint")
        return result
    }

    /**
     * The ControlTrace function flushes, queries, updates, or stops the specified event tracing session.
     * @param {Integer} TraceId 
     * @param {PWSTR} InstanceName Name of an event tracing session, or <b>NULL</b>. You must specify 
     *       <i>SessionName</i> if <i>SessionHandle</i> is 
     *       <b>NULL</b>. 
     * 
     * To specify the NT Kernel Logger session, set <i>SessionName</i> to 
     *       <b>KERNEL_LOGGER_NAME</b>.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an initialized 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. This structure 
     *        should be zeroed out before it is used.
     * 
     * If <i>ControlCode</i> specifies <b>EVENT_TRACE_CONTROL_STOP</b>, 
     *        <b>EVENT_TRACE_CONTROL_QUERY</b> or <b>EVENT_TRACE_CONTROL_FLUSH</b>, 
     *        you only need to set the <b>Wnode.BufferSize</b>, <b>Wnode.Guid</b>, 
     *        <b>LoggerNameOffset</b>, and <b>LogFileNameOffset</b> members of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. If the 
     *        session is a private session, you also need to set <b>LogFileMode</b>. You can use the 
     *        maximum session name (1024 characters) and maximum log file name (1024 characters) lengths to calculate the 
     *        buffer size and offsets if not known. 
     * 
     * If <i>ControlCode</i> specifies 
     *        <b>EVENT_TRACE_CONTROL_UPDATE</b>, on input, the members must specify the new values for the 
     *        properties to update. On output, <i>Properties</i> contains the properties and statistics 
     *        for the event tracing session. You can update the following properties.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Use</th>
     * </tr>
     * <tr>
     * <td><b>EnableFlags</b></td>
     * <td>Set this member to 0 to disable all kernel providers. Otherwise, you must specify the kernel providers that you want to enable or keep enabled. Applies only to NT Kernel Logger sessions.</td>
     * </tr>
     * <tr>
     * <td><b>FlushTimer</b></td>
     * <td>Set this member if you want to change the time to wait before flushing buffers. If this member is 0, the member is not updated.</td>
     * </tr>
     * <tr>
     * <td><b>LogFileNameOffset</b></td>
     * <td>Set this member if you want to switch to another log file. If this member is 0, the file name is not updated. If the offset is not zero and you do not change the log file name, the function returns an error.</td>
     * </tr>
     * <tr>
     * <td><b>LogFileMode</b></td>
     * <td>Set this member if you want to turn <b>EVENT_TRACE_REAL_TIME_MODE</b> on and off. To turn real time consuming off, set this member to 0. To turn real time consuming on, set this member to <b>EVENT_TRACE_REAL_TIME_MODE</b> and it will be OR'd with the current modes.</td>
     * </tr>
     * <tr>
     * <td><b>MaximumBuffers</b></td>
     * <td>Set this member if you want to change the maximum number of buffers that ETW uses. If this member is 0, the member is not updated.</td>
     * </tr>
     * </table>
     *  
     * 
     * For private logger sessions, you can update only the <b>LogFileNameOffset</b> and 
     *        <b>FlushTimer</b> members.
     * 
     * If you are using a newly initialized 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure, the only 
     *        members you need to specify, other than the members you are updating, are 
     *        <b>Wnode.BufferSize</b>, <b>Wnode.Guid</b>, and 
     *        <b>Wnode.Flags</b>.
     * 
     * If you use the property structure you passed to 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/starttrace">StartTrace</a>, make sure the 
     *        <b>LogFileNameOffset</b> member is 0 unless you are changing the log file name.
     * 
     * If you call the <b>ControlTrace</b> function to query the 
     *        current session properties and then update those properties to update the session, make sure you set 
     *        <b>LogFileNameOffset</b> to 0 (unless you are changing the log file name) and set 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES.Wnode.Flags</a> to 
     *        <b>WNODE_FLAG_TRACED_GUID</b>.
     * 
     * <b>Starting with Windows 10, version 1703:  </b>For better performance in cross process scenarios, you can now pass filtering in to <b>ControlTrace</b> for  system wide private loggers. You will need to pass in the new <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties-v2">EVENT_TRACE_PROPERTIES_V2</a> structure to include filtering information. See <a href="https://docs.microsoft.com/windows/desktop/ETW/configuring-and-starting-a-private-logger-session">Configuring and Starting a Private Logger Session</a> for more details.
     * @param {Integer} ControlCode 
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     *       
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li>The <b>Wnode.BufferSize</b> member of <i>Properties</i> 
     *           specifies an incorrect size.</li>
     * <li><i>Properties</i> does not have sufficient space allocated to hold a copy of the session name and log file name (if used).</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li><i>Properties</i> is <b>NULL</b>.</li>
     * <li><i>SessionName</i> and <i>SessionHandle</i> are both <b>NULL</b>.</li>
     * <li>The <b>LogFileNameOffset</b> member of <i>Properties</i> is not valid.</li>
     * <li>The <b>LoggerNameOffset</b> member of <i>Properties</i> is not valid.</li>
     * <li>The <b>LogFileMode</b> member of <i>Properties</i> specifies a combination of flags that is not valid.</li>
     * <li>The <b>Wnode.Guid</b> member of <i>Properties</i> is <b>SystemTraceControlGuid</b>, but the <i>SessionName</i> parameter is not KERNEL_LOGGER_NAME.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PATHNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another session is already using the file name specified by the 
     *         <b>LogFileNameOffset</b> member of the <i>Properties</i> structure.
     *        
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
     * The buffer for <a href="/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> is 
     *         too small to hold all the information for the session. If you do not need the session's property information, 
     *         you can ignore this error. If you receive this error when stopping the session, ETW will have already stopped 
     *         the session before generating this error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users running with elevated administrative privileges, users in the Performance Log Users group, and 
     *          services running as LocalSystem, LocalService, NetworkService can control event tracing sessions. To grant a 
     *          restricted user the ability to control trace sessions, add them to the Performance Log Users group. Only 
     *          users with administrative privileges and services running as LocalSystem can control an NT Kernel Logger 
     *          session.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can control a trace session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The given session is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-controltracew
     * @since windows5.0
     */
    static ControlTraceW(TraceId, InstanceName, Properties, ControlCode) {
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("ADVAPI32.dll\ControlTraceW", "uint", TraceId, "ptr", InstanceName, "ptr", Properties, "uint", ControlCode, "uint")
        return result
    }

    /**
     * The ControlTrace function flushes, queries, updates, or stops the specified event tracing session.
     * @param {Integer} TraceId 
     * @param {PSTR} InstanceName Name of an event tracing session, or <b>NULL</b>. You must specify 
     *       <i>SessionName</i> if <i>SessionHandle</i> is 
     *       <b>NULL</b>. 
     * 
     * To specify the NT Kernel Logger session, set <i>SessionName</i> to 
     *       <b>KERNEL_LOGGER_NAME</b>.
     * @param {Pointer<EVENT_TRACE_PROPERTIES>} Properties Pointer to an initialized 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. This structure 
     *        should be zeroed out before it is used.
     * 
     * If <i>ControlCode</i> specifies <b>EVENT_TRACE_CONTROL_STOP</b>, 
     *        <b>EVENT_TRACE_CONTROL_QUERY</b> or <b>EVENT_TRACE_CONTROL_FLUSH</b>, 
     *        you only need to set the <b>Wnode.BufferSize</b>, <b>Wnode.Guid</b>, 
     *        <b>LoggerNameOffset</b>, and <b>LogFileNameOffset</b> members of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. If the 
     *        session is a private session, you also need to set <b>LogFileMode</b>. You can use the 
     *        maximum session name (1024 characters) and maximum log file name (1024 characters) lengths to calculate the 
     *        buffer size and offsets if not known. 
     * 
     * If <i>ControlCode</i> specifies 
     *        <b>EVENT_TRACE_CONTROL_UPDATE</b>, on input, the members must specify the new values for the 
     *        properties to update. On output, <i>Properties</i> contains the properties and statistics 
     *        for the event tracing session. You can update the following properties.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Use</th>
     * </tr>
     * <tr>
     * <td><b>EnableFlags</b></td>
     * <td>Set this member to 0 to disable all kernel providers. Otherwise, you must specify the kernel providers that you want to enable or keep enabled. Applies only to NT Kernel Logger sessions.</td>
     * </tr>
     * <tr>
     * <td><b>FlushTimer</b></td>
     * <td>Set this member if you want to change the time to wait before flushing buffers. If this member is 0, the member is not updated.</td>
     * </tr>
     * <tr>
     * <td><b>LogFileNameOffset</b></td>
     * <td>Set this member if you want to switch to another log file. If this member is 0, the file name is not updated. If the offset is not zero and you do not change the log file name, the function returns an error.</td>
     * </tr>
     * <tr>
     * <td><b>LogFileMode</b></td>
     * <td>Set this member if you want to turn <b>EVENT_TRACE_REAL_TIME_MODE</b> on and off. To turn real time consuming off, set this member to 0. To turn real time consuming on, set this member to <b>EVENT_TRACE_REAL_TIME_MODE</b> and it will be OR'd with the current modes.</td>
     * </tr>
     * <tr>
     * <td><b>MaximumBuffers</b></td>
     * <td>Set this member if you want to change the maximum number of buffers that ETW uses. If this member is 0, the member is not updated.</td>
     * </tr>
     * </table>
     *  
     * 
     * For private logger sessions, you can update only the <b>LogFileNameOffset</b> and 
     *        <b>FlushTimer</b> members.
     * 
     * If you are using a newly initialized 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure, the only 
     *        members you need to specify, other than the members you are updating, are 
     *        <b>Wnode.BufferSize</b>, <b>Wnode.Guid</b>, and 
     *        <b>Wnode.Flags</b>.
     * 
     * If you use the property structure you passed to 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/starttrace">StartTrace</a>, make sure the 
     *        <b>LogFileNameOffset</b> member is 0 unless you are changing the log file name.
     * 
     * If you call the <b>ControlTrace</b> function to query the 
     *        current session properties and then update those properties to update the session, make sure you set 
     *        <b>LogFileNameOffset</b> to 0 (unless you are changing the log file name) and set 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES.Wnode.Flags</a> to 
     *        <b>WNODE_FLAG_TRACED_GUID</b>.
     * 
     * <b>Starting with Windows 10, version 1703:  </b>For better performance in cross process scenarios, you can now pass filtering in to <b>ControlTrace</b> for  system wide private loggers. You will need to pass in the new <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties-v2">EVENT_TRACE_PROPERTIES_V2</a> structure to include filtering information. See <a href="https://docs.microsoft.com/windows/desktop/ETW/configuring-and-starting-a-private-logger-session">Configuring and Starting a Private Logger Session</a> for more details.
     * @param {Integer} ControlCode 
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     *       
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li>The <b>Wnode.BufferSize</b> member of <i>Properties</i> 
     *           specifies an incorrect size.</li>
     * <li><i>Properties</i> does not have sufficient space allocated to hold a copy of the session name and log file name (if used).</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li><i>Properties</i> is <b>NULL</b>.</li>
     * <li><i>SessionName</i> and <i>SessionHandle</i> are both <b>NULL</b>.</li>
     * <li>The <b>LogFileNameOffset</b> member of <i>Properties</i> is not valid.</li>
     * <li>The <b>LoggerNameOffset</b> member of <i>Properties</i> is not valid.</li>
     * <li>The <b>LogFileMode</b> member of <i>Properties</i> specifies a combination of flags that is not valid.</li>
     * <li>The <b>Wnode.Guid</b> member of <i>Properties</i> is <b>SystemTraceControlGuid</b>, but the <i>SessionName</i> parameter is not KERNEL_LOGGER_NAME.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PATHNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another session is already using the file name specified by the 
     *         <b>LogFileNameOffset</b> member of the <i>Properties</i> structure.
     *        
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
     * The buffer for <a href="/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> is 
     *         too small to hold all the information for the session. If you do not need the session's property information, 
     *         you can ignore this error. If you receive this error when stopping the session, ETW will have already stopped 
     *         the session before generating this error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users running with elevated administrative privileges, users in the Performance Log Users group, and 
     *          services running as LocalSystem, LocalService, NetworkService can control event tracing sessions. To grant a 
     *          restricted user the ability to control trace sessions, add them to the Performance Log Users group. Only 
     *          users with administrative privileges and services running as LocalSystem can control an NT Kernel Logger 
     *          session.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can control a trace session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The given session is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-controltracea
     * @since windows5.0
     */
    static ControlTraceA(TraceId, InstanceName, Properties, ControlCode) {
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("ADVAPI32.dll\ControlTraceA", "uint", TraceId, "ptr", InstanceName, "ptr", Properties, "uint", ControlCode, "uint")
        return result
    }

    /**
     * The QueryAllTraces function retrieves the properties and statistics for all event tracing sessions started on the computer for which the caller has permissions to query.
     * @param {Pointer<Pointer<EVENT_TRACE_PROPERTIES>>} PropertyArray An array of pointers to 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structures that receive 
     *        session properties and statistics for the event tracing sessions.
     * 
     * You only need to set the <b>Wnode.BufferSize</b>, 
     *        <b>LoggerNameOffset</b> , and <b>LogFileNameOffset</b>  members of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. The other 
     *        members should all be set to zero.
     * @param {Integer} PropertyArrayCount Number of structures in the <i>PropertyArray</i> array. This value must be less than or 
     *       equal to 64, the maximum number of event tracing sessions that ETW supports.
     * @param {Pointer<Integer>} LoggerCount Actual number of event tracing sessions started on the computer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
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
     * One of the following is true:
     * 
     * <ul>
     * <li><i>PropertyArrayCount</i> is zero or greater than the maximum number of supported sessions</li>
     * <li><i>PropertyArray</i> is <b>NULL</b></li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property array is too small to receive information for all sessions 
     *         (<i>SessionCount</i> is greater than <i>PropertyArrayCount</i>). The 
     *         function fills the property array with the number of property structures specified in 
     *         <i>PropertyArrayCount</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-queryalltracesw
     * @since windows5.0
     */
    static QueryAllTracesW(PropertyArray, PropertyArrayCount, LoggerCount) {
        PropertyArrayMarshal := PropertyArray is VarRef ? "ptr*" : "ptr"
        LoggerCountMarshal := LoggerCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\QueryAllTracesW", PropertyArrayMarshal, PropertyArray, "uint", PropertyArrayCount, LoggerCountMarshal, LoggerCount, "uint")
        return result
    }

    /**
     * The QueryAllTraces function retrieves the properties and statistics for all event tracing sessions started on the computer for which the caller has permissions to query.
     * @param {Pointer<Pointer<EVENT_TRACE_PROPERTIES>>} PropertyArray An array of pointers to 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structures that receive 
     *        session properties and statistics for the event tracing sessions.
     * 
     * You only need to set the <b>Wnode.BufferSize</b>, 
     *        <b>LoggerNameOffset</b> , and <b>LogFileNameOffset</b>  members of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-properties">EVENT_TRACE_PROPERTIES</a> structure. The other 
     *        members should all be set to zero.
     * @param {Integer} PropertyArrayCount Number of structures in the <i>PropertyArray</i> array. This value must be less than or 
     *       equal to 64, the maximum number of event tracing sessions that ETW supports.
     * @param {Pointer<Integer>} LoggerCount Actual number of event tracing sessions started on the computer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
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
     * One of the following is true:
     * 
     * <ul>
     * <li><i>PropertyArrayCount</i> is zero or greater than the maximum number of supported sessions</li>
     * <li><i>PropertyArray</i> is <b>NULL</b></li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property array is too small to receive information for all sessions 
     *         (<i>SessionCount</i> is greater than <i>PropertyArrayCount</i>). The 
     *         function fills the property array with the number of property structures specified in 
     *         <i>PropertyArrayCount</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-queryalltracesa
     * @since windows5.0
     */
    static QueryAllTracesA(PropertyArray, PropertyArrayCount, LoggerCount) {
        PropertyArrayMarshal := PropertyArray is VarRef ? "ptr*" : "ptr"
        LoggerCountMarshal := LoggerCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\QueryAllTracesA", PropertyArrayMarshal, PropertyArray, "uint", PropertyArrayCount, LoggerCountMarshal, LoggerCount, "uint")
        return result
    }

    /**
     * Enables or disables the specified classic event trace provider. On Windows Vista and later, call the EnableTraceEx function to enable or disable a provider.
     * @param {Integer} Enable If <b>TRUE</b>, the provider is enabled; otherwise, the provider is disabled.
     * @param {Integer} EnableFlag Provider-defined value that specifies the class of events for which the provider generates events. A provider that generates only one class of events will typically ignore this flag. If the provider is more complex, the provider could use the <i>TraceGuidReg</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/ETW/registertraceguids">RegisterTraceGuids</a> to register more than one class of events. For example, if the provider has a database component, a UI component, and a general processing component, the provider could register separate event classes for these components. This would then allow the controller the ability to turn on tracing in only the database component. 
     * 
     * The provider calls <a href="https://docs.microsoft.com/windows/desktop/ETW/gettraceenableflags">GetTraceEnableFlags</a> from its <a href="https://docs.microsoft.com/windows/desktop/ETW/controlcallback">ControlCallback</a> function to obtain the enable flags.
     * @param {Integer} EnableLevel Provider-defined value that specifies the level of information the event generates. For example, you can use this value to indicate the severity level of the events (informational, warning, error) you want the provider to generate. 
     * 
     * 
     * 
     * 
     * Specify a value from zero to 255. ETW defines the following severity levels that you can use. Higher numbers imply that you get lower levels as well. For example, if you specify TRACE_LEVEL_WARNING, you also receive all warning, error, and fatal events.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_CRITICAL"></a><a id="trace_level_critical"></a><dl>
     * <dt><b>TRACE_LEVEL_CRITICAL</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Abnormal exit or termination events
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_ERROR"></a><a id="trace_level_error"></a><dl>
     * <dt><b>TRACE_LEVEL_ERROR</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Severe error events
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_WARNING"></a><a id="trace_level_warning"></a><dl>
     * <dt><b>TRACE_LEVEL_WARNING</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Warning events such as allocation failures
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_INFORMATION"></a><a id="trace_level_information"></a><dl>
     * <dt><b>TRACE_LEVEL_INFORMATION</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Non-error events such as entry or exit events
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_VERBOSE"></a><a id="trace_level_verbose"></a><dl>
     * <dt><b>TRACE_LEVEL_VERBOSE</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Detailed trace events
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} ControlGuid GUID of the event trace provider that you want to enable or disable.
     * @param {Integer} TraceId 
     * @returns {Integer} If the function is successful, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
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
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>ControlGuid</i> is <b>NULL</b>.</li>
     * <li><i>SessionHandle</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot change the enable flags and level when the provider is not registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider is not registered.  Occurs when KB307331 or Windows 2000 Service Pack 4 is installed and the 
     * provider is not registered. To avoid this error, the provider must first be registered. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Exceeded the number of trace sessions that can enable the provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the Performance Log Users group, and services running as LocalSystem, LocalService, NetworkService can enable trace providers. To grant a restricted user the ability to enable a trace provider, add them to the Performance Log Users group or see <a href="/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol">EventAccessControl</a>.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can enable a trace provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-enabletrace
     * @since windows5.0
     */
    static EnableTrace(Enable, EnableFlag, EnableLevel, ControlGuid, TraceId) {
        result := DllCall("ADVAPI32.dll\EnableTrace", "uint", Enable, "uint", EnableFlag, "uint", EnableLevel, "ptr", ControlGuid, "uint", TraceId, "uint")
        return result
    }

    /**
     * Enables or disables the specified event trace provider. The EnableTraceEx2 function supersedes this function.
     * @param {Pointer<Guid>} ProviderId GUID of the event trace provider that you want to enable or disable.
     * @param {Pointer<Guid>} SourceId GUID that uniquely identifies the session that is enabling or disabling the provider. Can be <b>NULL</b>. If the provider does not implement <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/nc-evntprov-penablecallback">EnableCallback</a>, the GUID is not used.
     * @param {Integer} TraceId 
     * @param {Integer} IsEnabled Set to 1 to receive events  when the provider is registered; otherwise, set to 0 to no longer receive events from the provider.
     * @param {Integer} Level Provider-defined value that specifies the level of detail included in the event.  
     * 
     * 
     * Specify one of the following levels that are defined in Winmeta.h. Higher numbers imply that you get lower levels as well. For example, if you specify TRACE_LEVEL_WARNING, you also receive all warning, error, and critical events.
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_CRITICAL"></a><a id="trace_level_critical"></a><dl>
     * <dt><b>TRACE_LEVEL_CRITICAL</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Abnormal exit or termination events
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_ERROR"></a><a id="trace_level_error"></a><dl>
     * <dt><b>TRACE_LEVEL_ERROR</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Severe error events
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_WARNING"></a><a id="trace_level_warning"></a><dl>
     * <dt><b>TRACE_LEVEL_WARNING</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Warning events such as allocation failures
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_INFORMATION"></a><a id="trace_level_information"></a><dl>
     * <dt><b>TRACE_LEVEL_INFORMATION</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Non-error events such as entry or exit events
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_VERBOSE"></a><a id="trace_level_verbose"></a><dl>
     * <dt><b>TRACE_LEVEL_VERBOSE</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Detailed trace events
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} MatchAnyKeyword Bitmask of keywords that determine the category of events that you want the provider to write. The provider writes the event if any of the event's keyword bits match any of the bits set in this mask. See Remarks.
     * @param {Integer} MatchAllKeyword This bitmask is optional. This mask further restricts the category of  events that you want the provider to write. If the event's keyword meets the <i>MatchAnyKeyword</i> condition, the provider will write the event only if all of the bits in this mask exist in the event's keyword. This mask is not used if <i>MatchAnyKeyword</i> is zero. See Remarks.
     * @param {Integer} EnableProperty Optional information that ETW can include when writing the event. The data is written to the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header_extended_data_item">extended data item</a> section of the event. To include the optional information, specify one or more of the following flags; otherwise, set to zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_ENABLE_PROPERTY_SID"></a><a id="event_enable_property_sid"></a><dl>
     * <dt><b>EVENT_ENABLE_PROPERTY_SID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include the security identifier (SID) of the user in the extended data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_ENABLE_PROPERTY_TS_ID"></a><a id="event_enable_property_ts_id"></a><dl>
     * <dt><b>EVENT_ENABLE_PROPERTY_TS_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include the terminal session identifier in the extended data.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<EVENT_FILTER_DESCRIPTOR>} EnableFilterDesc An <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structure that points to the filter data. The provider uses to filter data to prevent events that match the filter criteria from being written to the session; the provider determines the layout of the data and how it applies the filter to the event's data. A session can pass only one filter to the provider.
     * 
     * A session can call the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhenumerateproviderfilters">TdhEnumerateProviderFilters</a> function to determine the filters that it can pass to the provider.
     * @returns {Integer} If the function is successful, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
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
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>ProviderId</i> is <b>NULL</b>.</li>
     * <li><i>TraceHandle</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot update the level when the provider is not registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Exceeded the number of trace sessions that can enable the provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the Performance Log Users group, and services running as LocalSystem, LocalService, NetworkService can enable trace providers. To grant a restricted user the ability to enable a trace provider, add them to the Performance Log Users group or see <a href="/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol">EventAccessControl</a>.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can enable a trace provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-enabletraceex
     * @since windows6.0.6000
     */
    static EnableTraceEx(ProviderId, SourceId, TraceId, IsEnabled, Level, MatchAnyKeyword, MatchAllKeyword, EnableProperty, EnableFilterDesc) {
        result := DllCall("ADVAPI32.dll\EnableTraceEx", "ptr", ProviderId, "ptr", SourceId, "uint", TraceId, "uint", IsEnabled, "char", Level, "uint", MatchAnyKeyword, "uint", MatchAllKeyword, "uint", EnableProperty, "ptr", EnableFilterDesc, "uint")
        return result
    }

    /**
     * Enables or disables the specified event trace provider.
     * @param {Integer} TraceId 
     * @param {Pointer<Guid>} ProviderId A GUID of the event trace provider that you want to enable or disable.
     * @param {Integer} ControlCode You can specify one of the following control codes:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_CONTROL_CODE_DISABLE_PROVIDER"></a><a id="event_control_code_disable_provider"></a><dl>
     * <dt><b>EVENT_CONTROL_CODE_DISABLE_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables the provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_CONTROL_CODE_ENABLE_PROVIDER"></a><a id="event_control_code_enable_provider"></a><dl>
     * <dt><b>EVENT_CONTROL_CODE_ENABLE_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables the provider. The session receives events  when the provider is registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EVENT_CONTROL_CODE_CAPTURE_STATE"></a><a id="event_control_code_capture_state"></a><dl>
     * <dt><b>EVENT_CONTROL_CODE_CAPTURE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requests that the provider log its state information. First you would enable the provider and then call 
     *         <b>EnableTraceEx2</b> with this control code to capture 
     *         state information.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Level A provider-defined value that specifies the level of detail included in the event. Specify one of the 
     *       following levels that are defined in the <i>Winmeta.h</i> header file. Higher numbers imply 
     *       that you get lower levels as well. For example, if you specify TRACE_LEVEL_WARNING, you also receive all 
     *       warning, error, and critical events.
     *      
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_CRITICAL"></a><a id="trace_level_critical"></a><dl>
     * <dt><b>TRACE_LEVEL_CRITICAL</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Abnormal exit or termination events
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_ERROR"></a><a id="trace_level_error"></a><dl>
     * <dt><b>TRACE_LEVEL_ERROR</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Severe error events
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_WARNING"></a><a id="trace_level_warning"></a><dl>
     * <dt><b>TRACE_LEVEL_WARNING</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Warning events such as allocation failures
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_INFORMATION"></a><a id="trace_level_information"></a><dl>
     * <dt><b>TRACE_LEVEL_INFORMATION</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Non-error events such as entry or exit events
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRACE_LEVEL_VERBOSE"></a><a id="trace_level_verbose"></a><dl>
     * <dt><b>TRACE_LEVEL_VERBOSE</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Detailed trace events
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} MatchAnyKeyword A bitmask of keywords that determine the category of events that you want the provider to write. The 
     *       provider writes the event if any of the event's keyword bits match any of the bits set in this mask. See 
     *       Remarks.
     * @param {Integer} MatchAllKeyword This bitmask is optional. This mask further restricts the category of  events that you want the provider to write. If the event's keyword meets the <i>MatchAnyKeyword</i> condition, the provider will write the event only if all of the bits in this mask exist in the event's keyword. This mask is not used if <i>MatchAnyKeyword</i> is zero. See Remarks.
     * @param {Integer} Timeout Set to zero to enable the trace asynchronously; this is the default. If the timeout value is zero, this function calls the provider's enable callback and returns immediately. To enable the trace synchronously, specify a timeout value, in milliseconds. If you specify a timeout value, this function calls the provider's enable callback and waits until the callback exits or the timeout expires. To wait forever, set to INFINITE.
     * @param {Pointer<ENABLE_TRACE_PARAMETERS>} EnableParameters The trace parameters used to enable the provider. For details, see <a href="https://docs.microsoft.com/windows/desktop/ETW/enable-trace-parameters">ENABLE_TRACE_PARAMETERS</a> and <a href="https://docs.microsoft.com/windows/desktop/ETW/enable-trace-parameters-v1">ENABLE_TRACE_PARAMETERS_V1</a>.
     * @returns {Integer} If the function is successful, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
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
     * A parameter is incorrect. 
     * 
     * This can occur if any of the following are true:
     * 
     * <ul>
     * <li>The <i>ProviderId</i> is <b>NULL</b>.</li>
     * <li>The <i>TraceHandle</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The timeout value expired before the enable callback completed. For details, see the <i>Timeout</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot update the level when the provider is not registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SYSTEM_RESOURCES </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Exceeded the number of trace sessions that can enable the provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the <i>Performance Log Users</i> 
     *          group, and services running as <i>LocalSystem</i>, <i>LocalService</i>, 
     *          or <i>NetworkService</i> can enable trace providers. To grant a restricted user the ability 
     *          to enable a trace provider, add them to the <i>Performance Log Users</i> group or see 
     *          <a href="/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol">EventAccessControl</a>.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can enable a trace provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-enabletraceex2
     * @since windows6.1
     */
    static EnableTraceEx2(TraceId, ProviderId, ControlCode, Level, MatchAnyKeyword, MatchAllKeyword, Timeout, EnableParameters) {
        result := DllCall("ADVAPI32.dll\EnableTraceEx2", "uint", TraceId, "ptr", ProviderId, "uint", ControlCode, "char", Level, "uint", MatchAnyKeyword, "uint", MatchAllKeyword, "uint", Timeout, "ptr", EnableParameters, "uint")
        return result
    }

    /**
     * Use this function to retrieve information about trace providers that are registered on the computer.
     * @param {Integer} TraceQueryInfoClass Determines the type of information to include with the list of registered providers. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-info-class">TRACE_QUERY_INFO_CLASS</a> enumeration.
     * @param {Pointer} InBuffer GUID of the provider or provider group whose information you want to retrieve. Specify the GUID only if <i>TraceQueryInfoClass</i> is <b>TraceGuidQueryInfo</b> or <b>TraceGroupQueryInfo</b>.
     * @param {Integer} InBufferSize Size, in bytes, of the data <i>InBuffer</i>.
     * @param {Pointer} OutBuffer Application-allocated buffer that contains the enumerated information. The format of the information depends on the value of <i>TraceQueryInfoClass</i>. For details, see Remarks.
     * @param {Integer} OutBufferSize Size, in bytes, of the <i>OutBuffer</i> buffer. If the function succeeds, the <i>ReturnLength</i> parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and the <i>ReturnLength</i> parameter receives the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and the <i>ReturnLength</i> parameter receives the required buffer size.
     * @param {Pointer<Integer>} ReturnLength Actual size of the data in <i>OutBuffer</i>, in bytes.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
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
     * One of the parameters is not valid. 
     * 
     * 
     * 
     * 								
     * 							
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
     * The <i>OutBuffer</i> buffer is too small to receive information for all registered providers. Reallocate the buffer using the size returned in <i>ReturnLength</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-enumeratetraceguidsex
     * @since windows6.0.6000
     */
    static EnumerateTraceGuidsEx(TraceQueryInfoClass, InBuffer, InBufferSize, OutBuffer, OutBufferSize, ReturnLength) {
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\EnumerateTraceGuidsEx", "int", TraceQueryInfoClass, "ptr", InBuffer, "uint", InBufferSize, "ptr", OutBuffer, "uint", OutBufferSize, ReturnLengthMarshal, ReturnLength, "uint")
        return result
    }

    /**
     * Enables or disables event tracing session settings for the specified information class.
     * @param {Integer} TraceId 
     * @param {Integer} InformationClass The information class to enable or disable. The information that the class captures is included in the 
     *       extended data section of the event. For a list of information classes that you can enable, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-info-class">TRACE_INFO_CLASS</a> enumeration.
     * @param {Pointer} TraceInformation A pointer to information class specific data; the information class determines the contents of this 
     *       parameter. For example, for the <b>TraceStackTracingInfo</b> information class, this 
     *       parameter is an array of <a href="https://docs.microsoft.com/windows/desktop/ETW/classic-event-id">CLASSIC_EVENT_ID</a> structures. 
     *       The structures specify the event GUIDs for which stack tracing is enabled. The array is limited to 256 
     *       elements.
     * @param {Integer} InformationLength The size, in bytes, of the data in the <i>TraceInformation</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The program issued a command but the command length is incorrect. This error is returned if the 
     *         <i>InformationLength</i> parameter is less than a minimum size.
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
     * The parameter is incorrect. 
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
     * The request is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-tracesetinformation
     * @since windows6.1
     */
    static TraceSetInformation(TraceId, InformationClass, TraceInformation, InformationLength) {
        result := DllCall("ADVAPI32.dll\TraceSetInformation", "uint", TraceId, "int", InformationClass, "ptr", TraceInformation, "uint", InformationLength, "uint")
        return result
    }

    /**
     * Queries event tracing session settings for the specified information class.
     * @param {Integer} TraceId 
     * @param {Integer} InformationClass The information class to query. The information that the class captures is included in the extended data 
     *       section of the event. For a list of information classes that you can query, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-info-class">TRACE_QUERY_INFO_CLASS</a> enumeration.
     * @param {Pointer} TraceInformation A pointer to a buffer to receive the returned information class specific data. The information class 
     *       determines the contents of this parameter. For example, for the <b>TraceStackTracingInfo</b> 
     *       information class, this parameter is an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/ETW/classic-event-id">CLASSIC_EVENT_ID</a> structures. The structures specify 
     *       the event GUIDs for which stack tracing is enabled. The array is limited to 256 elements.
     * @param {Integer} InformationLength The size, in bytes, of the data returned in the <i>TraceInformation</i> buffer. If the 
     *       function fails, this value indicates the required size of the <i>TraceInformation</i> buffer 
     *       that is needed.
     * @param {Pointer<Integer>} ReturnLength A pointer a value that receives the size, in bytes, of the specific data returned in the 
     *       <i>TraceInformation</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The program issued a command but the command length is incorrect. This error is returned if the 
     *         <i>InformationLength</i> parameter is less than a minimum size.
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
     * The parameter is incorrect. 
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
     * The request is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string 
     *         for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-tracequeryinformation
     * @since windows8.0
     */
    static TraceQueryInformation(TraceId, InformationClass, TraceInformation, InformationLength, ReturnLength) {
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\TraceQueryInformation", "uint", TraceId, "int", InformationClass, "ptr", TraceInformation, "uint", InformationLength, ReturnLengthMarshal, ReturnLength, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} TraceId 
     * @param {Integer} LbrConfiguration 
     * @param {Pointer<CLASSIC_EVENT_ID>} Events 
     * @param {Integer} EventCount 
     * @returns {Integer} 
     */
    static TraceConfigureLastBranchRecord(TraceId, LbrConfiguration, Events, EventCount) {
        result := DllCall("ADVAPI32.dll\TraceConfigureLastBranchRecord", "uint", TraceId, "int", LbrConfiguration, "ptr", Events, "uint", EventCount, "uint")
        return result
    }

    /**
     * The CreateTraceInstanceId function creates a unique transaction identifier and maps it to a class GUID registration handle. You then use the transaction identifier when calling the TraceEventInstance function.
     * @param {HANDLE} RegHandle Handle to a registered event trace class. The 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/registertraceguids">RegisterTraceGuids</a> function returns this handle in the <b>RegHandle</b> member of the <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-guid-registration">TRACE_GUID_REGISTRATION</a> structure.
     * @param {Pointer<EVENT_INSTANCE_INFO>} InstInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/event-instance-info">EVENT_INSTANCE_INFO</a> structure. The <b>InstanceId</b> member of this structure contains the transaction identifier.
     * @returns {Integer} If the function is successful, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
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
     * One of the following is true:
     * 
     * <ul>
     * <li><i>RegHandle</i> is <b>NULL</b>.</li>
     * <li><i>pInstInfo</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-createtraceinstanceid
     * @since windows5.0
     */
    static CreateTraceInstanceId(RegHandle, InstInfo) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ADVAPI32.dll\CreateTraceInstanceId", "ptr", RegHandle, "ptr", InstInfo, "uint")
        return result
    }

    /**
     * The TraceEvent function sends an event to an event tracing session.
     * @param {Integer} TraceHandle Handle to the event tracing session that records the event. The provider obtains the handle when it calls the <a href="https://docs.microsoft.com/windows/desktop/ETW/gettraceloggerhandle">GetTraceLoggerHandle</a> function in its <a href="https://docs.microsoft.com/windows/desktop/ETW/controlcallback">ControlCallback</a> implementation.
     * @param {Pointer<EVENT_TRACE_HEADER>} EventTrace Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-header">EVENT_TRACE_HEADER</a> structure. Event-specific data is optionally appended to the structure. The largest event you can log is 64K. You must specify values for the following members of the 
     * <b>EVENT_TRACE_HEADER</b> structure. 
     * 
     * 
     * 
     * <ul>
     * <li><b>Size</b></li>
     * <li><b>Guid</b> or <b>GuidPtr</b></li>
     * <li><b>Flags</b></li>
     * </ul>
     * Depending on the complexity of the information your provider provides, you should also consider specifying values for the following members.
     * 
     * <ul>
     * <li><b>Class.Type</b></li>
     * <li><b>Class.Level</b></li>
     * </ul>
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAG_NUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Flags</b> member of the 
     * <a href="/windows/desktop/ETW/event-trace-header">EVENT_TRACE_HEADER</a> structure is incorrect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>SessionHandle</i> is not valid or specifies the NT Kernel Logger session handle.
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
     * The session ran out of free buffers to write to. This can occur during high event rates because the disk subsystem is overloaded or the number of buffers is too small. Rather than blocking until more buffers become available, <a href="/windows/desktop/ETW/traceevent">TraceEvent</a> discards the event. 
     * 
     * Consider increasing the number and size of the buffers for the session, or reducing the number of events written or the size of the events.
     * 
     * <b>Windows 2000:  </b>Not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The event is discarded because, although the buffer pool has not reached its maximum size, there is insufficient available memory to allocate an additional buffer and there is no buffer available to receive the event. 
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
     * One of the following is true:
     * 
     * <ul>
     * <li><i>SessionHandle</i> is <b>NULL</b>.</li>
     * <li><i>EventTrace</i> is <b>NULL</b>.</li>
     * <li>The <b>Size</b> member of the 
     * <a href="/windows/desktop/ETW/event-trace-header">EVENT_TRACE_HEADER</a> structure is incorrect.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data from a single event cannot span multiple buffers. A trace event is limited to the size of the event tracing session's buffer minus the size of the  
     * <a href="/windows/desktop/ETW/event-trace-header">EVENT_TRACE_HEADER</a> structure. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-traceevent
     * @since windows5.0
     */
    static TraceEvent(TraceHandle, EventTrace) {
        result := DllCall("ADVAPI32.dll\TraceEvent", "uint", TraceHandle, "ptr", EventTrace, "uint")
        return result
    }

    /**
     * The TraceEventInstance function sends an event to an event tracing session. The event uses an instance identifier to associate the event with a transaction. This function may also be used to trace hierarchical relationships between related events.
     * @param {Integer} TraceHandle Handle to the event tracing session that records the event instance. The provider obtains the handle when it calls the <a href="https://docs.microsoft.com/windows/desktop/ETW/gettraceloggerhandle">GetTraceLoggerHandle</a> function in its <a href="https://docs.microsoft.com/windows/desktop/ETW/controlcallback">ControlCallback</a> implementation.
     * @param {Pointer<EVENT_INSTANCE_HEADER>} EventTrace Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/event-instance-header">EVENT_INSTANCE_HEADER</a> structure. Event-specific data is optionally appended to the structure. The largest event you can log is 64K. You must specify values for the following members of the 
     * <b>EVENT_INSTANCE_HEADER</b> structure. 
     * 
     * 
     * 
     * <ul>
     * <li><b>Size</b></li>
     * <li><b>Flags</b></li>
     * <li><b>RegHandle</b></li>
     * </ul>
     * Depending on the complexity of the information your provider provides, you should also consider specifying values for the following members.
     * 
     * <ul>
     * <li><b>Class.Type</b></li>
     * <li><b>Class.Level</b></li>
     * </ul>
     * To trace hierarchical relationships between related events, also set the <b>ParentRegHandle</b> member.
     * @param {Pointer<EVENT_INSTANCE_INFO>} InstInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/event-instance-info">EVENT_INSTANCE_INFO</a> structure, which contains the registration handle for this event trace class and the instance identifier. Use the  <a href="https://docs.microsoft.com/windows/desktop/ETW/createtraceinstanceid">CreateTraceInstanceId</a> function to initialize the structure.
     * @param {Pointer<EVENT_INSTANCE_INFO>} ParentInstInfo Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/event-instance-info">EVENT_INSTANCE_INFO</a> structure, which contains the registration handle for the parent event trace class and its instance identifier. Use the  <a href="https://docs.microsoft.com/windows/desktop/ETW/createtraceinstanceid">CreateTraceInstanceId</a> function to initialize the structure. Set to <b>NULL</b> if you are not tracing a hierarchical relationship.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FLAGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Flags</b> member of the 
     * <a href="/windows/desktop/ETW/event-instance-header">EVENT_INSTANCE_HEADER</a> does not contain <b>WNODE_FLAG_TRACED_GUID</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was insufficient memory to complete the function call. The causes for this error code are described in the following Remarks section.
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
     * One of the following is true:
     * 
     * <ul>
     * <li><i>EventTrace</i> is <b>NULL</b>.</li>
     * <li><i>pInstInfo</i> is <b>NULL</b>.</li>
     * <li>The members of <i>pInstInfo</i> are <b>NULL</b>.</li>
     * <li><i>SessionHandle</i> is <b>NULL</b>.</li>
     * <li>The <b>Size</b> member of the 
     * <a href="/windows/desktop/ETW/event-instance-header">EVENT_INSTANCE_HEADER</a> is incorrect.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>SessionHandle</i> is not valid or specifies the NT Kernel Logger session handle.
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
     * The session ran out of free buffers to write to. This can occur during high event rates because the disk subsystem is overloaded or the number of buffers is too small. Rather than blocking until more buffers become available, <a href="/windows/desktop/ETW/traceevent">TraceEvent</a> discards the event.
     * 
     * <b>Windows 2000 and Windows XP:  </b>Not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The event is discarded because, although the buffer pool has not reached its maximum size, there is insufficient available memory to allocate an additional buffer and there is no buffer available to receive the event. 
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
     * Data from a single event cannot span multiple buffers. A trace event is limited to the size of the event tracing session's buffer minus the size of the  
     * <a href="/windows/desktop/ETW/event-instance-header">EVENT_INSTANCE_HEADER</a> structure. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-traceeventinstance
     * @since windows5.0
     */
    static TraceEventInstance(TraceHandle, EventTrace, InstInfo, ParentInstInfo) {
        result := DllCall("ADVAPI32.dll\TraceEventInstance", "uint", TraceHandle, "ptr", EventTrace, "ptr", InstInfo, "ptr", ParentInstInfo, "uint")
        return result
    }

    /**
     * The RegisterTraceGuids function registers an event trace provider and the event trace classes that it uses to generate events. This function also specifies the function the provider uses to enable and disable tracing.
     * @param {Pointer<WMIDPREQUEST>} RequestAddress Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/controlcallback">ControlCallback</a> function that receives notification when the provider is enabled or disabled by an event tracing session. The <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletrace">EnableTrace</a> function calls the callback.
     * @param {Pointer<Void>} RequestContext Pointer to an optional provider-defined context that ETW passes to the function specified by <i>RequestAddress</i>.
     * @param {Pointer<Guid>} ControlGuid GUID of the registering provider.
     * @param {Integer} GuidCount Number of elements in the <i>TraceGuidReg</i> array.
     * 					If <i>TraceGuidReg</i> is <b>NULL</b>, set this parameter to 0.
     * @param {Pointer<TRACE_GUID_REGISTRATION>} TraceGuidReg Pointer to an array of  
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-guid-registration">TRACE_GUID_REGISTRATION</a> structures. 
     * 
     * 
     * Each element identifies a category of events that the provider provides. 
     * 
     * On input, the <b>Guid</b> member of each structure contains an event trace class GUID assigned by the registering provider. The class GUID identifies a category of events that the provider provides. Providers use the same class GUID to set the Guid member of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-header">EVENT_TRACE_HEADER</a> when calling the <a href="https://docs.microsoft.com/windows/desktop/ETW/traceevent">TraceEvent</a> function to log the event. 
     * 
     * On output, the <b>RegHandle</b> member receives a handle to the event's class GUID registration. If the provider calls the <a href="https://docs.microsoft.com/windows/desktop/ETW/traceeventinstance">TraceEventInstance</a> function, use the <b>RegHandle</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-guid-registration">TRACE_GUID_REGISTRATION</a> to set the <b>RegHandle</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-instance-header">EVENT_INSTANCE_HEADER</a>.
     * 
     * This parameter can be <b>NULL</b> if the provider calls only the <a href="https://docs.microsoft.com/windows/desktop/ETW/traceevent">TraceEvent</a> function to log events. If the provider calls the <a href="https://docs.microsoft.com/windows/desktop/ETW/traceeventinstance">TraceEventInstance</a> function to log events, this parameter cannot be <b>NULL</b>.
     * @param {PWSTR} MofImagePath This parameter is not supported, set to <b>NULL</b>. You should use Mofcomp.exe to register the MOF resource during the setup of your application. For more information see, <a href="https://docs.microsoft.com/windows/desktop/ETW/publishing-your-event-schema">Publishing Your Event Schema</a>.
     * 
     * <b>Windows XP with SP1, Windows XP and Windows 2000:  </b>Pointer to an optional string that specifies the path of the DLL or executable program that contains the resource specified by <i>MofResourceName</i>. This parameter can be <b>NULL</b> if the event provider and consumer use another mechanism to share information about the event trace classes used by the provider.
     * @param {PWSTR} MofResourceName This parameter is not supported, set to <b>NULL</b>. You should use Mofcomp.exe to register the MOF resource during the setup of your application. For more information see, <a href="https://docs.microsoft.com/windows/desktop/ETW/publishing-your-event-schema">Publishing Your Event Schema</a>.
     * 
     * <b>Windows XP with SP1, Windows XP and Windows 2000:  </b>Pointer to an optional string that specifies the string resource of <i>MofImagePath</i>. The string resource contains the name of the binary MOF file that describes the event trace classes supported by the provider.
     * @param {Pointer<Integer>} RegistrationHandle Pointer to the provider's registration handle. Use this handle when you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/unregistertraceguids">UnregisterTraceGuids</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.<div class="alert"><b>Note</b>  This function can return the return value from <a href="/windows/desktop/ETW/controlcallback">ControlCallback</a> if a controller calls <a href="/windows/desktop/ETW/enabletrace">EnableTrace</a> to enable the provider and the provider has not yet called <b>RegisterTraceGuids</b>. When this occurs, <b>RegisterTraceGuids</b> will return the return value of the callback if the registration was successful.</div>
     * <div> </div>
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
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>RequestAddress</i> is <b>NULL</b>.</li>
     * <li><i>ControlGuid</i> is <b>NULL</b>.</li>
     * <li><i>RegistrationHandle</i> is <b>NULL</b>.</li>
     * </ul>
     * <b>Windows XP and Windows 2000:  </b><i>TraceGuidReg</i> is <b>NULL</b> or <i>GuidCount</i> is less than or equal to zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-registertraceguidsw
     * @since windows5.0
     */
    static RegisterTraceGuidsW(RequestAddress, RequestContext, ControlGuid, GuidCount, TraceGuidReg, MofImagePath, MofResourceName, RegistrationHandle) {
        MofImagePath := MofImagePath is String ? StrPtr(MofImagePath) : MofImagePath
        MofResourceName := MofResourceName is String ? StrPtr(MofResourceName) : MofResourceName

        RequestContextMarshal := RequestContext is VarRef ? "ptr" : "ptr"
        RegistrationHandleMarshal := RegistrationHandle is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\RegisterTraceGuidsW", "ptr", RequestAddress, RequestContextMarshal, RequestContext, "ptr", ControlGuid, "uint", GuidCount, "ptr", TraceGuidReg, "ptr", MofImagePath, "ptr", MofResourceName, RegistrationHandleMarshal, RegistrationHandle, "uint")
        return result
    }

    /**
     * The RegisterTraceGuids function registers an event trace provider and the event trace classes that it uses to generate events. This function also specifies the function the provider uses to enable and disable tracing.
     * @param {Pointer<WMIDPREQUEST>} RequestAddress Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/controlcallback">ControlCallback</a> function that receives notification when the provider is enabled or disabled by an event tracing session. The <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletrace">EnableTrace</a> function calls the callback.
     * @param {Pointer<Void>} RequestContext Pointer to an optional provider-defined context that ETW passes to the function specified by <i>RequestAddress</i>.
     * @param {Pointer<Guid>} ControlGuid GUID of the registering provider.
     * @param {Integer} GuidCount Number of elements in the <i>TraceGuidReg</i> array.
     * 					If <i>TraceGuidReg</i> is <b>NULL</b>, set this parameter to 0.
     * @param {Pointer<TRACE_GUID_REGISTRATION>} TraceGuidReg Pointer to an array of  
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-guid-registration">TRACE_GUID_REGISTRATION</a> structures. 
     * 
     * 
     * Each element identifies a category of events that the provider provides. 
     * 
     * On input, the <b>Guid</b> member of each structure contains an event trace class GUID assigned by the registering provider. The class GUID identifies a category of events that the provider provides. Providers use the same class GUID to set the Guid member of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-header">EVENT_TRACE_HEADER</a> when calling the <a href="https://docs.microsoft.com/windows/desktop/ETW/traceevent">TraceEvent</a> function to log the event. 
     * 
     * On output, the <b>RegHandle</b> member receives a handle to the event's class GUID registration. If the provider calls the <a href="https://docs.microsoft.com/windows/desktop/ETW/traceeventinstance">TraceEventInstance</a> function, use the <b>RegHandle</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-guid-registration">TRACE_GUID_REGISTRATION</a> to set the <b>RegHandle</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-instance-header">EVENT_INSTANCE_HEADER</a>.
     * 
     * This parameter can be <b>NULL</b> if the provider calls only the <a href="https://docs.microsoft.com/windows/desktop/ETW/traceevent">TraceEvent</a> function to log events. If the provider calls the <a href="https://docs.microsoft.com/windows/desktop/ETW/traceeventinstance">TraceEventInstance</a> function to log events, this parameter cannot be <b>NULL</b>.
     * @param {PSTR} MofImagePath This parameter is not supported, set to <b>NULL</b>. You should use Mofcomp.exe to register the MOF resource during the setup of your application. For more information see, <a href="https://docs.microsoft.com/windows/desktop/ETW/publishing-your-event-schema">Publishing Your Event Schema</a>.
     * 
     * <b>Windows XP with SP1, Windows XP and Windows 2000:  </b>Pointer to an optional string that specifies the path of the DLL or executable program that contains the resource specified by <i>MofResourceName</i>. This parameter can be <b>NULL</b> if the event provider and consumer use another mechanism to share information about the event trace classes used by the provider.
     * @param {PSTR} MofResourceName This parameter is not supported, set to <b>NULL</b>. You should use Mofcomp.exe to register the MOF resource during the setup of your application. For more information see, <a href="https://docs.microsoft.com/windows/desktop/ETW/publishing-your-event-schema">Publishing Your Event Schema</a>.
     * 
     * <b>Windows XP with SP1, Windows XP and Windows 2000:  </b>Pointer to an optional string that specifies the string resource of <i>MofImagePath</i>. The string resource contains the name of the binary MOF file that describes the event trace classes supported by the provider.
     * @param {Pointer<Integer>} RegistrationHandle Pointer to the provider's registration handle. Use this handle when you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/unregistertraceguids">UnregisterTraceGuids</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.<div class="alert"><b>Note</b>  This function can return the return value from <a href="/windows/desktop/ETW/controlcallback">ControlCallback</a> if a controller calls <a href="/windows/desktop/ETW/enabletrace">EnableTrace</a> to enable the provider and the provider has not yet called <b>RegisterTraceGuids</b>. When this occurs, <b>RegisterTraceGuids</b> will return the return value of the callback if the registration was successful.</div>
     * <div> </div>
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
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li><i>RequestAddress</i> is <b>NULL</b>.</li>
     * <li><i>ControlGuid</i> is <b>NULL</b>.</li>
     * <li><i>RegistrationHandle</i> is <b>NULL</b>.</li>
     * </ul>
     * <b>Windows XP and Windows 2000:  </b><i>TraceGuidReg</i> is <b>NULL</b> or <i>GuidCount</i> is less than or equal to zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-registertraceguidsa
     * @since windows5.0
     */
    static RegisterTraceGuidsA(RequestAddress, RequestContext, ControlGuid, GuidCount, TraceGuidReg, MofImagePath, MofResourceName, RegistrationHandle) {
        MofImagePath := MofImagePath is String ? StrPtr(MofImagePath) : MofImagePath
        MofResourceName := MofResourceName is String ? StrPtr(MofResourceName) : MofResourceName

        RequestContextMarshal := RequestContext is VarRef ? "ptr" : "ptr"
        RegistrationHandleMarshal := RegistrationHandle is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\RegisterTraceGuidsA", "ptr", RequestAddress, RequestContextMarshal, RequestContext, "ptr", ControlGuid, "uint", GuidCount, "ptr", TraceGuidReg, "ptr", MofImagePath, "ptr", MofResourceName, RegistrationHandleMarshal, RegistrationHandle, "uint")
        return result
    }

    /**
     * The EnumerateTraceGuids function retrieves information about registered event trace providers that are running on the computer.
     * @param {Pointer<Pointer<TRACE_GUID_PROPERTIES>>} GuidPropertiesArray An array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-guid-properties">TRACE_GUID_PROPERTIES</a> structures.
     * @param {Integer} PropertyArrayCount Number of elements in the <i>GuidPropertiesArray</i> array.
     * @param {Pointer<Integer>} GuidCount Actual number of event tracing providers registered on the computer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
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
     * One of the following is true:
     * 
     * <ul>
     * <li><i>PropertyArrayCount</i> is zero</li>
     * <li><i>GuidPropertiesArray</i> is <b>NULL</b></li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property array is too small to receive information for all registered providers (<i>GuidCount</i> is greater than <i>PropertyArrayCount</i>). The function fills the GUID property array with the number of structures specified in <i>PropertyArrayCount</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-enumeratetraceguids
     * @since windows5.1.2600
     */
    static EnumerateTraceGuids(GuidPropertiesArray, PropertyArrayCount, GuidCount) {
        GuidPropertiesArrayMarshal := GuidPropertiesArray is VarRef ? "ptr*" : "ptr"
        GuidCountMarshal := GuidCount is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\EnumerateTraceGuids", GuidPropertiesArrayMarshal, GuidPropertiesArray, "uint", PropertyArrayCount, GuidCountMarshal, GuidCount, "uint")
        return result
    }

    /**
     * The UnregisterTraceGuids function unregisters an event trace provider and its event trace classes.
     * @param {Integer} RegistrationHandle Handle to the event trace provider, obtained from an earlier call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/registertraceguids">RegisterTraceGuids</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
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
     * The <i>RegistrationHandle</i> parameter does not specify the handle to a registered provider or is <b>NULL</b>. 
     * 
     * 
     * 
     * 								
     * 							
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-unregistertraceguids
     * @since windows5.0
     */
    static UnregisterTraceGuids(RegistrationHandle) {
        result := DllCall("ADVAPI32.dll\UnregisterTraceGuids", "uint", RegistrationHandle, "uint")
        return result
    }

    /**
     * The GetTraceLoggerHandle function retrieves the handle of the event tracing session. Providers can only call this function from their ControlCallback function.
     * @param {Pointer<Void>} Buffer Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/wnode-header">WNODE_HEADER</a> structure. ETW passes this structure to the provider's 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/controlcallback">ControlCallback</a> function in the <i>Buffer</i> parameter.
     * 
     * The <b>HistoricalContext</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/wnode-header">WNODE_HEADER</a> contains the session's handle.
     * @returns {Integer} If the function succeeds, it returns the event tracing session handle.
     * 						
     * 
     * If the function fails, it returns <b>INVALID_HANDLE_VALUE</b>. To get extended error information, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-gettraceloggerhandle
     * @since windows5.0
     */
    static GetTraceLoggerHandle(Buffer) {
        BufferMarshal := Buffer is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetTraceLoggerHandle", BufferMarshal, Buffer, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The GetTraceEnableLevel function retrieves the severity level passed by the controller to indicate the level of logging the provider should perform. Providers can only call this function from their ControlCallback function.
     * @param {Integer} TraceHandle Handle to an event tracing session, obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/gettraceloggerhandle">GetTraceLoggerHandle</a> function.
     * @returns {Integer} Returns the value the controller specified in the <i>EnableLevel</i> parameter when calling the 
     * <a href="/windows/desktop/ETW/enabletrace">EnableTrace</a> function. 
     * 						
     * 
     * To determine if the function failed or the controller set the enable flags to 0, follow these steps:<ul>
     * <li>Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> function to set the last error to <b>ERROR_SUCCESS</b>.</li>
     * <li>Call the <b>GetTraceEnableLevel</b> function to retrieve the enable level.</li>
     * <li>If the enable level value is 0, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to retrieve the last known error.</li>
     * <li>If the last known error is <b>ERROR_SUCCESS</b>, the controller set the enable level to 0; otherwise, the <b>GetTraceEnableLevel</b> function failed with the last known error. </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-gettraceenablelevel
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
     * The GetTraceEnableFlags function retrieves the enable flags passed by the controller to indicate which category of events to trace.Providers can only call this function from their ControlCallback function.
     * @param {Integer} TraceHandle Handle to an event tracing session, obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/gettraceloggerhandle">GetTraceLoggerHandle</a> function.
     * @returns {Integer} Returns the value the controller specified in the <i>EnableFlag</i> parameter when calling the 
     * <a href="/windows/desktop/ETW/enabletrace">EnableTrace</a> function.
     * 						
     * 
     * To determine if the function failed or the controller set the enable flags to 0, follow these steps:<ul>
     * <li>Call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> function to set the last error to <b>ERROR_SUCCESS</b>.</li>
     * <li>Call the <b>GetTraceEnableFlags</b> function to retrieve the enable flags.</li>
     * <li>If the enable flags value is 0, call the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to retrieve the last known error.</li>
     * <li>If the last known error is <b>ERROR_SUCCESS</b>, the controller set the enable flags to 0; otherwise, the <b>GetTraceEnableFlags</b> function failed with the last known error. </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-gettraceenableflags
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
     * The OpenTrace function opens a real-time trace session or log file for consuming.
     * @param {Pointer<EVENT_TRACE_LOGFILEW>} Logfile Pointer to an <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-logfile">EVENT_TRACE_LOGFILE</a> structure. 
     *       The structure specifies the source from which to consume events (from a log file or the session in real time) 
     *       and specifies the callbacks the consumer wants to use to receive the events.
     * @returns {PROCESSTRACE_HANDLE} If the function succeeds, it returns a handle to the trace.
     * 
     * If the function fails, it returns INVALID_PROCESSTRACE_HANDLE.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">If your code base supports Windows 7 and Windows Vista, and also supports 
     *         earlier operating systems such as Windows XP and Windows Server 2003, do not use the 
     *         constants described above. Instead, determine the operating system on which you are running and compare the 
     *         return value to the following values.
     * 
     * <table>
     * <tr>
     * <th>Operating system</th>
     * <th>Application</th>
     * <th>Return value to compare</th>
     * </tr>
     * <tr>
     * <td>Windows 7 and Windows Vista</td>
     * <td>32-bit</td>
     * <td>0x00000000FFFFFFFF</td>
     * </tr>
     * <tr>
     * <td>Windows 7 and Windows Vista</td>
     * <td>64-bit</td>
     * <td>0XFFFFFFFFFFFFFFFF</td>
     * </tr>
     * <tr>
     * <td>Windows XP and Windows Server 2003</td>
     * <td>32- or 64-bit</td>
     * <td>0XFFFFFFFFFFFFFFFF</td>
     * </tr>
     * </table>
     *  
     * 
     * </div>
     * <div> </div>
     * If the function returns INVALID_PROCESSTRACE_HANDLE, you can use the 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to obtain extended error 
     *        information. The following table lists some common errors and their causes.
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
     * The <i>Logfile</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PATHNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If you did not specify the <b>LoggerName</b> member of <a href="/windows/desktop/ETW/event-trace-logfile">EVENT_TRACE_LOGFILE</a>, you must specify a valid log file name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the Performance Log Users group, and services running 
     *          as LocalSystem, LocalService, NetworkService can consume events in real time. To grant a restricted user the 
     *          ability to consume events in real time, add them to the Performance Log Users group.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can consume real time events.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-opentracew
     * @since windows5.0
     */
    static OpenTraceW(Logfile) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenTraceW", "ptr", Logfile, "ptr")
        if(A_LastError)
            throw OSError()

        resultHandle := PROCESSTRACE_HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * The ProcessTrace function delivers events from one or more event tracing sessions to the consumer.
     * @param {Pointer<PROCESSTRACE_HANDLE>} HandleArray Pointer to an array of trace handles obtained from earlier calls to the 
     *        <a href="https://docs.microsoft.com/windows/desktop/ETW/opentrace">OpenTrace</a> function. The number of handles that you can 
     *        specify is limited to 64.
     * 
     * The array can contain the handles to multiple log files, but only one real-time trace session.
     * @param {Integer} HandleCount Number of elements in <i>HandleArray</i>.
     * @param {Pointer<FILETIME>} StartTime Pointer to an optional <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that 
     *       specifies the beginning time period for which you want to receive events. The function does not deliver events 
     *       recorded prior to <i>StartTime</i>.
     * @param {Pointer<FILETIME>} EndTime Pointer to an optional <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that 
     *        specifies the ending time period for which you want to receive events. The function does not deliver events 
     *        recorded after  <i>EndTime</i>.
     * 
     * <b>Windows Server 2003:  </b>This value is ignored for real-time event delivery.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>HandleCount</i> is not valid or the number of handles is greater than 64.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An element of <i>HandleArray</i> is not a valid event tracing session handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_TIME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>EndTime</i> is less than <i>StartTime</i>.
     *        
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
     * <i>HandleArray</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOACCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An exception occurred in one of the callback functions that receives the events.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the consumer canceled processing by returning <b>FALSE</b> in their 
     *         <a href="/windows/desktop/ETW/buffercallback">BufferCallback</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The session from which you are trying to consume events in real time is not running or does not have the 
     *         real-time trace mode enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_ALREADY_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>HandleArray</i> parameter contains the handle to more than one real-time 
     *         session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-processtrace
     * @since windows5.0
     */
    static ProcessTrace(HandleArray, HandleCount, StartTime, EndTime) {
        result := DllCall("ADVAPI32.dll\ProcessTrace", "ptr", HandleArray, "uint", HandleCount, "ptr", StartTime, "ptr", EndTime, "uint")
        return result
    }

    /**
     * The CloseTrace function closes a trace.
     * @param {PROCESSTRACE_HANDLE} TraceHandle Handle to the trace to close. The <a href="https://docs.microsoft.com/windows/desktop/ETW/opentrace">OpenTrace</a> function 
     *       returns this handle.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the following is true:
     * 
     * <ul>
     * <li><i>TraceHandle</i> is <b>NULL</b>.</li>
     * <li><i>TraceHandle</i> is INVALID_HANDLE_VALUE.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prior to Windows Vista, you cannot close the trace until the <a href="/windows/desktop/ETW/processtrace">ProcessTrace</a> function completes.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CTX_CLOSE_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was successful. The  <a href="/windows/desktop/ETW/processtrace">ProcessTrace</a> function will stop after it has processed all real-time events in its buffers (it will not receive any new events).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-closetrace
     * @since windows5.0
     */
    static CloseTrace(TraceHandle) {
        TraceHandle := TraceHandle is Win32Handle ? NumGet(TraceHandle, "ptr") : TraceHandle

        result := DllCall("ADVAPI32.dll\CloseTrace", "ptr", TraceHandle, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ETW_OPEN_TRACE_OPTIONS>} Options 
     * @param {Pointer<PETW_BUFFER_COMPLETION_CALLBACK>} BufferCompletionCallback 
     * @param {Pointer<Void>} BufferCompletionContext 
     * @returns {PROCESSTRACE_HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-opentracefrombufferstream
     */
    static OpenTraceFromBufferStream(Options, BufferCompletionCallback, BufferCompletionContext) {
        BufferCompletionContextMarshal := BufferCompletionContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ADVAPI32.dll\OpenTraceFromBufferStream", "ptr", Options, "ptr", BufferCompletionCallback, BufferCompletionContextMarshal, BufferCompletionContext, "ptr")
        resultHandle := PROCESSTRACE_HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {PWSTR} LoggerName 
     * @param {Pointer<ETW_OPEN_TRACE_OPTIONS>} Options 
     * @param {Pointer<TRACE_LOGFILE_HEADER>} LogFileHeader 
     * @returns {PROCESSTRACE_HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-opentracefromrealtimelogger
     */
    static OpenTraceFromRealTimeLogger(LoggerName, Options, LogFileHeader) {
        LoggerName := LoggerName is String ? StrPtr(LoggerName) : LoggerName

        result := DllCall("ADVAPI32.dll\OpenTraceFromRealTimeLogger", "ptr", LoggerName, "ptr", Options, "ptr", LogFileHeader, "ptr")
        resultHandle := PROCESSTRACE_HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {PWSTR} LoggerName 
     * @param {Pointer<ETW_OPEN_TRACE_OPTIONS>} Options 
     * @param {Pointer} AllocationSize 
     * @param {HANDLE} MemoryPartitionHandle 
     * @param {Pointer<TRACE_LOGFILE_HEADER>} LogFileHeader 
     * @returns {PROCESSTRACE_HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-opentracefromrealtimeloggerwithallocationoptions
     */
    static OpenTraceFromRealTimeLoggerWithAllocationOptions(LoggerName, Options, AllocationSize, MemoryPartitionHandle, LogFileHeader) {
        LoggerName := LoggerName is String ? StrPtr(LoggerName) : LoggerName
        MemoryPartitionHandle := MemoryPartitionHandle is Win32Handle ? NumGet(MemoryPartitionHandle, "ptr") : MemoryPartitionHandle

        result := DllCall("ADVAPI32.dll\OpenTraceFromRealTimeLoggerWithAllocationOptions", "ptr", LoggerName, "ptr", Options, "ptr", AllocationSize, "ptr", MemoryPartitionHandle, "ptr", LogFileHeader, "ptr")
        resultHandle := PROCESSTRACE_HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {PWSTR} LogFileName 
     * @param {Pointer<ETW_OPEN_TRACE_OPTIONS>} Options 
     * @param {Pointer<TRACE_LOGFILE_HEADER>} LogFileHeader 
     * @returns {PROCESSTRACE_HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-opentracefromfile
     */
    static OpenTraceFromFile(LogFileName, Options, LogFileHeader) {
        LogFileName := LogFileName is String ? StrPtr(LogFileName) : LogFileName

        result := DllCall("ADVAPI32.dll\OpenTraceFromFile", "ptr", LogFileName, "ptr", Options, "ptr", LogFileHeader, "ptr")
        resultHandle := PROCESSTRACE_HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {PROCESSTRACE_HANDLE} TraceHandle 
     * @param {Pointer<ETW_BUFFER_HEADER>} Buffer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-processtracebufferincrementreference
     */
    static ProcessTraceBufferIncrementReference(TraceHandle, Buffer) {
        TraceHandle := TraceHandle is Win32Handle ? NumGet(TraceHandle, "ptr") : TraceHandle

        result := DllCall("ADVAPI32.dll\ProcessTraceBufferIncrementReference", "ptr", TraceHandle, "ptr", Buffer, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<ETW_BUFFER_HEADER>} Buffer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-processtracebufferdecrementreference
     */
    static ProcessTraceBufferDecrementReference(Buffer) {
        result := DllCall("ADVAPI32.dll\ProcessTraceBufferDecrementReference", "ptr", Buffer, "uint")
        return result
    }

    /**
     * 
     * @param {PROCESSTRACE_HANDLE} TraceHandle 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/evntrace/nf-evntrace-processtraceaddbuffertobufferstream
     */
    static ProcessTraceAddBufferToBufferStream(TraceHandle, Buffer, BufferSize) {
        TraceHandle := TraceHandle is Win32Handle ? NumGet(TraceHandle, "ptr") : TraceHandle

        result := DllCall("ADVAPI32.dll\ProcessTraceAddBufferToBufferStream", "ptr", TraceHandle, "ptr", Buffer, "uint", BufferSize, "uint")
        return result
    }

    /**
     * Queries the system for the trace processing handle.
     * @param {PROCESSTRACE_HANDLE} ProcessingHandle A valid handle created with <a href="https://docs.microsoft.com/windows/desktop/ETW/opentrace">OpenTrace</a> that the data should be queried from.
     * @param {Integer} InformationClass An <a href="https://docs.microsoft.com/windows/desktop/ETW/etw-process-handle-info-type">ETW_PROCESS_HANDLE_INFO_TYPE</a> value that specifies what kind of operation will be done on the handle.
     * @param {Pointer<Void>} InBuffer Reserved for future use. May be null.
     * @param {Integer} InBufferSize Size in bytes of the <i>InBuffer</i>.
     * @param {Pointer<Void>} OutBuffer Buffer provided by the caller to contain output data.
     * @param {Integer} OutBufferSize Size in bytes of <i>OutBuffer.</i>
     * @param {Pointer<Integer>} ReturnLength The size in bytes of the data that the API wrote into <i>OutBuffer</i>.  Important for variable length returns.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-querytraceprocessinghandle
     * @since windows10.0.16299
     */
    static QueryTraceProcessingHandle(ProcessingHandle, InformationClass, InBuffer, InBufferSize, OutBuffer, OutBufferSize, ReturnLength) {
        ProcessingHandle := ProcessingHandle is Win32Handle ? NumGet(ProcessingHandle, "ptr") : ProcessingHandle

        InBufferMarshal := InBuffer is VarRef ? "ptr" : "ptr"
        OutBufferMarshal := OutBuffer is VarRef ? "ptr" : "ptr"
        ReturnLengthMarshal := ReturnLength is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\QueryTraceProcessingHandle", "ptr", ProcessingHandle, "int", InformationClass, InBufferMarshal, InBuffer, "uint", InBufferSize, OutBufferMarshal, OutBuffer, "uint", OutBufferSize, ReturnLengthMarshal, ReturnLength, "uint")
        return result
    }

    /**
     * The OpenTrace function opens a real-time trace session or log file for consuming.
     * @param {Pointer<EVENT_TRACE_LOGFILEA>} Logfile Pointer to an <a href="https://docs.microsoft.com/windows/desktop/ETW/event-trace-logfile">EVENT_TRACE_LOGFILE</a> structure. 
     *       The structure specifies the source from which to consume events (from a log file or the session in real time) 
     *       and specifies the callbacks the consumer wants to use to receive the events.
     * @returns {PROCESSTRACE_HANDLE} If the function succeeds, it returns a handle to the trace.
     * 
     * If the function fails, it returns INVALID_PROCESSTRACE_HANDLE.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">If your code base supports Windows 7 and Windows Vista, and also supports 
     *         earlier operating systems such as Windows XP and Windows Server 2003, do not use the 
     *         constants described above. Instead, determine the operating system on which you are running and compare the 
     *         return value to the following values.
     * 
     * <table>
     * <tr>
     * <th>Operating system</th>
     * <th>Application</th>
     * <th>Return value to compare</th>
     * </tr>
     * <tr>
     * <td>Windows 7 and Windows Vista</td>
     * <td>32-bit</td>
     * <td>0x00000000FFFFFFFF</td>
     * </tr>
     * <tr>
     * <td>Windows 7 and Windows Vista</td>
     * <td>64-bit</td>
     * <td>0XFFFFFFFFFFFFFFFF</td>
     * </tr>
     * <tr>
     * <td>Windows XP and Windows Server 2003</td>
     * <td>32- or 64-bit</td>
     * <td>0XFFFFFFFFFFFFFFFF</td>
     * </tr>
     * </table>
     *  
     * 
     * </div>
     * <div> </div>
     * If the function returns INVALID_PROCESSTRACE_HANDLE, you can use the 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to obtain extended error 
     *        information. The following table lists some common errors and their causes.
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
     * The <i>Logfile</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PATHNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If you did not specify the <b>LoggerName</b> member of <a href="/windows/desktop/ETW/event-trace-logfile">EVENT_TRACE_LOGFILE</a>, you must specify a valid log file name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only users with administrative privileges, users in the Performance Log Users group, and services running 
     *          as LocalSystem, LocalService, NetworkService can consume events in real time. To grant a restricted user the 
     *          ability to consume events in real time, add them to the Performance Log Users group.
     * 
     * <b>Windows XP and Windows 2000:  </b>Anyone can consume real time events.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-opentracea
     * @since windows5.0
     */
    static OpenTraceA(Logfile) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenTraceA", "ptr", Logfile, "ptr")
        if(A_LastError)
            throw OSError()

        resultHandle := PROCESSTRACE_HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * The SetTraceCallback function specifies an EventClassCallback function to process events for the specified event trace class.
     * @param {Pointer<Guid>} pGuid Pointer to the class GUID of an event trace class for which you want to receive events. For a list of 
     *       kernel provider class GUIDs, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/ETW/nt-kernel-logger-constants">NT Kernel Logger Constants</a>.
     * @param {Pointer<PEVENT_CALLBACK>} EventCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/ETW/eventclasscallback">EventClassCallback</a> 
     *       function used to process events belonging to the event trace class.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     *       
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
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
     * One of the following is true:
     * 
     * <ul>
     * <li><i>pGuid</i> is <b>NULL</b>.</li>
     * <li><i>EventCallback</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-settracecallback
     * @since windows5.0
     */
    static SetTraceCallback(pGuid, EventCallback) {
        result := DllCall("ADVAPI32.dll\SetTraceCallback", "ptr", pGuid, "ptr", EventCallback, "uint")
        return result
    }

    /**
     * The RemoveTraceCallback function stops an EventClassCallback function from receiving events for an event trace class.
     * @param {Pointer<Guid>} pGuid Pointer to the class GUID of the event trace class for which the callback receives events. Use the same 
     *       class GUID that you passed to the <a href="https://docs.microsoft.com/windows/desktop/ETW/settracecallback">SetTraceCallback</a> 
     *       to begin receiving the events.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some 
     *        common errors and their causes.
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
     * The <i>pGuid</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no <a href="/windows/desktop/ETW/eventclasscallback">EventClassCallback</a> 
     *         function associated with the event trace class.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-removetracecallback
     * @since windows5.0
     */
    static RemoveTraceCallback(pGuid) {
        result := DllCall("ADVAPI32.dll\RemoveTraceCallback", "ptr", pGuid, "uint")
        return result
    }

    /**
     * The TraceMessage function sends an informational message to an event tracing session.
     * @param {Integer} LoggerHandle Handle to the event tracing session that records the event. The provider obtains the handle when it calls the <a href="https://docs.microsoft.com/windows/desktop/ETW/gettraceloggerhandle">GetTraceLoggerHandle</a> function in its <a href="https://docs.microsoft.com/windows/desktop/ETW/controlcallback">ControlCallback</a> implementation.
     * @param {Integer} MessageFlags 
     * @param {Pointer<Guid>} MessageGuid Class GUID or component ID that identifies the message. Depends if <i>MessageFlags</i> contains the <b>TRACE_MESSAGE_COMPONENTID</b> or <b>TRACE_MESSAGE_GUID</b> flag.
     * @param {Integer} MessageNumber Number that uniquely identifies each occurrence of the message. You must define the value specified for this parameter; the value should be meaningful to the application.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either the <i>SessionHandle</i> is <b>NULL</b> or specifies the NT Kernel Logger session handle.
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
     * The session ran out of free buffers to write to. This can occur during high event rates because the disk subsystem is overloaded or the number of buffers is too small. Rather than blocking until more buffers become available, <a href="/windows/desktop/ETW/tracemessage">TraceMessage</a> discards the event.
     * 
     * <b>Windows 2000 and Windows XP:  </b>Not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The event is discarded because, although the buffer pool has not reached its maximum size, there is insufficient available memory to allocate an additional buffer and there is no buffer available to receive the event. 
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
     * <i>MessageFlags</i> contains a value that is not valid.
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
     * Data from a single event cannot span multiple buffers. A trace event is limited to the size of the event tracing session's buffer minus the size of the  
     * <a href="/windows/desktop/ETW/event-trace-header">EVENT_TRACE_HEADER</a> structure. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-tracemessage
     * @since windows5.1.2600
     */
    static TraceMessage(LoggerHandle, MessageFlags, MessageGuid, MessageNumber) {
        result := DllCall("ADVAPI32.dll\TraceMessage", "uint", LoggerHandle, "uint", MessageFlags, "ptr", MessageGuid, "ushort", MessageNumber, "CDecl uint")
        return result
    }

    /**
     * The TraceMessageVa function sends an informational message with variable arguments to an event tracing session.
     * @param {Integer} LoggerHandle Handle to the event tracing session that records the event. The provider obtains the handle when it calls the <a href="https://docs.microsoft.com/windows/desktop/ETW/gettraceloggerhandle">GetTraceLoggerHandle</a> function in its <a href="https://docs.microsoft.com/windows/desktop/ETW/controlcallback">ControlCallback</a> implementation.
     * @param {Integer} MessageFlags 
     * @param {Pointer<Guid>} MessageGuid Class GUID that identifies the event trace message.
     * @param {Integer} MessageNumber Number that uniquely identifies each occurrence of the message. You must define the value specified for this parameter; the value should be meaningful to the application.
     * @param {Pointer<Integer>} MessageArgList List of variable arguments to be appended to the message. The list must be composed of pairs of arguments, as described in the following table. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Data Type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PVOID"></a><a id="pvoid"></a><dl>
     * <dt><b>PVOID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to the argument data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="size_t"></a><a id="SIZE_T"></a><dl>
     * <dt><b>size_t</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the argument data, in bytes.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Terminate the list using an argument pair consisting of a pointer to <b>NULL</b> and zero.
     * 						
     * 						
     * 
     * The caller must ensure that the sum of the sizes of the arguments + 72 does not exceed the size of the event tracing session's buffer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, the return value is one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following table includes some common errors and their causes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either the <i>SessionHandle</i> is <b>NULL</b> or specifies the NT Kernel Logger session handle.
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
     * The session ran out of free buffers to write to. This can occur during high event rates because the disk subsystem is overloaded or the number of buffers is too small. Rather than blocking until more buffers become available, <a href="/windows/desktop/ETW/tracemessage">TraceMessage</a> discards the event.
     * 
     * <b>Windows 2000 and Windows XP:  </b>Not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The event is discarded because, although the buffer pool has not reached its maximum size, there is insufficient available memory to allocate an additional buffer and there is no buffer available to receive the event. 
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
     * <i>MessageFlags</i> contains a value that is not valid.
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
     * Data from a single event cannot span multiple buffers. A trace event is limited to the size of the event tracing session's buffer minus the size of the  
     * <a href="/windows/desktop/ETW/event-trace-header">EVENT_TRACE_HEADER</a> structure. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evntrace/nf-evntrace-tracemessageva
     * @since windows5.1.2600
     */
    static TraceMessageVa(LoggerHandle, MessageFlags, MessageGuid, MessageNumber, MessageArgList) {
        MessageArgListMarshal := MessageArgList is VarRef ? "char*" : "ptr"

        result := DllCall("ADVAPI32.dll\TraceMessageVa", "uint", LoggerHandle, "uint", MessageFlags, "ptr", MessageGuid, "ushort", MessageNumber, MessageArgListMarshal, MessageArgList, "uint")
        return result
    }

    /**
     * Registers an ETW event provider, creating a handle that can be used to write ETW events.
     * @param {Pointer<Guid>} ProviderId GUID that uniquely identifies the provider, sometimes called a control GUID.
     * This must be a stable identifier so that trace controllers can use the GUID to
     * subscribe to events from this provider.
     * @param {Pointer<PENABLECALLBACK>} EnableCallback Optional
     * [EnableCallback](/windows/win32/api/evntprov/nc-evntprov-penablecallback) that
     * ETW will invoke when a trace session enables or disables this provider. Use
     * `NULL` if no callback is needed.
     * @param {Pointer<Void>} CallbackContext Optional context data that ETW will provide when invoking _EnableCallback_. Use
     * `NULL` if no callback context is needed.
     * @param {Pointer<REGHANDLE>} RegHandle Receives the event provider registration handle. The handle is used in
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
     * @see https://docs.microsoft.com/windows/win32/api//evntprov/nf-evntprov-eventregister
     * @since windows6.0.6000
     */
    static EventRegister(ProviderId, EnableCallback, CallbackContext, RegHandle) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ADVAPI32.dll\EventRegister", "ptr", ProviderId, "ptr", EnableCallback, CallbackContextMarshal, CallbackContext, "ptr", RegHandle, "uint")
        return result
    }

    /**
     * Unregisters an ETW event provider.
     * @param {REGHANDLE} RegHandle Event provider registration handle returned by
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister).
     * @returns {Integer} Returns **ERROR_SUCCESS** if successful.
     * @see https://docs.microsoft.com/windows/win32/api//evntprov/nf-evntprov-eventunregister
     * @since windows6.0.6000
     */
    static EventUnregister(RegHandle) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ADVAPI32.dll\EventUnregister", "ptr", RegHandle, "uint")
        return result
    }

    /**
     * Configures an ETW event provider.
     * @param {REGHANDLE} RegHandle Event provider registration handle. This is a handle returned by
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister).
     * @param {Integer} InformationClass [EVENT_INFO_CLASS](/windows/desktop/api/evntprov/ne-evntprov-event_info_class)
     * value that specifies the configuration operation to be performed on the event
     * provider.
     * @param {Pointer} EventInformation Pointer to a buffer that contains data to be used when configuring the event
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
     * @see https://docs.microsoft.com/windows/win32/api//evntprov/nf-evntprov-eventsetinformation
     * @since windows8.0
     */
    static EventSetInformation(RegHandle, InformationClass, EventInformation, InformationLength) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ADVAPI32.dll\EventSetInformation", "ptr", RegHandle, "int", InformationClass, "ptr", EventInformation, "uint", InformationLength, "uint")
        return result
    }

    /**
     * Determines whether an event provider should generate a particular event based on the event's EVENT_DESCRIPTOR.
     * @param {REGHANDLE} RegHandle Registration handle of the provider. The handle comes from
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister).
     * 
     * If _RegHandle_ is **NULL**, **EventEnabled** will return **FALSE**.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor [EVENT_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_descriptor)
     * that provides information that will be used to determine whether the event is
     * enabled. This includes the event's Level (severity) and Keyword (categories).
     * @returns {BOOLEAN} Returns **FALSE** if the provider should skip generating the event, i.e. returns
     * **FALSE** if ETW can quickly determine that no event collection session would
     * record an event from the given provider with the specified descriptor. Otherwise
     * returns **TRUE**, indicating that the provider should generate the event.
     * @see https://docs.microsoft.com/windows/win32/api//evntprov/nf-evntprov-eventenabled
     * @since windows6.0.6000
     */
    static EventEnabled(RegHandle, EventDescriptor) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ADVAPI32.dll\EventEnabled", "ptr", RegHandle, "ptr", EventDescriptor, "char")
        return result
    }

    /**
     * Determines whether an event provider should generate a particular event based on the event's Level and Keyword.
     * @remarks
     * 
     * This API provides a simple way to determine whether an event is enabled (i.e.
     * whether any event consumer sessions are interested in receiving the event) based
     * on the provider handle, the event level, and the event keyword.
     * 
     * > **Note:** This API performs a conservative quick test. It is possible for this
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
     * 
     * 
     * @param {REGHANDLE} RegHandle Registration handle of the provider. The handle comes from
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
     * @returns {BOOLEAN} 
     * @see https://docs.microsoft.com/windows/win32/api//evntprov/nf-evntprov-eventproviderenabled
     * @since windows6.0.6000
     */
    static EventProviderEnabled(RegHandle, Level, Keyword) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ADVAPI32.dll\EventProviderEnabled", "ptr", RegHandle, "char", Level, "uint", Keyword, "char")
        return result
    }

    /**
     * Writes an ETW event that uses the current thread's activity ID.
     * @param {REGHANDLE} RegHandle Registration handle of the provider. The handle comes from
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister). The
     * generated event will use the ProviderId associated with the handle.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor [EVENT_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_descriptor)
     * with event information (metadata) including ID, Version, Level, Keyword,
     * Channel, Opcode, and Task.
     * 
     * > **Important:** ProviderId, Level and Keyword are the primary means for
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
     * @see https://docs.microsoft.com/windows/win32/api//evntprov/nf-evntprov-eventwrite
     * @since windows6.0.6000
     */
    static EventWrite(RegHandle, EventDescriptor, UserDataCount, UserData) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ADVAPI32.dll\EventWrite", "ptr", RegHandle, "ptr", EventDescriptor, "uint", UserDataCount, "ptr", UserData, "uint")
        return result
    }

    /**
     * Writes an ETW event with an activity ID and an optional related activity ID.
     * @param {REGHANDLE} RegHandle Registration handle of the provider. The handle comes from
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister). The
     * generated event will use the ProviderId associated with the handle.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor [EVENT_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_descriptor)
     * with event information (metadata) including ID, Version, Level, Keyword,
     * Channel, Opcode, and Task.
     * 
     * > **Important:** ProviderId, Level and Keyword are the primary means for
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
     * @see https://docs.microsoft.com/windows/win32/api//evntprov/nf-evntprov-eventwritetransfer
     * @since windows6.0.6000
     */
    static EventWriteTransfer(RegHandle, EventDescriptor, ActivityId, RelatedActivityId, UserDataCount, UserData) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ADVAPI32.dll\EventWriteTransfer", "ptr", RegHandle, "ptr", EventDescriptor, "ptr", ActivityId, "ptr", RelatedActivityId, "uint", UserDataCount, "ptr", UserData, "uint")
        return result
    }

    /**
     * Writes an ETW event with an activity ID, an optional related activity ID, session filters, and special options.
     * @param {REGHANDLE} RegHandle Registration handle of the provider. The handle comes from
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister). The
     * generated event will use the ProviderId associated with the handle.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor [EVENT_DESCRIPTOR](/windows/desktop/api/evntprov/ns-evntprov-event_descriptor)
     * with event information (metadata) including ID, Version, Level, Keyword,
     * Channel, Opcode, and Task.
     * 
     * > **Important:** ProviderId, Level and Keyword are the primary means for
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
     * @see https://docs.microsoft.com/windows/win32/api//evntprov/nf-evntprov-eventwriteex
     * @since windows6.1
     */
    static EventWriteEx(RegHandle, EventDescriptor, Filter, Flags, ActivityId, RelatedActivityId, UserDataCount, UserData) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle

        result := DllCall("ADVAPI32.dll\EventWriteEx", "ptr", RegHandle, "ptr", EventDescriptor, "uint", Filter, "uint", Flags, "ptr", ActivityId, "ptr", RelatedActivityId, "uint", UserDataCount, "ptr", UserData, "uint")
        return result
    }

    /**
     * Writes an ETW event that contains a string as its data. This function should not be used.
     * @param {REGHANDLE} RegHandle Registration handle of the provider. The handle comes from
     * [EventRegister](/windows/desktop/api/evntprov/nf-evntprov-eventregister). The
     * generated event will use the ProviderId associated with the handle.
     * @param {Integer} Level An 8-bit number used to describe an event's severity or importance.
     * 
     * > **Important:** ProviderId, Level and Keyword are the primary means for
     * > filtering events. Other kinds of filtering are possible but have much higher
     * > overhead. Always assign a nonzero level and keyword to every event.
     * 
     * See [EVENT_DESCRIPTOR](nf-evntprov-eventdatadesccreate.md) for details about the
     * event level.
     * @param {Integer} Keyword A 64-bit bitmask used to indicate an event's membership in a set of event
     * categories.
     * 
     * > **Important:** ProviderId, Level and Keyword are the primary means for
     * > filtering events. Other kinds of filtering are possible but have much higher
     * > overhead. Always assign a nonzero level and keyword to every event.
     * 
     * See [EVENT_DESCRIPTOR](nf-evntprov-eventdatadesccreate.md) for details about the
     * event keyword.
     * @param {PWSTR} String NUL-terminated string to write as the event data.
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
     * @see https://docs.microsoft.com/windows/win32/api//evntprov/nf-evntprov-eventwritestring
     * @since windows6.0.6000
     */
    static EventWriteString(RegHandle, Level, Keyword, String) {
        RegHandle := RegHandle is Win32Handle ? NumGet(RegHandle, "ptr") : RegHandle
        String := String is String ? StrPtr(String) : String

        result := DllCall("ADVAPI32.dll\EventWriteString", "ptr", RegHandle, "char", Level, "uint", Keyword, "ptr", String, "uint")
        return result
    }

    /**
     * Creates, queries, and sets activity identifiers for use in ETW events.
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
     * @see https://docs.microsoft.com/windows/win32/api//evntprov/nf-evntprov-eventactivityidcontrol
     * @since windows6.0.6000
     */
    static EventActivityIdControl(ControlCode, ActivityId) {
        result := DllCall("ADVAPI32.dll\EventActivityIdControl", "uint", ControlCode, "ptr", ActivityId, "uint")
        return result
    }

    /**
     * Adds or modifies the permissions of the specified provider or session.
     * @param {Pointer<Guid>} Guid GUID that uniquely identifies the provider or session whose permissions you want to add or modify.
     * @param {Integer} Operation Type of operation to perform, for example, add a DACL to the session's GUID or provider's GUID. For 
     *       possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ne-evntcons-eventsecurityoperation">EVENTSECURITYOPERATION</a> 
     *       enumeration.
     * @param {PSID} Sid The security identifier (SID) of the user  or group to whom you want to grant or deny permissions.
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
     * @param {BOOLEAN} AllowOrDeny If <b>TRUE</b>, grant the user permissions to the session or provider; otherwise, deny 
     *       permissions. This value is ignored if the value of <i>Operation</i> is EventSecuritySetSACL 
     *       or EventSecurityAddSACL.
     * @returns {Integer} Returns ERROR_SUCCESS if successful.
     * @see https://docs.microsoft.com/windows/win32/api//evntcons/nf-evntcons-eventaccesscontrol
     * @since windows6.0.6000
     */
    static EventAccessControl(Guid, Operation, Sid, Rights, AllowOrDeny) {
        result := DllCall("ADVAPI32.dll\EventAccessControl", "ptr", Guid, "uint", Operation, "ptr", Sid, "uint", Rights, "char", AllowOrDeny, "uint")
        return result
    }

    /**
     * Retrieves the permissions for the specified controller or provider.
     * @param {Pointer<Guid>} Guid GUID that uniquely identifies the provider or session.
     * @param {Pointer} Buffer Application-allocated buffer that will contain the security descriptor of the controller or provider.
     * @param {Pointer<Integer>} BufferSize Size of the security descriptor buffer, in bytes. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_MORE_DATA and this parameter receives the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
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
     * @see https://docs.microsoft.com/windows/win32/api//evntcons/nf-evntcons-eventaccessquery
     * @since windows6.0.6000
     */
    static EventAccessQuery(Guid, Buffer, BufferSize) {
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ADVAPI32.dll\EventAccessQuery", "ptr", Guid, "ptr", Buffer, BufferSizeMarshal, BufferSize, "uint")
        return result
    }

    /**
     * Removes the permissions defined in the registry for the specified provider or session.
     * @param {Pointer<Guid>} Guid GUID that uniquely identifies the provider or session whose permissions you want to remove from the 
     *       registry.
     * @returns {Integer} Returns ERROR_SUCCESS if successful.
     * @see https://docs.microsoft.com/windows/win32/api//evntcons/nf-evntcons-eventaccessremove
     * @since windows6.0.6000
     */
    static EventAccessRemove(Guid) {
        result := DllCall("ADVAPI32.dll\EventAccessRemove", "ptr", Guid, "uint")
        return result
    }

    /**
     * Creates a single filter for a single payload to be used with the EnableTraceEx2 function.
     * @param {Pointer<Guid>} ProviderGuid A GUID that identifies the manifest provider of the <i>EventDescriptor</i> parameter.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor A pointer to the event descriptor whose payload will be filtered.
     * @param {BOOLEAN} EventMatchANY A Boolean value that indicates how events are handled when multiple conditions are specified.
     * 
     * When this parameter is <b>TRUE</b>, an event will be written to a session if any of
     *         the specified conditions specified in the filter are  <b>TRUE</b>.
     * 
     * When this parameter is <b>FALSE</b>, an event will be written to a session only if all of
     *         the specified conditions specified in the filter are  <b>TRUE</b>.
     * @param {Integer} PayloadPredicateCount The number of conditions specified in the filter.
     *         This value must be less than or equal to the <b>ETW_MAX_PAYLOAD_PREDICATES</b> constant defined in the <i>Tdh.h</i> header file.
     * @param {Pointer<PAYLOAD_FILTER_PREDICATE>} PayloadPredicates A pointer to an array of  <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-payload_filter_predicate">PAYLOAD_FILTER_PREDICATE</a> structures that contain the list conditions that the filter specifies.
     * @param {Pointer<Pointer<Void>>} PayloadFilter On success, this parameter returns a pointer to a single payload filter that is properly sized and built for the specified conditions.
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
     *         the <b>MAX_EVENT_FILTER_PAYLOAD_SIZE</b> limit imposed by the <a href="/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function
     *         on the <a href="/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structures in a payload.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhcreatepayloadfilter
     * @since windows8.1
     */
    static TdhCreatePayloadFilter(ProviderGuid, EventDescriptor, EventMatchANY, PayloadPredicateCount, PayloadPredicates, PayloadFilter) {
        PayloadFilterMarshal := PayloadFilter is VarRef ? "ptr*" : "ptr"

        result := DllCall("tdh.dll\TdhCreatePayloadFilter", "ptr", ProviderGuid, "ptr", EventDescriptor, "char", EventMatchANY, "uint", PayloadPredicateCount, "ptr", PayloadPredicates, PayloadFilterMarshal, PayloadFilter, "uint")
        return result
    }

    /**
     * Frees the memory allocated for a single payload filter by the TdhCreatePayloadFilter function.
     * @param {Pointer<Pointer<Void>>} PayloadFilter A pointer to a single payload filter allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhcreatepayloadfilter">TdhCreatePayloadFilter</a> function.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhdeletepayloadfilter
     * @since windows8.1
     */
    static TdhDeletePayloadFilter(PayloadFilter) {
        PayloadFilterMarshal := PayloadFilter is VarRef ? "ptr*" : "ptr"

        result := DllCall("tdh.dll\TdhDeletePayloadFilter", PayloadFilterMarshal, PayloadFilter, "uint")
        return result
    }

    /**
     * Aggregates multiple payload filters for a single provider into a single data structure for use with the EnableTraceEx2 function.
     * @param {Integer} PayloadFilterCount The count of payload filters.
     * @param {Pointer<Pointer<Void>>} PayloadFilterPtrs An array of event payload single filters,
     *         each created by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhcreatepayloadfilter">TdhCreatePayloadFilter</a>  function.
     * @param {Pointer<BOOLEAN>} EventMatchALLFlags An array of Boolean values  that correspond to
     *         each payload filter passed in the <i>PayloadFilterPtrs</i> parameter and indicates how events are handled when multiple conditions are specified..  This parameter only affects situations where multiple
     *         payload filters are being specified for the same event.  
     * 
     * When a Boolean value is <b>TRUE</b>, an event will be written to a session if any of
     *         the specified conditions specified in the filter are  <b>TRUE</b>. If this flag is set to <b>TRUE</b> on one or more filters for
     *         the same event Id or event version, then the event is only written if all
     *         the flagged filters for the event are satisfied.
     * 
     * 
     * When a Boolean value is <b>FALSE</b>, an event will be written to a session only if all of
     *         the specified conditions specified in the filter are  <b>TRUE</b>. If this flag is set to <b>FALSE</b> on one or more filters for
     *         the same event Id or event version, then the event is written if any of
     *         the non-flagged filters are satisfied.
     * @param {Pointer<EVENT_FILTER_DESCRIPTOR>} EventFilterDescriptor A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structure to be used with the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function.  The <b>EVENT_FILTER_DESCRIPTOR</b> structure will
     *         contain a pointer to the aggregated payload filters, which have been
     *         allocated by this function.  
     * 
     * When the caller is finished using this
     *         <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_filter_descriptor">EVENT_FILTER_DESCRIPTOR</a> structure with the <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletraceex2">EnableTraceEx2</a> function,  the  <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhcleanuppayloadeventfilterdescriptor">TdhCleanupPayloadEventFilterDescriptor</a>  function should be called to free the allocated memory.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhaggregatepayloadfilters
     * @since windows8.1
     */
    static TdhAggregatePayloadFilters(PayloadFilterCount, PayloadFilterPtrs, EventMatchALLFlags, EventFilterDescriptor) {
        PayloadFilterPtrsMarshal := PayloadFilterPtrs is VarRef ? "ptr*" : "ptr"
        EventMatchALLFlagsMarshal := EventMatchALLFlags is VarRef ? "char*" : "ptr"

        result := DllCall("tdh.dll\TdhAggregatePayloadFilters", "uint", PayloadFilterCount, PayloadFilterPtrsMarshal, PayloadFilterPtrs, EventMatchALLFlagsMarshal, EventMatchALLFlags, "ptr", EventFilterDescriptor, "uint")
        return result
    }

    /**
     * Frees the aggregated structure of payload filters created using the TdhAggregatePayloadFilters function.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhcleanuppayloadeventfilterdescriptor
     * @since windows8.1
     */
    static TdhCleanupPayloadEventFilterDescriptor(EventFilterDescriptor) {
        result := DllCall("tdh.dll\TdhCleanupPayloadEventFilterDescriptor", "ptr", EventFilterDescriptor, "uint")
        return result
    }

    /**
     * Retrieves metadata about an event.
     * @param {Pointer<EVENT_RECORD>} Event The event record passed to your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a> structure.
     * @param {Integer} TdhContextCount Number of elements in <i>pTdhContext</i>.
     * @param {Pointer<TDH_CONTEXT>} TdhContext Array of context values for WPP or classic ETW events only; otherwise, <b>NULL</b>. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-tdh_context">TDH_CONTEXT</a> structure.  The array must not contain duplicate context types.
     * @param {Pointer} Buffer User-allocated buffer to receive the event information. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-trace_event_info">TRACE_EVENT_INFO</a> structure.
     * @param {Pointer<Integer>} BufferSize Size, in bytes, of the <i>pBuffer</i> buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhgeteventinformation
     * @since windows6.0.6000
     */
    static TdhGetEventInformation(Event, TdhContextCount, TdhContext, Buffer, BufferSize) {
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TDH.dll\TdhGetEventInformation", "ptr", Event, "uint", TdhContextCount, "ptr", TdhContext, "ptr", Buffer, BufferSizeMarshal, BufferSize, "uint")
        return result
    }

    /**
     * Retrieves information about the event map contained in the event.
     * @param {Pointer<EVENT_RECORD>} pEvent The event record passed to your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a> structure.
     * @param {PWSTR} pMapName Null-terminated Unicode string that contains the name of the map attribute value. The name comes from the <b>MapNameOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structure.
     * @param {Pointer} pBuffer User-allocated buffer to receive the event map. The map could be a value map, bitmap, or pattern map. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_map_info">EVENT_MAP_INFO</a> structure.
     * @param {Pointer<Integer>} pBufferSize Size, in bytes, of the <i>pBuffer</i> buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhgeteventmapinformation
     * @since windows6.0.6000
     */
    static TdhGetEventMapInformation(pEvent, pMapName, pBuffer, pBufferSize) {
        pMapName := pMapName is String ? StrPtr(pMapName) : pMapName

        pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TDH.dll\TdhGetEventMapInformation", "ptr", pEvent, "ptr", pMapName, "ptr", pBuffer, pBufferSizeMarshal, pBufferSize, "uint")
        return result
    }

    /**
     * Retrieves the size of one or more property values in the event data.
     * @param {Pointer<EVENT_RECORD>} pEvent The event record passed to your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a> structure.
     * @param {Integer} TdhContextCount Number of elements in <i>pTdhContext</i>.
     * @param {Pointer<TDH_CONTEXT>} pTdhContext Array of context values for WPP or classic ETW events only, otherwise, <b>NULL</b>. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-tdh_context">TDH_CONTEXT</a> structure.  The array must not contain duplicate context types.
     * @param {Integer} PropertyDataCount Number of data descriptor structures in <i>pPropertyData</i>.
     * @param {Pointer<PROPERTY_DATA_DESCRIPTOR>} pPropertyData Array of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-property_data_descriptor">PROPERTY_DATA_DESCRIPTOR</a> structures that define the property whose size you want to retrieve.
     * 
     * You can pass this same array  to the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgetproperty">TdhGetProperty</a> function to retrieve the property data.
     * 
     * If you are retrieving the size of a property that is not a member of a structure, you can specify a single data descriptor. If you are retrieving the size of a property that is a member of a structure, specify an array of two  data descriptors (structures cannot contain or reference other structures). For more information on specifying this parameter, see the example code below.
     * @param {Pointer<Integer>} pPropertySize Size of the property, in bytes. Use this value to allocate the buffer passed in the <i>pBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgetproperty">TdhGetProperty</a> function.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhgetpropertysize
     * @since windows6.0.6000
     */
    static TdhGetPropertySize(pEvent, TdhContextCount, pTdhContext, PropertyDataCount, pPropertyData, pPropertySize) {
        pPropertySizeMarshal := pPropertySize is VarRef ? "uint*" : "ptr"

        result := DllCall("TDH.dll\TdhGetPropertySize", "ptr", pEvent, "uint", TdhContextCount, "ptr", pTdhContext, "uint", PropertyDataCount, "ptr", pPropertyData, pPropertySizeMarshal, pPropertySize, "uint")
        return result
    }

    /**
     * Retrieves a property value from the event data.
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
     * @param {Pointer} pBuffer User-allocated buffer that receives the property data.
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
     * The pBuffer buffer is too small. To get the required buffer size, call <a href="/windows/desktop/api/tdh/nf-tdh-tdhgetpropertysize">TdhGetPropertySize</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhgetproperty
     * @since windows6.0.6000
     */
    static TdhGetProperty(pEvent, TdhContextCount, pTdhContext, PropertyDataCount, pPropertyData, BufferSize, pBuffer) {
        result := DllCall("TDH.dll\TdhGetProperty", "ptr", pEvent, "uint", TdhContextCount, "ptr", pTdhContext, "uint", PropertyDataCount, "ptr", pPropertyData, "uint", BufferSize, "ptr", pBuffer, "uint")
        return result
    }

    /**
     * Retrieves a list of providers that have registered a MOF class or manifest file on the computer.
     * @param {Pointer} pBuffer Array of providers that publicly define  their events on the computer. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_enumeration_info">PROVIDER_ENUMERATION_INFO</a> structure.
     * @param {Pointer<Integer>} pBufferSize Size, in bytes, of the <i>pBuffer</i> buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
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
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhenumerateproviders
     * @since windows6.0.6000
     */
    static TdhEnumerateProviders(pBuffer, pBufferSize) {
        pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TDH.dll\TdhEnumerateProviders", "ptr", pBuffer, pBufferSizeMarshal, pBufferSize, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} filter 
     * @param {Pointer} buffer 
     * @param {Integer} bufferSize 
     * @param {Pointer<Integer>} bufferRequired 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhenumerateprovidersfordecodingsource
     */
    static TdhEnumerateProvidersForDecodingSource(filter, buffer, bufferSize, bufferRequired) {
        bufferRequiredMarshal := bufferRequired is VarRef ? "uint*" : "ptr"

        result := DllCall("tdh.dll\TdhEnumerateProvidersForDecodingSource", "int", filter, "ptr", buffer, "uint", bufferSize, bufferRequiredMarshal, bufferRequired, "uint")
        return result
    }

    /**
     * Retrieves information for the specified field from the event descriptions for those field values that match the given value.
     * @param {Pointer<Guid>} pGuid GUID that identifies the provider whose information you want to retrieve.
     * @param {Integer} EventFieldValue Retrieve information about the field if the field's value matches this value. If the field type is a keyword, the information is retrieved for each event keyword bit contained in the mask.
     * @param {Integer} EventFieldType Specify the type of field for which you want to retrieve information. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-event_field_type">EVENT_FIELD_TYPE</a> enumeration.
     * @param {Pointer} pBuffer User-allocated buffer to receive the field information. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_field_infoarray">PROVIDER_FIELD_INFOARRAY</a> structure.
     * @param {Pointer<Integer>} pBufferSize Size, in bytes, of the <i>pBuffer</i> buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhqueryproviderfieldinformation
     * @since windows6.0.6000
     */
    static TdhQueryProviderFieldInformation(pGuid, EventFieldValue, EventFieldType, pBuffer, pBufferSize) {
        pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TDH.dll\TdhQueryProviderFieldInformation", "ptr", pGuid, "uint", EventFieldValue, "int", EventFieldType, "ptr", pBuffer, pBufferSizeMarshal, pBufferSize, "uint")
        return result
    }

    /**
     * Retrieves the specified field metadata for a given provider.
     * @param {Pointer<Guid>} pGuid GUID that identifies the provider whose information you want to retrieve.
     * @param {Integer} EventFieldType Specify the type of field for which you want to retrieve information. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-event_field_type">EVENT_FIELD_TYPE</a> enumeration.
     * @param {Pointer} pBuffer User-allocated buffer to receive the field information. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_field_infoarray">PROVIDER_FIELD_INFOARRAY</a> structure.
     * @param {Pointer<Integer>} pBufferSize Size, in bytes, of the <i>pBuffer</i> buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhenumerateproviderfieldinformation
     * @since windows6.0.6000
     */
    static TdhEnumerateProviderFieldInformation(pGuid, EventFieldType, pBuffer, pBufferSize) {
        pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TDH.dll\TdhEnumerateProviderFieldInformation", "ptr", pGuid, "int", EventFieldType, "ptr", pBuffer, pBufferSizeMarshal, pBufferSize, "uint")
        return result
    }

    /**
     * Enumerates the filters that the specified provider defined in the manifest.
     * @param {Pointer<Guid>} Guid GUID that identifies the provider whose filters you want to retrieve.
     * @param {Integer} TdhContextCount Not used.
     * @param {Pointer<TDH_CONTEXT>} TdhContext Not used.
     * @param {Pointer<Integer>} FilterCount The number of filter structures that the <i>pBuffer</i> buffer contains. Is zero if the <i>pBuffer</i> buffer is insufficient.
     * @param {Pointer} Buffer User-allocated buffer to receive the filter information. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_filter_info">PROVIDER_FILTER_INFO</a> structure.
     * @param {Pointer<Integer>} BufferSize Size, in bytes, of the <i>pBuffer</i> buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhenumerateproviderfilters
     * @since windows6.1
     */
    static TdhEnumerateProviderFilters(Guid, TdhContextCount, TdhContext, FilterCount, Buffer, BufferSize) {
        FilterCountMarshal := FilterCount is VarRef ? "uint*" : "ptr"
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("tdh.dll\TdhEnumerateProviderFilters", "ptr", Guid, "uint", TdhContextCount, "ptr", TdhContext, FilterCountMarshal, FilterCount, "ptr", Buffer, BufferSizeMarshal, BufferSize, "uint")
        return result
    }

    /**
     * Loads the manifest used to decode a log file.
     * @param {PWSTR} Manifest The full path to the manifest.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhloadmanifest
     * @since windows6.1
     */
    static TdhLoadManifest(Manifest) {
        Manifest := Manifest is String ? StrPtr(Manifest) : Manifest

        result := DllCall("TDH.dll\TdhLoadManifest", "ptr", Manifest, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {Integer} cbData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhloadmanifestfrommemory
     */
    static TdhLoadManifestFromMemory(pData, cbData) {
        result := DllCall("TDH.dll\TdhLoadManifestFromMemory", "ptr", pData, "uint", cbData, "uint")
        return result
    }

    /**
     * Unloads the manifest that was loaded by the TdhLoadManifest function.
     * @param {PWSTR} Manifest The full path to the loaded manifest.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhunloadmanifest
     * @since windows6.1
     */
    static TdhUnloadManifest(Manifest) {
        Manifest := Manifest is String ? StrPtr(Manifest) : Manifest

        result := DllCall("TDH.dll\TdhUnloadManifest", "ptr", Manifest, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer} pData 
     * @param {Integer} cbData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tdh/nf-tdh-tdhunloadmanifestfrommemory
     */
    static TdhUnloadManifestFromMemory(pData, cbData) {
        result := DllCall("TDH.dll\TdhUnloadManifestFromMemory", "ptr", pData, "uint", cbData, "uint")
        return result
    }

    /**
     * Formats a property value for display.
     * @param {Pointer<TRACE_EVENT_INFO>} EventInfo A <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-trace_event_info">TRACE_EVENT_INFO</a> structure that contains the event information. To get this structure, call the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgeteventinformation">TdhGetEventInformation</a> function.
     * @param {Pointer<EVENT_MAP_INFO>} MapInfo An <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_map_info">EVENT_MAP_INFO</a> structure that maps integer and bit values to strings. To get this structure, call the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgeteventmapinformation">TdhGetEventMapInformation</a> function. To get the name of the map, use the <b>MapNameOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structure. If you do not provide the map information for a mapped property, the function formats the integer or bit value.
     * @param {Integer} PointerSize The size of a pointer value in the event data. To get the size, access the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header">EVENT_RECORD.EventHeader.Flags</a> member. The pointer size is 4 bytes if the EVENT_HEADER_FLAG_32_BIT_HEADER flag is set; otherwise, it is 8 bytes if the EVENT_HEADER_FLAG_64_BIT_HEADER flag is set. The <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">EVENT_RECORD</a> structure is passed to your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback function.
     * @param {Integer} PropertyInType The input type of the property. Use the <b>InType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structure to set this parameter.
     * @param {Integer} PropertyOutType The output type of the property. Use the <b>OutType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structure to set this parameter.
     * @param {Integer} PropertyLength The length, in bytes, of the property. Use the <b>Length</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structure to set this parameter.
     * @param {Integer} UserDataLength The size, in bytes, of the <i>UserData</i> buffer. See Remarks.
     * @param {Pointer} UserData The buffer that contains the event data. See Remarks.
     * @param {Pointer<Integer>} BufferSize The size, in bytes, of the <i>Buffer</i> buffer. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns ERROR_INSUFFICIENT_BUFFER and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
     * @param {Pointer} Buffer A caller-allocated buffer that contains the formatted property value. To determine the required buffer size, set this parameterto <b>NULL</b> and <i>BufferSize</i> to zero.
     * @param {Pointer<Integer>} UserDataConsumed The length, in bytes, of the consumed event data. Use this value to adjust the values of the <i>UserData</i> and <i>UserDataLength</i> parameters. See Remarks.
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
     * <dt><b>ERROR_EVT_INVALID_EVENT_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The event data does not match the event definition in the manifest.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhformatproperty
     * @since windows6.1
     */
    static TdhFormatProperty(EventInfo, MapInfo, PointerSize, PropertyInType, PropertyOutType, PropertyLength, UserDataLength, UserData, BufferSize, Buffer, UserDataConsumed) {
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        UserDataConsumedMarshal := UserDataConsumed is VarRef ? "ushort*" : "ptr"

        result := DllCall("TDH.dll\TdhFormatProperty", "ptr", EventInfo, "ptr", MapInfo, "uint", PointerSize, "ushort", PropertyInType, "ushort", PropertyOutType, "ushort", PropertyLength, "ushort", UserDataLength, "ptr", UserData, BufferSizeMarshal, BufferSize, "ptr", Buffer, UserDataConsumedMarshal, UserDataConsumed, "uint")
        return result
    }

    /**
     * Opens a decoding handle.
     * @param {Pointer<TDH_HANDLE>} Handle Type: <b>PTDH_HANDLE</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhopendecodinghandle
     * @since windows8.0
     */
    static TdhOpenDecodingHandle(Handle) {
        result := DllCall("tdh.dll\TdhOpenDecodingHandle", "ptr", Handle, "uint")
        return result
    }

    /**
     * Sets the value of a decoding parameter.
     * @param {TDH_HANDLE} Handle Type: <b>TDH_HANDLE</b>
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
     * One or more of the parameters is incorrect. This error is returned if the <i>Handle</i> or <i>TdhContext</i>   parameter is <b>NULL</b>. This error is also returned if the <b>ParameterValue</b> member of the <a href="/windows/desktop/api/tdh/ns-tdh-tdh_context">TDH_CONTEXT</a> struct pointed to by the <i>TdhContext</i>   parameter does not exist.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhsetdecodingparameter
     * @since windows8.0
     */
    static TdhSetDecodingParameter(Handle, TdhContext) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("tdh.dll\TdhSetDecodingParameter", "ptr", Handle, "ptr", TdhContext, "uint")
        return result
    }

    /**
     * Retrieves the value of a decoding parameter.
     * @param {TDH_HANDLE} Handle Type: <b>TDH_HANDLE</b>
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
     * One or more of the parameters is incorrect. This error is returned if the <i>Handle</i> or <i>TdhContext</i>   parameter is <b>NULL</b>. This error is also returned if the <b>ParameterValue</b> member of the <a href="/windows/desktop/api/tdh/ns-tdh-tdh_context">TDH_CONTEXT</a> struct pointed to by the <i>TdhContext</i>   parameter does not exist.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhgetdecodingparameter
     * @since windows8.0
     */
    static TdhGetDecodingParameter(Handle, TdhContext) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("tdh.dll\TdhGetDecodingParameter", "ptr", Handle, "ptr", TdhContext, "uint")
        return result
    }

    /**
     * Retrieves a specific property associated with a WPP message.
     * @param {TDH_HANDLE} Handle Type: <b>TDH_HANDLE</b>
     * 
     * A valid decoding handle.
     * @param {Pointer<EVENT_RECORD>} EventRecord Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">PEVENT_RECORD</a></b>
     * 
     * The event record passed to your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback.
     * @param {PWSTR} PropertyName Type: <b>PWSTR</b>
     * 
     * The name of the property to retrieve.
     * 
     * For a list of  possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-property_data_descriptor">PROPERTY_DATA_DESCRIPTOR</a>.
     * @param {Pointer<Integer>} BufferSize Type: <b>PULONG</b>
     * 
     * Size of the <i>Buffer</i> parameter, in bytes.
     * @param {Pointer} Buffer Type: <b>PBYTE</b>
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
     * <i>BufferSize</i> is too small. To get the required buffer size, call <a href="/windows/desktop/api/tdh/nf-tdh-tdhgetwppproperty">TdhGetWppProperty</a> twice, once with a null buffer and a pointer to retrieve the buffer size and then again with the correctly sized buffer.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhgetwppproperty
     * @since windows8.0
     */
    static TdhGetWppProperty(Handle, EventRecord, PropertyName, BufferSize, Buffer) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle
        PropertyName := PropertyName is String ? StrPtr(PropertyName) : PropertyName

        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("tdh.dll\TdhGetWppProperty", "ptr", Handle, "ptr", EventRecord, "ptr", PropertyName, BufferSizeMarshal, BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * Retrieves the formatted WPP message embedded into an EVENT_RECORD structure.
     * @param {TDH_HANDLE} Handle Type: <b>TDH_HANDLE</b>
     * 
     * A valid decoding handle.
     * @param {Pointer<EVENT_RECORD>} EventRecord Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_record">PEVENT_RECORD</a></b>
     * 
     * The event record passed to your <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback.
     * @param {Pointer<Integer>} BufferSize Type: <b>PULONG</b>
     * 
     * Size of the <i>Buffer</i> parameter, in bytes.
     * @param {Pointer} Buffer Type: <b>PBYTE</b>
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
     * <i>BufferSize</i> is too small. To get the required buffer size, call <a href="/windows/desktop/api/tdh/nf-tdh-tdhgetpropertysize">TdhGetPropertySize</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhgetwppmessage
     * @since windows8.0
     */
    static TdhGetWppMessage(Handle, EventRecord, BufferSize, Buffer) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("tdh.dll\TdhGetWppMessage", "ptr", Handle, "ptr", EventRecord, BufferSizeMarshal, BufferSize, "ptr", Buffer, "uint")
        return result
    }

    /**
     * Frees any resources associated with the input decoding handle.
     * @param {TDH_HANDLE} Handle Type: <b>TDH_HANDLE</b>
     * 
     * The decoding handle to be closed.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * This function returns ERROR_SUCCESS on completion.
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhclosedecodinghandle
     * @since windows8.0
     */
    static TdhCloseDecodingHandle(Handle) {
        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("tdh.dll\TdhCloseDecodingHandle", "ptr", Handle, "uint")
        return result
    }

    /**
     * Takes a NULL-terminated path to a binary file that contains metadata resources needed to decode a specific event provider.
     * @param {PWSTR} BinaryPath Type: <b>PWSTR</b>
     * 
     * Path to the ETW provider binary that contains the metadata resources.
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
     * The file pointed to by <i>BinaryPath</i> was not found.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file does not contain any eventing metadata resources.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhloadmanifestfrombinary
     * @since windows8.0
     */
    static TdhLoadManifestFromBinary(BinaryPath) {
        BinaryPath := BinaryPath is String ? StrPtr(BinaryPath) : BinaryPath

        result := DllCall("tdh.dll\TdhLoadManifestFromBinary", "ptr", BinaryPath, "uint")
        return result
    }

    /**
     * Retrieves the list of events present in the provider manifest.
     * @param {Pointer<Guid>} ProviderGuid A GUID that identifies the manifest provider whose list of events you want to retrieve.
     * @param {Pointer} Buffer A user-allocated buffer to receive the list of events. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_event_info">PROVIDER_EVENT_INFO</a>  structure.
     * @param {Pointer<Integer>} BufferSize The size, in bytes, of the buffer pointed to by the <i>ProviderInfo</i> parameter. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns <b>ERROR_INSUFFICIENT_BUFFER</b> and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhenumeratemanifestproviderevents
     * @since windows8.1
     */
    static TdhEnumerateManifestProviderEvents(ProviderGuid, Buffer, BufferSize) {
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TDH.dll\TdhEnumerateManifestProviderEvents", "ptr", ProviderGuid, "ptr", Buffer, BufferSizeMarshal, BufferSize, "uint")
        return result
    }

    /**
     * Retrieves metadata about an event in a manifest.
     * @param {Pointer<Guid>} ProviderGuid A GUID that identifies the manifest provider whose event metadata you want to retrieve.
     * @param {Pointer<EVENT_DESCRIPTOR>} EventDescriptor A pointer to the event descriptor that contains information such as event id, version, op-code, and keyword. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_descriptor">EVENT_DESCRIPTOR</a> structure
     * @param {Pointer} Buffer A user-allocated buffer to receive the metadata about an event in  a provider manifest. For details, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-trace_event_info">TRACE_EVENT_INFO</a> structure.
     * @param {Pointer<Integer>} BufferSize The size, in bytes, of the buffer pointed to by the <i>Buffer</i> parameter. If the function succeeds, this parameter receives the size of the buffer used. If the buffer is too small, the function returns <b>ERROR_INSUFFICIENT_BUFFER</b> and sets this parameter to the required buffer size. If the buffer size is zero on input, no data is returned in the buffer and this parameter receives the required buffer size.
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
     * @see https://docs.microsoft.com/windows/win32/api//tdh/nf-tdh-tdhgetmanifesteventinformation
     * @since windows8.1
     */
    static TdhGetManifestEventInformation(ProviderGuid, EventDescriptor, Buffer, BufferSize) {
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("TDH.dll\TdhGetManifestEventInformation", "ptr", ProviderGuid, "ptr", EventDescriptor, "ptr", Buffer, BufferSizeMarshal, BufferSize, "uint")
        return result
    }

    /**
     * A tracing function for publishing events when an attempted security vulnerability exploit is detected in your user-mode application.
     * @param {PWSTR} CveId A pointer to the CVE ID associated with the vulnerability for which this event is being raised.
     * @param {PWSTR} AdditionalDetails A pointer to a string giving additional details that the event producer may want to provide to the consumer of this event.
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
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-cveeventwrite
     * @since windows10.0.10240
     */
    static CveEventWrite(CveId, AdditionalDetails) {
        CveId := CveId is String ? StrPtr(CveId) : CveId
        AdditionalDetails := AdditionalDetails is String ? StrPtr(AdditionalDetails) : AdditionalDetails

        result := DllCall("ADVAPI32.dll\CveEventWrite", "ptr", CveId, "ptr", AdditionalDetails, "int")
        return result
    }

;@endregion Methods
}
