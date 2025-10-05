#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class RemoteDesktop {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static WTS_CURRENT_SERVER => 0

    /**
     * @type {Integer (Int32)}
     */
    static WTS_CURRENT_SERVER_HANDLE => 0

    /**
     * @type {String}
     */
    static WTS_CURRENT_SERVER_NAME => ""

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_DOMAIN_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_USERNAME_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PASSWORD_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_DIRECTORY_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_INITIALPROGRAM_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PROTOCOL_NAME_LENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_DRIVER_NAME_LENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_DEVICE_NAME_LENGTH => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_IMEFILENAME_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_CLIENTNAME_LENGTH => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_CLIENTADDRESS_LENGTH => 30

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_CLIENT_PRODUCT_ID_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_MAX_PROTOCOL_CACHE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_MAX_CACHE_RESERVED => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_MAX_RESERVED => 100

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_MAX_COUNTERS => 100

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_MAX_DISPLAY_IOCTL_DATA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PERF_DISABLE_NOTHING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PERF_DISABLE_WALLPAPER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PERF_DISABLE_FULLWINDOWDRAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PERF_DISABLE_MENUANIMATIONS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PERF_DISABLE_THEMING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PERF_ENABLE_ENHANCED_GRAPHICS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PERF_DISABLE_CURSOR_SHADOW => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PERF_DISABLE_CURSORSETTINGS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PERF_ENABLE_FONT_SMOOTHING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PERF_ENABLE_DESKTOP_COMPOSITION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_VALUE_TYPE_ULONG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_VALUE_TYPE_STRING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_VALUE_TYPE_BINARY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_VALUE_TYPE_GUID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_KEY_EXCHANGE_ALG_RSA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_KEY_EXCHANGE_ALG_DH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_LICENSE_PROTOCOL_VERSION => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_LICENSE_PREAMBLE_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_DOMAIN_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_USERNAME_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_PASSWORD_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_DIRECTORY_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_INITIALPROGRAM_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_PROTOCOL_NAME_LENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_DRIVER_NAME_LENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_DEVICE_NAME_LENGTH => 19

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_IMEFILENAME_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_CLIENTNAME_LENGTH => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_CLIENTADDRESS_LENGTH => 30

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_CLIENT_PRODUCT_ID_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_MAX_PROTOCOL_CACHE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_MAX_CACHE_RESERVED => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_MAX_RESERVED => 100

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_MAX_COUNTERS => 100

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_MAX_DISPLAY_IOCTL_DATA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_PERF_DISABLE_NOTHING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_PERF_DISABLE_WALLPAPER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_PERF_DISABLE_FULLWINDOWDRAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_PERF_DISABLE_MENUANIMATIONS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_PERF_DISABLE_THEMING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_PERF_ENABLE_ENHANCED_GRAPHICS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_PERF_DISABLE_CURSOR_SHADOW => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_PERF_DISABLE_CURSORSETTINGS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_PERF_ENABLE_FONT_SMOOTHING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_PERF_ENABLE_DESKTOP_COMPOSITION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_VALUE_TYPE_ULONG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_VALUE_TYPE_STRING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_VALUE_TYPE_BINARY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_VALUE_TYPE_GUID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_KEY_EXCHANGE_ALG_RSA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_KEY_EXCHANGE_ALG_DH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_LICENSE_PROTOCOL_VERSION => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WRDS_LICENSE_PREAMBLE_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SINGLE_SESSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FORCE_REJOIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FORCE_REJOIN_IN_CLUSTERMODE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RESERVED_FOR_LEGACY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KEEP_EXISTING_SESSIONS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_EVENT_INITIALIZED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_EVENT_CONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_EVENT_V1_CONNECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_EVENT_DISCONNECTED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_EVENT_TERMINATED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_EVENT_DATA_RECEIVED => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_EVENT_WRITE_COMPLETE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_EVENT_WRITE_CANCELLED => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_OK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_ALREADY_INITIALIZED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_NOT_INITIALIZED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_ALREADY_CONNECTED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_NOT_CONNECTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_TOO_MANY_CHANNELS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_BAD_CHANNEL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_BAD_CHANNEL_HANDLE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_NO_BUFFER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_BAD_INIT_HANDLE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_NOT_OPEN => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_BAD_PROC => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_NO_MEMORY => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_UNKNOWN_CHANNEL_NAME => 13

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_ALREADY_OPEN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_NOT_IN_VIRTUALCHANNELENTRY => 15

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_NULL_DATA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_ZERO_LENGTH => 17

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_INVALID_INSTANCE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_UNSUPPORTED_VERSION => 19

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_RC_INITIALIZATION_ERROR => 20

    /**
     * @type {Integer (UInt32)}
     */
    static VIRTUAL_CHANNEL_VERSION_WIN2000 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_CHUNK_LENGTH => 1600

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_BUFFER_SIZE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_FLAG_FIRST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_FLAG_LAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_FLAG_MIDDLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_FLAG_FAIL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_OPTION_INITIALIZED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_OPTION_ENCRYPT_RDP => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_OPTION_ENCRYPT_SC => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_OPTION_ENCRYPT_CS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_OPTION_PRI_HIGH => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_OPTION_PRI_MED => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_OPTION_PRI_LOW => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_OPTION_COMPRESS_RDP => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_OPTION_COMPRESS => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_OPTION_SHOW_PROTOCOL => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_OPTION_REMOTE_CONTROL_PERSISTENT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_MAX_COUNT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static CHANNEL_NAME_LEN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_POLICY_ATTRIBUTES => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_CURRENT_SESSION => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static USERNAME_LENGTH => 20

    /**
     * @type {Integer (UInt32)}
     */
    static CLIENTNAME_LENGTH => 20

    /**
     * @type {Integer (UInt32)}
     */
    static CLIENTADDRESS_LENGTH => 30

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_WSD_LOGOFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_WSD_SHUTDOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_WSD_REBOOT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_WSD_POWEROFF => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_WSD_FASTREBOOT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ELAPSED_TIME_LENGTH => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DATE_TIME_LENGTH => 56

    /**
     * @type {Integer (UInt32)}
     */
    static WINSTATIONNAME_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DOMAIN_LENGTH => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_DRIVE_LENGTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_LISTENER_NAME_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_COMMENT_LENGTH => 60

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_LISTENER_CREATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_LISTENER_UPDATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PROTOCOL_TYPE_CONSOLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PROTOCOL_TYPE_ICA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PROTOCOL_TYPE_RDP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SESSIONSTATE_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SESSIONSTATE_LOCK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_SESSIONSTATE_UNLOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCTINFO_COMPANYNAME_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCTINFO_PRODUCTID_LENGTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VALIDATIONINFORMATION_LICENSE_LENGTH => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static VALIDATIONINFORMATION_HARDWAREID_LENGTH => 20

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_EVENT_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_EVENT_CREATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_EVENT_DELETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_EVENT_RENAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_EVENT_CONNECT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_EVENT_DISCONNECT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_EVENT_LOGON => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_EVENT_LOGOFF => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_EVENT_STATECHANGE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_EVENT_LICENSE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_EVENT_ALL => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_EVENT_FLUSH => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTECONTROL_KBDSHIFT_HOTKEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTECONTROL_KBDCTRL_HOTKEY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTECONTROL_KBDALT_HOTKEY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_CHANNEL_OPTION_DYNAMIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_CHANNEL_OPTION_DYNAMIC_PRI_LOW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_CHANNEL_OPTION_DYNAMIC_PRI_MED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_CHANNEL_OPTION_DYNAMIC_PRI_HIGH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_CHANNEL_OPTION_DYNAMIC_PRI_REAL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_CHANNEL_OPTION_DYNAMIC_NO_COMPRESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFY_FOR_ALL_SESSIONS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFY_FOR_THIS_SESSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PROCESS_INFO_LEVEL_0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WTS_PROCESS_INFO_LEVEL_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PLUGIN_CAPABILITY_EXTERNAL_REDIRECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MaxFQDN_Len => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MaxNetBiosName_Len => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MaxNumOfExposed_IPs => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MaxUserName_Len => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MaxDomainName_Len => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MaxFarm_Len => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MaxAppName_Len => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WKS_FLAG_CLEAR_CREDS_ON_LAST_RESOURCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WKS_FLAG_PASSWORD_ENCRYPTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WKS_FLAG_CREDS_AUTHENTICATED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SB_SYNCH_CONFLICT_MAX_WRITE_ATTEMPTS => 100

    /**
     * @type {Integer (UInt32)}
     */
    static ACQUIRE_TARGET_LOCK_TIMEOUT => 300000

    /**
     * @type {Integer (UInt32)}
     */
    static RENDER_HINT_CLEAR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RENDER_HINT_VIDEO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RENDER_HINT_MAPPEDWINDOW => 2

    /**
     * @type {String}
     */
    static WTS_PROPERTY_DEFAULT_CONFIG => "DefaultConfig"

    /**
     * @type {Integer (UInt32)}
     */
    static TS_VC_LISTENER_STATIC_CHANNEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WRdsGraphicsChannels_LossyChannelMaxMessageSize => 988

    /**
     * @type {Integer (UInt32)}
     */
    static RFX_RDP_MSG_PREFIX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RFX_GFX_MSG_PREFIX => 48

    /**
     * @type {Integer (UInt32)}
     */
    static RFX_GFX_MSG_PREFIX_MASK => 48

    /**
     * @type {Integer (UInt32)}
     */
    static RFX_GFX_MAX_SUPPORTED_MONITORS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RFX_CLIENT_ID_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_CONNECT => 701

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_DISCONNECT => 702

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_RECONNECT => 703

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_DELETE_SAVED_CREDENTIALS => 704

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_UPDATE_SESSION_DISPLAYSETTINGS => 705

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_ATTACH_EVENT => 706

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_DETACH_EVENT => 707

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PROP_REMOTEDESKTOPCLIENT_SETTINGS => 710

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PROP_REMOTEDESKTOPCLIENT_ACTIONS => 711

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCH_POINTER => 712

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_SET_RDPPROPERTY => 720

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_GET_RDPPROPERTY => 721

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_APPLY_SETTINGS => 722

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_RETRIEVE_SETTINGS => 723

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_SUSPEND_SCREEN_UPDATES => 730

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_RESUME_SCREEN_UPDATES => 731

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_EXECUTE_REMOTE_ACTION => 732

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_METHOD_REMOTEDESKTOPCLIENT_GET_SNAPSHOT => 733

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_ENABLED => 740

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_EVENTSENABLED => 741

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_PROP_REMOTEDESKTOPCLIENT_TOUCHPOINTER_POINTERSPEED => 742

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_CONNECTING => 750

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_CONNECTED => 751

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_LOGINCOMPLETED => 752

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_DISCONNECTED => 753

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_STATUSCHANGED => 754

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_AUTORECONNECTING => 755

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_AUTORECONNECTED => 756

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_DIALOGDISPLAYING => 757

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_DIALOGDISMISSED => 758

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_NETWORKSTATUSCHANGED => 759

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_ADMINMESSAGERECEIVED => 760

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_KEYCOMBINATIONPRESSED => 761

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_REMOTEDESKTOPSIZECHANGED => 762

    /**
     * @type {Integer (UInt32)}
     */
    static DISPID_AX_TOUCHPOINTERCURSORMOVED => 800

    /**
     * @type {String}
     */
    static RDCLIENT_BITMAP_RENDER_SERVICE => "{e4cc08cb-942e-4b19-8504-bd5a89a747f5}"

    /**
     * @type {String}
     */
    static WTS_QUERY_ALLOWED_INITIAL_APP => "{c77d1b30-5be1-4c6b-a0e1-bd6d2e5c9fcc}"

    /**
     * @type {String}
     */
    static WTS_QUERY_LOGON_SCREEN_SIZE => "{8b8e0fe7-0804-4a0e-b279-8660b1df0049}"

    /**
     * @type {String}
     */
    static WTS_QUERY_AUDIOENUM_DLL => "{9bf4fa97-c883-4c2a-80ab-5a39c9af00db}"

    /**
     * @type {String}
     */
    static WTS_QUERY_MF_FORMAT_SUPPORT => "{41869ad0-6332-4dc8-95d5-db749e2f1d94}"

    /**
     * @type {String}
     */
    static WRDS_SERVICE_ID_GRAPHICS_GUID => "{d2993f4d-02cf-4280-8c48-1624b44f8706}"

    /**
     * @type {String}
     */
    static PROPERTY_DYNAMIC_TIME_ZONE_INFORMATION => "{0cdfd28e-d0b9-4c1f-a5eb-6d1f6c6535b9}"

    /**
     * @type {String}
     */
    static PROPERTY_TYPE_GET_FAST_RECONNECT => "{6212d757-0043-4862-99c3-9f3059ac2a3b}"

    /**
     * @type {String}
     */
    static PROPERTY_TYPE_GET_FAST_RECONNECT_USER_SID => "{197c427a-0135-4b6d-9c5e-e6579a0ab625}"

    /**
     * @type {String}
     */
    static PROPERTY_TYPE_ENABLE_UNIVERSAL_APPS_FOR_CUSTOM_SHELL => "{ed2c3fda-338d-4d3f-81a3-e767310d908e}"

    /**
     * @type {String}
     */
    static CONNECTION_PROPERTY_IDLE_TIME_WARNING => "{693f7ff5-0c4e-4d17-b8e0-1f70325e5d58}"

    /**
     * @type {String}
     */
    static CONNECTION_PROPERTY_CURSOR_BLINK_DISABLED => "{4b150580-fea4-4d3c-9de4-7433a66618f7}"
;@endregion Constants

;@region Methods
    /**
     * Stops a remote control session.
     * @param {Integer} LogonId The logon ID of the session that you want to stop the remote control of.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsstopremotecontrolsession
     * @since windows6.0.6000
     */
    static WTSStopRemoteControlSession(LogonId) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSStopRemoteControlSession", "uint", LogonId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Starts the remote control of another Remote Desktop Services session. You must call this function from a remote session. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSStartRemoteControlSession as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} pTargetServerName A pointer to the name of the server where the session that you want remote control of exists.
     * @param {Integer} TargetLogonId The logon ID of the session that you want remote control of.
     * @param {Integer} HotkeyVk The virtual-key code that represents the key to press to stop remote control of the session. The key that is defined in this parameter is used with the  <i>HotkeyModifiers</i> parameter.
     * @param {Integer} HotkeyModifiers The virtual modifier that represents the key to press to stop remote control of the session. The virtual modifier is used with the <i>HotkeyVk</i> parameter.
     * 
     * For example, if the <b>WTSStartRemoteControlSession</b> function is called with <i>HotkeyVk</i> set to <b>VK_MULTIPLY</b> and <i>HotkeyModifiers</i> set to <b>REMOTECONTROL_KBDCTRL_HOTKEY</b>, the user who has remote control of the target session can press CTRL + * to stop remote control of the session and return to their own session.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsstartremotecontrolsessionw
     * @since windows6.0.6000
     */
    static WTSStartRemoteControlSessionW(pTargetServerName, TargetLogonId, HotkeyVk, HotkeyModifiers) {
        pTargetServerName := pTargetServerName is String? StrPtr(pTargetServerName) : pTargetServerName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSStartRemoteControlSessionW", "ptr", pTargetServerName, "uint", TargetLogonId, "char", HotkeyVk, "ushort", HotkeyModifiers, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Starts the remote control of another Remote Desktop Services session. You must call this function from a remote session. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSStartRemoteControlSession as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} pTargetServerName A pointer to the name of the server where the session that you want remote control of exists.
     * @param {Integer} TargetLogonId The logon ID of the session that you want remote control of.
     * @param {Integer} HotkeyVk The virtual-key code that represents the key to press to stop remote control of the session. The key that is defined in this parameter is used with the  <i>HotkeyModifiers</i> parameter.
     * @param {Integer} HotkeyModifiers The virtual modifier that represents the key to press to stop remote control of the session. The virtual modifier is used with the <i>HotkeyVk</i> parameter.
     * 
     * For example, if the <b>WTSStartRemoteControlSession</b> function is called with <i>HotkeyVk</i> set to <b>VK_MULTIPLY</b> and <i>HotkeyModifiers</i> set to <b>REMOTECONTROL_KBDCTRL_HOTKEY</b>, the user who has remote control of the target session can press CTRL + * to stop remote control of the session and return to their own session.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsstartremotecontrolsessiona
     * @since windows6.0.6000
     */
    static WTSStartRemoteControlSessionA(pTargetServerName, TargetLogonId, HotkeyVk, HotkeyModifiers) {
        pTargetServerName := pTargetServerName is String? StrPtr(pTargetServerName) : pTargetServerName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSStartRemoteControlSessionA", "ptr", pTargetServerName, "uint", TargetLogonId, "char", HotkeyVk, "ushort", HotkeyModifiers, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Connects a Remote Desktop Services session to an existing session on the local computer. (ANSI)
     * @remarks
     * Either the <i>LogonId</i> or <i>TargetLogonId</i> parameter can be <b>LOGONID_CURRENT</b>, but not both.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSConnectSession as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} LogonId The logon ID of the session to connect to. The user of that session must have permissions to connect to an existing session. The output of this session will be routed to the session identified by the <i>TargetLogonId</i> parameter.
     * 
     * This can be <b>LOGONID_CURRENT</b> to use the current session.
     * @param {Integer} TargetLogonId The logon ID of the session to receive the output of the session represented by the <i>LogonId</i> parameter. The output of the session identified by the <i>LogonId</i> parameter will be routed to this session.
     * 
     * This can be <b>LOGONID_CURRENT</b> to use the current session.
     * @param {Pointer<Byte>} pPassword A pointer to the password for the user account that is specified in the <i>LogonId</i> parameter. The value of <i>pPassword</i> can be an empty string if the caller is logged on using the same domain name and user name as the logon ID. The value of <i>pPassword</i> cannot be <b>NULL</b>.
     * @param {Integer} bWait Indicates whether the operation is synchronous. Specify <b>TRUE</b> to wait for the operation to complete, or <b>FALSE</b> to return immediately.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsconnectsessiona
     * @since windows6.0.6000
     */
    static WTSConnectSessionA(LogonId, TargetLogonId, pPassword, bWait) {
        pPassword := pPassword is String? StrPtr(pPassword) : pPassword

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSConnectSessionA", "uint", LogonId, "uint", TargetLogonId, "ptr", pPassword, "int", bWait, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Connects a Remote Desktop Services session to an existing session on the local computer. (Unicode)
     * @remarks
     * Either the <i>LogonId</i> or <i>TargetLogonId</i> parameter can be <b>LOGONID_CURRENT</b>, but not both.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSConnectSession as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} LogonId The logon ID of the session to connect to. The user of that session must have permissions to connect to an existing session. The output of this session will be routed to the session identified by the <i>TargetLogonId</i> parameter.
     * 
     * This can be <b>LOGONID_CURRENT</b> to use the current session.
     * @param {Integer} TargetLogonId The logon ID of the session to receive the output of the session represented by the <i>LogonId</i> parameter. The output of the session identified by the <i>LogonId</i> parameter will be routed to this session.
     * 
     * This can be <b>LOGONID_CURRENT</b> to use the current session.
     * @param {Pointer<Char>} pPassword A pointer to the password for the user account that is specified in the <i>LogonId</i> parameter. The value of <i>pPassword</i> can be an empty string if the caller is logged on using the same domain name and user name as the logon ID. The value of <i>pPassword</i> cannot be <b>NULL</b>.
     * @param {Integer} bWait Indicates whether the operation is synchronous. Specify <b>TRUE</b> to wait for the operation to complete, or <b>FALSE</b> to return immediately.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsconnectsessionw
     * @since windows6.0.6000
     */
    static WTSConnectSessionW(LogonId, TargetLogonId, pPassword, bWait) {
        pPassword := pPassword is String? StrPtr(pPassword) : pPassword

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSConnectSessionW", "uint", LogonId, "uint", TargetLogonId, "ptr", pPassword, "int", bWait, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns a list of all Remote Desktop Session Host (RD Session Host) servers within the specified domain. (Unicode)
     * @remarks
     * This function will not work if NetBT is disabled.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSEnumerateServers as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} pDomainName Pointer to the name of the domain to be queried. If the value of this parameter is 
     *       <b>NULL</b>, the specified domain is the current domain.
     * @param {Integer} Reserved Reserved. The value of this parameter must be 0.
     * @param {Integer} Version Version of the enumeration request. The value of the parameter must be 1.
     * @param {Pointer<Char>} ppServerInfo Points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_server_infoa">WTS_SERVER_INFO</a> 
     *       structures, which contains the returned results of the enumeration. After use, the memory used by this buffer 
     *       should be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a>.
     * @param {Pointer<UInt32>} pCount Pointer to a variable that receives the number of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_server_infoa">WTS_SERVER_INFO</a> structures returned in the 
     *       <i>ppServerInfo</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     *  If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenumerateserversw
     * @since windows6.0.6000
     */
    static WTSEnumerateServersW(pDomainName, Reserved, Version, ppServerInfo, pCount) {
        pDomainName := pDomainName is String? StrPtr(pDomainName) : pDomainName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSEnumerateServersW", "ptr", pDomainName, "uint", Reserved, "uint", Version, "ptr", ppServerInfo, "uint*", pCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns a list of all Remote Desktop Session Host (RD Session Host) servers within the specified domain. (ANSI)
     * @remarks
     * This function will not work if NetBT is disabled.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSEnumerateServers as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} pDomainName Pointer to the name of the domain to be queried. If the value of this parameter is 
     *       <b>NULL</b>, the specified domain is the current domain.
     * @param {Integer} Reserved Reserved. The value of this parameter must be 0.
     * @param {Integer} Version Version of the enumeration request. The value of the parameter must be 1.
     * @param {Pointer<Byte>} ppServerInfo Points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_server_infoa">WTS_SERVER_INFO</a> 
     *       structures, which contains the returned results of the enumeration. After use, the memory used by this buffer 
     *       should be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a>.
     * @param {Pointer<UInt32>} pCount Pointer to a variable that receives the number of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_server_infoa">WTS_SERVER_INFO</a> structures returned in the 
     *       <i>ppServerInfo</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     *  If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenumerateserversa
     * @since windows6.0.6000
     */
    static WTSEnumerateServersA(pDomainName, Reserved, Version, ppServerInfo, pCount) {
        pDomainName := pDomainName is String? StrPtr(pDomainName) : pDomainName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSEnumerateServersA", "ptr", pDomainName, "uint", Reserved, "uint", Version, "ptr", ppServerInfo, "uint*", pCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a handle to the specified Remote Desktop Session Host (RD Session Host) server. (Unicode)
     * @remarks
     * When you have finished using the handle returned by 
     * <b>WTSOpenServer</b>, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtscloseserver">WTSCloseServer</a> function.
     * 
     * You do not need to open a handle for operations performed on the RD Session Host server on which your application is running. Use the constant <b>WTS_CURRENT_SERVER_HANDLE</b> instead.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSOpenServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} pServerName Pointer to a null-terminated string specifying the NetBIOS name of the RD Session Host server.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the specified server.
     * 
     * If the function fails, it returns a handle that is not valid. You can test the validity of the handle by using it in another function call.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsopenserverw
     * @since windows6.0.6000
     */
    static WTSOpenServerW(pServerName) {
        pServerName := pServerName is String? StrPtr(pServerName) : pServerName

        result := DllCall("WTSAPI32.dll\WTSOpenServerW", "ptr", pServerName, "ptr")
        return result
    }

    /**
     * Opens a handle to the specified Remote Desktop Session Host (RD Session Host) server. (ANSI)
     * @remarks
     * When you have finished using the handle returned by 
     * <b>WTSOpenServer</b>, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtscloseserver">WTSCloseServer</a> function.
     * 
     * You do not need to open a handle for operations performed on the RD Session Host server on which your application is running. Use the constant <b>WTS_CURRENT_SERVER_HANDLE</b> instead.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSOpenServer as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} pServerName Pointer to a null-terminated string specifying the NetBIOS name of the RD Session Host server.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the specified server.
     * 
     * If the function fails, it returns a handle that is not valid. You can test the validity of the handle by using it in another function call.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsopenservera
     * @since windows6.0.6000
     */
    static WTSOpenServerA(pServerName) {
        pServerName := pServerName is String? StrPtr(pServerName) : pServerName

        result := DllCall("WTSAPI32.dll\WTSOpenServerA", "ptr", pServerName, "ptr")
        return result
    }

    /**
     * Opens a handle to the specified Remote Desktop Session Host (RD Session Host) server or Remote Desktop Virtualization Host (RD Virtualization Host) server. (Unicode)
     * @remarks
     * If the server specified by the <i>pServerName</i> parameter is an RD Session Host server, the behavior of this function is identical to  that of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function.
     * 
     * To work with sessions running on virtual machines on the RD Virtualization Host server on which the calling application is running, specify <b>WTS_CURRENT_SERVER_NAME</b> for the <i>pServerName</i> parameter.
     * 
     * When you have finished using the handle returned by this function, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtscloseserver">WTSCloseServer</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSOpenServerEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} pServerName A pointer to a null-terminated string that contains the NetBIOS name of the server.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the specified server.
     * 
     * If the function fails, it returns an invalid handle. You can test the validity of the handle by using it in another function call.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsopenserverexw
     * @since windows6.1
     */
    static WTSOpenServerExW(pServerName) {
        pServerName := pServerName is String? StrPtr(pServerName) : pServerName

        result := DllCall("WTSAPI32.dll\WTSOpenServerExW", "ptr", pServerName, "ptr")
        return result
    }

    /**
     * Opens a handle to the specified Remote Desktop Session Host (RD Session Host) server or Remote Desktop Virtualization Host (RD Virtualization Host) server. (ANSI)
     * @remarks
     * If the server specified by the <i>pServerName</i> parameter is an RD Session Host server, the behavior of this function is identical to  that of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function.
     * 
     * To work with sessions running on virtual machines on the RD Virtualization Host server on which the calling application is running, specify <b>WTS_CURRENT_SERVER_NAME</b> for the <i>pServerName</i> parameter.
     * 
     * When you have finished using the handle returned by this function, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtscloseserver">WTSCloseServer</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSOpenServerEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} pServerName A pointer to a null-terminated string that contains the NetBIOS name of the server.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the specified server.
     * 
     * If the function fails, it returns an invalid handle. You can test the validity of the handle by using it in another function call.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsopenserverexa
     * @since windows6.1
     */
    static WTSOpenServerExA(pServerName) {
        pServerName := pServerName is String? StrPtr(pServerName) : pServerName

        result := DllCall("WTSAPI32.dll\WTSOpenServerExA", "ptr", pServerName, "ptr")
        return result
    }

    /**
     * Closes an open handle to a Remote Desktop Session Host (RD Session Host) server.
     * @remarks
     * Call the <b>WTSCloseServer</b> function as part of your program's clean-up routine to 
     *     close all the server handles opened by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> function.
     * 
     * After the handle has been closed, it cannot be used with any other WTS APIs.
     * @param {Pointer<Void>} hServer A handle to an RD Session Host server opened by a call to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> function.
     * 
     * Do not pass <b>WTS_CURRENT_SERVER_HANDLE</b> for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtscloseserver
     * @since windows6.0.6000
     */
    static WTSCloseServer(hServer) {
        DllCall("WTSAPI32.dll\WTSCloseServer", "ptr", hServer)
    }

    /**
     * Retrieves a list of sessions on a Remote Desktop Session Host (RD Session Host) server. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSEnumerateSessions as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hServer A handle to the RD Session Host server.
     * 
     * <div class="alert"><b>Note</b>  You can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> functions to retrieve a handle to a specific server, or  <b>WTS_CURRENT_SERVER_HANDLE</b> to use the RD Session Host server that hosts your application.</div>
     * <div> </div>
     * @param {Integer} Reserved This parameter is reserved. It must be zero.
     * @param {Integer} Version The version of the enumeration request. This parameter must be 1.
     * @param {Pointer<WTS_SESSION_INFOW>} ppSessionInfo A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_session_infoa">WTS_SESSION_INFO</a> structures that represent the retrieved sessions. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a> function.
     * 
     * <b>Session permissions:  </b><ul>
     * <li>To enumerate a session, you must enable the query information permission. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services Permissions</a>.</li>
     * <li>To change permissions on a session, use the Remote Desktop Services Configuration administrative tool.</li>
     * <li>To enumerate sessions running on a virtual machine hosted on a RD Virtualization Host server, you must be a member of the Administrators group on the RD Virtualization Host server.</li>
     * </ul>
     * @param {Pointer<UInt32>} pCount A pointer to the number of 
     * <b>WTS_SESSION_INFO</b> structures returned in the <i>ppSessionInfo</i> parameter.
     * @returns {Integer} Returns zero if this function fails. If this function succeeds, a nonzero value is returned.
     * 
     * To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsw
     * @since windows6.0.6000
     */
    static WTSEnumerateSessionsW(hServer, Reserved, Version, ppSessionInfo, pCount) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSEnumerateSessionsW", "ptr", hServer, "uint", Reserved, "uint", Version, "ptr", ppSessionInfo, "uint*", pCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a list of sessions on a Remote Desktop Session Host (RD Session Host) server. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSEnumerateSessions as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hServer A handle to the RD Session Host server.
     * 
     * <div class="alert"><b>Note</b>  You can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> functions to retrieve a handle to a specific server, or  <b>WTS_CURRENT_SERVER_HANDLE</b> to use the RD Session Host server that hosts your application.</div>
     * <div> </div>
     * @param {Integer} Reserved This parameter is reserved. It must be zero.
     * @param {Integer} Version The version of the enumeration request. This parameter must be 1.
     * @param {Pointer<WTS_SESSION_INFOA>} ppSessionInfo A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_session_infoa">WTS_SESSION_INFO</a> structures that represent the retrieved sessions. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a> function.
     * 
     * <b>Session permissions:  </b><ul>
     * <li>To enumerate a session, you must enable the query information permission. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services Permissions</a>.</li>
     * <li>To change permissions on a session, use the Remote Desktop Services Configuration administrative tool.</li>
     * <li>To enumerate sessions running on a virtual machine hosted on a RD Virtualization Host server, you must be a member of the Administrators group on the RD Virtualization Host server.</li>
     * </ul>
     * @param {Pointer<UInt32>} pCount A pointer to the number of 
     * <b>WTS_SESSION_INFO</b> structures returned in the <i>ppSessionInfo</i> parameter.
     * @returns {Integer} Returns zero if this function fails. If this function succeeds, a nonzero value is returned.
     * 
     * To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsa
     * @since windows6.0.6000
     */
    static WTSEnumerateSessionsA(hServer, Reserved, Version, ppSessionInfo, pCount) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSEnumerateSessionsA", "ptr", hServer, "uint", Reserved, "uint", Version, "ptr", ppSessionInfo, "uint*", pCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a list of sessions on a specified Remote Desktop Session Host (RD Session Host) server or Remote Desktop Virtualization Host (RD Virtualization Host) server. (Unicode)
     * @remarks
     * To obtain information about sessions running on virtual machines on an RD Virtualization Host server, you must obtain the handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> function. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememoryexa">WTSFreeMemoryEx</a> function and set the <i>WTSClassType</i> parameter to <b>WTSTypeSessionInfoLevel1</b>.
     * 
     * To enumerate a session, you need to have the Query Information permission for that session. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services Permissions</a>. To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool.
     * 
     * To enumerate sessions running on a virtual machine hosted on an RD Virtualization Host server, you must be a member of the Administrators group on the RD Virtualization Host server.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSEnumerateSessionsEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hServer A handle to the target server. Specify a handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> function. To enumerate sessions on  the RD Session Host server on which the application is running, specify <b>WTS_CURRENT_SERVER_HANDLE</b>.
     * @param {Pointer<UInt32>} pLevel This parameter is reserved. Always set this parameter to one. On output, <b>WTSEnumerateSessionsEx</b> does not change the value of this parameter.
     * @param {Integer} Filter This parameter is reserved. Always set this parameter to zero.
     * @param {Pointer<WTS_SESSION_INFO_1W>} ppSessionInfo A pointer to a <b>PWTS_SESSION_INFO_1</b> variable that receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_session_info_1a">WTS_SESSION_INFO_1</a> structures. Each structure in the array contains information about a session on the specified RD Session Host server. If you obtained a handle to an RD Virtualization Host server by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> function, the array contains information about sessions on virtual machines on the server. When you have finished using the array, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememoryexa">WTSFreeMemoryEx</a> function. You should also set the pointer to <b>NULL</b>.
     * @param {Pointer<UInt32>} pCount A pointer to a <b>DWORD</b> variable that receives the number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_session_info_1a">WTS_SESSION_INFO_1</a> structures returned in the <i>ppSessionInfo</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsexw
     * @since windows6.1
     */
    static WTSEnumerateSessionsExW(hServer, pLevel, Filter, ppSessionInfo, pCount) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSEnumerateSessionsExW", "ptr", hServer, "uint*", pLevel, "uint", Filter, "ptr", ppSessionInfo, "uint*", pCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a list of sessions on a specified Remote Desktop Session Host (RD Session Host) server or Remote Desktop Virtualization Host (RD Virtualization Host) server. (ANSI)
     * @remarks
     * To obtain information about sessions running on virtual machines on an RD Virtualization Host server, you must obtain the handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> function. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememoryexa">WTSFreeMemoryEx</a> function and set the <i>WTSClassType</i> parameter to <b>WTSTypeSessionInfoLevel1</b>.
     * 
     * To enumerate a session, you need to have the Query Information permission for that session. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services Permissions</a>. To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool.
     * 
     * To enumerate sessions running on a virtual machine hosted on an RD Virtualization Host server, you must be a member of the Administrators group on the RD Virtualization Host server.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSEnumerateSessionsEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hServer A handle to the target server. Specify a handle returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> function. To enumerate sessions on  the RD Session Host server on which the application is running, specify <b>WTS_CURRENT_SERVER_HANDLE</b>.
     * @param {Pointer<UInt32>} pLevel This parameter is reserved. Always set this parameter to one. On output, <b>WTSEnumerateSessionsEx</b> does not change the value of this parameter.
     * @param {Integer} Filter This parameter is reserved. Always set this parameter to zero.
     * @param {Pointer<WTS_SESSION_INFO_1A>} ppSessionInfo A pointer to a <b>PWTS_SESSION_INFO_1</b> variable that receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_session_info_1a">WTS_SESSION_INFO_1</a> structures. Each structure in the array contains information about a session on the specified RD Session Host server. If you obtained a handle to an RD Virtualization Host server by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> function, the array contains information about sessions on virtual machines on the server. When you have finished using the array, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememoryexa">WTSFreeMemoryEx</a> function. You should also set the pointer to <b>NULL</b>.
     * @param {Pointer<UInt32>} pCount A pointer to a <b>DWORD</b> variable that receives the number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_session_info_1a">WTS_SESSION_INFO_1</a> structures returned in the <i>ppSessionInfo</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsexa
     * @since windows6.1
     */
    static WTSEnumerateSessionsExA(hServer, pLevel, Filter, ppSessionInfo, pCount) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSEnumerateSessionsExA", "ptr", hServer, "uint*", pLevel, "uint", Filter, "ptr", ppSessionInfo, "uint*", pCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the active processes on a specified Remote Desktop Session Host (RD Session Host) server. (Unicode)
     * @remarks
     * The caller must be a member of the Administrators group to enumerate processes that are running under a 
     *     different user's context.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSEnumerateProcesses as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hServer Handle to an RD Session Host server. Specify a handle opened by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function, or specify 
     *       <b>WTS_CURRENT_SERVER_HANDLE</b> to indicate the RD Session Host server on which your application is 
     *       running.
     * @param {Integer} Reserved Reserved; must be zero.
     * @param {Integer} Version Specifies the version of the enumeration request. Must be 1.
     * @param {Pointer<WTS_PROCESS_INFOW>} ppProcessInfo Pointer to a variable that receives a pointer to an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_infoa">WTS_PROCESS_INFO</a> structures. Each structure 
     *       in the array contains information about an active process on the specified RD Session Host server. To free the returned 
     *       buffer, call the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a> function.
     * @param {Pointer<UInt32>} pCount Pointer to a variable that receives the number of <b>WTS_PROCESS_INFO</b> 
     *       structures returned in the <i>ppProcessInfo</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenumerateprocessesw
     * @since windows6.0.6000
     */
    static WTSEnumerateProcessesW(hServer, Reserved, Version, ppProcessInfo, pCount) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSEnumerateProcessesW", "ptr", hServer, "uint", Reserved, "uint", Version, "ptr", ppProcessInfo, "uint*", pCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the active processes on a specified Remote Desktop Session Host (RD Session Host) server. (ANSI)
     * @remarks
     * The caller must be a member of the Administrators group to enumerate processes that are running under a 
     *     different user's context.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSEnumerateProcesses as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hServer Handle to an RD Session Host server. Specify a handle opened by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function, or specify 
     *       <b>WTS_CURRENT_SERVER_HANDLE</b> to indicate the RD Session Host server on which your application is 
     *       running.
     * @param {Integer} Reserved Reserved; must be zero.
     * @param {Integer} Version Specifies the version of the enumeration request. Must be 1.
     * @param {Pointer<WTS_PROCESS_INFOA>} ppProcessInfo Pointer to a variable that receives a pointer to an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_infoa">WTS_PROCESS_INFO</a> structures. Each structure 
     *       in the array contains information about an active process on the specified RD Session Host server. To free the returned 
     *       buffer, call the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a> function.
     * @param {Pointer<UInt32>} pCount Pointer to a variable that receives the number of <b>WTS_PROCESS_INFO</b> 
     *       structures returned in the <i>ppProcessInfo</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenumerateprocessesa
     * @since windows6.0.6000
     */
    static WTSEnumerateProcessesA(hServer, Reserved, Version, ppProcessInfo, pCount) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSEnumerateProcessesA", "ptr", hServer, "uint", Reserved, "uint", Version, "ptr", ppProcessInfo, "uint*", pCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Terminates the specified process on the specified Remote Desktop Session Host (RD Session Host) server.
     * @param {Pointer<Void>} hServer Handle to an RD Session Host server. Specify a handle opened by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function, or specify WTS_CURRENT_SERVER_HANDLE to indicate the RD Session Host server on which your application is running.
     * @param {Integer} ProcessId Specifies the process identifier of the process to terminate.
     * @param {Integer} ExitCode Specifies the exit code for the terminated process.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsterminateprocess
     * @since windows6.0.6000
     */
    static WTSTerminateProcess(hServer, ProcessId, ExitCode) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSTerminateProcess", "ptr", hServer, "uint", ProcessId, "uint", ExitCode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves session information for the specified session on the specified Remote Desktop Session Host (RD Session Host) server. (Unicode)
     * @remarks
     * To retrieve the session ID for the current session when Remote Desktop Services is running, call 
     *     <b>WTSQuerySessionInformation</b> and specify 
     *     <b>WTS_CURRENT_SESSION</b> for the <i>SessionId</i> parameter and 
     *     <b>WTSSessionId</b> for the <i>WTSInfoClass</i> parameter. The session ID 
     *     will be returned in the <i>ppBuffer</i> parameter. If Remote Desktop Services is not running, calls 
     *     to <b>WTSQuerySessionInformation</b> fail. In 
     *     this situation, you can retrieve the current session ID by calling the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-processidtosessionid">ProcessIdToSessionId</a> function.
     * 
     * To determine whether your application is running on the physical console, you must specify 
     *     <b>WTS_CURRENT_SESSION</b> for the <i>SessionId</i> parameter, and 
     *     <b>WTSClientProtocolType</b> as the <i>WTSInfoClass</i> parameter. 
     *     If <i>ppBuffer</i> is "0", the session is attached to the physical console.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSQuerySessionInformation as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hServer A handle to an RD Session Host server. Specify a handle opened by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function, or specify 
     *       <b>WTS_CURRENT_SERVER_HANDLE</b> to indicate the RD Session Host server on which your application 
     *       is running.
     * @param {Integer} SessionId A Remote Desktop Services session identifier. To indicate the session in which the calling application is running 
     *       (or the current session) specify <b>WTS_CURRENT_SESSION</b>. Only specify 
     *       <b>WTS_CURRENT_SESSION</b> when obtaining session information on the local server. If 
     *       <b>WTS_CURRENT_SESSION</b> is specified when querying session information on a remote server, 
     *       the returned session information will be inconsistent. Do not use the returned data.
     * 
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsa">WTSEnumerateSessions</a> 
     *        function to retrieve the identifiers of all sessions on a specified RD Session Host server.
     * 
     * To query information for another user's session, you must have Query Information permission. For more 
     *        information, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services 
     *        Permissions</a>. To modify permissions on a session, use the Remote Desktop Services Configuration administrative 
     *        tool.
     * @param {Integer} WTSInfoClass A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_info_class">WTS_INFO_CLASS</a> enumeration that indicates the type of 
     *     session information to retrieve in a call to the 
     *     <b>WTSQuerySessionInformation</b> function.
     * @param {Pointer<Char>} ppBuffer A pointer to a variable that receives a pointer to the requested information. The format and contents of the 
     *       data depend on the information class specified in the <i>WTSInfoClass</i> parameter. To free 
     *       the returned buffer, call the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a> 
     *       function.
     * @param {Pointer<UInt32>} pBytesReturned A pointer to a variable that receives the size, in bytes, of the data returned in 
     *       <i>ppBuffer</i>.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsquerysessioninformationw
     * @since windows6.0.6000
     */
    static WTSQuerySessionInformationW(hServer, SessionId, WTSInfoClass, ppBuffer, pBytesReturned) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSQuerySessionInformationW", "ptr", hServer, "uint", SessionId, "int", WTSInfoClass, "ptr", ppBuffer, "uint*", pBytesReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves session information for the specified session on the specified Remote Desktop Session Host (RD Session Host) server. (ANSI)
     * @remarks
     * To retrieve the session ID for the current session when Remote Desktop Services is running, call 
     *     <b>WTSQuerySessionInformation</b> and specify 
     *     <b>WTS_CURRENT_SESSION</b> for the <i>SessionId</i> parameter and 
     *     <b>WTSSessionId</b> for the <i>WTSInfoClass</i> parameter. The session ID 
     *     will be returned in the <i>ppBuffer</i> parameter. If Remote Desktop Services is not running, calls 
     *     to <b>WTSQuerySessionInformation</b> fail. In 
     *     this situation, you can retrieve the current session ID by calling the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-processidtosessionid">ProcessIdToSessionId</a> function.
     * 
     * To determine whether your application is running on the physical console, you must specify 
     *     <b>WTS_CURRENT_SESSION</b> for the <i>SessionId</i> parameter, and 
     *     <b>WTSClientProtocolType</b> as the <i>WTSInfoClass</i> parameter. 
     *     If <i>ppBuffer</i> is "0", the session is attached to the physical console.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSQuerySessionInformation as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hServer A handle to an RD Session Host server. Specify a handle opened by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function, or specify 
     *       <b>WTS_CURRENT_SERVER_HANDLE</b> to indicate the RD Session Host server on which your application 
     *       is running.
     * @param {Integer} SessionId A Remote Desktop Services session identifier. To indicate the session in which the calling application is running 
     *       (or the current session) specify <b>WTS_CURRENT_SESSION</b>. Only specify 
     *       <b>WTS_CURRENT_SESSION</b> when obtaining session information on the local server. If 
     *       <b>WTS_CURRENT_SESSION</b> is specified when querying session information on a remote server, 
     *       the returned session information will be inconsistent. Do not use the returned data.
     * 
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsa">WTSEnumerateSessions</a> 
     *        function to retrieve the identifiers of all sessions on a specified RD Session Host server.
     * 
     * To query information for another user's session, you must have Query Information permission. For more 
     *        information, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services 
     *        Permissions</a>. To modify permissions on a session, use the Remote Desktop Services Configuration administrative 
     *        tool.
     * @param {Integer} WTSInfoClass A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_info_class">WTS_INFO_CLASS</a> enumeration that indicates the type of 
     *     session information to retrieve in a call to the 
     *     <b>WTSQuerySessionInformation</b> function.
     * @param {Pointer<Byte>} ppBuffer A pointer to a variable that receives a pointer to the requested information. The format and contents of the 
     *       data depend on the information class specified in the <i>WTSInfoClass</i> parameter. To free 
     *       the returned buffer, call the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a> 
     *       function.
     * @param {Pointer<UInt32>} pBytesReturned A pointer to a variable that receives the size, in bytes, of the data returned in 
     *       <i>ppBuffer</i>.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsquerysessioninformationa
     * @since windows6.0.6000
     */
    static WTSQuerySessionInformationA(hServer, SessionId, WTSInfoClass, ppBuffer, pBytesReturned) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSQuerySessionInformationA", "ptr", hServer, "uint", SessionId, "int", WTSInfoClass, "ptr", ppBuffer, "uint*", pBytesReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves configuration information for the specified user on the specified domain controller or Remote Desktop Session Host (RD Session Host) server. (Unicode)
     * @remarks
     * The 
     * <b>WTSQueryUserConfig</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtssetuserconfiga">WTSSetUserConfig</a> functions are passed a server name instead of a handle because user account information often resides on a domain controller. To set user configuration information, use the primary domain controller. You can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgetdcname">NetGetDCName</a> function to get the name of the primary domain controller. To query user configuration information, you can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgetanydcname">NetGetAnyDCName</a> function to get the name of a primary or backup domain controller.
     * 
     * Any domain controller can set or query user configuration information. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function to retrieve the name of a domain controller.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSQueryUserConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} pServerName Pointer to a null-terminated string containing the name of a domain controller or an RD Session Host server. Specify <b>WTS_CURRENT_SERVER_NAME</b> to indicate the RD Session Host server on which your application is running.
     * @param {Pointer<Char>} pUserName Pointer to a null-terminated string containing the user name to query. To retrieve the default user settings for the RD Session Host server, set this parameter to <b>NULL</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>Setting this parameter to <b>NULL</b> returns an error.
     * @param {Integer} WTSConfigClass Specifies the type of information to retrieve. This parameter can be one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_config_class">WTS_CONFIG_CLASS</a> enumeration type. The documentation for 
     * <b>WTS_CONFIG_CLASS</b> describes the format of the data returned in <i>ppBuffer</i> for each of the information types.
     * @param {Pointer<Char>} ppBuffer Pointer to a variable that receives a pointer to the requested information. The format and contents of the data depend on the information class specified in the <i>WTSConfigClass</i> parameter. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a> function.
     * @param {Pointer<UInt32>} pBytesReturned Pointer to a variable that receives the size, in bytes, of the data returned in <i>ppBuffer</i>.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsqueryuserconfigw
     * @since windows6.0.6000
     */
    static WTSQueryUserConfigW(pServerName, pUserName, WTSConfigClass, ppBuffer, pBytesReturned) {
        pServerName := pServerName is String? StrPtr(pServerName) : pServerName
        pUserName := pUserName is String? StrPtr(pUserName) : pUserName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSQueryUserConfigW", "ptr", pServerName, "ptr", pUserName, "int", WTSConfigClass, "ptr", ppBuffer, "uint*", pBytesReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves configuration information for the specified user on the specified domain controller or Remote Desktop Session Host (RD Session Host) server. (ANSI)
     * @remarks
     * The 
     * <b>WTSQueryUserConfig</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtssetuserconfiga">WTSSetUserConfig</a> functions are passed a server name instead of a handle because user account information often resides on a domain controller. To set user configuration information, use the primary domain controller. You can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgetdcname">NetGetDCName</a> function to get the name of the primary domain controller. To query user configuration information, you can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgetanydcname">NetGetAnyDCName</a> function to get the name of a primary or backup domain controller.
     * 
     * Any domain controller can set or query user configuration information. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function to retrieve the name of a domain controller.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSQueryUserConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} pServerName Pointer to a null-terminated string containing the name of a domain controller or an RD Session Host server. Specify <b>WTS_CURRENT_SERVER_NAME</b> to indicate the RD Session Host server on which your application is running.
     * @param {Pointer<Byte>} pUserName Pointer to a null-terminated string containing the user name to query. To retrieve the default user settings for the RD Session Host server, set this parameter to <b>NULL</b>.
     * 
     * <b>Windows Server 2008 and Windows Vista:  </b>Setting this parameter to <b>NULL</b> returns an error.
     * @param {Integer} WTSConfigClass Specifies the type of information to retrieve. This parameter can be one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_config_class">WTS_CONFIG_CLASS</a> enumeration type. The documentation for 
     * <b>WTS_CONFIG_CLASS</b> describes the format of the data returned in <i>ppBuffer</i> for each of the information types.
     * @param {Pointer<Byte>} ppBuffer Pointer to a variable that receives a pointer to the requested information. The format and contents of the data depend on the information class specified in the <i>WTSConfigClass</i> parameter. To free the returned buffer, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a> function.
     * @param {Pointer<UInt32>} pBytesReturned Pointer to a variable that receives the size, in bytes, of the data returned in <i>ppBuffer</i>.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsqueryuserconfiga
     * @since windows6.0.6000
     */
    static WTSQueryUserConfigA(pServerName, pUserName, WTSConfigClass, ppBuffer, pBytesReturned) {
        pServerName := pServerName is String? StrPtr(pServerName) : pServerName
        pUserName := pUserName is String? StrPtr(pUserName) : pUserName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSQueryUserConfigA", "ptr", pServerName, "ptr", pUserName, "int", WTSConfigClass, "ptr", ppBuffer, "uint*", pBytesReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Modifies configuration information for the specified user on the specified domain controller or Remote Desktop Session Host (RD Session Host) server. (Unicode)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsqueryuserconfiga">WTSQueryUserConfig</a> and 
     *     <b>WTSSetUserConfig</b> functions are passed a server 
     *     name instead of a handle because user account information often resides on a domain controller. To set user 
     *     configuration information, use the primary domain controller. You can call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgetdcname">NetGetDCName</a> function to get the name of the primary 
     *     domain controller. To query user configuration information, you can use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgetanydcname">NetGetAnyDCName</a> function to get the name of a 
     *     primary or backup domain controller.
     * 
     * Any domain controller can set or query user configuration information. Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function to retrieve the name of a domain 
     *     controller.
     * 
     * If the value of the  <i>WTSConfigClass</i> parameter corresponds to an integer value in the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_config_class">WTS_CONFIG_CLASS</a> enumeration, define the value 
     *      to be set as a <b>DWORD</b>.  Then cast the value to an <b>LPWSTR</b> 
     *      in the call to <b>WTSSetUserConfig</b>, as in the 
     *      following example:
     * 
     * 
     * ```cpp
     * WTSSetUserConfig( strServer.GetBuffer(0), 
     *                   m_strName.GetBuffer(0), 
     *                   WTSUserConfigfAllowLogonTerminalServer, 
     *                   (LPWSTR) &dwEnable, 
     *                   sizeof(DWORD));
     * ```
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSSetUserConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} pServerName Pointer to a null-terminated string containing the name of a domain controller or 
     *       RD Session Host server. Specify <b>WTS_CURRENT_SERVER_NAME</b> to indicate the 
     *       RD Session Host server on which your application is running.
     * @param {Pointer<Char>} pUserName Pointer to a null-terminated string containing the name of the user whose configuration is being set.
     * @param {Integer} WTSConfigClass Specifies the type of information to set for the user. This parameter can be one of the values from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_config_class">WTS_CONFIG_CLASS</a> enumeration type. The 
     *       documentation for <b>WTS_CONFIG_CLASS</b> describes 
     *       the format of the data specified in <i>ppBuffer</i> for each of the information types.
     * @param {Pointer} pBuffer Pointer to the data used to modify the specified user's configuration.
     * @param {Integer} DataLength Size, in <b>TCHARs</b>, of the <i>pBuffer</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtssetuserconfigw
     * @since windows6.0.6000
     */
    static WTSSetUserConfigW(pServerName, pUserName, WTSConfigClass, pBuffer, DataLength) {
        pServerName := pServerName is String? StrPtr(pServerName) : pServerName
        pUserName := pUserName is String? StrPtr(pUserName) : pUserName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSSetUserConfigW", "ptr", pServerName, "ptr", pUserName, "int", WTSConfigClass, "ptr", pBuffer, "uint", DataLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Modifies configuration information for the specified user on the specified domain controller or Remote Desktop Session Host (RD Session Host) server. (ANSI)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsqueryuserconfiga">WTSQueryUserConfig</a> and 
     *     <b>WTSSetUserConfig</b> functions are passed a server 
     *     name instead of a handle because user account information often resides on a domain controller. To set user 
     *     configuration information, use the primary domain controller. You can call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgetdcname">NetGetDCName</a> function to get the name of the primary 
     *     domain controller. To query user configuration information, you can use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgetanydcname">NetGetAnyDCName</a> function to get the name of a 
     *     primary or backup domain controller.
     * 
     * Any domain controller can set or query user configuration information. Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> function to retrieve the name of a domain 
     *     controller.
     * 
     * If the value of the  <i>WTSConfigClass</i> parameter corresponds to an integer value in the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_config_class">WTS_CONFIG_CLASS</a> enumeration, define the value 
     *      to be set as a <b>DWORD</b>.  Then cast the value to an <b>LPWSTR</b> 
     *      in the call to <b>WTSSetUserConfig</b>, as in the 
     *      following example:
     * 
     * 
     * ```cpp
     * WTSSetUserConfig( strServer.GetBuffer(0), 
     *                   m_strName.GetBuffer(0), 
     *                   WTSUserConfigfAllowLogonTerminalServer, 
     *                   (LPWSTR) &dwEnable, 
     *                   sizeof(DWORD));
     * ```
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSSetUserConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} pServerName Pointer to a null-terminated string containing the name of a domain controller or 
     *       RD Session Host server. Specify <b>WTS_CURRENT_SERVER_NAME</b> to indicate the 
     *       RD Session Host server on which your application is running.
     * @param {Pointer<Byte>} pUserName Pointer to a null-terminated string containing the name of the user whose configuration is being set.
     * @param {Integer} WTSConfigClass Specifies the type of information to set for the user. This parameter can be one of the values from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_config_class">WTS_CONFIG_CLASS</a> enumeration type. The 
     *       documentation for <b>WTS_CONFIG_CLASS</b> describes 
     *       the format of the data specified in <i>ppBuffer</i> for each of the information types.
     * @param {Pointer} pBuffer Pointer to the data used to modify the specified user's configuration.
     * @param {Integer} DataLength Size, in <b>TCHARs</b>, of the <i>pBuffer</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtssetuserconfiga
     * @since windows6.0.6000
     */
    static WTSSetUserConfigA(pServerName, pUserName, WTSConfigClass, pBuffer, DataLength) {
        pServerName := pServerName is String? StrPtr(pServerName) : pServerName
        pUserName := pUserName is String? StrPtr(pUserName) : pUserName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSSetUserConfigA", "ptr", pServerName, "ptr", pUserName, "int", WTSConfigClass, "ptr", pBuffer, "uint", DataLength, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Displays a message box on the client desktop of a specified Remote Desktop Services session. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSSendMessage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hServer A handle to an RD Session Host server. Specify a handle opened by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function, or specify 
     *        <b>WTS_CURRENT_SERVER_HANDLE</b> to indicate the RD Session Host server on which your application 
     *        is running.
     * @param {Integer} SessionId A Remote Desktop Services session identifier. To indicate the current session, specify 
     *       <b>WTS_CURRENT_SESSION</b>. You can use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsa">WTSEnumerateSessions</a> function to retrieve 
     *       the identifiers of all sessions on a specified RD Session Host server.
     * 
     * To send a message to another user's session, you need to have the Message permission. For more 
     *        information, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services  
     *        Permissions</a>. To modify permissions on a session, use the Remote Desktop Services Configuration administrative 
     *        tool.
     * @param {Pointer} pTitle A pointer to a null-terminated string for the title bar of the message box.
     * @param {Integer} TitleLength The length, in bytes, of the title bar string.
     * @param {Pointer} pMessage A pointer to a null-terminated string that contains the message to display.
     * @param {Integer} MessageLength The length, in bytes, of the message string.
     * @param {Integer} Style The contents and behavior of the message box. This value is typically 
     *       <b>MB_OK</b>. For a complete list of values, see the <i>uType</i> 
     *       parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-messagebox">MessageBox</a> function.
     * @param {Integer} Timeout The time, in seconds, that the <b>WTSSendMessage</b> function waits for 
     *       the user's response. If the user does not respond within the time-out interval, the 
     *       <i>pResponse</i> parameter returns <b>IDTIMEOUT</b>. If the 
     *       <i>Timeout</i> parameter is zero, <b>WTSSendMessage</b> waits 
     *       indefinitely for the user to respond.
     * @param {Pointer<Int32>} pResponse 
     * @param {Integer} bWait If <b>TRUE</b>, <b>WTSSendMessage</b> does not return until 
     *       the user responds or the time-out interval elapses. If the <i>Timeout</i> parameter is zero, 
     *       the function does not return until the user responds.
     * 
     * If <b>FALSE</b>, the function returns immediately and the 
     *        <i>pResponse</i> parameter returns <b>IDASYNC</b>. Use this method for 
     *        simple information messages (such as print job–notification messages) that do not need to return the 
     *        user's response to the calling program.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtssendmessagew
     * @since windows6.0.6000
     */
    static WTSSendMessageW(hServer, SessionId, pTitle, TitleLength, pMessage, MessageLength, Style, Timeout, pResponse, bWait) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSSendMessageW", "ptr", hServer, "uint", SessionId, "ptr", pTitle, "uint", TitleLength, "ptr", pMessage, "uint", MessageLength, "uint", Style, "uint", Timeout, "int*", pResponse, "int", bWait, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Displays a message box on the client desktop of a specified Remote Desktop Services session. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSSendMessage as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hServer A handle to an RD Session Host server. Specify a handle opened by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function, or specify 
     *        <b>WTS_CURRENT_SERVER_HANDLE</b> to indicate the RD Session Host server on which your application 
     *        is running.
     * @param {Integer} SessionId A Remote Desktop Services session identifier. To indicate the current session, specify 
     *       <b>WTS_CURRENT_SESSION</b>. You can use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsa">WTSEnumerateSessions</a> function to retrieve 
     *       the identifiers of all sessions on a specified RD Session Host server.
     * 
     * To send a message to another user's session, you need to have the Message permission. For more 
     *        information, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services  
     *        Permissions</a>. To modify permissions on a session, use the Remote Desktop Services Configuration administrative 
     *        tool.
     * @param {Pointer} pTitle A pointer to a null-terminated string for the title bar of the message box.
     * @param {Integer} TitleLength The length, in bytes, of the title bar string.
     * @param {Pointer} pMessage A pointer to a null-terminated string that contains the message to display.
     * @param {Integer} MessageLength The length, in bytes, of the message string.
     * @param {Integer} Style The contents and behavior of the message box. This value is typically 
     *       <b>MB_OK</b>. For a complete list of values, see the <i>uType</i> 
     *       parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-messagebox">MessageBox</a> function.
     * @param {Integer} Timeout The time, in seconds, that the <b>WTSSendMessage</b> function waits for 
     *       the user's response. If the user does not respond within the time-out interval, the 
     *       <i>pResponse</i> parameter returns <b>IDTIMEOUT</b>. If the 
     *       <i>Timeout</i> parameter is zero, <b>WTSSendMessage</b> waits 
     *       indefinitely for the user to respond.
     * @param {Pointer<Int32>} pResponse 
     * @param {Integer} bWait If <b>TRUE</b>, <b>WTSSendMessage</b> does not return until 
     *       the user responds or the time-out interval elapses. If the <i>Timeout</i> parameter is zero, 
     *       the function does not return until the user responds.
     * 
     * If <b>FALSE</b>, the function returns immediately and the 
     *        <i>pResponse</i> parameter returns <b>IDASYNC</b>. Use this method for 
     *        simple information messages (such as print job–notification messages) that do not need to return the 
     *        user's response to the calling program.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtssendmessagea
     * @since windows6.0.6000
     */
    static WTSSendMessageA(hServer, SessionId, pTitle, TitleLength, pMessage, MessageLength, Style, Timeout, pResponse, bWait) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSSendMessageA", "ptr", hServer, "uint", SessionId, "ptr", pTitle, "uint", TitleLength, "ptr", pMessage, "uint", MessageLength, "uint", Style, "uint", Timeout, "int*", pResponse, "int", bWait, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Disconnects the logged-on user from the specified Remote Desktop Services session without closing the session.
     * @param {Pointer<Void>} hServer A handle to an RD Session Host server. Specify a handle opened by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> function, or specify <b>WTS_CURRENT_SERVER_HANDLE</b> to indicate the RD Session Host server on which your application is running.
     * @param {Integer} SessionId A Remote Desktop Services session identifier. To indicate the current session, specify <b>WTS_CURRENT_SESSION</b>. To retrieve the identifiers of all sessions on a specified RD Session Host server, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsa">WTSEnumerateSessions</a> function.
     * 
     * To be able to disconnect another user's session, you need to have the Disconnect permission. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services Permissions</a>. To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool.
     * 
     * To disconnect sessions running on a virtual machine hosted on a RD Virtualization Host server, you must be a member of the Administrators group on the RD Virtualization Host server.
     * @param {Integer} bWait Indicates whether the operation is synchronous. Specify <b>TRUE</b> to wait for the operation to complete, or <b>FALSE</b> to return immediately.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsdisconnectsession
     * @since windows6.0.6000
     */
    static WTSDisconnectSession(hServer, SessionId, bWait) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSDisconnectSession", "ptr", hServer, "uint", SessionId, "int", bWait, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Logs off a specified Remote Desktop Services session.
     * @param {Pointer<Void>} hServer A handle to an RD Session Host server. Specify a handle opened by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> function, or specify <b>WTS_CURRENT_SERVER_HANDLE</b> to indicate the RD Session Host server on which your application is running.
     * @param {Integer} SessionId A Remote Desktop Services session identifier. To indicate the current session, specify <b>WTS_CURRENT_SESSION</b>. You can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsa">WTSEnumerateSessions</a> function to retrieve the identifiers of all sessions on a specified RD Session Host server.
     * 
     * To be able to log off another user's session, you need to have the Reset permission. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services Permissions</a>. To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool.
     * 
     * To log off sessions running on a virtual machine hosted on a RD Virtualization Host server, you must be a member of the Administrators group on the RD Virtualization Host server.
     * @param {Integer} bWait Indicates whether the operation is synchronous.
     * 
     * If <i>bWait</i> is <b>TRUE</b>, the function returns when the session is logged off.
     * 
     * If <i>bWait</i> is <b>FALSE</b>, the function returns immediately. To verify that the session has been logged off, specify the session identifier in a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsquerysessioninformationa">WTSQuerySessionInformation</a> function. 
     * <b>WTSQuerySessionInformation</b> returns zero if the session is logged off.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtslogoffsession
     * @since windows6.0.6000
     */
    static WTSLogoffSession(hServer, SessionId, bWait) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSLogoffSession", "ptr", hServer, "uint", SessionId, "int", bWait, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Shuts down (and optionally restarts) the specified Remote Desktop Session Host (RD Session Host) server.
     * @remarks
     * A system shutdown terminates all users and active programs. The following steps occur during shutdown.
     * 
     * <ol>
     * <li>An exit command is issued to all active user applications.</li>
     * <li>If the application does not exit within a specific interval, the application is terminated.</li>
     * <li>After all the applications for a user terminate, the user is logged off.</li>
     * <li>After all users are logged off, an exit command is issued to all system services.</li>
     * <li>If the system service does not terminate within a specific interval, the service is terminated.</li>
     * <li>The file system cache is written to disk.</li>
     * <li>The disks are marked read-only.</li>
     * <li>The RD Session Host server displays the message "It is now safe to turn off your computer", or the system is restarted if <b>WTS_WSD_REBOOT</b> is specified. (The message is displayed on the console because all client sessions have been terminated.)</li>
     * </ol>
     * <div class="alert"><b>Note</b>  Because there can be many users and processes in a large multiple-user configuration, large system configurations may take some time to shut down in an orderly fashion. It is important to allow the system to shut down completely.</div>
     * <div> </div>
     * <b>Windows Server 2008 and Windows Vista:  </b>A call to <b>WTSShutdownSystem</b> does not work when Remote Connection Manager (RCM) is disabled. This is the case when the Remote Desktop Services service is stopped.
     * @param {Pointer<Void>} hServer Handle to an RD Session Host server. Specify a handle opened by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function, or specify <b>WTS_CURRENT_SERVER_HANDLE</b> to indicate the RD Session Host server on which your application is running.
     * @param {Integer} ShutdownFlag 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsshutdownsystem
     * @since windows6.0.6000
     */
    static WTSShutdownSystem(hServer, ShutdownFlag) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSShutdownSystem", "ptr", hServer, "uint", ShutdownFlag, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Waits for a Remote Desktop Services event before returning to the caller.
     * @param {Pointer<Void>} hServer Handle to an RD Session Host server. Specify a handle opened by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function, or specify WTS_CURRENT_SERVER_HANDLE to indicate the RD Session Host server on which your application is running.
     * @param {Integer} EventMask Bitmask that specifies the set of events to wait for. This mask can be WTS_EVENT_FLUSH to cause all pending
     * @param {Pointer<UInt32>} pEventFlags Pointer to a variable that receives a bitmask of the event or events that occurred. The returned mask can 
     *       be a combination of the values from the previous list, or it can be <b>WTS_EVENT_NONE</b> if 
     *       the wait terminated because of a <b>WTSWaitSystemEvent</b> call with 
     *       <b>WTS_EVENT_FLUSH</b>.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtswaitsystemevent
     * @since windows6.0.6000
     */
    static WTSWaitSystemEvent(hServer, EventMask, pEventFlags) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSWaitSystemEvent", "ptr", hServer, "uint", EventMask, "uint*", pEventFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a handle to the server end of a specified virtual channel.
     * @remarks
     * When you have finished using the handle, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelclose">WTSVirtualChannelClose</a> function.
     * 
     * For an example that shows how to gain access to a virtual channel file handle that can be used for asynchronous I/O, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelquery">WTSVirtualChannelQuery</a>.
     * 
     * If you try to use this function to open the same virtual channel multiple times, it can cause a 10-second delay and disrupt the established channel.
     * @param {Integer} SessionId A Remote Desktop Services session identifier. To indicate the current session, specify <b>WTS_CURRENT_SESSION</b>. You can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsa">WTSEnumerateSessions</a> function to retrieve the identifiers of all sessions on a specified RD Session Host server.
     * 
     * To open a virtual channel on another user's session, you need to have permission from the Virtual Channel. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services Permissions</a>. To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool.
     * @param {Pointer<Byte>} pVirtualName A pointer to a <b>null</b>-terminated string containing the virtual channel name. Note that this is an ANSI string even when UNICODE is defined. The virtual channel name consists of one to CHANNEL_NAME_LEN characters, not including the terminating <b>null</b>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the specified virtual channel.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelopen
     * @since windows6.0.6000
     */
    static WTSVirtualChannelOpen(SessionId, pVirtualName) {
        static hServer := 0 ;Reserved parameters must always be NULL

        pVirtualName := pVirtualName is String? StrPtr(pVirtualName) : pVirtualName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSVirtualChannelOpen", "ptr", hServer, "uint", SessionId, "ptr", pVirtualName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a virtual channel in a manner similar to WTSVirtualChannelOpen.
     * @param {Integer} SessionId A Remote Desktop Services session identifier. To indicate the current session, specify 
     *        <b>WTS_CURRENT_SESSION</b>. You can use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsa">WTSEnumerateSessions</a> function to retrieve 
     *        the identifiers of all sessions on a specified RD Session Host server.
     * 
     * To be able to open a virtual channel on another user's session, you must have the Virtual Channels 
     *        permission. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services Permissions</a>. 
     *        To modify permissions on a session, use the Remote Desktop Services Configuration administrative tool.
     * @param {Pointer<Byte>} pVirtualName In the case of an SVC, points to a null-terminated string that contains the virtual channel name. The length 
     *        of an SVC name is limited to <b>CHANNEL_NAME_LEN</b> characters, not including the 
     *        terminating null.
     * 
     * In the case of a DVC, points to a null-terminated string that contains the endpoint name of the listener. The 
     *        length of a DVC name is limited to <b>MAX_PATH</b> characters.
     * @param {Integer} flags To open the channel as an SVC, specify zero for this parameter. To open the channel as a DVC, specify 
     *        <b>WTS_CHANNEL_OPTION_DYNAMIC</b>.
     * 
     * When opening a DVC, you can specify a priority setting for the data that is being transferred by specifying 
     *        one of the <b>WTS_CHANNEL_OPTION_DYNAMIC_PRI_<i>XXX</i></b> values in 
     *        combination with the <b>WTS_CHANNEL_OPTION_DYNAMIC</b> value.
     * @returns {Pointer<Void>} <b>NULL</b> on error with 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> set.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelopenex
     * @since windows6.0.6000
     */
    static WTSVirtualChannelOpenEx(SessionId, pVirtualName, flags) {
        pVirtualName := pVirtualName is String? StrPtr(pVirtualName) : pVirtualName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSVirtualChannelOpenEx", "uint", SessionId, "ptr", pVirtualName, "uint", flags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes an open virtual channel handle.
     * @param {Pointer<Void>} hChannelHandle Handle to a virtual channel opened by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelopen">WTSVirtualChannelOpen</a> function.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelclose
     * @since windows6.0.6000
     */
    static WTSVirtualChannelClose(hChannelHandle) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSVirtualChannelClose", "ptr", hChannelHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reads data from the server end of a virtual channel.
     * @remarks
     * <div class="alert"><b>Note</b>  <b>WTSVirtualChannelRead</b> is not thread safe. 
     *     To access a virtual channel from multiple threads, or to do asynchronous IO through a virtual channel, use 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelquery">WTSVirtualChannelQuery</a> with 
     *     <b>WTSVirtualFileHandle</b>.</div>
     * <div> </div>
     * @param {Pointer<Void>} hChannelHandle Handle to a virtual channel opened by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelopen">WTSVirtualChannelOpen</a> function.
     * @param {Integer} TimeOut Specifies the time-out, in milliseconds. If <i>TimeOut</i> is zero, 
     *       <b>WTSVirtualChannelRead</b> returns immediately 
     *       if there is no data to read. If <i>TimeOut</i> is INFINITE (defined in Winbase.h), the 
     *       function waits indefinitely until there is data to read.
     * @param {Pointer} Buffer Pointer to a buffer that receives a chunk of data read from the server end of the virtual channel. The maximum 
     *       amount of data that the server can receive in a single 
     *       <b>WTSVirtualChannelRead</b> call is 
     *       <b>CHANNEL_CHUNK_LENGTH</b> bytes. If the client's 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/cchannel/nc-cchannel-virtualchannelwrite">VirtualChannelWrite</a> call writes 
     *       a larger block of data, the server must make multiple 
     *       <b>WTSVirtualChannelRead</b> calls.
     * 
     * In certain cases, Remote Desktop Services places a 
     * <b>CHANNEL_PDU_HEADER</b> structure at the beginning of each chunk of data read by the 
     * <b>WTSVirtualChannelRead</b> function. This will occur if the 
     * client DLL sets the <b>CHANNEL_OPTION_SHOW_PROTOCOL</b> option when it calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cchannel/nc-cchannel-virtualchannelinit">VirtualChannelInit</a> function to initialize the virtual channel. This will also occur if the channel is a dynamic virtual channel written to by using the <a href="https://docs.microsoft.com/windows/desktop/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannel-write">IWTSVirtualChannel::Write</a> method. Otherwise, 
     *        the buffer receives only the data written in the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/cchannel/nc-cchannel-virtualchannelwrite">VirtualChannelWrite</a> call.
     * @param {Integer} BufferSize Specifies the size, in bytes, of <i>Buffer</i>. If the chunk of data in <i>Buffer</i> will be preceded by a <b>CHANNEL_PDU_HEADER</b> structure, the value of this parameter should be at least 
     *       <b>CHANNEL_PDU_LENGTH</b>. Otherwise, the value of this parameter should be at least <b>CHANNEL_CHUNK_LENGTH</b>.
     * @param {Pointer<UInt32>} pBytesRead Pointer to a variable that receives the number of bytes read.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelread
     * @since windows6.0.6000
     */
    static WTSVirtualChannelRead(hChannelHandle, TimeOut, Buffer, BufferSize, pBytesRead) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSVirtualChannelRead", "ptr", hChannelHandle, "uint", TimeOut, "ptr", Buffer, "uint", BufferSize, "uint*", pBytesRead, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Writes data to the server end of a virtual channel.
     * @remarks
     * <div class="alert"><b>Note</b>  <b>WTSVirtualChannelWrite</b> is not thread safe. 
     *     To access a virtual channel from multiple threads, or to do asynchronous IO through a virtual channel, use 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelquery">WTSVirtualChannelQuery</a> with 
     *     <b>WTSVirtualFileHandle</b>.</div>
     * <div> </div>
     * @param {Pointer<Void>} hChannelHandle Handle to a virtual channel opened by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelopen">WTSVirtualChannelOpen</a> function.
     * @param {Pointer} Buffer Pointer to a buffer containing the data to write to the virtual channel.
     * @param {Integer} Length Specifies the size, in bytes, of the data to write.
     * @param {Pointer<UInt32>} pBytesWritten Pointer to a variable that receives the number of bytes written.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelwrite
     * @since windows6.0.6000
     */
    static WTSVirtualChannelWrite(hChannelHandle, Buffer, Length, pBytesWritten) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSVirtualChannelWrite", "ptr", hChannelHandle, "ptr", Buffer, "uint", Length, "uint*", pBytesWritten, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes all queued input data sent from the client to the server on a specified virtual channel.
     * @param {Pointer<Void>} hChannelHandle Handle to a virtual channel opened by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelopen">WTSVirtualChannelOpen</a> function.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelpurgeinput
     * @since windows6.0.6000
     */
    static WTSVirtualChannelPurgeInput(hChannelHandle) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSVirtualChannelPurgeInput", "ptr", hChannelHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes all queued output data sent from the server to the client on a specified virtual channel.
     * @param {Pointer<Void>} hChannelHandle Handle to a virtual channel opened by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelopen">WTSVirtualChannelOpen</a> function.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelpurgeoutput
     * @since windows6.0.6000
     */
    static WTSVirtualChannelPurgeOutput(hChannelHandle) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSVirtualChannelPurgeOutput", "ptr", hChannelHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns information about a specified virtual channel.
     * @remarks
     * The following example shows how to gain access to a virtual channel file handle that can be used for 
     *     asynchronous I/O. First the code opens a virtual channel by using a call to the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelopen">WTSVirtualChannelOpen</a> function.
     *     Then the code calls the 
     *     <b>WTSVirtualChannelQuery</b> function, specifying 
     *     the WTSVirtualFileHandle virtual class type. 
     *     <b>WTSVirtualChannelQuery</b> returns a file 
     *     handle that you can use to perform asynchronous (overlapped) read and write operations. Finally, the code frees 
     *     the memory allocated by 
     *     <b>WTSVirtualChannelQuery</b> with a call to the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a> function, and closes the 
     *     virtual channel with a call to the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelclose">WTSVirtualChannelClose</a> function.
     * 
     * Note that you should not explicitly close the file handle obtained by calling 
     *     <b>WTSVirtualChannelQuery</b>. This is because 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelclose">WTSVirtualChannelClose</a> closes the file handle.
     * 
     * 
     * ```cpp
     *     PVOID vcFileHandlePtr = NULL;
     *     DWORD len;
     *     DWORD result = ERROR_SUCCESS;
     *     HANDLE vcHandle = NULL;
     *     HANDLE vcFileHandle = NULL;
     * 
     *     //
     *     //  Open a virtual channel.
     *     //
     *     vcHandle = WTSVirtualChannelOpen(
     *                       WTS_CURRENT_SERVER_HANDLE, // Current TS Server
     *                       WTS_CURRENT_SESSION,       // Current TS Session
     *                       (LPSTR) "TSTCHNL"                 // Channel name
     *                       );
     * 
     *     if (vcHandle == NULL) 
     *     {
     *         result = GetLastError();
     *     }
     * 
     *     //
     *     //  Gain access to the underlying file handle for 
     *     //   asynchronous I/O. 
     *     //
     *     if (result == ERROR_SUCCESS) 
     *     {
     *         if (!WTSVirtualChannelQuery(
     *                             vcHandle,
     *                             WTSVirtualFileHandle,
     *                             &vcFileHandlePtr,
     *                             &len
     *                             )) 
     *         {
     *             result = GetLastError();
     *         }
     *     }
     * 
     *     //
     *     //  Copy the data and
     *     //   free the buffer allocated by WTSVirtualChannelQuery.
     *     //
     *     if (result == ERROR_SUCCESS) 
     *     {
     *         memcpy(&vcFileHandle, vcFileHandlePtr, sizeof(vcFileHandle));
     *         WTSFreeMemory(vcFileHandlePtr);
     * 
     *         //
     *         //  Use vcFileHandle for overlapped reads and writes here.
     *         //
     *         //.
     *         //.
     *         //.
     *     }
     * 
     *     //
     *     //  Call WTSVirtualChannelClose to close the virtual channel. 
     *     //   Note: do not close the file handle.
     *     //
     *     if (vcHandle != NULL) 
     *     {
     *         WTSVirtualChannelClose(vcHandle);
     *         vcFileHandle = NULL;
     *     }
     * 
     * ```
     * 
     * 
     * For more information about overlapped mode, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and 
     *     Output</a>.
     * @param {Pointer<Void>} hChannelHandle Handle to a virtual channel opened by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelopen">WTSVirtualChannelOpen</a> function.
     * @param {Integer} param1 
     * @param {Pointer<Void>} ppBuffer Pointer to a buffer that receives the requested information.
     * @param {Pointer<UInt32>} pBytesReturned Pointer to a variable that receives the number of bytes returned in the <i>ppBuffer</i> 
     *       parameter.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value. Call the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a> function with the value returned in 
     *        the <i>ppBuffer</i> parameter to free the temporary memory allocated by 
     *        <b>WTSVirtualChannelQuery</b>.
     *       
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelquery
     * @since windows6.0.6000
     */
    static WTSVirtualChannelQuery(hChannelHandle, param1, ppBuffer, pBytesReturned) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSVirtualChannelQuery", "ptr", hChannelHandle, "int", param1, "ptr", ppBuffer, "uint*", pBytesReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees memory allocated by a Remote Desktop Services function.
     * @remarks
     * Several Remote Desktop Services functions allocate buffers to return information. Use the 
     * <b>WTSFreeMemory</b> function to free these buffers.
     * @param {Pointer<Void>} pMemory Pointer to the memory to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsfreememory
     * @since windows6.0.6000
     */
    static WTSFreeMemory(pMemory) {
        DllCall("WTSAPI32.dll\WTSFreeMemory", "ptr", pMemory)
    }

    /**
     * Registers the specified window to receive session change notifications. (WTSRegisterSessionNotification)
     * @remarks
     * If this function is called before the dependent services of Remote Desktop Services have started, an 
     *     <b>RPC_S_INVALID_BINDING</b> error code may be returned. When the Global\\TermSrvReadyEvent 
     *     global event is set, all dependent services  have started and this function can be successfully called.
     * 
     * Session change notifications are sent in the form of a 
     *     <a href="https://docs.microsoft.com/windows/desktop/TermServ/wm-wtssession-change">WM_WTSSESSION_CHANGE</a> message. These 
     *     notifications are sent only to the windows that have registered for them using this function.
     * 
     * When a window no longer requires these notifications, it must call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsunregistersessionnotification">WTSUnRegisterSessionNotification</a> 
     *     before being destroyed. For every call to this function, there must be a corresponding call to 
     *     <b>WTSUnRegisterSessionNotification</b>.
     * 
     * If the window handle passed in this function is already registered, the value of the <i>dwFlags</i> parameter is ignored.
     * 
     * To receive session change notifications from a service, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a> function.
     * @param {Pointer<Void>} hWnd Handle of the window to receive session change notifications.
     * @param {Integer} dwFlags Specifies which session notifications are to be received. This parameter can be one of the following 
     *       values.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. Otherwise, it is 
     *        <b>FALSE</b>. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsregistersessionnotification
     * @since windows6.0.6000
     */
    static WTSRegisterSessionNotification(hWnd, dwFlags) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSRegisterSessionNotification", "ptr", hWnd, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unregisters the specified window so that it receives no further session change notifications. (WTSUnRegisterSessionNotification)
     * @remarks
     * This function must be called once for every call to the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsregistersessionnotification">WTSRegisterSessionNotification</a> 
     *     function.
     * @param {Pointer<Void>} hWnd Handle of the window to be unregistered from receiving session notifications.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>. To get extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsunregistersessionnotification
     * @since windows6.0.6000
     */
    static WTSUnRegisterSessionNotification(hWnd) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSUnRegisterSessionNotification", "ptr", hWnd, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers the specified window to receive session change notifications. (WTSRegisterSessionNotificationEx)
     * @remarks
     * If this function is called before the dependent services of Remote Desktop Services have started, an 
     *     <b>RPC_S_INVALID_BINDING</b> error code may be returned. When the 
     *     "Global\\TermSrvReadyEvent" global event is set, all dependent services  have started and this 
     *     function can be successfully called.
     * 
     * Session change notifications are sent in the form of a 
     *     <a href="https://docs.microsoft.com/windows/desktop/TermServ/wm-wtssession-change">WM_WTSSESSION_CHANGE</a> message. These 
     *     notifications are sent only to the windows that have registered for them using this function.
     * 
     * When a window no longer requires these notifications, it must call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsunregistersessionnotificationex">WTSUnRegisterSessionNotificationEx</a> 
     *     before being destroyed. For every call to this function, there must be a corresponding call to 
     *     <b>WTSUnRegisterSessionNotificationEx</b>.
     * 
     * If the window handle passed in this function is already registered, the value of the 
     *     <i>dwFlags</i> parameter is ignored.
     * 
     * To receive session change notifications from a service, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a> function.
     * @param {Pointer<Void>} hServer Handle of the server returned from 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> or 
     *       <b>WTS_CURRENT_SERVER</b>.
     * @param {Pointer<Void>} hWnd Handle of the window to receive session change notifications.
     * @param {Integer} dwFlags Specifies which session notifications are to be received. This parameter can only be 
     *       <b>NOTIFY_FOR_THIS_SESSION</b> if <i>hServer</i> is a remote server.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. Otherwise, it is 
     *        <b>FALSE</b>. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsregistersessionnotificationex
     * @since windows6.0.6000
     */
    static WTSRegisterSessionNotificationEx(hServer, hWnd, dwFlags) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSRegisterSessionNotificationEx", "ptr", hServer, "ptr", hWnd, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unregisters the specified window so that it receives no further session change notifications. (WTSUnRegisterSessionNotificationEx)
     * @remarks
     * This function must be called once for every call to the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsregistersessionnotificationex">WTSRegisterSessionNotificationEx</a> 
     *     function.
     * @param {Pointer<Void>} hServer Handle of the server returned from 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> or 
     *       <b>WTS_CURRENT_SERVER</b>.
     * @param {Pointer<Void>} hWnd Handle of the window to be unregistered from receiving session notifications.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>. To get extended error 
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsunregistersessionnotificationex
     * @since windows6.0.6000
     */
    static WTSUnRegisterSessionNotificationEx(hServer, hWnd) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSUnRegisterSessionNotificationEx", "ptr", hServer, "ptr", hWnd, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Obtains the primary access token of the logged-on user specified by the session ID.
     * @remarks
     * For information about primary tokens, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-tokens">Access Tokens</a>. For more information about 
     *     account privileges, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services Permissions</a> 
     *     and <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authorization-constants">Authorization Constants</a>.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/Services/localsystem-account">LocalSystem account</a> for 
     *     information about the privileges associated with that account.
     * @param {Integer} SessionId A Remote Desktop Services session identifier. Any program running in the context of a service will have a 
     *        session identifier of zero (0). You can use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsa">WTSEnumerateSessions</a> function to retrieve 
     *       the identifiers of all sessions on a specified RD Session Host server.
     * 
     * To be able to query information for another user's session, you need to have the Query Information 
     *        permission. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/TermServ/terminal-services-permissions">Remote Desktop Services 
     *        Permissions</a>. To modify permissions on a session, use the Remote Desktop Services Configuration 
     *        administrative tool.
     * @param {Pointer<Void>} phToken If the function succeeds, receives a pointer to the token handle for the logged-on user. Note that you must 
     *       call the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function to close this 
     *       handle.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value, and the <i>phToken</i> 
     *        parameter points to the primary token of the user.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsqueryusertoken
     * @since windows6.0.6000
     */
    static WTSQueryUserToken(SessionId, phToken) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSQueryUserToken", "uint", SessionId, "ptr", phToken, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees memory that contains WTS_PROCESS_INFO_EX or WTS_SESSION_INFO_1 structures allocated by a Remote Desktop Services function. (Unicode)
     * @remarks
     * Several Remote Desktop Services functions allocate buffers to return information. To free buffers that 
     *     contain <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_info_exa">WTS_PROCESS_INFO_EX</a> or 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_session_info_1a">WTS_SESSION_INFO_1</a> structures, you must call the 
     *     <b>WTSFreeMemoryEx</b> function. To free other buffers, 
     *     you can call either the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a> function or 
     *     the <b>WTSFreeMemoryEx</b> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSFreeMemoryEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} WTSTypeClass A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_type_class">WTS_TYPE_CLASS</a> enumeration type 
     *       that specifies the type of structures contained in the buffer referenced by the 
     *       <i>pMemory</i> parameter.
     * @param {Pointer<Void>} pMemory A pointer to the buffer to free.
     * @param {Integer} NumberOfEntries The number of elements in the buffer referenced by the <i>pMemory</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsfreememoryexw
     * @since windows6.1
     */
    static WTSFreeMemoryExW(WTSTypeClass, pMemory, NumberOfEntries) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSFreeMemoryExW", "int", WTSTypeClass, "ptr", pMemory, "uint", NumberOfEntries, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Frees memory that contains WTS_PROCESS_INFO_EX or WTS_SESSION_INFO_1 structures allocated by a Remote Desktop Services function. (ANSI)
     * @remarks
     * Several Remote Desktop Services functions allocate buffers to return information. To free buffers that 
     *     contain <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_info_exa">WTS_PROCESS_INFO_EX</a> or 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_session_info_1a">WTS_SESSION_INFO_1</a> structures, you must call the 
     *     <b>WTSFreeMemoryEx</b> function. To free other buffers, 
     *     you can call either the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememory">WTSFreeMemory</a> function or 
     *     the <b>WTSFreeMemoryEx</b> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSFreeMemoryEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} WTSTypeClass A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_type_class">WTS_TYPE_CLASS</a> enumeration type 
     *       that specifies the type of structures contained in the buffer referenced by the 
     *       <i>pMemory</i> parameter.
     * @param {Pointer<Void>} pMemory A pointer to the buffer to free.
     * @param {Integer} NumberOfEntries The number of elements in the buffer referenced by the <i>pMemory</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsfreememoryexa
     * @since windows6.1
     */
    static WTSFreeMemoryExA(WTSTypeClass, pMemory, NumberOfEntries) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSFreeMemoryExA", "int", WTSTypeClass, "ptr", pMemory, "uint", NumberOfEntries, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the active processes on the specified Remote Desktop Session Host (RD Session Host) server or Remote Desktop Virtualization Host (RD Virtualization Host) server. (Unicode)
     * @remarks
     * The caller must be a member of the Administrators group to enumerate processes that are running under another user session.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSEnumerateProcessesEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hServer A handle to an RD Session Host server. Specify a handle opened by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function, or specify 
     *       <b>WTS_CURRENT_SERVER_HANDLE</b> to indicate the server on which your application is 
     *       running.
     * @param {Pointer<UInt32>} pLevel A pointer to a <b>DWORD</b> variable that, on input, specifies the type of information  to return. To return an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_infoa">WTS_PROCESS_INFO</a> structures, specify zero. To return an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_info_exa">WTS_PROCESS_INFO_EX</a> structures, specify one.
     * 
     * If you do not specify a valid value for this parameter, on output, <b>WTSEnumerateProcessesEx</b> sets this parameter to one and returns an error. Otherwise, on output, <b>WTSEnumerateProcessesEx</b> does not change the value of this parameter.
     * @param {Integer} SessionId The session  for which to enumerate processes. To enumerate processes for all sessions on the server,  specify <b>WTS_ANY_SESSION</b>.
     * @param {Pointer<Char>} ppProcessInfo A pointer to a variable that receives a pointer to an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_infoa">WTS_PROCESS_INFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_info_exa">WTS_PROCESS_INFO_EX</a> structures. The type of structure is determined by the value passed to the <i>pLevel</i> parameter. Each structure 
     *       in the array contains information about an active process. When you have finished using the array, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememoryexa">WTSFreeMemoryEx</a> function. You should also set the pointer to <b>NULL</b>.
     * @param {Pointer<UInt32>} pCount A pointer to a variable that receives the number of  
     *       structures returned in the buffer referenced by the <i>ppProcessInfo</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenumerateprocessesexw
     * @since windows6.1
     */
    static WTSEnumerateProcessesExW(hServer, pLevel, SessionId, ppProcessInfo, pCount) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSEnumerateProcessesExW", "ptr", hServer, "uint*", pLevel, "uint", SessionId, "ptr", ppProcessInfo, "uint*", pCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the active processes on the specified Remote Desktop Session Host (RD Session Host) server or Remote Desktop Virtualization Host (RD Virtualization Host) server. (ANSI)
     * @remarks
     * The caller must be a member of the Administrators group to enumerate processes that are running under another user session.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSEnumerateProcessesEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hServer A handle to an RD Session Host server. Specify a handle opened by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenservera">WTSOpenServer</a> function, or specify 
     *       <b>WTS_CURRENT_SERVER_HANDLE</b> to indicate the server on which your application is 
     *       running.
     * @param {Pointer<UInt32>} pLevel A pointer to a <b>DWORD</b> variable that, on input, specifies the type of information  to return. To return an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_infoa">WTS_PROCESS_INFO</a> structures, specify zero. To return an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_info_exa">WTS_PROCESS_INFO_EX</a> structures, specify one.
     * 
     * If you do not specify a valid value for this parameter, on output, <b>WTSEnumerateProcessesEx</b> sets this parameter to one and returns an error. Otherwise, on output, <b>WTSEnumerateProcessesEx</b> does not change the value of this parameter.
     * @param {Integer} SessionId The session  for which to enumerate processes. To enumerate processes for all sessions on the server,  specify <b>WTS_ANY_SESSION</b>.
     * @param {Pointer<Byte>} ppProcessInfo A pointer to a variable that receives a pointer to an array of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_infoa">WTS_PROCESS_INFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_process_info_exa">WTS_PROCESS_INFO_EX</a> structures. The type of structure is determined by the value passed to the <i>pLevel</i> parameter. Each structure 
     *       in the array contains information about an active process. When you have finished using the array, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsfreememoryexa">WTSFreeMemoryEx</a> function. You should also set the pointer to <b>NULL</b>.
     * @param {Pointer<UInt32>} pCount A pointer to a variable that receives the number of  
     *       structures returned in the buffer referenced by the <i>ppProcessInfo</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenumerateprocessesexa
     * @since windows6.1
     */
    static WTSEnumerateProcessesExA(hServer, pLevel, SessionId, ppProcessInfo, pCount) {
        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSEnumerateProcessesExA", "ptr", hServer, "uint*", pLevel, "uint", SessionId, "ptr", ppProcessInfo, "uint*", pCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates all the Remote Desktop Services listeners on a Remote Desktop Session Host (RD Session Host) server. (Unicode)
     * @remarks
     * This function  returns all listeners currently running on the server, including listeners that do not support 
     *     Remote Desktop Protocol (RDP).
     * 
     * If the number of listeners is unknown, you can call this function with <i>pListeners</i> 
     *     set to <b>NULL</b>. The function will then return, in the <i>pCount</i> 
     *     parameter, the number of <b>WTSLISTENERNAME</b> variables necessary to receive all the 
     *     listeners. Allocate the array for <i>pListeners</i> based on this number, and then call the 
     *     function again, setting <i>pListeners</i> to the newly allocated array and 
     *     <i>pCount</i> to the number returned by the first call.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSEnumerateListeners as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} pReserved This parameter is reserved. Always set this parameter to <b>NULL</b>.
     * @param {Integer} Reserved This parameter is reserved. Always set this parameter to zero.
     * @param {Pointer<UInt16>} pListeners A pointer to an array of <b>WTSLISTENERNAME</b> variables that receive the names of 
     *       the listeners.
     * @param {Pointer<UInt32>} pCount A pointer to a <b>DWORD</b> variable that contains the number of listener names in 
     *       the array referenced by the <i>pListeners</i> parameter. If the number of listener names is 
     *       unknown, pass <i>pListeners</i> as <b>NULL</b>. The function will return 
     *       the number of  <b>WTSLISTENERNAME</b> variables necessary to allocate for the array 
     *       pointed to by the <i>pListeners</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenumeratelistenersw
     * @since windows6.1
     */
    static WTSEnumerateListenersW(pReserved, Reserved, pListeners, pCount) {
        static hServer := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSEnumerateListenersW", "ptr", hServer, "ptr", pReserved, "uint", Reserved, "ptr", pListeners, "uint*", pCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates all the Remote Desktop Services listeners on a Remote Desktop Session Host (RD Session Host) server. (ANSI)
     * @remarks
     * This function  returns all listeners currently running on the server, including listeners that do not support 
     *     Remote Desktop Protocol (RDP).
     * 
     * If the number of listeners is unknown, you can call this function with <i>pListeners</i> 
     *     set to <b>NULL</b>. The function will then return, in the <i>pCount</i> 
     *     parameter, the number of <b>WTSLISTENERNAME</b> variables necessary to receive all the 
     *     listeners. Allocate the array for <i>pListeners</i> based on this number, and then call the 
     *     function again, setting <i>pListeners</i> to the newly allocated array and 
     *     <i>pCount</i> to the number returned by the first call.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSEnumerateListeners as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} pReserved This parameter is reserved. Always set this parameter to <b>NULL</b>.
     * @param {Integer} Reserved This parameter is reserved. Always set this parameter to zero.
     * @param {Pointer<SByte>} pListeners A pointer to an array of <b>WTSLISTENERNAME</b> variables that receive the names of 
     *       the listeners.
     * @param {Pointer<UInt32>} pCount A pointer to a <b>DWORD</b> variable that contains the number of listener names in 
     *       the array referenced by the <i>pListeners</i> parameter. If the number of listener names is 
     *       unknown, pass <i>pListeners</i> as <b>NULL</b>. The function will return 
     *       the number of  <b>WTSLISTENERNAME</b> variables necessary to allocate for the array 
     *       pointed to by the <i>pListeners</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenumeratelistenersa
     * @since windows6.1
     */
    static WTSEnumerateListenersA(pReserved, Reserved, pListeners, pCount) {
        static hServer := 0 ;Reserved parameters must always be NULL

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSEnumerateListenersA", "ptr", hServer, "ptr", pReserved, "uint", Reserved, "ptr", pListeners, "uint*", pCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves configuration information for a Remote Desktop Services listener. (Unicode)
     * @remarks
     * This function does not retrieve the security descriptor for the listener. To retrieve the security descriptor, call the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsgetlistenersecuritya">WTSGetListenerSecurity</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSQueryListenerConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} pReserved This parameter is reserved. Always set this parameter to <b>NULL</b>.
     * @param {Integer} Reserved This parameter is reserved. Always set this parameter to zero.
     * @param {Pointer<Char>} pListenerName A pointer to a null-terminated string that contains the name of the listener to query.
     * @param {Pointer<WTSLISTENERCONFIGW>} pBuffer A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtslistenerconfiga">WTSLISTENERCONFIG</a> structure that receives the  retrieved listener configuration information.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsquerylistenerconfigw
     * @since windows6.1
     */
    static WTSQueryListenerConfigW(pReserved, Reserved, pListenerName, pBuffer) {
        static hServer := 0 ;Reserved parameters must always be NULL

        pListenerName := pListenerName is String? StrPtr(pListenerName) : pListenerName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSQueryListenerConfigW", "ptr", hServer, "ptr", pReserved, "uint", Reserved, "ptr", pListenerName, "ptr", pBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves configuration information for a Remote Desktop Services listener. (ANSI)
     * @remarks
     * This function does not retrieve the security descriptor for the listener. To retrieve the security descriptor, call the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsgetlistenersecuritya">WTSGetListenerSecurity</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSQueryListenerConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} pReserved This parameter is reserved. Always set this parameter to <b>NULL</b>.
     * @param {Integer} Reserved This parameter is reserved. Always set this parameter to zero.
     * @param {Pointer<Byte>} pListenerName A pointer to a null-terminated string that contains the name of the listener to query.
     * @param {Pointer<WTSLISTENERCONFIGA>} pBuffer A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtslistenerconfiga">WTSLISTENERCONFIG</a> structure that receives the  retrieved listener configuration information.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsquerylistenerconfiga
     * @since windows6.1
     */
    static WTSQueryListenerConfigA(pReserved, Reserved, pListenerName, pBuffer) {
        static hServer := 0 ;Reserved parameters must always be NULL

        pListenerName := pListenerName is String? StrPtr(pListenerName) : pListenerName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSQueryListenerConfigA", "ptr", hServer, "ptr", pReserved, "uint", Reserved, "ptr", pListenerName, "ptr", pBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new Remote Desktop Services listener or configures an existing listener. (Unicode)
     * @remarks
     * This function creates or configures a listener that uses   <a href="https://docs.microsoft.com/windows/desktop/TermServ/remote-desktop-protocol">Remote Desktop Protocol</a> (RDP). Always set the <b>version</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtslistenerconfiga">WTSLISTENERCONFIG</a> structure that is pointed to by the <i>pBuffer</i> parameter to one.
     * 
     * This function does not create or configure the security descriptor of the listener. When you call this function to create a new listener, the function assigns the default security descriptor to the new listener. To modify the security descriptor, call the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtssetlistenersecuritya">WTSSetListenerSecurity</a> function. For more information about security descriptors, see  <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a>.
     * 
     * This function does not validate the settings for the new listener. Be sure that the settings are valid before calling this function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSCreateListener as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} pReserved This parameter is reserved. Always set this parameter to <b>NULL</b>.
     * @param {Integer} Reserved This parameter is reserved. Always set this parameter to zero.
     * @param {Pointer<Char>} pListenerName A pointer to a null-terminated string that contains the name of the listener to create or configure.
     * @param {Pointer<WTSLISTENERCONFIGW>} pBuffer A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtslistenerconfiga">WTSLISTENERCONFIG</a> structure that contains configuration information for the listener.
     * @param {Integer} flag 
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtscreatelistenerw
     * @since windows6.1
     */
    static WTSCreateListenerW(pReserved, Reserved, pListenerName, pBuffer, flag) {
        static hServer := 0 ;Reserved parameters must always be NULL

        pListenerName := pListenerName is String? StrPtr(pListenerName) : pListenerName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSCreateListenerW", "ptr", hServer, "ptr", pReserved, "uint", Reserved, "ptr", pListenerName, "ptr", pBuffer, "uint", flag, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a new Remote Desktop Services listener or configures an existing listener. (ANSI)
     * @remarks
     * This function creates or configures a listener that uses   <a href="https://docs.microsoft.com/windows/desktop/TermServ/remote-desktop-protocol">Remote Desktop Protocol</a> (RDP). Always set the <b>version</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtslistenerconfiga">WTSLISTENERCONFIG</a> structure that is pointed to by the <i>pBuffer</i> parameter to one.
     * 
     * This function does not create or configure the security descriptor of the listener. When you call this function to create a new listener, the function assigns the default security descriptor to the new listener. To modify the security descriptor, call the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtssetlistenersecuritya">WTSSetListenerSecurity</a> function. For more information about security descriptors, see  <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a>.
     * 
     * This function does not validate the settings for the new listener. Be sure that the settings are valid before calling this function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSCreateListener as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} pReserved This parameter is reserved. Always set this parameter to <b>NULL</b>.
     * @param {Integer} Reserved This parameter is reserved. Always set this parameter to zero.
     * @param {Pointer<Byte>} pListenerName A pointer to a null-terminated string that contains the name of the listener to create or configure.
     * @param {Pointer<WTSLISTENERCONFIGA>} pBuffer A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtslistenerconfiga">WTSLISTENERCONFIG</a> structure that contains configuration information for the listener.
     * @param {Integer} flag 
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtscreatelistenera
     * @since windows6.1
     */
    static WTSCreateListenerA(pReserved, Reserved, pListenerName, pBuffer, flag) {
        static hServer := 0 ;Reserved parameters must always be NULL

        pListenerName := pListenerName is String? StrPtr(pListenerName) : pListenerName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSCreateListenerA", "ptr", hServer, "ptr", pReserved, "uint", Reserved, "ptr", pListenerName, "ptr", pBuffer, "uint", flag, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Configures the security descriptor of a Remote Desktop Services listener. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSSetListenerSecurity as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} pReserved This parameter is reserved. Always set this parameter to <b>NULL</b>.
     * @param {Integer} Reserved This parameter is reserved. Always set this parameter to zero.
     * @param {Pointer<Char>} pListenerName A pointer to a null-terminated string that contains the name of the listener.
     * @param {Integer} SecurityInformation A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that specifies the security information  to set. Always enable the  <b>DACL_SECURITY_INFORMATION</b> and <b>SACL_SECURITY_INFORMATION</b> flags.
     * 
     * For more information about possible values, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a>.
     * @param {Pointer<Void>} pSecurityDescriptor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the security information associated with the listener. For more information about possible values, see <b>SECURITY_DESCRIPTOR</b>. For information about <b>STANDARD_RIGHTS_REQUIRED</b>, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">Standard Access Rights</a>.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtssetlistenersecurityw
     * @since windows6.1
     */
    static WTSSetListenerSecurityW(pReserved, Reserved, pListenerName, SecurityInformation, pSecurityDescriptor) {
        static hServer := 0 ;Reserved parameters must always be NULL

        pListenerName := pListenerName is String? StrPtr(pListenerName) : pListenerName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSSetListenerSecurityW", "ptr", hServer, "ptr", pReserved, "uint", Reserved, "ptr", pListenerName, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Configures the security descriptor of a Remote Desktop Services listener. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSSetListenerSecurity as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} pReserved This parameter is reserved. Always set this parameter to <b>NULL</b>.
     * @param {Integer} Reserved This parameter is reserved. Always set this parameter to zero.
     * @param {Pointer<Byte>} pListenerName A pointer to a null-terminated string that contains the name of the listener.
     * @param {Integer} SecurityInformation A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that specifies the security information  to set. Always enable the  <b>DACL_SECURITY_INFORMATION</b> and <b>SACL_SECURITY_INFORMATION</b> flags.
     * 
     * For more information about possible values, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a>.
     * @param {Pointer<Void>} pSecurityDescriptor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the security information associated with the listener. For more information about possible values, see <b>SECURITY_DESCRIPTOR</b>. For information about <b>STANDARD_RIGHTS_REQUIRED</b>, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">Standard Access Rights</a>.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtssetlistenersecuritya
     * @since windows6.1
     */
    static WTSSetListenerSecurityA(pReserved, Reserved, pListenerName, SecurityInformation, pSecurityDescriptor) {
        static hServer := 0 ;Reserved parameters must always be NULL

        pListenerName := pListenerName is String? StrPtr(pListenerName) : pListenerName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSSetListenerSecurityA", "ptr", hServer, "ptr", pReserved, "uint", Reserved, "ptr", pListenerName, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the security descriptor of a Remote Desktop Services listener. (Unicode)
     * @remarks
     * If the number of bytes needed for the buffer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure is unknown, you can call this method with <i>nLength</i> set to zero. The method will then return, in the <i>lpnLengthNeeded</i> parameter, the number of bytes required for the buffer. Allocate the buffer based on this number, and then call the method again, setting <i>pSecurityDescriptor</i> to the newly allocated buffer and <i>nLength</i> to the number returned by the first call.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSGetListenerSecurity as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} pReserved This parameter is reserved. Always set this parameter to <b>NULL</b>.
     * @param {Integer} Reserved This parameter is reserved. Always set this parameter to zero.
     * @param {Pointer<Char>} pListenerName A pointer to a null-terminated string that contains the name of the listener.
     * @param {Integer} SecurityInformation A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that specifies the security information  to retrieve. Always enable the  <b>DACL_SECURITY_INFORMATION</b> and <b>SACL_SECURITY_INFORMATION</b> flags.
     * 
     * For more information about possible values, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a>.
     * @param {Pointer<Void>} pSecurityDescriptor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that receives the security information associated with  the listener referenced by the <i>pListenerName</i> parameter. The <b>SECURITY_DESCRIPTOR</b> structure is returned in self-relative format. For more information about possible values, see <b>SECURITY_DESCRIPTOR</b>.
     * @param {Integer} nLength The size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure referenced by the <i>pSecurityDescriptor</i> parameter.
     * @param {Pointer<UInt32>} lpnLengthNeeded A pointer to a variable that receives the number of bytes required to store the complete security descriptor. If this number is less than or equal to the value of the <i>nLength</i> parameter, the security descriptor is copied to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure referenced by the <i>pSecurityDescriptor</i> parameter; otherwise, no action is taken.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsgetlistenersecurityw
     * @since windows6.1
     */
    static WTSGetListenerSecurityW(pReserved, Reserved, pListenerName, SecurityInformation, pSecurityDescriptor, nLength, lpnLengthNeeded) {
        static hServer := 0 ;Reserved parameters must always be NULL

        pListenerName := pListenerName is String? StrPtr(pListenerName) : pListenerName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSGetListenerSecurityW", "ptr", hServer, "ptr", pReserved, "uint", Reserved, "ptr", pListenerName, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "uint", nLength, "uint*", lpnLengthNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the security descriptor of a Remote Desktop Services listener. (ANSI)
     * @remarks
     * If the number of bytes needed for the buffer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure is unknown, you can call this method with <i>nLength</i> set to zero. The method will then return, in the <i>lpnLengthNeeded</i> parameter, the number of bytes required for the buffer. Allocate the buffer based on this number, and then call the method again, setting <i>pSecurityDescriptor</i> to the newly allocated buffer and <i>nLength</i> to the number returned by the first call.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wtsapi32.h header defines WTSGetListenerSecurity as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} pReserved This parameter is reserved. Always set this parameter to <b>NULL</b>.
     * @param {Integer} Reserved This parameter is reserved. Always set this parameter to zero.
     * @param {Pointer<Byte>} pListenerName A pointer to a null-terminated string that contains the name of the listener.
     * @param {Integer} SecurityInformation A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that specifies the security information  to retrieve. Always enable the  <b>DACL_SECURITY_INFORMATION</b> and <b>SACL_SECURITY_INFORMATION</b> flags.
     * 
     * For more information about possible values, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a>.
     * @param {Pointer<Void>} pSecurityDescriptor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that receives the security information associated with  the listener referenced by the <i>pListenerName</i> parameter. The <b>SECURITY_DESCRIPTOR</b> structure is returned in self-relative format. For more information about possible values, see <b>SECURITY_DESCRIPTOR</b>.
     * @param {Integer} nLength The size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure referenced by the <i>pSecurityDescriptor</i> parameter.
     * @param {Pointer<UInt32>} lpnLengthNeeded A pointer to a variable that receives the number of bytes required to store the complete security descriptor. If this number is less than or equal to the value of the <i>nLength</i> parameter, the security descriptor is copied to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure referenced by the <i>pSecurityDescriptor</i> parameter; otherwise, no action is taken.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsgetlistenersecuritya
     * @since windows6.1
     */
    static WTSGetListenerSecurityA(pReserved, Reserved, pListenerName, SecurityInformation, pSecurityDescriptor, nLength, lpnLengthNeeded) {
        static hServer := 0 ;Reserved parameters must always be NULL

        pListenerName := pListenerName is String? StrPtr(pListenerName) : pListenerName

        A_LastError := 0

        result := DllCall("WTSAPI32.dll\WTSGetListenerSecurityA", "ptr", hServer, "ptr", pReserved, "uint", Reserved, "ptr", pListenerName, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "uint", nLength, "uint*", lpnLengthNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables or disables Child Sessions.
     * @remarks
     * For more information about child sessions, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/child-sessions">Child Sessions</a>.
     * @param {Integer} bEnable Indicates whether to enable or disable child sessions. Pass <b>TRUE</b> if child sessions are to be enabled or <b>FALSE</b> otherwise.
     * @returns {Integer} Returns nonzero if the function succeeds or zero otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsenablechildsessions
     * @since windows8.0
     */
    static WTSEnableChildSessions(bEnable) {
        result := DllCall("WTSAPI32.dll\WTSEnableChildSessions", "int", bEnable, "int")
        return result
    }

    /**
     * Determines whether child sessions are enabled.
     * @remarks
     * For more information about child sessions, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/child-sessions">Child Sessions</a>.
     * @param {Pointer<Int32>} pbEnabled The address of a <b>BOOL</b> variable that receives a nonzero value if child sessions are enabled or zero otherwise.
     * @returns {Integer} Returns nonzero if the function succeeds or zero otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsischildsessionsenabled
     * @since windows8.0
     */
    static WTSIsChildSessionsEnabled(pbEnabled) {
        result := DllCall("WTSAPI32.dll\WTSIsChildSessionsEnabled", "int*", pbEnabled, "int")
        return result
    }

    /**
     * Retrieves the child session identifier, if present.
     * @remarks
     * For more information about child sessions, see <a href="https://docs.microsoft.com/windows/desktop/TermServ/child-sessions">Child Sessions</a>.
     * @param {Pointer<UInt32>} pSessionId The address of a <b>ULONG</b> variable that receives the child session identifier. This will be (<b>ULONG</b>)–1 if there is no child session for the current session.
     * @returns {Integer} Returns nonzero if the function succeeds or zero otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/nf-wtsapi32-wtsgetchildsessionid
     * @since windows8.0
     */
    static WTSGetChildSessionId(pSessionId) {
        result := DllCall("WTSAPI32.dll\WTSGetChildSessionId", "uint*", pSessionId, "int")
        return result
    }

    /**
     * Used by an application that is displaying content that can be optimized for displaying in a remote session to identify the region of a window that is the actual content.
     * @param {Pointer<UInt64>} pRenderHintID The address of a value that identifies the rendering hint affected by this call. If a new hint is being 
     *       created, this value must contain zero. This function will return a unique rendering hint identifier which is 
     *       used for subsequent calls, such as clearing the hint.
     * @param {Pointer<Void>} hwndOwner The handle of window linked to lifetime of the rendering hint. This window is used in situations where a 
     *       hint target is removed without the hint being explicitly cleared.
     * @param {Integer} renderHintType Specifies the type of hint represented by this call.
     * @param {Integer} cbHintDataLength The size, in <b>BYTE</b>s, of the <i>pHintData</i> buffer.
     * @param {Pointer} pHintData Additional data for the hint.
     * 
     * The format of this data is dependent upon the value passed in the <i>renderHintType</i> 
     *        parameter.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wtshintapi/nf-wtshintapi-wtssetrenderhint
     * @since windows8.0
     */
    static WTSSetRenderHint(pRenderHintID, hwndOwner, renderHintType, cbHintDataLength, pHintData) {
        result := DllCall("WTSAPI32.dll\WTSSetRenderHint", "uint*", pRenderHintID, "ptr", hwndOwner, "uint", renderHintType, "uint", cbHintDataLength, "ptr", pHintData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the Remote Desktop Services session associated with a specified process.
     * @remarks
     * Callers must hold the <b>PROCESS_QUERY_INFORMATION</b> access right for the specified 
     *     process. For more information, see 
     *   <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * @param {Integer} dwProcessId Specifies a process identifier. Use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocessid">GetCurrentProcessId</a> function to retrieve the 
     *       process identifier for the current process.
     * @param {Pointer<UInt32>} pSessionId Pointer to a variable that receives the identifier of the Remote Desktop Services session under which the 
     *       specified process is running. To retrieve the identifier of the session currently attached to the console, use 
     *   the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-wtsgetactiveconsolesessionid">WTSGetActiveConsoleSessionId</a> 
     *   function.
     * @returns {Integer} If the function succeeds, the return value is a nonzero value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-processidtosessionid
     * @since windows6.0.6000
     */
    static ProcessIdToSessionId(dwProcessId, pSessionId) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ProcessIdToSessionId", "uint", dwProcessId, "uint*", pSessionId, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the session identifier of the console session.
     * @remarks
     * The session identifier returned by this function is the identifier of the current physical console session. To monitor 
     *     the state of the current physical console session, use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsregistersessionnotification">WTSRegisterSessionNotification</a> 
     *     function.
     * @returns {Integer} The session identifier of the session that is attached to the physical console. If there is no session attached to the 
     *        physical console, (for example, if the physical console session is in the process of being attached or detached), this function 
     *        returns 0xFFFFFFFF.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-wtsgetactiveconsolesessionid
     * @since windows6.0.6000
     */
    static WTSGetActiveConsoleSessionId() {
        result := DllCall("KERNEL32.dll\WTSGetActiveConsoleSessionId", "uint")
        return result
    }

;@endregion Methods
}
