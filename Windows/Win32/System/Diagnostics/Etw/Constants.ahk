#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */

;@region Constants

/**
 * @type {Guid}
 */
export global ALPCGuid := Guid("{45d8cccd-539f-4b72-a8b7-5c683142609a}")

/**
 * @type {Guid}
 */
export global DiskIoGuid := Guid("{3d6fa8d4-fe05-11d0-9dda-00c04fd7ba7c}")

/**
 * @type {Guid}
 */
export global EventTraceConfigGuid := Guid("{01853a65-418f-4f36-aefc-dc0f1d2fd235}")

/**
 * @type {Guid}
 */
export global FileIoGuid := Guid("{90cbdc39-4a3e-11d1-84f4-0000f80464e3}")

/**
 * @type {Guid}
 */
export global ImageLoadGuid := Guid("{2cb15d1d-5fc1-11d2-abe1-00a0c911f518}")

/**
 * @type {Guid}
 */
export global PageFaultGuid := Guid("{3d6fa8d3-fe05-11d0-9dda-00c04fd7ba7c}")

/**
 * @type {Guid}
 */
export global PerfInfoGuid := Guid("{ce1dbfb4-137e-4da6-87b0-3f59aa102cbc}")

/**
 * @type {Guid}
 */
export global ProcessGuid := Guid("{3d6fa8d0-fe05-11d0-9dda-00c04fd7ba7c}")

/**
 * @type {Guid}
 */
export global RegistryGuid := Guid("{ae53722e-c863-11d2-8659-00c04fa321a1}")

/**
 * @type {Guid}
 */
export global SplitIoGuid := Guid("{d837ca92-12b9-44a5-ad6a-3a65b3578aa8}")

/**
 * @type {Guid}
 */
export global TcpIpGuid := Guid("{9a280ac0-c8e0-11d1-84e2-00c04fb998a2}")

/**
 * @type {Guid}
 */
export global ThreadGuid := Guid("{3d6fa8d1-fe05-11d0-9dda-00c04fd7ba7c}")

/**
 * @type {Guid}
 */
export global UdpIpGuid := Guid("{bf3a50c5-a9c9-4988-a005-2df0b7c80f80}")

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_ALL_DATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_SINGLE_INSTANCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_SINGLE_ITEM := 4

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_EVENT_ITEM := 8

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_FIXED_INSTANCE_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_TOO_SMALL := 32

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_INSTANCES_SAME := 64

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_STATIC_INSTANCE_NAMES := 128

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_INTERNAL := 256

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_USE_TIMESTAMP := 512

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_PERSIST_EVENT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_EVENT_REFERENCE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_ANSI_INSTANCENAMES := 16384

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_METHOD_ITEM := 32768

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_PDO_INSTANCE_NAMES := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_TRACED_GUID := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_LOG_WNODE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_USE_GUID_PTR := 524288

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_USE_MOF_PTR := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_NO_HEADER := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_SEND_DATA_BLOCK := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_VERSIONED_PROPERTIES := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global WNODE_FLAG_SEVERITY_MASK := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_FLAG_EXPENSIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_FLAG_INSTANCE_LIST := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_FLAG_INSTANCE_BASENAME := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_FLAG_INSTANCE_PDO := 32

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_FLAG_REMOVE_GUID := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_FLAG_RESERVED1 := 131072

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_FLAG_RESERVED2 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_FLAG_TRACED_GUID := 524288

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_FLAG_TRACE_CONTROL_GUID := 4096

/**
 * @type {Integer (UInt32)}
 */
export global WMIREG_FLAG_EVENT_ONLY_GUID := 64

/**
 * @type {Integer (UInt32)}
 */
export global WMI_GUIDTYPE_TRACECONTROL := 0

/**
 * @type {Integer (UInt32)}
 */
export global WMI_GUIDTYPE_TRACE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMI_GUIDTYPE_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMI_GUIDTYPE_EVENT := 3

/**
 * @type {Integer (UInt32)}
 */
export global WMIGUID_QUERY := 1

/**
 * @type {Integer (UInt32)}
 */
export global WMIGUID_SET := 2

/**
 * @type {Integer (UInt32)}
 */
export global WMIGUID_NOTIFICATION := 4

/**
 * @type {Integer (UInt32)}
 */
export global WMIGUID_READ_DESCRIPTION := 8

/**
 * @type {Integer (UInt32)}
 */
export global WMIGUID_EXECUTE := 16

/**
 * @type {Integer (UInt32)}
 */
export global TRACELOG_CREATE_REALTIME := 32

/**
 * @type {Integer (UInt32)}
 */
export global TRACELOG_CREATE_ONDISK := 64

/**
 * @type {Integer (UInt32)}
 */
export global TRACELOG_GUID_ENABLE := 128

/**
 * @type {Integer (UInt32)}
 */
export global TRACELOG_ACCESS_KERNEL_LOGGER := 256

/**
 * @type {Integer (UInt32)}
 */
export global TRACELOG_LOG_EVENT := 512

/**
 * @type {Integer (UInt32)}
 */
export global TRACELOG_CREATE_INPROC := 512

/**
 * @type {Integer (UInt32)}
 */
export global TRACELOG_ACCESS_REALTIME := 1024

/**
 * @type {Integer (UInt32)}
 */
export global TRACELOG_REGISTER_GUIDS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global TRACELOG_JOIN_GROUP := 4096

/**
 * @type {Integer (UInt32)}
 */
export global WMI_GLOBAL_LOGGER_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PAYLOAD_PREDICATES := 8

/**
 * @type {Guid}
 */
export global EventTraceGuid := Guid("{68fdd900-4a3e-11d1-84f4-0000f80464e3}")

/**
 * @type {Guid}
 */
export global SystemTraceControlGuid := Guid("{9e814aad-3204-11d2-9a82-006008a86939}")

/**
 * @type {Guid}
 */
export global DefaultTraceSecurityGuid := Guid("{0811c1af-7a07-4a06-82ed-869455cdf713}")

/**
 * @type {Guid}
 */
export global PrivateLoggerNotificationGuid := Guid("{3595ab5c-042a-4c8e-b942-2d059bfeb1b1}")

/**
 * @type {Guid}
 */
export global SystemIoFilterProviderGuid := Guid("{fbd09363-9e22-4661-b8bf-e7a34b535b8c}")

/**
 * @type {Guid}
 */
export global SystemObjectProviderGuid := Guid("{febd7460-3d1d-47eb-af49-c9eeb1e146f2}")

/**
 * @type {Guid}
 */
export global SystemPowerProviderGuid := Guid("{c134884a-32d5-4488-80e5-14ed7abb8269}")

/**
 * @type {Guid}
 */
export global SystemHypervisorProviderGuid := Guid("{bafa072a-918a-4bed-b622-bc152097098f}")

/**
 * @type {Guid}
 */
export global SystemLockProviderGuid := Guid("{721ddfd3-dacc-4e1e-b26a-a2cb31d4705a}")

/**
 * @type {Guid}
 */
export global SystemConfigProviderGuid := Guid("{fef3a8b6-318d-4b67-a96a-3b0f6b8f18fe}")

/**
 * @type {Guid}
 */
export global SystemCpuProviderGuid := Guid("{c6c5265f-eae8-4650-aae4-9d48603d8510}")

/**
 * @type {Guid}
 */
export global SystemSchedulerProviderGuid := Guid("{599a2a76-4d91-4910-9ac7-7d33f2e97a6c}")

/**
 * @type {Guid}
 */
export global SystemProfileProviderGuid := Guid("{bfeb0324-1cee-496f-a409-2ac2b48a6322}")

/**
 * @type {Guid}
 */
export global SystemIoProviderGuid := Guid("{3d5c43e3-0f1c-4202-b817-174c0070dc79}")

/**
 * @type {Guid}
 */
export global SystemMemoryProviderGuid := Guid("{82958ca9-b6cd-47f8-a3a8-03ae85a4bc24}")

/**
 * @type {Guid}
 */
export global SystemRegistryProviderGuid := Guid("{16156bd9-fab4-4cfa-a232-89d1099058e3}")

/**
 * @type {Guid}
 */
export global SystemProcessProviderGuid := Guid("{151f55dc-467d-471f-83b5-5f889d46ff66}")

/**
 * @type {Guid}
 */
export global SystemAlpcProviderGuid := Guid("{fcb9baaf-e529-4980-92e9-ced1a6aadfdf}")

/**
 * @type {Guid}
 */
export global SystemSyscallProviderGuid := Guid("{434286f7-6f1b-45bb-b37e-95f623046c7c}")

/**
 * @type {Guid}
 */
export global SystemInterruptProviderGuid := Guid("{d4bbee17-b545-4888-858b-744169015b25}")

/**
 * @type {Guid}
 */
export global SystemTimerProviderGuid := Guid("{4f061568-e215-499f-ab2e-eda0ae890a5b}")

/**
 * @type {Guid}
 */
export global LastBranchRecordProviderGuid := Guid("{99134383-5248-43fc-834b-529454e75df3}")

/**
 * @type {String}
 */
export global KERNEL_LOGGER_NAMEW := "NT Kernel Logger"

/**
 * @type {String}
 */
export global GLOBAL_LOGGER_NAMEW := "GlobalLogger"

/**
 * @type {String}
 */
export global EVENT_LOGGER_NAMEW := "EventLog"

/**
 * @type {String}
 */
export global DIAG_LOGGER_NAMEW := "DiagLog"

/**
 * @type {String}
 */
export global KERNEL_LOGGER_NAMEA := "NT Kernel Logger"

/**
 * @type {String}
 */
export global GLOBAL_LOGGER_NAMEA := "GlobalLogger"

/**
 * @type {String}
 */
export global EVENT_LOGGER_NAMEA := "EventLog"

/**
 * @type {String}
 */
export global DIAG_LOGGER_NAMEA := "DiagLog"

/**
 * @type {Integer (UInt32)}
 */
export global MAX_MOF_FIELDS := 16

/**
 * @type {Integer (UInt32)}
 */
export global SYSTEM_EVENT_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_INFO := 0

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_START := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_END := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_STOP := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_DC_START := 3

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_DC_END := 4

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_EXTENSION := 5

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REPLY := 6

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_DEQUEUE := 7

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_RESUME := 7

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CHECKPOINT := 8

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_SUSPEND := 8

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_WINEVT_SEND := 9

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_WINEVT_RECEIVE := 240

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LEVEL_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LEVEL_CRITICAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LEVEL_FATAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LEVEL_ERROR := 2

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LEVEL_WARNING := 3

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LEVEL_INFORMATION := 4

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LEVEL_VERBOSE := 5

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LEVEL_RESERVED6 := 6

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LEVEL_RESERVED7 := 7

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LEVEL_RESERVED8 := 8

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LEVEL_RESERVED9 := 9

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_LOAD := 10

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_TERMINATE := 11

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_IO_READ := 10

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_IO_WRITE := 11

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_IO_READ_INIT := 12

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_IO_WRITE_INIT := 13

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_IO_FLUSH := 14

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_IO_FLUSH_INIT := 15

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_IO_REDIRECTED_INIT := 16

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_MM_TF := 10

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_MM_DZF := 11

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_MM_COW := 12

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_MM_GPF := 13

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_MM_HPF := 14

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_MM_AV := 15

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_SEND := 10

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_RECEIVE := 11

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONNECT := 12

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_DISCONNECT := 13

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_RETRANSMIT := 14

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_ACCEPT := 15

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_RECONNECT := 16

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONNFAIL := 17

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_COPY_TCP := 18

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_COPY_ARP := 19

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_ACKFULL := 20

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_ACKPART := 21

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_ACKDUP := 22

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_GUIDMAP := 10

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG := 11

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_SIDINFO := 12

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_SECURITY := 13

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_DBGID_RSDS := 64

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGCREATE := 10

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGOPEN := 11

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGDELETE := 12

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGQUERY := 13

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGSETVALUE := 14

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGDELETEVALUE := 15

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGQUERYVALUE := 16

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGENUMERATEKEY := 17

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGENUMERATEVALUEKEY := 18

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGQUERYMULTIPLEVALUE := 19

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGSETINFORMATION := 20

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGFLUSH := 21

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGKCBCREATE := 22

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGKCBDELETE := 23

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGKCBRUNDOWNBEGIN := 24

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGKCBRUNDOWNEND := 25

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGVIRTUALIZE := 26

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGCLOSE := 27

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGSETSECURITY := 28

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGQUERYSECURITY := 29

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGCOMMIT := 30

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGPREPARE := 31

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGROLLBACK := 32

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_REGMOUNTHIVE := 33

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_CPU := 10

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_PHYSICALDISK := 11

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_LOGICALDISK := 12

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_NIC := 13

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_VIDEO := 14

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_SERVICES := 15

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_POWER := 16

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_NETINFO := 17

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_OPTICALMEDIA := 18

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_PHYSICALDISK_EX := 19

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_IRQ := 21

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_PNP := 22

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_IDECHANNEL := 23

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_NUMANODE := 24

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_PLATFORM := 25

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_PROCESSORGROUP := 26

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_PROCESSORNUMBER := 27

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_DPI := 28

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_CI_INFO := 29

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_MACHINEID := 30

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_DEFRAG := 31

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_MOBILEPLATFORM := 32

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_DEVICEFAMILY := 33

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_FLIGHTID := 34

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_PROCESSOR := 35

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_VIRTUALIZATION := 36

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_CONFIG_BOOT := 37

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_OPTICAL_IO_READ := 55

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_OPTICAL_IO_WRITE := 56

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_OPTICAL_IO_FLUSH := 57

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_OPTICAL_IO_READ_INIT := 58

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_OPTICAL_IO_WRITE_INIT := 59

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_OPTICAL_IO_FLUSH_INIT := 60

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_FLT_PREOP_INIT := 96

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_FLT_POSTOP_INIT := 97

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_FLT_PREOP_COMPLETION := 98

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_FLT_POSTOP_COMPLETION := 99

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_FLT_PREOP_FAILURE := 100

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_TYPE_FLT_POSTOP_FAILURE := 101

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_FLAG_DEBUG_EVENTS := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_FLAG_EXTENSION := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_FLAG_FORWARD_WMI := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_FLAG_ENABLE_RESERVE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_FILE_MODE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_FILE_MODE_SEQUENTIAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_FILE_MODE_CIRCULAR := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_FILE_MODE_APPEND := 4

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_REAL_TIME_MODE := 256

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_DELAY_OPEN_FILE_MODE := 512

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_BUFFERING_MODE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_PRIVATE_LOGGER_MODE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_ADD_HEADER_MODE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_USE_GLOBAL_SEQUENCE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_USE_LOCAL_SEQUENCE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_RELOG_MODE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_USE_PAGED_MEMORY := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_FILE_MODE_NEWFILE := 8

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_FILE_MODE_PREALLOCATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_NONSTOPPABLE_MODE := 64

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_SECURE_MODE := 128

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_USE_KBYTES_FOR_SIZE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_PRIVATE_IN_PROC := 131072

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_MODE_RESERVED := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_NO_PER_PROCESSOR_BUFFERING := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_SYSTEM_LOGGER_MODE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_ADDTO_TRIAGE_DUMP := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_STOP_ON_HYBRID_SHUTDOWN := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_PERSIST_ON_HYBRID_SHUTDOWN := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_INDEPENDENT_SESSION_MODE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_COMPRESSED_MODE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_CONTROL_INCREMENT_FILE := 4

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_CONTROL_CONVERT_TO_REALTIME := 5

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_MESSAGE_PERFORMANCE_TIMESTAMP := 16

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_MESSAGE_POINTER32 := 64

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_MESSAGE_POINTER64 := 128

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_MESSAGE_FLAG_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_USE_PROCTIME := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_TRACE_USE_NOCPUTIME := 2

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_HEADER_FLAG_USE_TIMESTAMP := 512

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_HEADER_FLAG_TRACED_GUID := 131072

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_HEADER_FLAG_LOG_WNODE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_HEADER_FLAG_USE_GUID_PTR := 524288

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_HEADER_FLAG_USE_MOF_PTR := 1048576

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_ALPC_KW_GENERAL := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_CONFIG_KW_SYSTEM := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_CONFIG_KW_GRAPHICS := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_CONFIG_KW_STORAGE := 4

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_CONFIG_KW_NETWORK := 8

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_CONFIG_KW_SERVICES := 16

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_CONFIG_KW_PNP := 32

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_CONFIG_KW_OPTICAL := 64

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_CPU_KW_CONFIG := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_CPU_KW_CACHE_FLUSH := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_CPU_KW_SPEC_CONTROL := 4

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_CPU_KW_DOMAIN_CHANGE := 8

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_HYPERVISOR_KW_PROFILE := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_HYPERVISOR_KW_CALLOUTS := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_HYPERVISOR_KW_VTL_CHANGE := 4

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_INTERRUPT_KW_GENERAL := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_INTERRUPT_KW_CLOCK_INTERRUPT := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_INTERRUPT_KW_DPC := 4

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_INTERRUPT_KW_DPC_QUEUE := 8

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_INTERRUPT_KW_WDF_DPC := 16

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_INTERRUPT_KW_WDF_INTERRUPT := 32

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_INTERRUPT_KW_IPI := 64

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IO_KW_DISK := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IO_KW_DISK_INIT := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IO_KW_FILENAME := 4

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IO_KW_SPLIT := 8

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IO_KW_FILE := 16

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IO_KW_OPTICAL := 32

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IO_KW_OPTICAL_INIT := 64

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IO_KW_DRIVERS := 128

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IO_KW_CC := 256

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IO_KW_NETWORK := 512

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IO_KW_FILE_INIT := 1024

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IO_KW_TIMER := 2048

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IOFILTER_KW_GENERAL := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IOFILTER_KW_INIT := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IOFILTER_KW_FASTIO := 4

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_IOFILTER_KW_FAILURE := 8

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_LOCK_KW_SPINLOCK := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_LOCK_KW_SPINLOCK_COUNTERS := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_LOCK_KW_SYNC_OBJECTS := 4

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_GENERAL := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_HARD_FAULTS := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_ALL_FAULTS := 4

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_POOL := 8

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_MEMINFO := 16

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_PFSECTION := 32

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_MEMINFO_WS := 64

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_HEAP := 128

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_WS := 256

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_CONTMEM_GEN := 512

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_VIRTUAL_ALLOC := 1024

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_FOOTPRINT := 2048

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_SESSION := 4096

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_REFSET := 8192

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_VAMAP := 16384

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_MEMORY_KW_NONTRADEABLE := 32768

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_OBJECT_KW_GENERAL := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_OBJECT_KW_HANDLE := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_POWER_KW_GENERAL := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_POWER_KW_HIBER_RUNDOWN := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_POWER_KW_PROCESSOR_IDLE := 4

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_POWER_KW_IDLE_SELECTION := 8

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_POWER_KW_PPM_EXIT_LATENCY := 16

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_GENERAL := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_INSWAP := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_FREEZE := 4

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_PERF_COUNTER := 8

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_WAKE_COUNTER := 16

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_WAKE_DROP := 32

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_WAKE_EVENT := 64

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_DEBUG_EVENTS := 128

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_DBGPRINT := 256

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_JOB := 512

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_WORKER_THREAD := 1024

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_THREAD := 2048

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROCESS_KW_LOADER := 4096

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROFILE_KW_GENERAL := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_PROFILE_KW_PMC_PROFILE := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_REGISTRY_KW_GENERAL := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_REGISTRY_KW_HIVE := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_REGISTRY_KW_NOTIFICATION := 4

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_XSCHEDULER := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_DISPATCHER := 2

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_KERNEL_QUEUE := 4

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_SHOULD_YIELD := 8

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_ANTI_STARVATION := 16

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_LOAD_BALANCER := 32

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_AFFINITY := 64

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_PRIORITY := 128

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_IDEAL_PROCESSOR := 256

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_CONTEXT_SWITCH := 512

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_COMPACT_CSWITCH := 1024

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_SCHEDULE_THREAD := 2048

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_READY_QUEUE := 4096

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_CPU_PARTITION := 8192

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_THREAD_FEEDBACK_READ := 16384

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_WORKLOAD_CLASS_UPDATE := 32768

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SCHEDULER_KW_AUTOBOOST := 65536

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_SYSCALL_KW_GENERAL := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_TIMER_KW_GENERAL := 1

/**
 * @type {Integer (UInt64)}
 */
export global SYSTEM_TIMER_KW_CLOCK_TIMER := 2

/**
 * @type {Integer (UInt32)}
 */
export global SYSTEM_MEMORY_POOL_FILTER_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global _typedef_TRACELOGGER_HANDLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ETW_NULL_TYPE_VALUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global ETW_OBJECT_TYPE_VALUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ETW_STRING_TYPE_VALUE := 2

/**
 * @type {Integer (UInt32)}
 */
export global ETW_SBYTE_TYPE_VALUE := 3

/**
 * @type {Integer (UInt32)}
 */
export global ETW_BYTE_TYPE_VALUE := 4

/**
 * @type {Integer (UInt32)}
 */
export global ETW_INT16_TYPE_VALUE := 5

/**
 * @type {Integer (UInt32)}
 */
export global ETW_UINT16_TYPE_VALUE := 6

/**
 * @type {Integer (UInt32)}
 */
export global ETW_INT32_TYPE_VALUE := 7

/**
 * @type {Integer (UInt32)}
 */
export global ETW_UINT32_TYPE_VALUE := 8

/**
 * @type {Integer (UInt32)}
 */
export global ETW_INT64_TYPE_VALUE := 9

/**
 * @type {Integer (UInt32)}
 */
export global ETW_UINT64_TYPE_VALUE := 10

/**
 * @type {Integer (UInt32)}
 */
export global ETW_CHAR_TYPE_VALUE := 11

/**
 * @type {Integer (UInt32)}
 */
export global ETW_SINGLE_TYPE_VALUE := 12

/**
 * @type {Integer (UInt32)}
 */
export global ETW_DOUBLE_TYPE_VALUE := 13

/**
 * @type {Integer (UInt32)}
 */
export global ETW_BOOLEAN_TYPE_VALUE := 14

/**
 * @type {Integer (UInt32)}
 */
export global ETW_DECIMAL_TYPE_VALUE := 15

/**
 * @type {Integer (UInt32)}
 */
export global ETW_GUID_TYPE_VALUE := 101

/**
 * @type {Integer (UInt32)}
 */
export global ETW_ASCIICHAR_TYPE_VALUE := 102

/**
 * @type {Integer (UInt32)}
 */
export global ETW_ASCIISTRING_TYPE_VALUE := 103

/**
 * @type {Integer (UInt32)}
 */
export global ETW_COUNTED_STRING_TYPE_VALUE := 104

/**
 * @type {Integer (UInt32)}
 */
export global ETW_POINTER_TYPE_VALUE := 105

/**
 * @type {Integer (UInt32)}
 */
export global ETW_SIZET_TYPE_VALUE := 106

/**
 * @type {Integer (UInt32)}
 */
export global ETW_HIDDEN_TYPE_VALUE := 107

/**
 * @type {Integer (UInt32)}
 */
export global ETW_BOOL_TYPE_VALUE := 108

/**
 * @type {Integer (UInt32)}
 */
export global ETW_COUNTED_ANSISTRING_TYPE_VALUE := 109

/**
 * @type {Integer (UInt32)}
 */
export global ETW_REVERSED_COUNTED_STRING_TYPE_VALUE := 110

/**
 * @type {Integer (UInt32)}
 */
export global ETW_REVERSED_COUNTED_ANSISTRING_TYPE_VALUE := 111

/**
 * @type {Integer (UInt32)}
 */
export global ETW_NON_NULL_TERMINATED_STRING_TYPE_VALUE := 112

/**
 * @type {Integer (UInt32)}
 */
export global ETW_REDUCED_ANSISTRING_TYPE_VALUE := 113

/**
 * @type {Integer (UInt32)}
 */
export global ETW_REDUCED_STRING_TYPE_VALUE := 114

/**
 * @type {Integer (UInt32)}
 */
export global ETW_SID_TYPE_VALUE := 115

/**
 * @type {Integer (UInt32)}
 */
export global ETW_VARIANT_TYPE_VALUE := 116

/**
 * @type {Integer (UInt32)}
 */
export global ETW_PTVECTOR_TYPE_VALUE := 117

/**
 * @type {Integer (UInt32)}
 */
export global ETW_WMITIME_TYPE_VALUE := 118

/**
 * @type {Integer (UInt32)}
 */
export global ETW_DATETIME_TYPE_VALUE := 119

/**
 * @type {Integer (UInt32)}
 */
export global ETW_REFRENCE_TYPE_VALUE := 120

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_PROVIDER_FLAG_LEGACY := 1

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_PROVIDER_FLAG_PRE_ENABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LBR_EVENT_OPCODE := 32

/**
 * @type {Integer (UInt32)}
 */
export global TRACE_LBR_MAXIMUM_EVENTS := 4

/**
 * @type {String}
 */
export global KERNEL_LOGGER_NAME := "NT Kernel Logger"

/**
 * @type {String}
 */
export global GLOBAL_LOGGER_NAME := "GlobalLogger"

/**
 * @type {String}
 */
export global EVENT_LOGGER_NAME := "EventLog"

/**
 * @type {Integer (UInt32)}
 */
export global ENABLE_TRACE_PARAMETERS_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global ENABLE_TRACE_PARAMETERS_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_MIN_LEVEL := 0

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_MAX_LEVEL := 255

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ACTIVITY_CTRL_GET_ID := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ACTIVITY_CTRL_SET_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ACTIVITY_CTRL_CREATE_ID := 3

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ACTIVITY_CTRL_GET_SET_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ACTIVITY_CTRL_CREATE_SET_ID := 5

/**
 * @type {Integer (UInt32)}
 */
export global MAX_EVENT_DATA_DESCRIPTORS := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAX_EVENT_FILTER_DATA_SIZE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MAX_EVENT_FILTER_PAYLOAD_SIZE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MAX_EVENT_FILTER_EVENT_NAME_SIZE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MAX_EVENT_FILTERS_COUNT := 13

/**
 * @type {Integer (UInt32)}
 */
export global MAX_EVENT_FILTER_PID_COUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global MAX_EVENT_FILTER_EVENT_ID_COUNT := 64

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_SCHEMATIZED := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_SYSTEM_FLAGS := 2147483649

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_TRACEHANDLE := 2147483650

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_PID := 2147483652

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_EXECUTABLE_NAME := 2147483656

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_PACKAGE_ID := 2147483664

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_PACKAGE_APP_ID := 2147483680

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_PAYLOAD := 2147483904

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_EVENT_ID := 2147484160

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_EVENT_NAME := 2147484672

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_STACKWALK := 2147487744

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_STACKWALK_NAME := 2147491840

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_STACKWALK_LEVEL_KW := 2147500032

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_FILTER_TYPE_CONTAINER := 2147516416

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_DATA_DESCRIPTOR_TYPE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_DATA_DESCRIPTOR_TYPE_EVENT_METADATA := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_DATA_DESCRIPTOR_TYPE_PROVIDER_METADATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_DATA_DESCRIPTOR_TYPE_TIMESTAMP_OVERRIDE := 3

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_WRITE_FLAG_NO_FAULTING := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_WRITE_FLAG_INPRIVATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_RELATED_ACTIVITYID := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_SID := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_TS_ID := 3

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_INSTANCE_INFO := 4

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_STACK_TRACE32 := 5

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_STACK_TRACE64 := 6

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_PEBS_INDEX := 7

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_PMC_COUNTERS := 8

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_PSM_KEY := 9

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_EVENT_KEY := 10

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_EVENT_SCHEMA_TL := 11

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_PROV_TRAITS := 12

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_PROCESS_START_KEY := 13

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_CONTROL_GUID := 14

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_QPC_DELTA := 15

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_CONTAINER_ID := 16

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_STACK_KEY32 := 17

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_STACK_KEY64 := 18

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_EXT_TYPE_MAX := 19

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_PROPERTY_XML := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_PROPERTY_FORWARDED_XML := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_PROPERTY_LEGACY_EVENTLOG := 4

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_PROPERTY_RELOGGABLE := 8

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_FLAG_EXTENDED_INFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_FLAG_PRIVATE_SESSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_FLAG_STRING_ONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_FLAG_TRACE_MESSAGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_FLAG_NO_CPUTIME := 16

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_FLAG_32_BIT_HEADER := 32

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_FLAG_64_BIT_HEADER := 64

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_FLAG_DECODE_GUID := 128

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_FLAG_CLASSIC_HEADER := 256

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_HEADER_FLAG_PROCESSOR_INDEX := 512

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ENABLE_PROPERTY_SID := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ENABLE_PROPERTY_TS_ID := 2

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ENABLE_PROPERTY_STACK_TRACE := 4

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ENABLE_PROPERTY_PSM_KEY := 8

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ENABLE_PROPERTY_IGNORE_KEYWORD_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ENABLE_PROPERTY_PROVIDER_GROUP := 32

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ENABLE_PROPERTY_ENABLE_KEYWORD_0 := 64

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ENABLE_PROPERTY_PROCESS_START_KEY := 128

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ENABLE_PROPERTY_EVENT_KEY := 256

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ENABLE_PROPERTY_EXCLUDE_INPRIVATE := 512

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ENABLE_PROPERTY_ENABLE_SILOS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global EVENT_ENABLE_PROPERTY_SOURCE_CONTAINER_TRACKING := 2048

/**
 * @type {Integer (UInt32)}
 */
export global PROCESS_TRACE_MODE_REAL_TIME := 256

/**
 * @type {Integer (UInt32)}
 */
export global PROCESS_TRACE_MODE_RAW_TIMESTAMP := 4096

/**
 * @type {Integer (UInt32)}
 */
export global PROCESS_TRACE_MODE_EVENT_RECORD := 268435456

/**
 * @type {Guid}
 */
export global CLSID_TraceRelogger := Guid("{7b40792d-05ff-44c4-9058-f440c71f17d4}")
;@endregion Constants
