#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class Fax {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static prv_DEFAULT_PREFETCH_SIZE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static FS_INITIALIZING => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static FS_DIALING => 536870913

    /**
     * @type {Integer (UInt32)}
     */
    static FS_TRANSMITTING => 536870914

    /**
     * @type {Integer (UInt32)}
     */
    static FS_RECEIVING => 536870916

    /**
     * @type {Integer (UInt32)}
     */
    static FS_COMPLETED => 536870920

    /**
     * @type {Integer (UInt32)}
     */
    static FS_HANDLED => 536870928

    /**
     * @type {Integer (UInt32)}
     */
    static FS_LINE_UNAVAILABLE => 536870944

    /**
     * @type {Integer (UInt32)}
     */
    static FS_BUSY => 536870976

    /**
     * @type {Integer (UInt32)}
     */
    static FS_NO_ANSWER => 536871040

    /**
     * @type {Integer (UInt32)}
     */
    static FS_BAD_ADDRESS => 536871168

    /**
     * @type {Integer (UInt32)}
     */
    static FS_NO_DIAL_TONE => 536871424

    /**
     * @type {Integer (UInt32)}
     */
    static FS_DISCONNECTED => 536871936

    /**
     * @type {Integer (UInt32)}
     */
    static FS_FATAL_ERROR => 536872960

    /**
     * @type {Integer (UInt32)}
     */
    static FS_NOT_FAX_CALL => 536875008

    /**
     * @type {Integer (UInt32)}
     */
    static FS_CALL_DELAYED => 536879104

    /**
     * @type {Integer (UInt32)}
     */
    static FS_CALL_BLACKLISTED => 536887296

    /**
     * @type {Integer (UInt32)}
     */
    static FS_USER_ABORT => 538968064

    /**
     * @type {Integer (UInt32)}
     */
    static FS_ANSWERED => 545259520

    /**
     * @type {Integer (UInt32)}
     */
    static FAXDEVRECEIVE_SIZE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FAXDEVREPORTSTATUS_SIZE => 4096

    /**
     * @type {String}
     */
    static MS_FAXROUTE_PRINTING_GUID => "{aec1b37c-9af2-11d0-abf7-00c04fd91a4e}"

    /**
     * @type {String}
     */
    static MS_FAXROUTE_FOLDER_GUID => "{92041a90-9af2-11d0-abf7-00c04fd91a4e}"

    /**
     * @type {String}
     */
    static MS_FAXROUTE_EMAIL_GUID => "{6bbf7bfe-9af2-11d0-abf7-00c04fd91a4e}"

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_START => 7001

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_SRV_OUTOFMEMORY => 7001

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_GROUP_NOT_FOUND => 7002

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_BAD_GROUP_CONFIGURATION => 7003

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_GROUP_IN_USE => 7004

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_RULE_NOT_FOUND => 7005

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_NOT_NTFS => 7006

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_DIRECTORY_IN_USE => 7007

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_FILE_ACCESS_DENIED => 7008

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_MESSAGE_NOT_FOUND => 7009

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_DEVICE_NUM_LIMIT_EXCEEDED => 7010

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_NOT_SUPPORTED_ON_THIS_SKU => 7011

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_VERSION_MISMATCH => 7012

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_RECIPIENTS_LIMIT => 7013

    /**
     * @type {Integer (Int32)}
     */
    static FAX_ERR_END => 7013

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_SRV_OUTOFMEMORY => -2147214503

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_GROUP_NOT_FOUND => -2147214502

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_BAD_GROUP_CONFIGURATION => -2147214501

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_GROUP_IN_USE => -2147214500

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_RULE_NOT_FOUND => -2147214499

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_NOT_NTFS => -2147214498

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_DIRECTORY_IN_USE => -2147214497

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_FILE_ACCESS_DENIED => -2147214496

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_MESSAGE_NOT_FOUND => -2147214495

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_DEVICE_NUM_LIMIT_EXCEEDED => -2147214494

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_NOT_SUPPORTED_ON_THIS_SKU => -2147214493

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_VERSION_MISMATCH => -2147214492

    /**
     * @type {Integer (Int32)}
     */
    static FAX_E_RECIPIENTS_LIMIT => -2147214491

    /**
     * @type {Integer (UInt32)}
     */
    static JT_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JT_SEND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JT_RECEIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JT_ROUTING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JT_FAIL_RECEIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JS_PENDING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JS_INPROGRESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JS_DELETING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JS_FAILED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JS_PAUSED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JS_NOLINE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JS_RETRYING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static JS_RETRIES_EXCEEDED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_DIALING => 536870913

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_SENDING => 536870914

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_RECEIVING => 536870916

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_COMPLETED => 536870920

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_HANDLED => 536870928

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_UNAVAILABLE => 536870944

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_BUSY => 536870976

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_NO_ANSWER => 536871040

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_BAD_ADDRESS => 536871168

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_NO_DIAL_TONE => 536871424

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_DISCONNECTED => 536871936

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_FATAL_ERROR => 536872960

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_NOT_FAX_CALL => 536875008

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_CALL_DELAYED => 536879104

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_CALL_BLACKLISTED => 536887296

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_INITIALIZING => 536903680

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_OFFLINE => 536936448

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_RINGING => 537001984

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_AVAILABLE => 537919488

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_ABORTING => 538968064

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_ROUTING => 541065216

    /**
     * @type {Integer (UInt32)}
     */
    static FPS_ANSWERED => 545259520

    /**
     * @type {Integer (UInt32)}
     */
    static FPF_RECEIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FPF_SEND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FPF_VIRTUAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_DIALING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_SENDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_RECEIVING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_COMPLETED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_BUSY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_NO_ANSWER => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_BAD_ADDRESS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_NO_DIAL_TONE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_DISCONNECTED => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_FATAL_ERROR => 10

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_NOT_FAX_CALL => 11

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_CALL_DELAYED => 12

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_CALL_BLACKLISTED => 13

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_RINGING => 14

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_ABORTING => 15

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_ROUTING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_MODEM_POWERED_ON => 17

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_MODEM_POWERED_OFF => 18

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_IDLE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_FAXSVC_ENDED => 20

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_ANSWERED => 21

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_JOB_QUEUED => 22

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_DELETED => 23

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_INITIALIZING => 24

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_LINE_UNAVAILABLE => 25

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_HANDLED => 26

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_FAXSVC_STARTED => 27

    /**
     * @type {Integer (UInt32)}
     */
    static FEI_NEVENTS => 27

    /**
     * @type {Integer (UInt32)}
     */
    static FAX_JOB_SUBMIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FAX_JOB_QUERY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FAX_CONFIG_QUERY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FAX_CONFIG_SET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FAX_PORT_QUERY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FAX_PORT_SET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FAX_JOB_MANAGE => 64

    /**
     * @type {String}
     */
    static FAXSRV_DEVICE_NODETYPE_GUID => "{3115a19a-6251-46ac-9425-14782858b8c9}"

    /**
     * @type {String}
     */
    static FAXSRV_DEVICE_PROVIDER_NODETYPE_GUID => "{bd38e2ac-b926-4161-8640-0f6956ee2ba3}"

    /**
     * @type {String}
     */
    static FAXSRV_ROUTING_METHOD_NODETYPE_GUID => "{220d2cb0-85a9-4a43-b6e8-9d66b44f1af5}"

    /**
     * @type {String}
     */
    static CF_MSFAXSRV_DEVICE_ID => "FAXSRV_DeviceID"

    /**
     * @type {String}
     */
    static CF_MSFAXSRV_FSP_GUID => "FAXSRV_FSPGuid"

    /**
     * @type {String}
     */
    static CF_MSFAXSRV_SERVER_NAME => "FAXSRV_ServerName"

    /**
     * @type {String}
     */
    static CF_MSFAXSRV_ROUTEEXT_NAME => "FAXSRV_RoutingExtName"

    /**
     * @type {String}
     */
    static CF_MSFAXSRV_ROUTING_METHOD_GUID => "FAXSRV_RoutingMethodGuid"

    /**
     * @type {Integer (UInt32)}
     */
    static STI_UNICODE => 1

    /**
     * @type {String}
     */
    static CLSID_Sti => "{b323f8e0-2e68-11d0-90ea-00aa0060f86c}"

    /**
     * @type {String}
     */
    static GUID_DeviceArrivedLaunch => "{740d9ee6-70f1-11d1-ad10-00a02438ad48}"

    /**
     * @type {String}
     */
    static GUID_ScanImage => "{a6c5a715-8c6e-11d2-977a-0000f87a926f}"

    /**
     * @type {String}
     */
    static GUID_ScanPrintImage => "{b441f425-8c6e-11d2-977a-0000f87a926f}"

    /**
     * @type {String}
     */
    static GUID_ScanFaxImage => "{c00eb793-8c6e-11d2-977a-0000f87a926f}"

    /**
     * @type {String}
     */
    static GUID_STIUserDefined1 => "{c00eb795-8c6e-11d2-977a-0000f87a926f}"

    /**
     * @type {String}
     */
    static GUID_STIUserDefined2 => "{c77ae9c5-8c6e-11d2-977a-0000f87a926f}"

    /**
     * @type {String}
     */
    static GUID_STIUserDefined3 => "{c77ae9c6-8c6e-11d2-977a-0000f87a926f}"

    /**
     * @type {Integer (UInt32)}
     */
    static STI_VERSION_FLAG_MASK => 4278190080

    /**
     * @type {Integer (UInt32)}
     */
    static STI_VERSION_FLAG_UNICODE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static STI_VERSION_REAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STI_VERSION_MIN_ALLOWED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STI_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STI_MAX_INTERNAL_NAME_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static STI_GENCAP_COMMON_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static STI_GENCAP_NOTIFICATIONS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STI_GENCAP_POLLING_NEEDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STI_GENCAP_GENERATE_ARRIVALEVENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STI_GENCAP_AUTO_PORTSELECT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STI_GENCAP_WIA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STI_GENCAP_SUBSET => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WIA_INCOMPAT_XP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STI_HW_CONFIG_UNKNOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STI_HW_CONFIG_SCSI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STI_HW_CONFIG_USB => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STI_HW_CONFIG_SERIAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STI_HW_CONFIG_PARALLEL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STI_DEVSTATUS_ONLINE_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STI_DEVSTATUS_EVENTS_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_OPERATIONAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_PENDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_ERROR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_PAUSED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_PAPER_JAM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_PAPER_PROBLEM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_OFFLINE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_IO_ACTIVE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_BUSY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_TRANSFERRING => 512

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_INITIALIZING => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_WARMING_UP => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_USER_INTERVENTION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static STI_ONLINESTATE_POWER_SAVE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static STI_EVENTHANDLING_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STI_EVENTHANDLING_POLLING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STI_EVENTHANDLING_PENDING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STI_DIAGCODE_HWPRESENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STI_TRACE_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STI_TRACE_WARNING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STI_TRACE_ERROR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STI_SUBSCRIBE_FLAG_WINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STI_SUBSCRIBE_FLAG_EVENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_NOTIFICATION_DATA => 64

    /**
     * @type {String}
     */
    static STI_ADD_DEVICE_BROADCAST_ACTION => "Arrival"

    /**
     * @type {String}
     */
    static STI_REMOVE_DEVICE_BROADCAST_ACTION => "Removal"

    /**
     * @type {String}
     */
    static STI_ADD_DEVICE_BROADCAST_STRING => "STI\"

    /**
     * @type {String}
     */
    static STI_REMOVE_DEVICE_BROADCAST_STRING => "STI\"

    /**
     * @type {Integer (UInt32)}
     */
    static STI_DEVICE_CREATE_STATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STI_DEVICE_CREATE_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STI_DEVICE_CREATE_BOTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STI_DEVICE_CREATE_MASK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static STIEDFL_ALLDEVICES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STIEDFL_ATTACHEDONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STI_RAW_RESERVED => 4096

    /**
     * @type {Integer (Int32)}
     */
    static STI_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static STI_ERROR_NO_ERROR => 0

    /**
     * @type {Integer (Int32)}
     */
    static STI_NOTCONNECTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static STI_CHANGENOEFFECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_OLD_VERSION => -2147023746

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_BETA_VERSION => -2147023743

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_BADDRIVER => -2147024777

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_DEVICENOTREG => -2147221164

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_OBJECTNOTFOUND => -2147024894

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_INVALID_PARAM => -2147024809

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_NOINTERFACE => -2147467262

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_GENERIC => -2147467259

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_OUTOFMEMORY => -2147024882

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_UNSUPPORTED => -2147467263

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_NOT_INITIALIZED => -2147024875

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_ALREADY_INITIALIZED => -2147023649

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_DEVICE_LOCKED => -2147024863

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_READONLY => -2147024891

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_NOTINITIALIZED => -2147024891

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_NEEDS_LOCK => -2147024738

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_SHARING_VIOLATION => -2147024864

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_HANDLEEXISTS => -2147024713

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_INVALID_DEVICE_NAME => -2147024773

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_INVALID_HW_TYPE => -2147024883

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_NOEVENTS => -2147024637

    /**
     * @type {Integer (Int32)}
     */
    static STIERR_DEVICE_NOTREADY => -2147024875

    /**
     * @type {String}
     */
    static REGSTR_VAL_TYPE_W => "Type"

    /**
     * @type {String}
     */
    static REGSTR_VAL_VENDOR_NAME_W => "Vendor"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVICETYPE_W => "DeviceType"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVICESUBTYPE_W => "DeviceSubType"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEV_NAME_W => "DeviceName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DRIVER_DESC_W => "DriverDesc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FRIENDLY_NAME_W => "FriendlyName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_GENERIC_CAPS_W => "Capabilities"

    /**
     * @type {String}
     */
    static REGSTR_VAL_HARDWARE_W => "HardwareConfig"

    /**
     * @type {String}
     */
    static REGSTR_VAL_HARDWARE => "HardwareConfig"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVICE_NAME_W => "DriverDesc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DATA_W => "DeviceData"

    /**
     * @type {String}
     */
    static REGSTR_VAL_GUID_W => "GUID"

    /**
     * @type {String}
     */
    static REGSTR_VAL_GUID => "GUID"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LAUNCH_APPS_W => "LaunchApplications"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LAUNCH_APPS => "LaunchApplications"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LAUNCHABLE_W => "Launchable"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LAUNCHABLE => "Launchable"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHUTDOWNDELAY_W => "ShutdownIfUnusedDelay"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHUTDOWNDELAY => "ShutdownIfUnusedDelay"

    /**
     * @type {String}
     */
    static IS_DIGITAL_CAMERA_STR => "IsDigitalCamera"

    /**
     * @type {Integer (UInt32)}
     */
    static IS_DIGITAL_CAMERA_VAL => 1

    /**
     * @type {String}
     */
    static SUPPORTS_MSCPLUS_STR => "SupportsMSCPlus"

    /**
     * @type {Integer (UInt32)}
     */
    static SUPPORTS_MSCPLUS_VAL => 1

    /**
     * @type {String}
     */
    static STI_DEVICE_VALUE_TWAIN_NAME => "TwainDS"

    /**
     * @type {String}
     */
    static STI_DEVICE_VALUE_ISIS_NAME => "ISISDriverName"

    /**
     * @type {String}
     */
    static STI_DEVICE_VALUE_ICM_PROFILE => "ICMProfile"

    /**
     * @type {String}
     */
    static STI_DEVICE_VALUE_DEFAULT_LAUNCHAPP => "DefaultLaunchApp"

    /**
     * @type {String}
     */
    static STI_DEVICE_VALUE_TIMEOUT => "PollTimeout"

    /**
     * @type {String}
     */
    static STI_DEVICE_VALUE_DISABLE_NOTIFICATIONS => "DisableNotifications"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BAUDRATE => "BaudRate"

    /**
     * @type {String}
     */
    static STI_DEVICE_VALUE_TWAIN_NAME_A => "TwainDS"

    /**
     * @type {String}
     */
    static STI_DEVICE_VALUE_ISIS_NAME_A => "ISISDriverName"

    /**
     * @type {String}
     */
    static STI_DEVICE_VALUE_ICM_PROFILE_A => "ICMProfile"

    /**
     * @type {String}
     */
    static STI_DEVICE_VALUE_DEFAULT_LAUNCHAPP_A => "DefaultLaunchApp"

    /**
     * @type {String}
     */
    static STI_DEVICE_VALUE_TIMEOUT_A => "PollTimeout"

    /**
     * @type {String}
     */
    static STI_DEVICE_VALUE_DISABLE_NOTIFICATIONS_A => "DisableNotifications"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BAUDRATE_A => "BaudRate"

    /**
     * @type {Integer (UInt32)}
     */
    static STI_USD_GENCAP_NATIVE_PUSHSUPPORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STI_DEVICE_CREATE_FOR_MONITOR => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static lDEFAULT_PREFETCH_SIZE => 100

    /**
     * @type {Integer (UInt16)}
     */
    static wcharREASSIGN_RECIPIENTS_DELIMITER => 59
;@endregion Constants

;@region Methods
    /**
     * The FaxConnectFaxServer function connects a fax client application to the local fax server. The function returns a fax server handle that is required to call other fax client functions that facilitate job, device, configuration, and document management.
     * @param {PSTR} MachineName Type: <b>LPCTSTR</b>
     * 
     * This pointer must be <b>NULL</b> (an empty string), so that the application connects to the fax server on the local computer.
     * @param {Pointer<HANDLE>} FaxHandle Type: <b>LPHANDLE</b>
     * 
     * Pointer to a variable that receives a fax server handle that is required on subsequent calls to other fax client functions. If the fax server returns a null handle, it indicates an error.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * The <i>FaxHandle</i> parameter is <b>NULL</b>.
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
     * An error occurred during memory allocation.
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
     * The user under whose account the call was made does not have sufficient rights to the fax server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxconnectfaxservera
     * @since windows5.0
     */
    static FaxConnectFaxServerA(MachineName, FaxHandle) {
        MachineName := MachineName is String ? StrPtr(MachineName) : MachineName

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxConnectFaxServerA", "ptr", MachineName, "ptr", FaxHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxConnectFaxServer function connects a fax client application to the local fax server. The function returns a fax server handle that is required to call other fax client functions that facilitate job, device, configuration, and document management.
     * @param {PWSTR} MachineName Type: <b>LPCTSTR</b>
     * 
     * This pointer must be <b>NULL</b> (an empty string), so that the application connects to the fax server on the local computer.
     * @param {Pointer<HANDLE>} FaxHandle Type: <b>LPHANDLE</b>
     * 
     * Pointer to a variable that receives a fax server handle that is required on subsequent calls to other fax client functions. If the fax server returns a null handle, it indicates an error.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * The <i>FaxHandle</i> parameter is <b>NULL</b>.
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
     * An error occurred during memory allocation.
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
     * The user under whose account the call was made does not have sufficient rights to the fax server.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxconnectfaxserverw
     * @since windows5.0
     */
    static FaxConnectFaxServerW(MachineName, FaxHandle) {
        MachineName := MachineName is String ? StrPtr(MachineName) : MachineName

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxConnectFaxServerW", "ptr", MachineName, "ptr", FaxHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} FaxHandle 
     * @returns {BOOL} 
     */
    static FaxClose(FaxHandle) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        result := DllCall("WINFAX.dll\FaxClose", "ptr", FaxHandle, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} FaxHandle 
     * @param {Integer} DeviceId 
     * @param {Integer} Flags 
     * @param {Pointer<HANDLE>} FaxPortHandle 
     * @returns {BOOL} 
     */
    static FaxOpenPort(FaxHandle, DeviceId, Flags, FaxPortHandle) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        result := DllCall("WINFAX.dll\FaxOpenPort", "ptr", FaxHandle, "uint", DeviceId, "uint", Flags, "ptr", FaxPortHandle, "int")
        return result
    }

    /**
     * The FaxCompleteJobParams function creates both a FAX_COVERPAGE_INFO structure and a FAX_JOB_PARAM structure for a fax client application.
     * @param {Pointer<Pointer<FAX_JOB_PARAMA>>} JobParams Type: <b>PFAX_JOB_PARAM*</b>
     * 
     * Pointer to the address of a buffer to contain a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure. On output, this structure contains members with values that are available from the fax server.
     * @param {Pointer<Pointer<FAX_COVERPAGE_INFOA>>} CoverpageInfo Type: <b>PFAX_COVERPAGE_INFO*</b>
     * 
     * Pointer to the address of a buffer to contain a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a> structure. On output, this structure contains members with values that are available from the fax server.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxcompletejobparamsa
     * @since windows5.0
     */
    static FaxCompleteJobParamsA(JobParams, CoverpageInfo) {
        JobParamsMarshal := JobParams is VarRef ? "ptr*" : "ptr"
        CoverpageInfoMarshal := CoverpageInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("WINFAX.dll\FaxCompleteJobParamsA", JobParamsMarshal, JobParams, CoverpageInfoMarshal, CoverpageInfo, "int")
        return result
    }

    /**
     * The FaxCompleteJobParams function creates both a FAX_COVERPAGE_INFO structure and a FAX_JOB_PARAM structure for a fax client application.
     * @param {Pointer<Pointer<FAX_JOB_PARAMW>>} JobParams Type: <b>PFAX_JOB_PARAM*</b>
     * 
     * Pointer to the address of a buffer to contain a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure. On output, this structure contains members with values that are available from the fax server.
     * @param {Pointer<Pointer<FAX_COVERPAGE_INFOW>>} CoverpageInfo Type: <b>PFAX_COVERPAGE_INFO*</b>
     * 
     * Pointer to the address of a buffer to contain a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a> structure. On output, this structure contains members with values that are available from the fax server.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxcompletejobparamsw
     * @since windows5.0
     */
    static FaxCompleteJobParamsW(JobParams, CoverpageInfo) {
        JobParamsMarshal := JobParams is VarRef ? "ptr*" : "ptr"
        CoverpageInfoMarshal := CoverpageInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("WINFAX.dll\FaxCompleteJobParamsW", JobParamsMarshal, JobParams, CoverpageInfoMarshal, CoverpageInfo, "int")
        return result
    }

    /**
     * A fax client application calls the FaxSendDocument function to queue a fax job that will transmit an outgoing fax transmission.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {PSTR} FileName Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that contains the fully qualified path and name of the file that contains the fax document to transmit. The path can be a UNC path or a path that begins with a drive letter. 
     * 
     *                     
     * 
     * This parameter can contain any valid local file name. The file must be a properly registered file type, and the fax server must be able to access the file.
     * @param {Pointer<FAX_JOB_PARAMA>} JobParams Type: <b>PFAX_JOB_PARAM</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure that contains the information necessary for the fax server to send the fax transmission. The structure includes, among other items, the recipient's fax number, sender and recipient data, an optional billing code, and job scheduling information.
     * @param {Pointer<FAX_COVERPAGE_INFOA>} CoverpageInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a> structure that contains personal data to display on the cover page of the fax document. This parameter must be <b>NULL</b> if a cover page is not required.
     * @param {Pointer<Integer>} FaxJobId Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive a unique number that identifies the queued job that will send the fax transmission.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or all of the <i>FaxHandle</i>, <i>JobParams</i>, or <i>FileName</i> parameters are <b>NULL</b>; the call handle specified by the <b>CallHandle</b> member of the <a href="/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure is invalid (should be <b>NULL</b>), or the <b>RecipientNumber</b> member in the <b>FAX_JOB_PARAM</b> structure is <b>NULL</b>.
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
     * The <i>FaxHandle</i> parameter specifies a remote connection, but the <b>CallHandle</b> member of the <a href="/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure is not <b>NULL</b>.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_SUBMIT</a> access is required.
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
     * The fax server cannot locate the file specified by the <i>FileName</i> or the <i>CoverpageInfo</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The fax server cannot process the file specified by the <i>FileName</i> or the <i>CoverpageInfo</i> parameter.
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
     * An attempt was made to hand off a voice call to send a fax, using the <b>CallHandle</b> member of the <a href="/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure. This functionality is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsenddocumenta
     * @since windows5.0
     */
    static FaxSendDocumentA(FaxHandle, FileName, JobParams, CoverpageInfo, FaxJobId) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle
        FileName := FileName is String ? StrPtr(FileName) : FileName

        FaxJobIdMarshal := FaxJobId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSendDocumentA", "ptr", FaxHandle, "ptr", FileName, "ptr", JobParams, "ptr", CoverpageInfo, FaxJobIdMarshal, FaxJobId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxSendDocument function to queue a fax job that will transmit an outgoing fax transmission.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {PWSTR} FileName Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that contains the fully qualified path and name of the file that contains the fax document to transmit. The path can be a UNC path or a path that begins with a drive letter. 
     * 
     *                     
     * 
     * This parameter can contain any valid local file name. The file must be a properly registered file type, and the fax server must be able to access the file.
     * @param {Pointer<FAX_JOB_PARAMW>} JobParams Type: <b>PFAX_JOB_PARAM</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure that contains the information necessary for the fax server to send the fax transmission. The structure includes, among other items, the recipient's fax number, sender and recipient data, an optional billing code, and job scheduling information.
     * @param {Pointer<FAX_COVERPAGE_INFOW>} CoverpageInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a> structure that contains personal data to display on the cover page of the fax document. This parameter must be <b>NULL</b> if a cover page is not required.
     * @param {Pointer<Integer>} FaxJobId Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive a unique number that identifies the queued job that will send the fax transmission.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or all of the <i>FaxHandle</i>, <i>JobParams</i>, or <i>FileName</i> parameters are <b>NULL</b>; the call handle specified by the <b>CallHandle</b> member of the <a href="/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure is invalid (should be <b>NULL</b>), or the <b>RecipientNumber</b> member in the <b>FAX_JOB_PARAM</b> structure is <b>NULL</b>.
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
     * The <i>FaxHandle</i> parameter specifies a remote connection, but the <b>CallHandle</b> member of the <a href="/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure is not <b>NULL</b>.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_SUBMIT</a> access is required.
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
     * The fax server cannot locate the file specified by the <i>FileName</i> or the <i>CoverpageInfo</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The fax server cannot process the file specified by the <i>FileName</i> or the <i>CoverpageInfo</i> parameter.
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
     * An attempt was made to hand off a voice call to send a fax, using the <b>CallHandle</b> member of the <a href="/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure. This functionality is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsenddocumentw
     * @since windows5.0
     */
    static FaxSendDocumentW(FaxHandle, FileName, JobParams, CoverpageInfo, FaxJobId) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle
        FileName := FileName is String ? StrPtr(FileName) : FileName

        FaxJobIdMarshal := FaxJobId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSendDocumentW", "ptr", FaxHandle, "ptr", FileName, "ptr", JobParams, "ptr", CoverpageInfo, FaxJobIdMarshal, FaxJobId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxSendDocumentForBroadcast function to queue several fax jobs that will transmit the same outgoing fax transmission to several recipients.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {PSTR} FileName Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that contains the fully qualified path and name of the file that contains the fax document to transmit to all recipients. The path can be a UNC path or a path that begins with a drive letter. 
     * 
     *                     
     * 
     * 
     * 
     * This parameter can contain any valid local file name. The file must be a properly registered file type, and the fax server must be able to access the file.
     * @param {Pointer<Integer>} FaxJobId Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the unique number that identifies the queued job that will send the fax transmission.
     * @param {Pointer<PFAX_RECIPIENT_CALLBACKA>} FaxRecipientCallback Type: <b>PFAX_RECIPIENT_CALLBACK</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfax_recipient_callbacka">FAX_RECIPIENT_CALLBACK</a> function that retrieves user-specific information for each designated recipient of the fax transmission. The <b>FaxSendDocumentForBroadcast</b> function calls the <b>FAX_RECIPIENT_CALLBACK</b> function once for each fax recipient until it returns a value of zero, indicating that all outbound transmissions have been queued.
     * @param {Pointer<Void>} Context Type: <b>LPVOID</b>
     * 
     * Pointer to a variable that contains application-specific context information or an application-defined value. <b>FaxSendDocumentForBroadcast</b> passes this data to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfax_recipient_callbacka">FAX_RECIPIENT_CALLBACK</a> function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or all of the <i>FaxHandle</i>, <i>FileName</i>, <i>FaxRecipientCallback</i>, or <i>FaxJobId</i> parameters are <b>NULL</b>, or the <b>RecipientNumber</b> member in the <a href="/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure is <b>NULL</b>.
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
     * The fax server cannot locate the file specified by the <i>FileName</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The fax server cannot render the file specified by the <i>FileName</i> parameter.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_SUBMIT</a> access is required.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsenddocumentforbroadcasta
     * @since windows5.0
     */
    static FaxSendDocumentForBroadcastA(FaxHandle, FileName, FaxJobId, FaxRecipientCallback, Context) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle
        FileName := FileName is String ? StrPtr(FileName) : FileName

        FaxJobIdMarshal := FaxJobId is VarRef ? "uint*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSendDocumentForBroadcastA", "ptr", FaxHandle, "ptr", FileName, FaxJobIdMarshal, FaxJobId, "ptr", FaxRecipientCallback, ContextMarshal, Context, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxSendDocumentForBroadcast function to queue several fax jobs that will transmit the same outgoing fax transmission to several recipients.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {PWSTR} FileName Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that contains the fully qualified path and name of the file that contains the fax document to transmit to all recipients. The path can be a UNC path or a path that begins with a drive letter. 
     * 
     *                     
     * 
     * 
     * 
     * This parameter can contain any valid local file name. The file must be a properly registered file type, and the fax server must be able to access the file.
     * @param {Pointer<Integer>} FaxJobId Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the unique number that identifies the queued job that will send the fax transmission.
     * @param {Pointer<PFAX_RECIPIENT_CALLBACKW>} FaxRecipientCallback Type: <b>PFAX_RECIPIENT_CALLBACK</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfax_recipient_callbacka">FAX_RECIPIENT_CALLBACK</a> function that retrieves user-specific information for each designated recipient of the fax transmission. The <b>FaxSendDocumentForBroadcast</b> function calls the <b>FAX_RECIPIENT_CALLBACK</b> function once for each fax recipient until it returns a value of zero, indicating that all outbound transmissions have been queued.
     * @param {Pointer<Void>} Context Type: <b>LPVOID</b>
     * 
     * Pointer to a variable that contains application-specific context information or an application-defined value. <b>FaxSendDocumentForBroadcast</b> passes this data to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfax_recipient_callbacka">FAX_RECIPIENT_CALLBACK</a> function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or all of the <i>FaxHandle</i>, <i>FileName</i>, <i>FaxRecipientCallback</i>, or <i>FaxJobId</i> parameters are <b>NULL</b>, or the <b>RecipientNumber</b> member in the <a href="/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure is <b>NULL</b>.
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
     * The fax server cannot locate the file specified by the <i>FileName</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The fax server cannot render the file specified by the <i>FileName</i> parameter.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_SUBMIT</a> access is required.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsenddocumentforbroadcastw
     * @since windows5.0
     */
    static FaxSendDocumentForBroadcastW(FaxHandle, FileName, FaxJobId, FaxRecipientCallback, Context) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle
        FileName := FileName is String ? StrPtr(FileName) : FileName

        FaxJobIdMarshal := FaxJobId is VarRef ? "uint*" : "ptr"
        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSendDocumentForBroadcastW", "ptr", FaxHandle, "ptr", FileName, FaxJobIdMarshal, FaxJobId, "ptr", FaxRecipientCallback, ContextMarshal, Context, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxEnumJobs function enumerates all queued and active fax jobs on the fax server to which the client has connected. The function returns detailed information for each fax job to the fax client application.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<Pointer<FAX_JOB_ENTRYA>>} JobEntry Type: <b>PFAX_JOB_ENTRY*</b>
     * 
     * Pointer to the address of a buffer to receive an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_entrya">FAX_JOB_ENTRY</a> structures. Each structure describes one fax job. The data includes, among other items, the job type and status; recipient and sender identification; scheduling and delivery settings; and the page count. For information about memory allocation, see the following Remarks section.
     * @param {Pointer<Integer>} JobsReturned Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the number of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_entrya">FAX_JOB_ENTRY</a> structures the function returns in the <i>JobEntry</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_QUERY</a> access is required.
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
     * One or all of the <i>JobsReturned</i>, <i>JobEntry</i>, or <i>FaxHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxenumjobsa
     * @since windows5.0
     */
    static FaxEnumJobsA(FaxHandle, JobEntry, JobsReturned) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        JobEntryMarshal := JobEntry is VarRef ? "ptr*" : "ptr"
        JobsReturnedMarshal := JobsReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxEnumJobsA", "ptr", FaxHandle, JobEntryMarshal, JobEntry, JobsReturnedMarshal, JobsReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxEnumJobs function enumerates all queued and active fax jobs on the fax server to which the client has connected. The function returns detailed information for each fax job to the fax client application.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<Pointer<FAX_JOB_ENTRYW>>} JobEntry Type: <b>PFAX_JOB_ENTRY*</b>
     * 
     * Pointer to the address of a buffer to receive an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_entrya">FAX_JOB_ENTRY</a> structures. Each structure describes one fax job. The data includes, among other items, the job type and status; recipient and sender identification; scheduling and delivery settings; and the page count. For information about memory allocation, see the following Remarks section.
     * @param {Pointer<Integer>} JobsReturned Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the number of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_entrya">FAX_JOB_ENTRY</a> structures the function returns in the <i>JobEntry</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_QUERY</a> access is required.
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
     * One or all of the <i>JobsReturned</i>, <i>JobEntry</i>, or <i>FaxHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxenumjobsw
     * @since windows5.0
     */
    static FaxEnumJobsW(FaxHandle, JobEntry, JobsReturned) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        JobEntryMarshal := JobEntry is VarRef ? "ptr*" : "ptr"
        JobsReturnedMarshal := JobsReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxEnumJobsW", "ptr", FaxHandle, JobEntryMarshal, JobEntry, JobsReturnedMarshal, JobsReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxGetJob function to retrieve detailed information for the specified queued or active fax job. The function returns the information in a FAX_JOB_ENTRY structure.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Integer} JobId Type: <b>DWORD</b>
     * 
     * Specifies a unique number that identifies a queued or active fax job. The job can be an inbound or an outbound transmission.
     * @param {Pointer<Pointer<FAX_JOB_ENTRYA>>} JobEntry Type: <b>PFAX_JOB_ENTRY*</b>
     * 
     * Pointer to the address of a buffer to receive a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_entrya">FAX_JOB_ENTRY</a> structure. The data includes the job type and status, recipient and sender identification, scheduling and delivery settings, and the page count. For information about memory allocation, see the following Remarks section.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_QUERY</a> access is required.
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
     * The <i>JobId</i> parameter is invalid, or one or both of the <i>JobEntry</i> or <i>FaxHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxgetjoba
     * @since windows5.0
     */
    static FaxGetJobA(FaxHandle, JobId, JobEntry) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        JobEntryMarshal := JobEntry is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxGetJobA", "ptr", FaxHandle, "uint", JobId, JobEntryMarshal, JobEntry, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxGetJob function to retrieve detailed information for the specified queued or active fax job. The function returns the information in a FAX_JOB_ENTRY structure.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Integer} JobId Type: <b>DWORD</b>
     * 
     * Specifies a unique number that identifies a queued or active fax job. The job can be an inbound or an outbound transmission.
     * @param {Pointer<Pointer<FAX_JOB_ENTRYW>>} JobEntry Type: <b>PFAX_JOB_ENTRY*</b>
     * 
     * Pointer to the address of a buffer to receive a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_entrya">FAX_JOB_ENTRY</a> structure. The data includes the job type and status, recipient and sender identification, scheduling and delivery settings, and the page count. For information about memory allocation, see the following Remarks section.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_QUERY</a> access is required.
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
     * The <i>JobId</i> parameter is invalid, or one or both of the <i>JobEntry</i> or <i>FaxHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxgetjobw
     * @since windows5.0
     */
    static FaxGetJobW(FaxHandle, JobId, JobEntry) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        JobEntryMarshal := JobEntry is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxGetJobW", "ptr", FaxHandle, "uint", JobId, JobEntryMarshal, JobEntry, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxSetJob function to pause, resume, cancel, or restart a specified fax job.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Integer} JobId Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that is a unique number to identify the fax job to modify. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumjobsa">FaxEnumJobs</a> function to retrieve a valid fax job identifier to use in the <i>JobId</i> parameter.
     * @param {Integer} Command Type: <b>DWORD</b>
     * @param {Pointer<FAX_JOB_ENTRYA>} JobEntry Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_entrya">FAX_JOB_ENTRY</a>*</b>
     * 
     * Not used, must be <b>NULL</b>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_MANAGE</a> access is required.
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
     * The <i>FaxHandle</i> parameter is <b>NULL</b>, or one or all of the <i>Command</i>, <i>JobEntry</i>, or <i>JobId</i> parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsetjoba
     * @since windows5.0
     */
    static FaxSetJobA(FaxHandle, JobId, Command, JobEntry) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSetJobA", "ptr", FaxHandle, "uint", JobId, "uint", Command, "ptr", JobEntry, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxSetJob function to pause, resume, cancel, or restart a specified fax job.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Integer} JobId Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that is a unique number to identify the fax job to modify. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumjobsa">FaxEnumJobs</a> function to retrieve a valid fax job identifier to use in the <i>JobId</i> parameter.
     * @param {Integer} Command Type: <b>DWORD</b>
     * @param {Pointer<FAX_JOB_ENTRYW>} JobEntry Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_entrya">FAX_JOB_ENTRY</a>*</b>
     * 
     * Not used, must be <b>NULL</b>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_MANAGE</a> access is required.
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
     * The <i>FaxHandle</i> parameter is <b>NULL</b>, or one or all of the <i>Command</i>, <i>JobEntry</i>, or <i>JobId</i> parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsetjobw
     * @since windows5.0
     */
    static FaxSetJobW(FaxHandle, JobId, Command, JobEntry) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSetJobW", "ptr", FaxHandle, "uint", JobId, "uint", Command, "ptr", JobEntry, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} FaxHandle 
     * @param {Integer} JobId 
     * @param {Pointer<Pointer<Integer>>} Buffer 
     * @param {Pointer<Integer>} BufferSize 
     * @param {Pointer<Integer>} ImageWidth 
     * @param {Pointer<Integer>} ImageHeight 
     * @returns {BOOL} 
     */
    static FaxGetPageData(FaxHandle, JobId, Buffer, BufferSize, ImageWidth, ImageHeight) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        BufferMarshal := Buffer is VarRef ? "ptr*" : "ptr"
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        ImageWidthMarshal := ImageWidth is VarRef ? "uint*" : "ptr"
        ImageHeightMarshal := ImageHeight is VarRef ? "uint*" : "ptr"

        result := DllCall("WINFAX.dll\FaxGetPageData", "ptr", FaxHandle, "uint", JobId, BufferMarshal, Buffer, BufferSizeMarshal, BufferSize, ImageWidthMarshal, ImageWidth, ImageHeightMarshal, ImageHeight, "int")
        return result
    }

    /**
     * The FaxGetDeviceStatus function returns to a fax client application current status information for the fax device of interest.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {Pointer<Pointer<FAX_DEVICE_STATUSA>>} DeviceStatus Type: <b>PFAX_DEVICE_STATUS*</b>
     * 
     * Pointer to the address of a buffer to receive a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_device_statusa">FAX_DEVICE_STATUS</a> structure. The structure describes the status of one fax device. For information about memory allocation, see the following Remarks section
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or both of the <i>DeviceStatus</i> or <i>FaxPortHandle</i> parameters are <b>NULL</b>.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_QUERY</a> access is required.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxgetdevicestatusa
     * @since windows5.0
     */
    static FaxGetDeviceStatusA(FaxPortHandle, DeviceStatus) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle

        DeviceStatusMarshal := DeviceStatus is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxGetDeviceStatusA", "ptr", FaxPortHandle, DeviceStatusMarshal, DeviceStatus, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxGetDeviceStatus function returns to a fax client application current status information for the fax device of interest.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {Pointer<Pointer<FAX_DEVICE_STATUSW>>} DeviceStatus Type: <b>PFAX_DEVICE_STATUS*</b>
     * 
     * Pointer to the address of a buffer to receive a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_device_statusa">FAX_DEVICE_STATUS</a> structure. The structure describes the status of one fax device. For information about memory allocation, see the following Remarks section
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or both of the <i>DeviceStatus</i> or <i>FaxPortHandle</i> parameters are <b>NULL</b>.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_QUERY</a> access is required.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxgetdevicestatusw
     * @since windows5.0
     */
    static FaxGetDeviceStatusW(FaxPortHandle, DeviceStatus) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle

        DeviceStatusMarshal := DeviceStatus is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxGetDeviceStatusW", "ptr", FaxPortHandle, DeviceStatusMarshal, DeviceStatus, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} FaxHandle 
     * @param {Integer} JobId 
     * @returns {BOOL} 
     */
    static FaxAbort(FaxHandle, JobId) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        result := DllCall("WINFAX.dll\FaxAbort", "ptr", FaxHandle, "uint", JobId, "int")
        return result
    }

    /**
     * The FaxGetConfiguration function returns to a fax client application the global configuration settings for the fax server to which the client has connected.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<Pointer<FAX_CONFIGURATIONA>>} FaxConfig Type: <b>PFAX_CONFIGURATION*</b>
     * 
     * Pointer to the address of a buffer to receive a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_configurationa">FAX_CONFIGURATION</a> structure. The structure contains the current configuration settings for the fax server. For information about memory allocation, see the following Remarks section.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or both of the <i>FaxConfig</i> or <i>FaxHandle</i> parameters are <b>NULL</b>.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_CONFIG_QUERY</a> access is required.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxgetconfigurationa
     * @since windows5.0
     */
    static FaxGetConfigurationA(FaxHandle, FaxConfig) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        FaxConfigMarshal := FaxConfig is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxGetConfigurationA", "ptr", FaxHandle, FaxConfigMarshal, FaxConfig, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxGetConfiguration function returns to a fax client application the global configuration settings for the fax server to which the client has connected.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<Pointer<FAX_CONFIGURATIONW>>} FaxConfig Type: <b>PFAX_CONFIGURATION*</b>
     * 
     * Pointer to the address of a buffer to receive a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_configurationa">FAX_CONFIGURATION</a> structure. The structure contains the current configuration settings for the fax server. For information about memory allocation, see the following Remarks section.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or both of the <i>FaxConfig</i> or <i>FaxHandle</i> parameters are <b>NULL</b>.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_CONFIG_QUERY</a> access is required.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxgetconfigurationw
     * @since windows5.0
     */
    static FaxGetConfigurationW(FaxHandle, FaxConfig) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        FaxConfigMarshal := FaxConfig is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxGetConfigurationW", "ptr", FaxHandle, FaxConfigMarshal, FaxConfig, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxSetConfiguration function to change the global configuration settings for the fax server to which the client has connected.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<FAX_CONFIGURATIONA>} FaxConfig Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_configurationa">FAX_CONFIGURATION</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_configurationa">FAX_CONFIGURATION</a> structure. The structure contains data to modify the current fax server configuration settings.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_CONFIG_SET</a> access is required.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_QUERY</a> access is required.
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
     * The <i>FaxConfig</i> parameter is <b>NULL</b>, or the <b>SizeOfStruct</b> member of the specified <a href="/windows/desktop/api/winfax/ns-winfax-fax_configurationa">FAX_CONFIGURATION</a> structure is not equal to <b>sizeof(FAX_CONFIGURATION)</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsetconfigurationa
     * @since windows5.0
     */
    static FaxSetConfigurationA(FaxHandle, FaxConfig) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSetConfigurationA", "ptr", FaxHandle, "ptr", FaxConfig, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxSetConfiguration function to change the global configuration settings for the fax server to which the client has connected.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<FAX_CONFIGURATIONW>} FaxConfig Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_configurationa">FAX_CONFIGURATION</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_configurationa">FAX_CONFIGURATION</a> structure. The structure contains data to modify the current fax server configuration settings.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_CONFIG_SET</a> access is required.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_QUERY</a> access is required.
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
     * The <i>FaxConfig</i> parameter is <b>NULL</b>, or the <b>SizeOfStruct</b> member of the specified <a href="/windows/desktop/api/winfax/ns-winfax-fax_configurationa">FAX_CONFIGURATION</a> structure is not equal to <b>sizeof(FAX_CONFIGURATION)</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsetconfigurationw
     * @since windows5.0
     */
    static FaxSetConfigurationW(FaxHandle, FaxConfig) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSetConfigurationW", "ptr", FaxHandle, "ptr", FaxConfig, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxGetLoggingCategories function returns to a fax client application the current logging categories for the fax server to which the client has connected.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<Pointer<FAX_LOG_CATEGORYA>>} Categories Type: <b>PFAX_LOG_CATEGORY*</b>
     * 
     * Pointer to the address of a buffer to receive an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_log_categorya">FAX_LOG_CATEGORY</a> structures. Each structure describes one current logging category. The data includes the descriptive name of the logging category, the category number, and the current logging level. 
     * 
     *                     
     * 
     * For a description of predefined logging categories and logging levels, see the <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_log_categorya">FAX_LOG_CATEGORY</a> topic. For information about memory allocation, see the following Remarks section.
     * @param {Pointer<Integer>} NumberCategories Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the number of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_log_categorya">FAX_LOG_CATEGORY</a> structures the function returns in the <i>Categories</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_CONFIG_QUERY</a> access is required.
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
     * One or all of the <i>Categories</i>, <i>NumberCategories</i>, or <i>FaxHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxgetloggingcategoriesa
     * @since windows5.0
     */
    static FaxGetLoggingCategoriesA(FaxHandle, Categories, NumberCategories) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        CategoriesMarshal := Categories is VarRef ? "ptr*" : "ptr"
        NumberCategoriesMarshal := NumberCategories is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxGetLoggingCategoriesA", "ptr", FaxHandle, CategoriesMarshal, Categories, NumberCategoriesMarshal, NumberCategories, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxGetLoggingCategories function returns to a fax client application the current logging categories for the fax server to which the client has connected.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<Pointer<FAX_LOG_CATEGORYW>>} Categories Type: <b>PFAX_LOG_CATEGORY*</b>
     * 
     * Pointer to the address of a buffer to receive an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_log_categorya">FAX_LOG_CATEGORY</a> structures. Each structure describes one current logging category. The data includes the descriptive name of the logging category, the category number, and the current logging level. 
     * 
     *                     
     * 
     * For a description of predefined logging categories and logging levels, see the <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_log_categorya">FAX_LOG_CATEGORY</a> topic. For information about memory allocation, see the following Remarks section.
     * @param {Pointer<Integer>} NumberCategories Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the number of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_log_categorya">FAX_LOG_CATEGORY</a> structures the function returns in the <i>Categories</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_CONFIG_QUERY</a> access is required.
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
     * One or all of the <i>Categories</i>, <i>NumberCategories</i>, or <i>FaxHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxgetloggingcategoriesw
     * @since windows5.0
     */
    static FaxGetLoggingCategoriesW(FaxHandle, Categories, NumberCategories) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        CategoriesMarshal := Categories is VarRef ? "ptr*" : "ptr"
        NumberCategoriesMarshal := NumberCategories is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxGetLoggingCategoriesW", "ptr", FaxHandle, CategoriesMarshal, Categories, NumberCategoriesMarshal, NumberCategories, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxSetLoggingCategories function to modify the current logging categories for the fax server to which the client has connected.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<FAX_LOG_CATEGORYA>} Categories Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_log_categorya">FAX_LOG_CATEGORY</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_log_categorya">FAX_LOG_CATEGORY</a> structures. Each structure contains the data to modify one logging category. The data includes the descriptive name of the logging category, the category number, and the current logging level for the category. For a description of predefined logging categories and logging levels, see the <b>FAX_LOG_CATEGORY</b> topic.
     * @param {Integer} NumberCategories Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that contains the number of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_log_categorya">FAX_LOG_CATEGORY</a> structures the function passes in the <i>Categories</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or all of the <i>FaxHandle</i>, <i>Categories</i>, or <i>NumberCategories</i> parameters are invalid or <b>NULL</b>.
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
     * The <i>FaxHandle</i> parameter is <b>NULL</b>; or the <i>hWnd</i> parameter is specified but the <i>FaxHandle</i> parameter does not specify a connection with a local fax server; or the <i>MessageStart</i> parameter specifies a message in the range below <a href="/windows/desktop/winmsg/wm-user">WM_USER</a>.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_CONFIG_SET</a> access is required.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsetloggingcategoriesa
     * @since windows5.0
     */
    static FaxSetLoggingCategoriesA(FaxHandle, Categories, NumberCategories) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSetLoggingCategoriesA", "ptr", FaxHandle, "ptr", Categories, "uint", NumberCategories, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxSetLoggingCategories function to modify the current logging categories for the fax server to which the client has connected.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<FAX_LOG_CATEGORYW>} Categories Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_log_categorya">FAX_LOG_CATEGORY</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_log_categorya">FAX_LOG_CATEGORY</a> structures. Each structure contains the data to modify one logging category. The data includes the descriptive name of the logging category, the category number, and the current logging level for the category. For a description of predefined logging categories and logging levels, see the <b>FAX_LOG_CATEGORY</b> topic.
     * @param {Integer} NumberCategories Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that contains the number of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_log_categorya">FAX_LOG_CATEGORY</a> structures the function passes in the <i>Categories</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or all of the <i>FaxHandle</i>, <i>Categories</i>, or <i>NumberCategories</i> parameters are invalid or <b>NULL</b>.
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
     * The <i>FaxHandle</i> parameter is <b>NULL</b>; or the <i>hWnd</i> parameter is specified but the <i>FaxHandle</i> parameter does not specify a connection with a local fax server; or the <i>MessageStart</i> parameter specifies a message in the range below <a href="/windows/desktop/winmsg/wm-user">WM_USER</a>.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_CONFIG_SET</a> access is required.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsetloggingcategoriesw
     * @since windows5.0
     */
    static FaxSetLoggingCategoriesW(FaxHandle, Categories, NumberCategories) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSetLoggingCategoriesW", "ptr", FaxHandle, "ptr", Categories, "uint", NumberCategories, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxEnumPorts function enumerates all fax devices currently attached to the fax server to which the client has connected. The function returns detailed information for each fax port to the fax client application.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<Pointer<FAX_PORT_INFOA>>} PortInfo Type: <b>PFAX_PORT_INFO*</b>
     * 
     * Pointer to the address of a buffer to receive an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_port_infoa">FAX_PORT_INFO</a> structures. Each structure describes one fax port. The data includes, among other items, the permanent line identifier, and the current status and capability of the port. For information about memory allocation, see the following Remarks section.
     * @param {Pointer<Integer>} PortsReturned Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the number of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_port_infoa">FAX_PORT_INFO</a> structures the function returns in the <i>PortInfo</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_QUERY</a> access is required.
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
     * One or all of the <i>PortsReturned</i>, <i>PortInfo</i>, or <i>FaxHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxenumportsa
     * @since windows5.0
     */
    static FaxEnumPortsA(FaxHandle, PortInfo, PortsReturned) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        PortInfoMarshal := PortInfo is VarRef ? "ptr*" : "ptr"
        PortsReturnedMarshal := PortsReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxEnumPortsA", "ptr", FaxHandle, PortInfoMarshal, PortInfo, PortsReturnedMarshal, PortsReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxEnumPorts function enumerates all fax devices currently attached to the fax server to which the client has connected. The function returns detailed information for each fax port to the fax client application.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<Pointer<FAX_PORT_INFOW>>} PortInfo Type: <b>PFAX_PORT_INFO*</b>
     * 
     * Pointer to the address of a buffer to receive an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_port_infoa">FAX_PORT_INFO</a> structures. Each structure describes one fax port. The data includes, among other items, the permanent line identifier, and the current status and capability of the port. For information about memory allocation, see the following Remarks section.
     * @param {Pointer<Integer>} PortsReturned Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the number of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_port_infoa">FAX_PORT_INFO</a> structures the function returns in the <i>PortInfo</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_JOB_QUERY</a> access is required.
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
     * One or all of the <i>PortsReturned</i>, <i>PortInfo</i>, or <i>FaxHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxenumportsw
     * @since windows5.0
     */
    static FaxEnumPortsW(FaxHandle, PortInfo, PortsReturned) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        PortInfoMarshal := PortInfo is VarRef ? "ptr*" : "ptr"
        PortsReturnedMarshal := PortsReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxEnumPortsW", "ptr", FaxHandle, PortInfoMarshal, PortInfo, PortsReturnedMarshal, PortsReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxGetPort function returns information for a specified fax port to a fax client application.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {Pointer<Pointer<FAX_PORT_INFOA>>} PortInfo Type: <b>PFAX_PORT_INFO*</b>
     * 
     * Pointer to the address of a buffer to receive a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_port_infoa">FAX_PORT_INFO</a> structure. The structure describes one fax port. For information about memory allocation, see the following Remarks section.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or both of the <i>PortInfo</i> or <i>FaxPortHandle</i> parameters are <b>NULL</b>.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_QUERY</a> access is required.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxgetporta
     * @since windows5.0
     */
    static FaxGetPortA(FaxPortHandle, PortInfo) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle

        PortInfoMarshal := PortInfo is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxGetPortA", "ptr", FaxPortHandle, PortInfoMarshal, PortInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxGetPort function returns information for a specified fax port to a fax client application.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {Pointer<Pointer<FAX_PORT_INFOW>>} PortInfo Type: <b>PFAX_PORT_INFO*</b>
     * 
     * Pointer to the address of a buffer to receive a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_port_infoa">FAX_PORT_INFO</a> structure. The structure describes one fax port. For information about memory allocation, see the following Remarks section.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or both of the <i>PortInfo</i> or <i>FaxPortHandle</i> parameters are <b>NULL</b>.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_QUERY</a> access is required.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxgetportw
     * @since windows5.0
     */
    static FaxGetPortW(FaxPortHandle, PortInfo) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle

        PortInfoMarshal := PortInfo is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxGetPortW", "ptr", FaxPortHandle, PortInfoMarshal, PortInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxSetPort function to change the configuration of the fax port of interest.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {Pointer<FAX_PORT_INFOA>} PortInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_port_infoa">FAX_PORT_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_port_infoa">FAX_PORT_INFO</a> structure. The structure contains data to modify the configuration of the specified fax port.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_SET</a> access is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The port indicated by the <i>FaxPortHandle</i> parameter is busy.
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
     * One or both of the <i>FaxPortHandle</i> or <i>PortInfo</i> parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsetporta
     * @since windows5.0
     */
    static FaxSetPortA(FaxPortHandle, PortInfo) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSetPortA", "ptr", FaxPortHandle, "ptr", PortInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxSetPort function to change the configuration of the fax port of interest.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {Pointer<FAX_PORT_INFOW>} PortInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_port_infoa">FAX_PORT_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_port_infoa">FAX_PORT_INFO</a> structure. The structure contains data to modify the configuration of the specified fax port.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_SET</a> access is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The port indicated by the <i>FaxPortHandle</i> parameter is busy.
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
     * One or both of the <i>FaxPortHandle</i> or <i>PortInfo</i> parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsetportw
     * @since windows5.0
     */
    static FaxSetPortW(FaxPortHandle, PortInfo) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSetPortW", "ptr", FaxPortHandle, "ptr", PortInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxEnumRoutingMethods function enumerates all fax routing methods for a specific fax device. The function returns information about each routing method to a fax client application.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {Pointer<Pointer<FAX_ROUTING_METHODA>>} RoutingMethod Type: <b>PFAX_ROUTING_METHOD*</b>
     * 
     * Pointer to the address of a buffer to receive an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_routing_methoda">FAX_ROUTING_METHOD</a> structures. Each structure contains information about one fax routing method. The data includes, among other items, the name of the DLL that exports the routing method, the GUID and function name that identify the routing method, and the method's user-friendly name. 
     * 
     *                     
     * 
     * For information about memory allocation, see the following Remarks section. For information about fax routing methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>.
     * @param {Pointer<Integer>} MethodsReturned Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the number of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_routing_methoda">FAX_ROUTING_METHOD</a> structures the <b>FaxEnumRoutingMethods</b> function returns in the <i>RoutingMethod</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_QUERY</a> access is required.
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
     * One or all of the <i>MethodsReturned</i>, <i>RoutingMethod</i>, or <i>FaxPortHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxenumroutingmethodsa
     * @since windows5.0
     */
    static FaxEnumRoutingMethodsA(FaxPortHandle, RoutingMethod, MethodsReturned) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle

        RoutingMethodMarshal := RoutingMethod is VarRef ? "ptr*" : "ptr"
        MethodsReturnedMarshal := MethodsReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxEnumRoutingMethodsA", "ptr", FaxPortHandle, RoutingMethodMarshal, RoutingMethod, MethodsReturnedMarshal, MethodsReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxEnumRoutingMethods function enumerates all fax routing methods for a specific fax device. The function returns information about each routing method to a fax client application.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {Pointer<Pointer<FAX_ROUTING_METHODW>>} RoutingMethod Type: <b>PFAX_ROUTING_METHOD*</b>
     * 
     * Pointer to the address of a buffer to receive an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_routing_methoda">FAX_ROUTING_METHOD</a> structures. Each structure contains information about one fax routing method. The data includes, among other items, the name of the DLL that exports the routing method, the GUID and function name that identify the routing method, and the method's user-friendly name. 
     * 
     *                     
     * 
     * For information about memory allocation, see the following Remarks section. For information about fax routing methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>.
     * @param {Pointer<Integer>} MethodsReturned Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the number of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_routing_methoda">FAX_ROUTING_METHOD</a> structures the <b>FaxEnumRoutingMethods</b> function returns in the <i>RoutingMethod</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_QUERY</a> access is required.
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
     * One or all of the <i>MethodsReturned</i>, <i>RoutingMethod</i>, or <i>FaxPortHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxenumroutingmethodsw
     * @since windows5.0
     */
    static FaxEnumRoutingMethodsW(FaxPortHandle, RoutingMethod, MethodsReturned) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle

        RoutingMethodMarshal := RoutingMethod is VarRef ? "ptr*" : "ptr"
        MethodsReturnedMarshal := MethodsReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxEnumRoutingMethodsW", "ptr", FaxPortHandle, RoutingMethodMarshal, RoutingMethod, MethodsReturnedMarshal, MethodsReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxEnableRoutingMethod function enables or disables a fax routing method for a specific fax device. A fax administration application typically calls this function for device management.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {PSTR} RoutingGuid Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the GUID that uniquely identifies the fax routing method of interest. 
     * 
     *                     
     * 
     * For information about fax routing methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>. For information about the relationship between routing methods and GUIDs, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-routing-methods">Fax Routing Methods</a>.
     * @param {BOOL} Enabled Type: <b>BOOL</b>
     * 
     * Specifies a Boolean variable that indicates whether the application is enabling or disabling the fax routing method specified by the <i>RoutingGuid</i> parameter. If this parameter is <b>TRUE</b>, the application is enabling the routing method; if this parameter is <b>FALSE</b>, the application is disabling the routing method.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or both of the <i>FaxPortHandle</i> or <i>RoutingGuid</i> parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>RoutingGuid</i> parameter is invalid.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_SET</a> access is required.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxenableroutingmethoda
     * @since windows5.0
     */
    static FaxEnableRoutingMethodA(FaxPortHandle, RoutingGuid, Enabled) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle
        RoutingGuid := RoutingGuid is String ? StrPtr(RoutingGuid) : RoutingGuid

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxEnableRoutingMethodA", "ptr", FaxPortHandle, "ptr", RoutingGuid, "int", Enabled, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxEnableRoutingMethod function enables or disables a fax routing method for a specific fax device. A fax administration application typically calls this function for device management.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {PWSTR} RoutingGuid Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the GUID that uniquely identifies the fax routing method of interest. 
     * 
     *                     
     * 
     * For information about fax routing methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>. For information about the relationship between routing methods and GUIDs, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-routing-methods">Fax Routing Methods</a>.
     * @param {BOOL} Enabled Type: <b>BOOL</b>
     * 
     * Specifies a Boolean variable that indicates whether the application is enabling or disabling the fax routing method specified by the <i>RoutingGuid</i> parameter. If this parameter is <b>TRUE</b>, the application is enabling the routing method; if this parameter is <b>FALSE</b>, the application is disabling the routing method.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or both of the <i>FaxPortHandle</i> or <i>RoutingGuid</i> parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>RoutingGuid</i> parameter is invalid.
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
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_SET</a> access is required.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxenableroutingmethodw
     * @since windows5.0
     */
    static FaxEnableRoutingMethodW(FaxPortHandle, RoutingGuid, Enabled) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle
        RoutingGuid := RoutingGuid is String ? StrPtr(RoutingGuid) : RoutingGuid

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxEnableRoutingMethodW", "ptr", FaxPortHandle, "ptr", RoutingGuid, "int", Enabled, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxEnumGlobalRoutingInfo function enumerates all fax routing methods associated with a specific fax server.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<Pointer<FAX_GLOBAL_ROUTING_INFOA>>} RoutingInfo Type: <b>PFAX_GLOBAL_ROUTING_INFO*</b>
     * 
     * Pointer to the address of a buffer to receive an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_global_routing_infoa">FAX_GLOBAL_ROUTING_INFO</a> structures. Each structure contains information about one fax routing method, as it pertains to the entire fax service. The data includes, among other items, the priority for the fax routing method, and the name of the DLL that exports the routing method. It also includes the GUID and function name that identify the routing method, and the method's user-friendly name. For information about memory allocation, see the following Remarks section.
     * @param {Pointer<Integer>} MethodsReturned Type: <b>LPDWORD</b>
     * 
     * Pointer to a DWORD variable to receive the number of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_global_routing_infoa">FAX_GLOBAL_ROUTING_INFO</a> structures the function returns in the <i>RoutingInfo</i> parameter. This number equals the total number of fax routing methods installed on the target server.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_CONFIG_QUERY</a> access is required.
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
     * One or all of the <i>MethodsReturned</i>, <i>RoutingInfo</i> or <i>FaxHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxenumglobalroutinginfoa
     * @since windows5.0
     */
    static FaxEnumGlobalRoutingInfoA(FaxHandle, RoutingInfo, MethodsReturned) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        RoutingInfoMarshal := RoutingInfo is VarRef ? "ptr*" : "ptr"
        MethodsReturnedMarshal := MethodsReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxEnumGlobalRoutingInfoA", "ptr", FaxHandle, RoutingInfoMarshal, RoutingInfo, MethodsReturnedMarshal, MethodsReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxEnumGlobalRoutingInfo function enumerates all fax routing methods associated with a specific fax server.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<Pointer<FAX_GLOBAL_ROUTING_INFOW>>} RoutingInfo Type: <b>PFAX_GLOBAL_ROUTING_INFO*</b>
     * 
     * Pointer to the address of a buffer to receive an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_global_routing_infoa">FAX_GLOBAL_ROUTING_INFO</a> structures. Each structure contains information about one fax routing method, as it pertains to the entire fax service. The data includes, among other items, the priority for the fax routing method, and the name of the DLL that exports the routing method. It also includes the GUID and function name that identify the routing method, and the method's user-friendly name. For information about memory allocation, see the following Remarks section.
     * @param {Pointer<Integer>} MethodsReturned Type: <b>LPDWORD</b>
     * 
     * Pointer to a DWORD variable to receive the number of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_global_routing_infoa">FAX_GLOBAL_ROUTING_INFO</a> structures the function returns in the <i>RoutingInfo</i> parameter. This number equals the total number of fax routing methods installed on the target server.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_CONFIG_QUERY</a> access is required.
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
     * One or all of the <i>MethodsReturned</i>, <i>RoutingInfo</i> or <i>FaxHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxenumglobalroutinginfow
     * @since windows5.0
     */
    static FaxEnumGlobalRoutingInfoW(FaxHandle, RoutingInfo, MethodsReturned) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        RoutingInfoMarshal := RoutingInfo is VarRef ? "ptr*" : "ptr"
        MethodsReturnedMarshal := MethodsReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxEnumGlobalRoutingInfoW", "ptr", FaxHandle, RoutingInfoMarshal, RoutingInfo, MethodsReturnedMarshal, MethodsReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax management application calls the FaxSetGlobalRoutingInfo function to modify fax routing method data, such as routing priority, that applies globally to the fax server.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<FAX_GLOBAL_ROUTING_INFOA>} RoutingInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_global_routing_infoa">FAX_GLOBAL_ROUTING_INFO</a>*</b>
     * 
     * Pointer to a buffer that contains a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_global_routing_infoa">FAX_GLOBAL_ROUTING_INFO</a> structure.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_CONFIG_SET</a> access is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Guid</b> member of the specified <a href="/windows/desktop/api/winfax/ns-winfax-fax_global_routing_infoa">FAX_GLOBAL_ROUTING_INFO</a> structure does not correspond to an installed fax routing method.
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
     * One or both of the <i>FaxHandle</i> or <i>RoutingInfo</i> parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsetglobalroutinginfoa
     * @since windows5.0
     */
    static FaxSetGlobalRoutingInfoA(FaxHandle, RoutingInfo) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSetGlobalRoutingInfoA", "ptr", FaxHandle, "ptr", RoutingInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax management application calls the FaxSetGlobalRoutingInfo function to modify fax routing method data, such as routing priority, that applies globally to the fax server.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Pointer<FAX_GLOBAL_ROUTING_INFOW>} RoutingInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_global_routing_infoa">FAX_GLOBAL_ROUTING_INFO</a>*</b>
     * 
     * Pointer to a buffer that contains a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_global_routing_infoa">FAX_GLOBAL_ROUTING_INFO</a> structure.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_CONFIG_SET</a> access is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Guid</b> member of the specified <a href="/windows/desktop/api/winfax/ns-winfax-fax_global_routing_infoa">FAX_GLOBAL_ROUTING_INFO</a> structure does not correspond to an installed fax routing method.
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
     * One or both of the <i>FaxHandle</i> or <i>RoutingInfo</i> parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsetglobalroutinginfow
     * @since windows5.0
     */
    static FaxSetGlobalRoutingInfoW(FaxHandle, RoutingInfo) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSetGlobalRoutingInfoW", "ptr", FaxHandle, "ptr", RoutingInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxGetRoutingInfo function returns to a fax client application routing information for a fax routing method that is associated with a specific fax device.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {PSTR} RoutingGuid Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the GUID that uniquely identifies the fax routing method of interest.
     *                     
     *                     
     * 
     * For information about fax routing methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>. For information about the relationship between routing methods and GUIDs, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-routing-methods">Fax Routing Methods</a>.
     * @param {Pointer<Pointer<Integer>>} RoutingInfoBuffer Type: <b>LPBYTE*</b>
     * 
     * Pointer to the address of a buffer to receive the fax routing information.
     * @param {Pointer<Integer>} RoutingInfoBufferSize Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the size of the buffer, in bytes, pointed to by the <i>RoutingInfoBuffer</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_QUERY</a> access is required.
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
     * One or all of the <i>RoutingGuid</i>, <i>RoutingInfoBuffer</i>, <i>RoutingInfoBufferSize</i>, or <i>FaxPortHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>RoutingGuid</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxgetroutinginfoa
     * @since windows5.0
     */
    static FaxGetRoutingInfoA(FaxPortHandle, RoutingGuid, RoutingInfoBuffer, RoutingInfoBufferSize) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle
        RoutingGuid := RoutingGuid is String ? StrPtr(RoutingGuid) : RoutingGuid

        RoutingInfoBufferMarshal := RoutingInfoBuffer is VarRef ? "ptr*" : "ptr"
        RoutingInfoBufferSizeMarshal := RoutingInfoBufferSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxGetRoutingInfoA", "ptr", FaxPortHandle, "ptr", RoutingGuid, RoutingInfoBufferMarshal, RoutingInfoBuffer, RoutingInfoBufferSizeMarshal, RoutingInfoBufferSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxGetRoutingInfo function returns to a fax client application routing information for a fax routing method that is associated with a specific fax device.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {PWSTR} RoutingGuid Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the GUID that uniquely identifies the fax routing method of interest.
     *                     
     *                     
     * 
     * For information about fax routing methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>. For information about the relationship between routing methods and GUIDs, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-routing-methods">Fax Routing Methods</a>.
     * @param {Pointer<Pointer<Integer>>} RoutingInfoBuffer Type: <b>LPBYTE*</b>
     * 
     * Pointer to the address of a buffer to receive the fax routing information.
     * @param {Pointer<Integer>} RoutingInfoBufferSize Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the size of the buffer, in bytes, pointed to by the <i>RoutingInfoBuffer</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_QUERY</a> access is required.
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
     * One or all of the <i>RoutingGuid</i>, <i>RoutingInfoBuffer</i>, <i>RoutingInfoBufferSize</i>, or <i>FaxPortHandle</i> parameters are <b>NULL</b>.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>RoutingGuid</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxgetroutinginfow
     * @since windows5.0
     */
    static FaxGetRoutingInfoW(FaxPortHandle, RoutingGuid, RoutingInfoBuffer, RoutingInfoBufferSize) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle
        RoutingGuid := RoutingGuid is String ? StrPtr(RoutingGuid) : RoutingGuid

        RoutingInfoBufferMarshal := RoutingInfoBuffer is VarRef ? "ptr*" : "ptr"
        RoutingInfoBufferSizeMarshal := RoutingInfoBufferSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxGetRoutingInfoW", "ptr", FaxPortHandle, "ptr", RoutingGuid, RoutingInfoBufferMarshal, RoutingInfoBuffer, RoutingInfoBufferSizeMarshal, RoutingInfoBufferSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax management application calls the FaxSetRoutingInfo function to modify the routing information for a fax routing method that is associated with a specific fax device.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {PSTR} RoutingGuid Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the GUID that uniquely identifies the fax routing method of interest. 
     * 
     *                     
     * 
     * For information about fax routing methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>. For information about the relationship between routing methods and GUIDs, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-routing-methods">Fax Routing Methods</a>.
     * @param {Pointer<Integer>} RoutingInfoBuffer Type: <b>const BYTE*</b>
     * 
     * Pointer to a buffer that contains the fax routing information. The routing data is typically provided by the fax service administration application, a MMC snap-in component.
     * @param {Integer} RoutingInfoBufferSize Type: <b>DWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable that contains the size of the buffer, in bytes, pointed to by the <i>RoutingInfoBuffer</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_SET</a> access is required.
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
     * One or more of the parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>RoutingGuid</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsetroutinginfoa
     * @since windows5.0
     */
    static FaxSetRoutingInfoA(FaxPortHandle, RoutingGuid, RoutingInfoBuffer, RoutingInfoBufferSize) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle
        RoutingGuid := RoutingGuid is String ? StrPtr(RoutingGuid) : RoutingGuid

        RoutingInfoBufferMarshal := RoutingInfoBuffer is VarRef ? "char*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSetRoutingInfoA", "ptr", FaxPortHandle, "ptr", RoutingGuid, RoutingInfoBufferMarshal, RoutingInfoBuffer, "uint", RoutingInfoBufferSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax management application calls the FaxSetRoutingInfo function to modify the routing information for a fax routing method that is associated with a specific fax device.
     * @param {HANDLE} FaxPortHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax port handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxopenport">FaxOpenPort</a> function.
     * @param {PWSTR} RoutingGuid Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the GUID that uniquely identifies the fax routing method of interest. 
     * 
     *                     
     * 
     * For information about fax routing methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>. For information about the relationship between routing methods and GUIDs, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-routing-methods">Fax Routing Methods</a>.
     * @param {Pointer<Integer>} RoutingInfoBuffer Type: <b>const BYTE*</b>
     * 
     * Pointer to a buffer that contains the fax routing information. The routing data is typically provided by the fax service administration application, a MMC snap-in component.
     * @param {Integer} RoutingInfoBufferSize Type: <b>DWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable that contains the size of the buffer, in bytes, pointed to by the <i>RoutingInfoBuffer</i> parameter.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_SET</a> access is required.
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
     * One or more of the parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>RoutingGuid</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxsetroutinginfow
     * @since windows5.0
     */
    static FaxSetRoutingInfoW(FaxPortHandle, RoutingGuid, RoutingInfoBuffer, RoutingInfoBufferSize) {
        FaxPortHandle := FaxPortHandle is Win32Handle ? NumGet(FaxPortHandle, "ptr") : FaxPortHandle
        RoutingGuid := RoutingGuid is String ? StrPtr(RoutingGuid) : RoutingGuid

        RoutingInfoBufferMarshal := RoutingInfoBuffer is VarRef ? "char*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxSetRoutingInfoW", "ptr", FaxPortHandle, "ptr", RoutingGuid, RoutingInfoBufferMarshal, RoutingInfoBuffer, "uint", RoutingInfoBufferSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} FaxHandle 
     * @param {HANDLE} CompletionPort 
     * @param {Pointer} CompletionKey 
     * @param {HWND} hWnd 
     * @param {Integer} MessageStart 
     * @returns {BOOL} 
     */
    static FaxInitializeEventQueue(FaxHandle, CompletionPort, CompletionKey, hWnd, MessageStart) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle
        CompletionPort := CompletionPort is Win32Handle ? NumGet(CompletionPort, "ptr") : CompletionPort
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := DllCall("WINFAX.dll\FaxInitializeEventQueue", "ptr", FaxHandle, "ptr", CompletionPort, "ptr", CompletionKey, "ptr", hWnd, "uint", MessageStart, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Buffer 
     * @returns {String} Nothing - always returns an empty string
     */
    static FaxFreeBuffer(Buffer) {
        BufferMarshal := Buffer is VarRef ? "ptr" : "ptr"

        DllCall("WINFAX.dll\FaxFreeBuffer", BufferMarshal, Buffer)
    }

    /**
     * A fax client application calls the FaxStartPrintJob function to start printing an outbound fax transmission on the specified fax printer.
     * @param {PSTR} PrinterName Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that contains the name of a fax printer. The string can specify one of the following: 
     * 
     *                     
     * 
     * 
     * <ul>
     * <li>A local printer, such as, "<i>printername</i>"</li>
     * <li>A network printer, such as "&#92;&#92;<i>machinename</i>&#92;<i>printername</i>"</li>
     * <li><b>NULL</b> to specify the local fax printer</li>
     * </ul>
     * @param {Pointer<FAX_PRINT_INFOA>} PrintInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_print_infoa">FAX_PRINT_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_print_infoa">FAX_PRINT_INFO</a> structure that contains the information necessary for the fax server to print the fax transmission. The structure includes, among other items, the recipient's fax number, sender and recipient data, an optional billing code, and delivery report information. For more information, see the following Remarks section.
     * @param {Pointer<Integer>} FaxJobId Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the print spooler's unique ID for the fax print job. (This is not the same as the fax queue's ID for the job and it cannot be used as a parameter in any fax API that takes a fax ID parameter.) This parameter is required.
     * @param {Pointer<FAX_CONTEXT_INFOA>} FaxContextInfo Type: <b>PFAX_CONTEXT_INFO</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_context_infoa">FAX_CONTEXT_INFO</a> structure to receive a handle to a printer device context. When the fax client application calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxprintcoverpagea">FaxPrintCoverPage</a> function, it must pass this value in that function's <i>FaxContextInfo</i> parameter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/gdi/device-contexts">Device Contexts</a> and the <a href="https://docs.microsoft.com/previous-versions/ms535790(v=vs.85)">Printing and Print Spooler Reference</a>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or both of the <i>PrintInfo</i> or <i>FaxContextInfo</i> parameters are <b>NULL</b>.
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
     * The <b>RecipientNumber</b> member of the <a href="/windows/desktop/api/winfax/ns-winfax-fax_print_infoa">FAX_PRINT_INFO</a> structure is <b>NULL</b>; or the <b>OutputFileName</b> member is <b>NULL</b> and the <b>RecipientNumber</b> member is not specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PRINTER_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>PrinterName</i> parameter specifies a printer that is not a fax printer, or there is no fax printer installed.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SPL_NO_STARTDOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/previous-versions/windows/desktop/api/winfax/nf-winfax-faxstartprintjoba">FaxStartPrintJob</a> was not called first, hence there was no <a href="/windows/desktop/api/wingdi/nf-wingdi-startdoca">StartDoc</a> call.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxstartprintjoba
     * @since windows5.0
     */
    static FaxStartPrintJobA(PrinterName, PrintInfo, FaxJobId, FaxContextInfo) {
        PrinterName := PrinterName is String ? StrPtr(PrinterName) : PrinterName

        FaxJobIdMarshal := FaxJobId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxStartPrintJobA", "ptr", PrinterName, "ptr", PrintInfo, FaxJobIdMarshal, FaxJobId, "ptr", FaxContextInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * A fax client application calls the FaxStartPrintJob function to start printing an outbound fax transmission on the specified fax printer.
     * @param {PWSTR} PrinterName Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that contains the name of a fax printer. The string can specify one of the following: 
     * 
     *                     
     * 
     * 
     * <ul>
     * <li>A local printer, such as, "<i>printername</i>"</li>
     * <li>A network printer, such as "&#92;&#92;<i>machinename</i>&#92;<i>printername</i>"</li>
     * <li><b>NULL</b> to specify the local fax printer</li>
     * </ul>
     * @param {Pointer<FAX_PRINT_INFOW>} PrintInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_print_infoa">FAX_PRINT_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_print_infoa">FAX_PRINT_INFO</a> structure that contains the information necessary for the fax server to print the fax transmission. The structure includes, among other items, the recipient's fax number, sender and recipient data, an optional billing code, and delivery report information. For more information, see the following Remarks section.
     * @param {Pointer<Integer>} FaxJobId Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> variable to receive the print spooler's unique ID for the fax print job. (This is not the same as the fax queue's ID for the job and it cannot be used as a parameter in any fax API that takes a fax ID parameter.) This parameter is required.
     * @param {Pointer<FAX_CONTEXT_INFOW>} FaxContextInfo Type: <b>PFAX_CONTEXT_INFO</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_context_infoa">FAX_CONTEXT_INFO</a> structure to receive a handle to a printer device context. When the fax client application calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxprintcoverpagea">FaxPrintCoverPage</a> function, it must pass this value in that function's <i>FaxContextInfo</i> parameter. For more information, see <a href="https://docs.microsoft.com/windows/desktop/gdi/device-contexts">Device Contexts</a> and the <a href="https://docs.microsoft.com/previous-versions/ms535790(v=vs.85)">Printing and Print Spooler Reference</a>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or both of the <i>PrintInfo</i> or <i>FaxContextInfo</i> parameters are <b>NULL</b>.
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
     * The <b>RecipientNumber</b> member of the <a href="/windows/desktop/api/winfax/ns-winfax-fax_print_infoa">FAX_PRINT_INFO</a> structure is <b>NULL</b>; or the <b>OutputFileName</b> member is <b>NULL</b> and the <b>RecipientNumber</b> member is not specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PRINTER_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>PrinterName</i> parameter specifies a printer that is not a fax printer, or there is no fax printer installed.
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
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SPL_NO_STARTDOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/previous-versions/windows/desktop/api/winfax/nf-winfax-faxstartprintjoba">FaxStartPrintJob</a> was not called first, hence there was no <a href="/windows/desktop/api/wingdi/nf-wingdi-startdoca">StartDoc</a> call.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxstartprintjobw
     * @since windows5.0
     */
    static FaxStartPrintJobW(PrinterName, PrintInfo, FaxJobId, FaxContextInfo) {
        PrinterName := PrinterName is String ? StrPtr(PrinterName) : PrinterName

        FaxJobIdMarshal := FaxJobId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxStartPrintJobW", "ptr", PrinterName, "ptr", PrintInfo, FaxJobIdMarshal, FaxJobId, "ptr", FaxContextInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxPrintCoverPage function prints a fax transmission cover page to the specified device context for a fax client application.
     * @param {Pointer<FAX_CONTEXT_INFOA>} FaxContextInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_context_infoa">FAX_CONTEXT_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_context_infoa">FAX_CONTEXT_INFO</a> structure that contains a handle to a fax printer device context.
     * @param {Pointer<FAX_COVERPAGE_INFOA>} CoverPageInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a> structure that contains personal data to display on the cover page of the fax document.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or both of the <i>CoverPageInfo</i> or <i>FaxContextInfo</i> parameters are <b>NULL</b>.
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
     * The <b>SizeOfStruct</b> member of the specified <a href="/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a> structure is not equal to <b>sizeof(FAX_COVERPAGE_INFO)</b>; or the <b>SizeOfStruct</b> member of the specified <a href="/windows/desktop/api/winfax/ns-winfax-fax_context_infoa">FAX_CONTEXT_INFO</a> structure is not equal to <b>sizeof(FAX_CONTEXT_INFO)</b>.
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
     * The fax server cannot locate the file specified by the <b>CoverPageName</b> member of the <a href="/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxprintcoverpagea
     * @since windows5.0
     */
    static FaxPrintCoverPageA(FaxContextInfo, CoverPageInfo) {
        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxPrintCoverPageA", "ptr", FaxContextInfo, "ptr", CoverPageInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxPrintCoverPage function prints a fax transmission cover page to the specified device context for a fax client application.
     * @param {Pointer<FAX_CONTEXT_INFOW>} FaxContextInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_context_infoa">FAX_CONTEXT_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_context_infoa">FAX_CONTEXT_INFO</a> structure that contains a handle to a fax printer device context.
     * @param {Pointer<FAX_COVERPAGE_INFOW>} CoverPageInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a> structure that contains personal data to display on the cover page of the fax document.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * One or both of the <i>CoverPageInfo</i> or <i>FaxContextInfo</i> parameters are <b>NULL</b>.
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
     * The <b>SizeOfStruct</b> member of the specified <a href="/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a> structure is not equal to <b>sizeof(FAX_COVERPAGE_INFO)</b>; or the <b>SizeOfStruct</b> member of the specified <a href="/windows/desktop/api/winfax/ns-winfax-fax_context_infoa">FAX_CONTEXT_INFO</a> structure is not equal to <b>sizeof(FAX_CONTEXT_INFO)</b>.
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
     * The fax server cannot locate the file specified by the <b>CoverPageName</b> member of the <a href="/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxprintcoverpagew
     * @since windows5.0
     */
    static FaxPrintCoverPageW(FaxContextInfo, CoverPageInfo) {
        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxPrintCoverPageW", "ptr", FaxContextInfo, "ptr", CoverPageInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The FaxRegisterServiceProvider function registers a fax service provider DLL with the fax service. The function configures the fax service registry to query and use the new fax service provider DLL when the fax service restarts.
     * @param {PWSTR} DeviceProvider Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the internal name of the fax service provider DLL to register. This should be a unique string, such as a GUID.
     * @param {PWSTR} FriendlyName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string to associate with the fax service provider DLL. This is the fax service provider's user-friendly name, suitable for display.
     * @param {PWSTR} ImageName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the full path and file name for the fax service provider DLL. The path can include valid environment variables, for example, %SYSTEMDRIVE% and %SYSTEMROOT%.
     * @param {PWSTR} TspName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the name of the telephony service provider associated with the devices for the fax service provider. For a virtual fax device, use an empty string.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * At least one parameter to the <a href="/windows/desktop/api/winfax/nf-winfax-faxregisterserviceproviderw">FaxRegisterServiceProvider</a> function is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxregisterserviceproviderw
     * @since windows5.0
     */
    static FaxRegisterServiceProviderW(DeviceProvider, FriendlyName, ImageName, TspName) {
        DeviceProvider := DeviceProvider is String ? StrPtr(DeviceProvider) : DeviceProvider
        FriendlyName := FriendlyName is String ? StrPtr(FriendlyName) : FriendlyName
        ImageName := ImageName is String ? StrPtr(ImageName) : ImageName
        TspName := TspName is String ? StrPtr(TspName) : TspName

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxRegisterServiceProviderW", "ptr", DeviceProvider, "ptr", FriendlyName, "ptr", ImageName, "ptr", TspName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {PWSTR} DeviceProvider 
     * @returns {BOOL} 
     */
    static FaxUnregisterServiceProviderW(DeviceProvider) {
        DeviceProvider := DeviceProvider is String ? StrPtr(DeviceProvider) : DeviceProvider

        result := DllCall("WINFAX.dll\FaxUnregisterServiceProviderW", "ptr", DeviceProvider, "int")
        return result
    }

    /**
     * The FaxRegisterRoutingExtension function registers a fax routing extension DLL with the fax service. The function configures the fax service registry to use the new routing extension DLL.
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {PWSTR} ExtensionName Type: <b>LPCWSTR</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {PWSTR} FriendlyName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string to associate with the fax routing extension DLL. This is the routing extension's user-friendly name, suitable for display.
     * @param {PWSTR} ImageName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the full path and file name for the fax routing extension DLL. The path can include valid environment variables, for example, %SYSTEMDRIVE% and %SYSTEMROOT%.
     * @param {Pointer<PFAX_ROUTING_INSTALLATION_CALLBACKW>} CallBack Type: <b>PFAX_ROUTING_INSTALLATION_CALLBACK</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/nc-winfax-pfax_routing_installation_callbackw">FaxRoutingInstallationCallback</a> function that installs a fax routing method for the specified fax routing extension DLL. The <b>FaxRegisterRoutingExtension</b> function calls the <b>FaxRoutingInstallationCallback</b> function multiple times, until it returns a value of zero, indicating that all routing methods in the fax routing extension DLL have been registered.
     * @param {Pointer<Void>} Context Type: <b>LPVOID</b>
     * 
     * Pointer to a variable that contains application-specific context information or an application-defined value. <b>FaxRegisterRoutingExtension</b> passes this data to the <a href="https://docs.microsoft.com/windows/desktop/api/winfax/nc-winfax-pfax_routing_installation_callbackw">FaxRoutingInstallationCallback</a> function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
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
     * At least one parameter to the <a href="/windows/desktop/api/winfax/nf-winfax-faxregisterroutingextensionw">FaxRegisterRoutingExtension</a> function is <b>NULL</b>.
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
     * The <i>FaxHandle</i> specifies a remote fax server connection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winfax/nf-winfax-faxregisterroutingextensionw
     * @since windows5.0
     */
    static FaxRegisterRoutingExtensionW(FaxHandle, ExtensionName, FriendlyName, ImageName, CallBack, Context) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle
        ExtensionName := ExtensionName is String ? StrPtr(ExtensionName) : ExtensionName
        FriendlyName := FriendlyName is String ? StrPtr(FriendlyName) : FriendlyName
        ImageName := ImageName is String ? StrPtr(ImageName) : ImageName

        ContextMarshal := Context is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("WINFAX.dll\FaxRegisterRoutingExtensionW", "ptr", FaxHandle, "ptr", ExtensionName, "ptr", FriendlyName, "ptr", ImageName, "ptr", CallBack, ContextMarshal, Context, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HANDLE} FaxHandle 
     * @param {Integer} AccessMask 
     * @returns {BOOL} 
     */
    static FaxAccessCheck(FaxHandle, AccessMask) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        result := DllCall("WINFAX.dll\FaxAccessCheck", "ptr", FaxHandle, "uint", AccessMask, "int")
        return result
    }

    /**
     * Called by an application to determine whether to make a menu item or other UI available that calls the Windows Vista function SendToFaxRecipient.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * <b>TRUE</b>, if the following conditions are met; otherwise <b>FALSE</b>. 
     *                 <ul>
     * <li>The operating system is Windows Vista or later.</li>
     * <li>The fax service is installed.</li>
     * <li>The current user has a fax account setup with the fax service.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//fxsutility/nf-fxsutility-cansendtofaxrecipient
     * @since windows6.0.6000
     */
    static CanSendToFaxRecipient() {
        result := DllCall("fxsutility.dll\CanSendToFaxRecipient", "int")
        return result
    }

    /**
     * Called by an application to fax a file.
     * @param {Integer} sndMode Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fxsutility/ne-fxsutility-sendtomode">SendToMode</a></b>
     * 
     * A value specifying how to send the fax. For Windows Vista, this must be <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fxsutility/ne-fxsutility-sendtomode">SEND_TO_FAX_RECIPIENT_ATTACHMENT</a>.
     * @param {PWSTR} lpFileName Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated string representing the name of the file to fax.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Zero, if the operation is successful.
     * @see https://docs.microsoft.com/windows/win32/api//fxsutility/nf-fxsutility-sendtofaxrecipient
     * @since windows6.0.6000
     */
    static SendToFaxRecipient(sndMode, lpFileName) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        result := DllCall("fxsutility.dll\SendToFaxRecipient", "int", sndMode, "ptr", lpFileName, "uint")
        return result
    }

    /**
     * 
     * @param {HINSTANCE} hinst 
     * @param {Integer} dwVer 
     * @param {Pointer<IStillImageW>} ppSti 
     * @param {IUnknown} punkOuter 
     * @returns {HRESULT} 
     */
    static StiCreateInstanceW(hinst, dwVer, ppSti, punkOuter) {
        hinst := hinst is Win32Handle ? NumGet(hinst, "ptr") : hinst

        result := DllCall("STI.dll\StiCreateInstanceW", "ptr", hinst, "uint", dwVer, "ptr*", ppSti, "ptr", punkOuter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
