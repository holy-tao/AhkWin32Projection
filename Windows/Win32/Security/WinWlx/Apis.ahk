#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class WinWlx {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_VERSION_1_0 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_VERSION_1_1 => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_VERSION_1_2 => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_VERSION_1_3 => 65539

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_VERSION_1_4 => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_CURRENT_VERSION => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_TYPE_TIMEOUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_TYPE_CTRL_ALT_DEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_TYPE_SCRNSVR_TIMEOUT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_TYPE_SCRNSVR_ACTIVITY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_TYPE_USER_LOGOFF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_TYPE_SC_INSERT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_TYPE_SC_REMOVE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_TYPE_AUTHENTICATED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_TYPE_SC_FIRST_READER_ARRIVED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_TYPE_SC_LAST_READER_REMOVED => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_TYPE_SWITCHUSER => 10

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_TYPE_MAX_MSFT_VALUE => 127

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_LOGON_OPT_NO_PROFILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_PROFILE_TYPE_V1_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_PROFILE_TYPE_V2_0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_LOGON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_NONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_LOCK_WKSTA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_LOGOFF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_PWD_CHANGED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_TASKLIST => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_UNLOCK_WKSTA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_FORCE_LOGOFF => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_SHUTDOWN_SLEEP => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_SHUTDOWN_SLEEP2 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_SHUTDOWN_HIBERNATE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_RECONNECTED => 15

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_DELAYED_FORCE_LOGOFF => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_SAS_ACTION_SWITCH_CONSOLE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_WM_SAS => 1625

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_DLG_SAS => 101

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_DLG_INPUT_TIMEOUT => 102

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_DLG_SCREEN_SAVER_TIMEOUT => 103

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_DLG_USER_LOGOFF => 104

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_DIRECTORY_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_CREDENTIAL_TYPE_V1_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_CREDENTIAL_TYPE_V2_0 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_CONSOLESWITCHCREDENTIAL_TYPE_V1_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STATUSMSG_OPTION_NOANIMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STATUSMSG_OPTION_SETFOREGROUND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_DESKTOP_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_DESKTOP_HANDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_CREATE_INSTANCE_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_CREATE_USER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_OPTION_USE_CTRL_ALT_DEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_OPTION_CONTEXT_POINTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_OPTION_USE_SMART_CARD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_OPTION_FORCE_LOGOFF_TIME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_OPTION_IGNORE_AUTO_LOGON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_OPTION_NO_SWITCH_ON_SAS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_OPTION_SMART_CARD_PRESENT => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_OPTION_SMART_CARD_INFO => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static WLX_OPTION_DISPATCH_TABLE_SIZE => 65539
;@endregion Constants

;@region Methods
;@endregion Methods
}
