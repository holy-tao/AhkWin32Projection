#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }

/**
 * @namespace Windows.Win32.Devices.Fax
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global prv_DEFAULT_PREFETCH_SIZE := 100

/**
 * @type {Integer (UInt32)}
 */
export global FS_INITIALIZING := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global FS_DIALING := 536870913

/**
 * @type {Integer (UInt32)}
 */
export global FS_TRANSMITTING := 536870914

/**
 * @type {Integer (UInt32)}
 */
export global FS_RECEIVING := 536870916

/**
 * @type {Integer (UInt32)}
 */
export global FS_COMPLETED := 536870920

/**
 * @type {Integer (UInt32)}
 */
export global FS_HANDLED := 536870928

/**
 * @type {Integer (UInt32)}
 */
export global FS_LINE_UNAVAILABLE := 536870944

/**
 * @type {Integer (UInt32)}
 */
export global FS_BUSY := 536870976

/**
 * @type {Integer (UInt32)}
 */
export global FS_NO_ANSWER := 536871040

/**
 * @type {Integer (UInt32)}
 */
export global FS_BAD_ADDRESS := 536871168

/**
 * @type {Integer (UInt32)}
 */
export global FS_NO_DIAL_TONE := 536871424

/**
 * @type {Integer (UInt32)}
 */
export global FS_DISCONNECTED := 536871936

/**
 * @type {Integer (UInt32)}
 */
export global FS_FATAL_ERROR := 536872960

/**
 * @type {Integer (UInt32)}
 */
export global FS_NOT_FAX_CALL := 536875008

/**
 * @type {Integer (UInt32)}
 */
export global FS_CALL_DELAYED := 536879104

/**
 * @type {Integer (UInt32)}
 */
export global FS_CALL_BLACKLISTED := 536887296

/**
 * @type {Integer (UInt32)}
 */
export global FS_USER_ABORT := 538968064

/**
 * @type {Integer (UInt32)}
 */
export global FS_ANSWERED := 545259520

/**
 * @type {Integer (UInt32)}
 */
export global FAXDEVRECEIVE_SIZE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global FAXDEVREPORTSTATUS_SIZE := 4096

/**
 * @type {String}
 */
export global MS_FAXROUTE_PRINTING_GUID := "{aec1b37c-9af2-11d0-abf7-00c04fd91a4e}"

/**
 * @type {String}
 */
export global MS_FAXROUTE_FOLDER_GUID := "{92041a90-9af2-11d0-abf7-00c04fd91a4e}"

/**
 * @type {String}
 */
export global MS_FAXROUTE_EMAIL_GUID := "{6bbf7bfe-9af2-11d0-abf7-00c04fd91a4e}"

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_START := 7001

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_SRV_OUTOFMEMORY := 7001

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_GROUP_NOT_FOUND := 7002

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_BAD_GROUP_CONFIGURATION := 7003

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_GROUP_IN_USE := 7004

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_RULE_NOT_FOUND := 7005

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_NOT_NTFS := 7006

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_DIRECTORY_IN_USE := 7007

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_FILE_ACCESS_DENIED := 7008

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_MESSAGE_NOT_FOUND := 7009

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_DEVICE_NUM_LIMIT_EXCEEDED := 7010

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_NOT_SUPPORTED_ON_THIS_SKU := 7011

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_VERSION_MISMATCH := 7012

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_RECIPIENTS_LIMIT := 7013

/**
 * @type {Integer (Int32)}
 */
export global FAX_ERR_END := 7013

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_SRV_OUTOFMEMORY := -2147214503

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_GROUP_NOT_FOUND := -2147214502

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_BAD_GROUP_CONFIGURATION := -2147214501

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_GROUP_IN_USE := -2147214500

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_RULE_NOT_FOUND := -2147214499

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_NOT_NTFS := -2147214498

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_DIRECTORY_IN_USE := -2147214497

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_FILE_ACCESS_DENIED := -2147214496

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_MESSAGE_NOT_FOUND := -2147214495

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_DEVICE_NUM_LIMIT_EXCEEDED := -2147214494

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_NOT_SUPPORTED_ON_THIS_SKU := -2147214493

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_VERSION_MISMATCH := -2147214492

/**
 * @type {Integer (Int32)}
 */
export global FAX_E_RECIPIENTS_LIMIT := -2147214491

/**
 * @type {Integer (UInt32)}
 */
export global JT_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global JT_SEND := 1

/**
 * @type {Integer (UInt32)}
 */
export global JT_RECEIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global JT_ROUTING := 3

/**
 * @type {Integer (UInt32)}
 */
export global JT_FAIL_RECEIVE := 4

/**
 * @type {Integer (UInt32)}
 */
export global JS_PENDING := 0

/**
 * @type {Integer (UInt32)}
 */
export global JS_INPROGRESS := 1

/**
 * @type {Integer (UInt32)}
 */
export global JS_DELETING := 2

/**
 * @type {Integer (UInt32)}
 */
export global JS_FAILED := 4

/**
 * @type {Integer (UInt32)}
 */
export global JS_PAUSED := 8

/**
 * @type {Integer (UInt32)}
 */
export global JS_NOLINE := 16

/**
 * @type {Integer (UInt32)}
 */
export global JS_RETRYING := 32

/**
 * @type {Integer (UInt32)}
 */
export global JS_RETRIES_EXCEEDED := 64

/**
 * @type {Integer (UInt32)}
 */
export global FPS_DIALING := 536870913

/**
 * @type {Integer (UInt32)}
 */
export global FPS_SENDING := 536870914

/**
 * @type {Integer (UInt32)}
 */
export global FPS_RECEIVING := 536870916

/**
 * @type {Integer (UInt32)}
 */
export global FPS_COMPLETED := 536870920

/**
 * @type {Integer (UInt32)}
 */
export global FPS_HANDLED := 536870928

/**
 * @type {Integer (UInt32)}
 */
export global FPS_UNAVAILABLE := 536870944

/**
 * @type {Integer (UInt32)}
 */
export global FPS_BUSY := 536870976

/**
 * @type {Integer (UInt32)}
 */
export global FPS_NO_ANSWER := 536871040

/**
 * @type {Integer (UInt32)}
 */
export global FPS_BAD_ADDRESS := 536871168

/**
 * @type {Integer (UInt32)}
 */
export global FPS_NO_DIAL_TONE := 536871424

/**
 * @type {Integer (UInt32)}
 */
export global FPS_DISCONNECTED := 536871936

/**
 * @type {Integer (UInt32)}
 */
export global FPS_FATAL_ERROR := 536872960

/**
 * @type {Integer (UInt32)}
 */
export global FPS_NOT_FAX_CALL := 536875008

/**
 * @type {Integer (UInt32)}
 */
export global FPS_CALL_DELAYED := 536879104

/**
 * @type {Integer (UInt32)}
 */
export global FPS_CALL_BLACKLISTED := 536887296

/**
 * @type {Integer (UInt32)}
 */
export global FPS_INITIALIZING := 536903680

/**
 * @type {Integer (UInt32)}
 */
export global FPS_OFFLINE := 536936448

/**
 * @type {Integer (UInt32)}
 */
export global FPS_RINGING := 537001984

/**
 * @type {Integer (UInt32)}
 */
export global FPS_AVAILABLE := 537919488

/**
 * @type {Integer (UInt32)}
 */
export global FPS_ABORTING := 538968064

/**
 * @type {Integer (UInt32)}
 */
export global FPS_ROUTING := 541065216

/**
 * @type {Integer (UInt32)}
 */
export global FPS_ANSWERED := 545259520

/**
 * @type {Integer (UInt32)}
 */
export global FPF_RECEIVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FPF_SEND := 2

/**
 * @type {Integer (UInt32)}
 */
export global FPF_VIRTUAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global FEI_DIALING := 1

/**
 * @type {Integer (UInt32)}
 */
export global FEI_SENDING := 2

/**
 * @type {Integer (UInt32)}
 */
export global FEI_RECEIVING := 3

/**
 * @type {Integer (UInt32)}
 */
export global FEI_COMPLETED := 4

/**
 * @type {Integer (UInt32)}
 */
export global FEI_BUSY := 5

/**
 * @type {Integer (UInt32)}
 */
export global FEI_NO_ANSWER := 6

/**
 * @type {Integer (UInt32)}
 */
export global FEI_BAD_ADDRESS := 7

/**
 * @type {Integer (UInt32)}
 */
export global FEI_NO_DIAL_TONE := 8

/**
 * @type {Integer (UInt32)}
 */
export global FEI_DISCONNECTED := 9

/**
 * @type {Integer (UInt32)}
 */
export global FEI_FATAL_ERROR := 10

/**
 * @type {Integer (UInt32)}
 */
export global FEI_NOT_FAX_CALL := 11

/**
 * @type {Integer (UInt32)}
 */
export global FEI_CALL_DELAYED := 12

/**
 * @type {Integer (UInt32)}
 */
export global FEI_CALL_BLACKLISTED := 13

/**
 * @type {Integer (UInt32)}
 */
export global FEI_RINGING := 14

/**
 * @type {Integer (UInt32)}
 */
export global FEI_ABORTING := 15

/**
 * @type {Integer (UInt32)}
 */
export global FEI_ROUTING := 16

/**
 * @type {Integer (UInt32)}
 */
export global FEI_MODEM_POWERED_ON := 17

/**
 * @type {Integer (UInt32)}
 */
export global FEI_MODEM_POWERED_OFF := 18

/**
 * @type {Integer (UInt32)}
 */
export global FEI_IDLE := 19

/**
 * @type {Integer (UInt32)}
 */
export global FEI_FAXSVC_ENDED := 20

/**
 * @type {Integer (UInt32)}
 */
export global FEI_ANSWERED := 21

/**
 * @type {Integer (UInt32)}
 */
export global FEI_JOB_QUEUED := 22

/**
 * @type {Integer (UInt32)}
 */
export global FEI_DELETED := 23

/**
 * @type {Integer (UInt32)}
 */
export global FEI_INITIALIZING := 24

/**
 * @type {Integer (UInt32)}
 */
export global FEI_LINE_UNAVAILABLE := 25

/**
 * @type {Integer (UInt32)}
 */
export global FEI_HANDLED := 26

/**
 * @type {Integer (UInt32)}
 */
export global FEI_FAXSVC_STARTED := 27

/**
 * @type {Integer (UInt32)}
 */
export global FEI_NEVENTS := 27

/**
 * @type {Integer (UInt32)}
 */
export global FAX_JOB_SUBMIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global FAX_JOB_QUERY := 2

/**
 * @type {Integer (UInt32)}
 */
export global FAX_CONFIG_QUERY := 4

/**
 * @type {Integer (UInt32)}
 */
export global FAX_CONFIG_SET := 8

/**
 * @type {Integer (UInt32)}
 */
export global FAX_PORT_QUERY := 16

/**
 * @type {Integer (UInt32)}
 */
export global FAX_PORT_SET := 32

/**
 * @type {Integer (UInt32)}
 */
export global FAX_JOB_MANAGE := 64

/**
 * @type {Guid}
 */
export global FAXSRV_DEVICE_NODETYPE_GUID := Guid("{3115a19a-6251-46ac-9425-14782858b8c9}")

/**
 * @type {Guid}
 */
export global FAXSRV_DEVICE_PROVIDER_NODETYPE_GUID := Guid("{bd38e2ac-b926-4161-8640-0f6956ee2ba3}")

/**
 * @type {Guid}
 */
export global FAXSRV_ROUTING_METHOD_NODETYPE_GUID := Guid("{220d2cb0-85a9-4a43-b6e8-9d66b44f1af5}")

/**
 * @type {String}
 */
export global CF_MSFAXSRV_DEVICE_ID := "FAXSRV_DeviceID"

/**
 * @type {String}
 */
export global CF_MSFAXSRV_FSP_GUID := "FAXSRV_FSPGuid"

/**
 * @type {String}
 */
export global CF_MSFAXSRV_SERVER_NAME := "FAXSRV_ServerName"

/**
 * @type {String}
 */
export global CF_MSFAXSRV_ROUTEEXT_NAME := "FAXSRV_RoutingExtName"

/**
 * @type {String}
 */
export global CF_MSFAXSRV_ROUTING_METHOD_GUID := "FAXSRV_RoutingMethodGuid"

/**
 * @type {Integer (UInt32)}
 */
export global STI_UNICODE := 1

/**
 * @type {Guid}
 */
export global CLSID_Sti := Guid("{b323f8e0-2e68-11d0-90ea-00aa0060f86c}")

/**
 * @type {Guid}
 */
export global GUID_DeviceArrivedLaunch := Guid("{740d9ee6-70f1-11d1-ad10-00a02438ad48}")

/**
 * @type {Guid}
 */
export global GUID_ScanImage := Guid("{a6c5a715-8c6e-11d2-977a-0000f87a926f}")

/**
 * @type {Guid}
 */
export global GUID_ScanPrintImage := Guid("{b441f425-8c6e-11d2-977a-0000f87a926f}")

/**
 * @type {Guid}
 */
export global GUID_ScanFaxImage := Guid("{c00eb793-8c6e-11d2-977a-0000f87a926f}")

/**
 * @type {Guid}
 */
export global GUID_STIUserDefined1 := Guid("{c00eb795-8c6e-11d2-977a-0000f87a926f}")

/**
 * @type {Guid}
 */
export global GUID_STIUserDefined2 := Guid("{c77ae9c5-8c6e-11d2-977a-0000f87a926f}")

/**
 * @type {Guid}
 */
export global GUID_STIUserDefined3 := Guid("{c77ae9c6-8c6e-11d2-977a-0000f87a926f}")

/**
 * @type {Integer (UInt32)}
 */
export global STI_VERSION_FLAG_MASK := 4278190080

/**
 * @type {Integer (UInt32)}
 */
export global STI_VERSION_FLAG_UNICODE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global STI_VERSION_REAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global STI_VERSION_MIN_ALLOWED := 2

/**
 * @type {Integer (UInt32)}
 */
export global STI_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global STI_MAX_INTERNAL_NAME_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global STI_GENCAP_COMMON_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global STI_GENCAP_NOTIFICATIONS := 1

/**
 * @type {Integer (UInt32)}
 */
export global STI_GENCAP_POLLING_NEEDED := 2

/**
 * @type {Integer (UInt32)}
 */
export global STI_GENCAP_GENERATE_ARRIVALEVENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global STI_GENCAP_AUTO_PORTSELECT := 8

/**
 * @type {Integer (UInt32)}
 */
export global STI_GENCAP_WIA := 16

/**
 * @type {Integer (UInt32)}
 */
export global STI_GENCAP_SUBSET := 32

/**
 * @type {Integer (UInt32)}
 */
export global WIA_INCOMPAT_XP := 1

/**
 * @type {Integer (UInt32)}
 */
export global STI_HW_CONFIG_UNKNOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global STI_HW_CONFIG_SCSI := 2

/**
 * @type {Integer (UInt32)}
 */
export global STI_HW_CONFIG_USB := 4

/**
 * @type {Integer (UInt32)}
 */
export global STI_HW_CONFIG_SERIAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global STI_HW_CONFIG_PARALLEL := 16

/**
 * @type {Integer (UInt32)}
 */
export global STI_DEVSTATUS_ONLINE_STATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global STI_DEVSTATUS_EVENTS_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_OPERATIONAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_PENDING := 2

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_ERROR := 4

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_PAUSED := 8

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_PAPER_JAM := 16

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_PAPER_PROBLEM := 32

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_OFFLINE := 64

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_IO_ACTIVE := 128

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_BUSY := 256

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_TRANSFERRING := 512

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_INITIALIZING := 1024

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_WARMING_UP := 2048

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_USER_INTERVENTION := 4096

/**
 * @type {Integer (UInt32)}
 */
export global STI_ONLINESTATE_POWER_SAVE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global STI_EVENTHANDLING_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global STI_EVENTHANDLING_POLLING := 2

/**
 * @type {Integer (UInt32)}
 */
export global STI_EVENTHANDLING_PENDING := 4

/**
 * @type {Integer (UInt32)}
 */
export global STI_DIAGCODE_HWPRESENCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global STI_TRACE_INFORMATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global STI_TRACE_WARNING := 2

/**
 * @type {Integer (UInt32)}
 */
export global STI_TRACE_ERROR := 4

/**
 * @type {Integer (UInt32)}
 */
export global STI_SUBSCRIBE_FLAG_WINDOW := 1

/**
 * @type {Integer (UInt32)}
 */
export global STI_SUBSCRIBE_FLAG_EVENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAX_NOTIFICATION_DATA := 64

/**
 * @type {String}
 */
export global STI_ADD_DEVICE_BROADCAST_ACTION := "Arrival"

/**
 * @type {String}
 */
export global STI_REMOVE_DEVICE_BROADCAST_ACTION := "Removal"

/**
 * @type {String}
 */
export global STI_ADD_DEVICE_BROADCAST_STRING := "STI\"

/**
 * @type {String}
 */
export global STI_REMOVE_DEVICE_BROADCAST_STRING := "STI\"

/**
 * @type {Integer (UInt32)}
 */
export global STI_DEVICE_CREATE_STATUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global STI_DEVICE_CREATE_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global STI_DEVICE_CREATE_BOTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global STI_DEVICE_CREATE_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global STIEDFL_ALLDEVICES := 0

/**
 * @type {Integer (UInt32)}
 */
export global STIEDFL_ATTACHEDONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global STI_RAW_RESERVED := 4096

/**
 * @type {Integer (Int32)}
 */
export global STI_OK := 0

/**
 * @type {Integer (Int32)}
 */
export global STI_ERROR_NO_ERROR := 0

/**
 * @type {Integer (Int32)}
 */
export global STI_NOTCONNECTED := 1

/**
 * @type {Integer (Int32)}
 */
export global STI_CHANGENOEFFECT := 1

/**
 * @type {Integer (Int32)}
 */
export global STIERR_OLD_VERSION := -2147023746

/**
 * @type {Integer (Int32)}
 */
export global STIERR_BETA_VERSION := -2147023743

/**
 * @type {Integer (Int32)}
 */
export global STIERR_BADDRIVER := -2147024777

/**
 * @type {Integer (Int32)}
 */
export global STIERR_DEVICENOTREG := -2147221164

/**
 * @type {Integer (Int32)}
 */
export global STIERR_OBJECTNOTFOUND := -2147024894

/**
 * @type {Integer (Int32)}
 */
export global STIERR_INVALID_PARAM := -2147024809

/**
 * @type {Integer (Int32)}
 */
export global STIERR_NOINTERFACE := -2147467262

/**
 * @type {Integer (Int32)}
 */
export global STIERR_GENERIC := -2147467259

/**
 * @type {Integer (Int32)}
 */
export global STIERR_OUTOFMEMORY := -2147024882

/**
 * @type {Integer (Int32)}
 */
export global STIERR_UNSUPPORTED := -2147467263

/**
 * @type {Integer (Int32)}
 */
export global STIERR_NOT_INITIALIZED := -2147024875

/**
 * @type {Integer (Int32)}
 */
export global STIERR_ALREADY_INITIALIZED := -2147023649

/**
 * @type {Integer (Int32)}
 */
export global STIERR_DEVICE_LOCKED := -2147024863

/**
 * @type {Integer (Int32)}
 */
export global STIERR_READONLY := -2147024891

/**
 * @type {Integer (Int32)}
 */
export global STIERR_NOTINITIALIZED := -2147024891

/**
 * @type {Integer (Int32)}
 */
export global STIERR_NEEDS_LOCK := -2147024738

/**
 * @type {Integer (Int32)}
 */
export global STIERR_SHARING_VIOLATION := -2147024864

/**
 * @type {Integer (Int32)}
 */
export global STIERR_HANDLEEXISTS := -2147024713

/**
 * @type {Integer (Int32)}
 */
export global STIERR_INVALID_DEVICE_NAME := -2147024773

/**
 * @type {Integer (Int32)}
 */
export global STIERR_INVALID_HW_TYPE := -2147024883

/**
 * @type {Integer (Int32)}
 */
export global STIERR_NOEVENTS := -2147024637

/**
 * @type {Integer (Int32)}
 */
export global STIERR_DEVICE_NOTREADY := -2147024875

/**
 * @type {String}
 */
export global REGSTR_VAL_TYPE_W := "Type"

/**
 * @type {String}
 */
export global REGSTR_VAL_VENDOR_NAME_W := "Vendor"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVICETYPE_W := "DeviceType"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVICESUBTYPE_W := "DeviceSubType"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEV_NAME_W := "DeviceName"

/**
 * @type {String}
 */
export global REGSTR_VAL_DRIVER_DESC_W := "DriverDesc"

/**
 * @type {String}
 */
export global REGSTR_VAL_FRIENDLY_NAME_W := "FriendlyName"

/**
 * @type {String}
 */
export global REGSTR_VAL_GENERIC_CAPS_W := "Capabilities"

/**
 * @type {String}
 */
export global REGSTR_VAL_HARDWARE_W := "HardwareConfig"

/**
 * @type {String}
 */
export global REGSTR_VAL_HARDWARE := "HardwareConfig"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVICE_NAME_W := "DriverDesc"

/**
 * @type {String}
 */
export global REGSTR_VAL_DATA_W := "DeviceData"

/**
 * @type {String}
 */
export global REGSTR_VAL_GUID_W := "GUID"

/**
 * @type {String}
 */
export global REGSTR_VAL_GUID := "GUID"

/**
 * @type {String}
 */
export global REGSTR_VAL_LAUNCH_APPS_W := "LaunchApplications"

/**
 * @type {String}
 */
export global REGSTR_VAL_LAUNCH_APPS := "LaunchApplications"

/**
 * @type {String}
 */
export global REGSTR_VAL_LAUNCHABLE_W := "Launchable"

/**
 * @type {String}
 */
export global REGSTR_VAL_LAUNCHABLE := "Launchable"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHUTDOWNDELAY_W := "ShutdownIfUnusedDelay"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHUTDOWNDELAY := "ShutdownIfUnusedDelay"

/**
 * @type {String}
 */
export global IS_DIGITAL_CAMERA_STR := "IsDigitalCamera"

/**
 * @type {Integer (UInt32)}
 */
export global IS_DIGITAL_CAMERA_VAL := 1

/**
 * @type {String}
 */
export global SUPPORTS_MSCPLUS_STR := "SupportsMSCPlus"

/**
 * @type {Integer (UInt32)}
 */
export global SUPPORTS_MSCPLUS_VAL := 1

/**
 * @type {String}
 */
export global STI_DEVICE_VALUE_TWAIN_NAME := "TwainDS"

/**
 * @type {String}
 */
export global STI_DEVICE_VALUE_ISIS_NAME := "ISISDriverName"

/**
 * @type {String}
 */
export global STI_DEVICE_VALUE_ICM_PROFILE := "ICMProfile"

/**
 * @type {String}
 */
export global STI_DEVICE_VALUE_DEFAULT_LAUNCHAPP := "DefaultLaunchApp"

/**
 * @type {String}
 */
export global STI_DEVICE_VALUE_TIMEOUT := "PollTimeout"

/**
 * @type {String}
 */
export global STI_DEVICE_VALUE_DISABLE_NOTIFICATIONS := "DisableNotifications"

/**
 * @type {String}
 */
export global REGSTR_VAL_BAUDRATE := "BaudRate"

/**
 * @type {String}
 */
export global STI_DEVICE_VALUE_TWAIN_NAME_A := "TwainDS"

/**
 * @type {String}
 */
export global STI_DEVICE_VALUE_ISIS_NAME_A := "ISISDriverName"

/**
 * @type {String}
 */
export global STI_DEVICE_VALUE_ICM_PROFILE_A := "ICMProfile"

/**
 * @type {String}
 */
export global STI_DEVICE_VALUE_DEFAULT_LAUNCHAPP_A := "DefaultLaunchApp"

/**
 * @type {String}
 */
export global STI_DEVICE_VALUE_TIMEOUT_A := "PollTimeout"

/**
 * @type {String}
 */
export global STI_DEVICE_VALUE_DISABLE_NOTIFICATIONS_A := "DisableNotifications"

/**
 * @type {String}
 */
export global REGSTR_VAL_BAUDRATE_A := "BaudRate"

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WIA_DeviceType := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WIA_DeviceType.fmtid),
    Guid.Ptr, Guid("{6bdd1fc6-810f-11d0-bec7-08002be2092f}"),
    UInt32, 16)
DEVPKEY_WIA_DeviceType.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_WIA_USDClassId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_WIA_USDClassId.fmtid),
    Guid.Ptr, Guid("{6bdd1fc6-810f-11d0-bec7-08002be2092f}"),
    UInt32, 16)
DEVPKEY_WIA_USDClassId.pid := 3

/**
 * @type {Integer (UInt32)}
 */
export global STI_USD_GENCAP_NATIVE_PUSHSUPPORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global STI_DEVICE_CREATE_FOR_MONITOR := 16777216

/**
 * @type {Integer (Int32)}
 */
export global lDEFAULT_PREFETCH_SIZE := 100

/**
 * @type {Integer (UInt16)}
 */
export global wcharREASSIGN_RECIPIENTS_DELIMITER := 59
;@endregion Constants
