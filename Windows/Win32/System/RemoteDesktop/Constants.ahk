#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */

;@region Constants

/**
 * @type {HANDLE}
 */
export global WTS_CURRENT_SERVER := HANDLE(0)

/**
 * @type {HANDLE}
 */
export global WTS_CURRENT_SERVER_HANDLE := HANDLE(0)

/**
 * @type {String}
 */
export global WTS_CURRENT_SERVER_NAME := ""

/**
 * @type {Integer (UInt32)}
 */
export global WTS_DOMAIN_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global WTS_USERNAME_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PASSWORD_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global WTS_DIRECTORY_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global WTS_INITIALPROGRAM_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PROTOCOL_NAME_LENGTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global WTS_DRIVER_NAME_LENGTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global WTS_DEVICE_NAME_LENGTH := 19

/**
 * @type {Integer (UInt32)}
 */
export global WTS_IMEFILENAME_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global WTS_CLIENTNAME_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global WTS_CLIENTADDRESS_LENGTH := 30

/**
 * @type {Integer (UInt32)}
 */
export global WTS_CLIENT_PRODUCT_ID_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global WTS_MAX_PROTOCOL_CACHE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WTS_MAX_CACHE_RESERVED := 20

/**
 * @type {Integer (UInt32)}
 */
export global WTS_MAX_RESERVED := 100

/**
 * @type {Integer (UInt32)}
 */
export global WTS_MAX_COUNTERS := 100

/**
 * @type {Integer (UInt32)}
 */
export global WTS_MAX_DISPLAY_IOCTL_DATA := 256

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PERF_DISABLE_NOTHING := 0

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PERF_DISABLE_WALLPAPER := 1

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PERF_DISABLE_FULLWINDOWDRAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PERF_DISABLE_MENUANIMATIONS := 4

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PERF_DISABLE_THEMING := 8

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PERF_ENABLE_ENHANCED_GRAPHICS := 16

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PERF_DISABLE_CURSOR_SHADOW := 32

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PERF_DISABLE_CURSORSETTINGS := 64

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PERF_ENABLE_FONT_SMOOTHING := 128

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PERF_ENABLE_DESKTOP_COMPOSITION := 256

/**
 * @type {Integer (UInt32)}
 */
export global WTS_VALUE_TYPE_ULONG := 1

/**
 * @type {Integer (UInt32)}
 */
export global WTS_VALUE_TYPE_STRING := 2

/**
 * @type {Integer (UInt32)}
 */
export global WTS_VALUE_TYPE_BINARY := 3

/**
 * @type {Integer (UInt32)}
 */
export global WTS_VALUE_TYPE_GUID := 4

/**
 * @type {Integer (UInt32)}
 */
export global WTS_KEY_EXCHANGE_ALG_RSA := 1

/**
 * @type {Integer (UInt32)}
 */
export global WTS_KEY_EXCHANGE_ALG_DH := 2

/**
 * @type {Integer (UInt32)}
 */
export global WTS_LICENSE_PROTOCOL_VERSION := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WTS_LICENSE_PREAMBLE_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_DOMAIN_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_USERNAME_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_PASSWORD_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_DIRECTORY_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_INITIALPROGRAM_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_PROTOCOL_NAME_LENGTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_DRIVER_NAME_LENGTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_DEVICE_NAME_LENGTH := 19

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_IMEFILENAME_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_CLIENTNAME_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_CLIENTADDRESS_LENGTH := 30

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_CLIENT_PRODUCT_ID_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_MAX_PROTOCOL_CACHE := 4

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_MAX_CACHE_RESERVED := 20

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_MAX_RESERVED := 100

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_MAX_COUNTERS := 100

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_MAX_DISPLAY_IOCTL_DATA := 256

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_PERF_DISABLE_NOTHING := 0

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_PERF_DISABLE_WALLPAPER := 1

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_PERF_DISABLE_FULLWINDOWDRAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_PERF_DISABLE_MENUANIMATIONS := 4

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_PERF_DISABLE_THEMING := 8

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_PERF_ENABLE_ENHANCED_GRAPHICS := 16

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_PERF_DISABLE_CURSOR_SHADOW := 32

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_PERF_DISABLE_CURSORSETTINGS := 64

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_PERF_ENABLE_FONT_SMOOTHING := 128

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_PERF_ENABLE_DESKTOP_COMPOSITION := 256

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_VALUE_TYPE_ULONG := 1

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_VALUE_TYPE_STRING := 2

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_VALUE_TYPE_BINARY := 3

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_VALUE_TYPE_GUID := 4

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_KEY_EXCHANGE_ALG_RSA := 1

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_KEY_EXCHANGE_ALG_DH := 2

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_LICENSE_PROTOCOL_VERSION := 65536

/**
 * @type {Integer (UInt32)}
 */
export global WRDS_LICENSE_PREAMBLE_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global SINGLE_SESSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global FORCE_REJOIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global FORCE_REJOIN_IN_CLUSTERMODE := 3

/**
 * @type {Integer (UInt32)}
 */
export global RESERVED_FOR_LEGACY := 4

/**
 * @type {Integer (UInt32)}
 */
export global KEEP_EXISTING_SESSIONS := 8

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_EVENT_INITIALIZED := 0

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_EVENT_CONNECTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_EVENT_V1_CONNECTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_EVENT_DISCONNECTED := 3

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_EVENT_TERMINATED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_EVENT_DATA_RECEIVED := 10

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_EVENT_WRITE_COMPLETE := 11

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_EVENT_WRITE_CANCELLED := 12

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_OK := 0

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_ALREADY_INITIALIZED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_NOT_INITIALIZED := 2

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_ALREADY_CONNECTED := 3

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_NOT_CONNECTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_TOO_MANY_CHANNELS := 5

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_BAD_CHANNEL := 6

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_BAD_CHANNEL_HANDLE := 7

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_NO_BUFFER := 8

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_BAD_INIT_HANDLE := 9

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_NOT_OPEN := 10

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_BAD_PROC := 11

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_NO_MEMORY := 12

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_UNKNOWN_CHANNEL_NAME := 13

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_ALREADY_OPEN := 14

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_NOT_IN_VIRTUALCHANNELENTRY := 15

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_NULL_DATA := 16

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_ZERO_LENGTH := 17

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_INVALID_INSTANCE := 18

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_UNSUPPORTED_VERSION := 19

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_RC_INITIALIZATION_ERROR := 20

/**
 * @type {Integer (UInt32)}
 */
export global VIRTUAL_CHANNEL_VERSION_WIN2000 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_CHUNK_LENGTH := 1600

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_BUFFER_SIZE := 65535

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_FLAG_FIRST := 1

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_FLAG_LAST := 2

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_FLAG_MIDDLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_FLAG_FAIL := 256

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_OPTION_INITIALIZED := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_OPTION_ENCRYPT_RDP := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_OPTION_ENCRYPT_SC := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_OPTION_ENCRYPT_CS := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_OPTION_PRI_HIGH := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_OPTION_PRI_MED := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_OPTION_PRI_LOW := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_OPTION_COMPRESS_RDP := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_OPTION_COMPRESS := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_OPTION_SHOW_PROTOCOL := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_OPTION_REMOTE_CONTROL_PERSISTENT := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_MAX_COUNT := 30

/**
 * @type {Integer (UInt32)}
 */
export global CHANNEL_NAME_LEN := 7

/**
 * @type {Integer (UInt32)}
 */
export global MAX_POLICY_ATTRIBUTES := 20

/**
 * @type {Integer (UInt32)}
 */
export global WTS_CURRENT_SESSION := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global USERNAME_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global CLIENTNAME_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global CLIENTADDRESS_LENGTH := 30

/**
 * @type {Integer (UInt32)}
 */
export global WTS_WSD_LOGOFF := 1

/**
 * @type {Integer (UInt32)}
 */
export global WTS_WSD_SHUTDOWN := 2

/**
 * @type {Integer (UInt32)}
 */
export global WTS_WSD_REBOOT := 4

/**
 * @type {Integer (UInt32)}
 */
export global WTS_WSD_POWEROFF := 8

/**
 * @type {Integer (UInt32)}
 */
export global WTS_WSD_FASTREBOOT := 16

/**
 * @type {Integer (UInt32)}
 */
export global MAX_ELAPSED_TIME_LENGTH := 15

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DATE_TIME_LENGTH := 56

/**
 * @type {Integer (UInt32)}
 */
export global WINSTATIONNAME_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global DOMAIN_LENGTH := 17

/**
 * @type {Integer (UInt32)}
 */
export global WTS_DRIVE_LENGTH := 3

/**
 * @type {Integer (UInt32)}
 */
export global WTS_LISTENER_NAME_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global WTS_COMMENT_LENGTH := 60

/**
 * @type {Integer (UInt32)}
 */
export global WTS_LISTENER_CREATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WTS_LISTENER_UPDATE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PROTOCOL_TYPE_CONSOLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PROTOCOL_TYPE_ICA := 1

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PROTOCOL_TYPE_RDP := 2

/**
 * @type {Integer (UInt32)}
 */
export global WTS_SESSIONSTATE_UNKNOWN := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global WTS_SESSIONSTATE_LOCK := 0

/**
 * @type {Integer (UInt32)}
 */
export global WTS_SESSIONSTATE_UNLOCK := 1

/**
 * @type {Integer (UInt32)}
 */
export global PRODUCTINFO_COMPANYNAME_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global PRODUCTINFO_PRODUCTID_LENGTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global VALIDATIONINFORMATION_LICENSE_LENGTH := 16384

/**
 * @type {Integer (UInt32)}
 */
export global VALIDATIONINFORMATION_HARDWAREID_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global WTS_EVENT_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global WTS_EVENT_CREATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WTS_EVENT_DELETE := 2

/**
 * @type {Integer (UInt32)}
 */
export global WTS_EVENT_RENAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global WTS_EVENT_CONNECT := 8

/**
 * @type {Integer (UInt32)}
 */
export global WTS_EVENT_DISCONNECT := 16

/**
 * @type {Integer (UInt32)}
 */
export global WTS_EVENT_LOGON := 32

/**
 * @type {Integer (UInt32)}
 */
export global WTS_EVENT_LOGOFF := 64

/**
 * @type {Integer (UInt32)}
 */
export global WTS_EVENT_STATECHANGE := 128

/**
 * @type {Integer (UInt32)}
 */
export global WTS_EVENT_LICENSE := 256

/**
 * @type {Integer (UInt32)}
 */
export global WTS_EVENT_ALL := 2147483647

/**
 * @type {Integer (UInt32)}
 */
export global WTS_EVENT_FLUSH := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global REMOTECONTROL_KBDSHIFT_HOTKEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global REMOTECONTROL_KBDCTRL_HOTKEY := 2

/**
 * @type {Integer (UInt32)}
 */
export global REMOTECONTROL_KBDALT_HOTKEY := 4

/**
 * @type {Integer (UInt32)}
 */
export global WTS_CHANNEL_OPTION_DYNAMIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global WTS_CHANNEL_OPTION_DYNAMIC_PRI_LOW := 0

/**
 * @type {Integer (UInt32)}
 */
export global WTS_CHANNEL_OPTION_DYNAMIC_PRI_MED := 2

/**
 * @type {Integer (UInt32)}
 */
export global WTS_CHANNEL_OPTION_DYNAMIC_PRI_HIGH := 4

/**
 * @type {Integer (UInt32)}
 */
export global WTS_CHANNEL_OPTION_DYNAMIC_PRI_REAL := 6

/**
 * @type {Integer (UInt32)}
 */
export global WTS_CHANNEL_OPTION_DYNAMIC_NO_COMPRESS := 8

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFY_FOR_ALL_SESSIONS := 1

/**
 * @type {Integer (UInt32)}
 */
export global NOTIFY_FOR_THIS_SESSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PROCESS_INFO_LEVEL_0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global WTS_PROCESS_INFO_LEVEL_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global PLUGIN_CAPABILITY_EXTERNAL_REDIRECTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global MaxFQDN_Len := 256

/**
 * @type {Integer (UInt32)}
 */
export global MaxNetBiosName_Len := 16

/**
 * @type {Integer (UInt32)}
 */
export global MaxNumOfExposed_IPs := 12

/**
 * @type {Integer (UInt32)}
 */
export global MaxUserName_Len := 104

/**
 * @type {Integer (UInt32)}
 */
export global MaxDomainName_Len := 256

/**
 * @type {Integer (UInt32)}
 */
export global MaxFarm_Len := 256

/**
 * @type {Integer (UInt32)}
 */
export global MaxAppName_Len := 256

/**
 * @type {Integer (UInt32)}
 */
export global WKS_FLAG_CLEAR_CREDS_ON_LAST_RESOURCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global WKS_FLAG_PASSWORD_ENCRYPTED := 2

/**
 * @type {Integer (UInt32)}
 */
export global WKS_FLAG_CREDS_AUTHENTICATED := 4

/**
 * @type {Integer (UInt32)}
 */
export global SB_SYNCH_CONFLICT_MAX_WRITE_ATTEMPTS := 100

/**
 * @type {Integer (UInt32)}
 */
export global ACQUIRE_TARGET_LOCK_TIMEOUT := 300000

/**
 * @type {Integer (UInt32)}
 */
export global RENDER_HINT_CLEAR := 0

/**
 * @type {Integer (UInt32)}
 */
export global RENDER_HINT_VIDEO := 1

/**
 * @type {Integer (UInt32)}
 */
export global RENDER_HINT_MAPPEDWINDOW := 2

/**
 * @type {String}
 */
export global WTS_PROPERTY_DEFAULT_CONFIG := "DefaultConfig"

/**
 * @type {Integer (UInt32)}
 */
export global TS_VC_LISTENER_STATIC_CHANNEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global WRdsGraphicsChannels_LossyChannelMaxMessageSize := 988

/**
 * @type {Integer (UInt32)}
 */
export global RFX_RDP_MSG_PREFIX := 0

/**
 * @type {Integer (UInt32)}
 */
export global RFX_GFX_MSG_PREFIX := 48

/**
 * @type {Integer (UInt32)}
 */
export global RFX_GFX_MSG_PREFIX_MASK := 48

/**
 * @type {Integer (UInt32)}
 */
export global RFX_GFX_MAX_SUPPORTED_MONITORS := 16

/**
 * @type {Integer (UInt32)}
 */
export global RFX_CLIENT_ID_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_CONNECT := 701

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_DISCONNECT := 702

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_RECONNECT := 703

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_DELETE_SAVED_CREDENTIALS := 704

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_UPDATE_SESSION_DISPLAYSETTINGS := 705

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_ATTACH_EVENT := 706

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_DETACH_EVENT := 707

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PROP_REMOTEDESKTOPCLIENT_SETTINGS := 710

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PROP_REMOTEDESKTOPCLIENT_ACTIONS := 711

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCH_POINTER := 712

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_SET_RDPPROPERTY := 720

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_GET_RDPPROPERTY := 721

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_APPLY_SETTINGS := 722

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_RETRIEVE_SETTINGS := 723

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_SUSPEND_SCREEN_UPDATES := 730

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_RESUME_SCREEN_UPDATES := 731

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_EXECUTE_REMOTE_ACTION := 732

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_METHOD_REMOTEDESKTOPCLIENT_GET_SNAPSHOT := 733

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_ENABLED := 740

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_EVENTSENABLED := 741

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_POINTERSPEED := 742

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_CONNECTING := 750

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_CONNECTED := 751

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_LOGINCOMPLETED := 752

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_DISCONNECTED := 753

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_STATUSCHANGED := 754

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_AUTORECONNECTING := 755

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_AUTORECONNECTED := 756

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_DIALOGDISPLAYING := 757

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_DIALOGDISMISSED := 758

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_NETWORKSTATUSCHANGED := 759

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_ADMINMESSAGERECEIVED := 760

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_KEYCOMBINATIONPRESSED := 761

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_REMOTEDESKTOPSIZECHANGED := 762

/**
 * @type {Integer (UInt32)}
 */
export global DISPID_AX_TOUCHPOINTERCURSORMOVED := 800

/**
 * @type {Guid}
 */
export global RDCLIENT_BITMAP_RENDER_SERVICE := Guid("{e4cc08cb-942e-4b19-8504-bd5a89a747f5}")

/**
 * @type {Guid}
 */
export global WTS_QUERY_ALLOWED_INITIAL_APP := Guid("{c77d1b30-5be1-4c6b-a0e1-bd6d2e5c9fcc}")

/**
 * @type {Guid}
 */
export global WTS_QUERY_LOGON_SCREEN_SIZE := Guid("{8b8e0fe7-0804-4a0e-b279-8660b1df0049}")

/**
 * @type {Guid}
 */
export global WTS_QUERY_AUDIOENUM_DLL := Guid("{9bf4fa97-c883-4c2a-80ab-5a39c9af00db}")

/**
 * @type {Guid}
 */
export global WTS_QUERY_MF_FORMAT_SUPPORT := Guid("{41869ad0-6332-4dc8-95d5-db749e2f1d94}")

/**
 * @type {Guid}
 */
export global WRDS_SERVICE_ID_GRAPHICS_GUID := Guid("{d2993f4d-02cf-4280-8c48-1624b44f8706}")

/**
 * @type {Guid}
 */
export global PROPERTY_DYNAMIC_TIME_ZONE_INFORMATION := Guid("{0cdfd28e-d0b9-4c1f-a5eb-6d1f6c6535b9}")

/**
 * @type {Guid}
 */
export global PROPERTY_TYPE_GET_FAST_RECONNECT := Guid("{6212d757-0043-4862-99c3-9f3059ac2a3b}")

/**
 * @type {Guid}
 */
export global PROPERTY_TYPE_GET_FAST_RECONNECT_USER_SID := Guid("{197c427a-0135-4b6d-9c5e-e6579a0ab625}")

/**
 * @type {Guid}
 */
export global PROPERTY_TYPE_ENABLE_UNIVERSAL_APPS_FOR_CUSTOM_SHELL := Guid("{ed2c3fda-338d-4d3f-81a3-e767310d908e}")

/**
 * @type {Guid}
 */
export global CONNECTION_PROPERTY_IDLE_TIME_WARNING := Guid("{693f7ff5-0c4e-4d17-b8e0-1f70325e5d58}")

/**
 * @type {Guid}
 */
export global CONNECTION_PROPERTY_CURSOR_BLINK_DISABLED := Guid("{4b150580-fea4-4d3c-9de4-7433a66618f7}")
;@endregion Constants
