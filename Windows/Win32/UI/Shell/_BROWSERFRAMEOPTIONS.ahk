#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_browserframeoptions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _BROWSERFRAMEOPTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BFO_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static BFO_BROWSER_PERSIST_SETTINGS => 1

    /**
     * @type {Integer (Int32)}
     */
    static BFO_RENAME_FOLDER_OPTIONS_TOINTERNET => 2

    /**
     * @type {Integer (Int32)}
     */
    static BFO_BOTH_OPTIONS => 4

    /**
     * @type {Integer (Int32)}
     */
    static BIF_PREFER_INTERNET_SHORTCUT => 8

    /**
     * @type {Integer (Int32)}
     */
    static BFO_BROWSE_NO_IN_NEW_PROCESS => 16

    /**
     * @type {Integer (Int32)}
     */
    static BFO_ENABLE_HYPERLINK_TRACKING => 32

    /**
     * @type {Integer (Int32)}
     */
    static BFO_USE_IE_OFFLINE_SUPPORT => 64

    /**
     * @type {Integer (Int32)}
     */
    static BFO_SUBSTITUE_INTERNET_START_PAGE => 128

    /**
     * @type {Integer (Int32)}
     */
    static BFO_USE_IE_LOGOBANDING => 256

    /**
     * @type {Integer (Int32)}
     */
    static BFO_ADD_IE_TOCAPTIONBAR => 512

    /**
     * @type {Integer (Int32)}
     */
    static BFO_USE_DIALUP_REF => 1024

    /**
     * @type {Integer (Int32)}
     */
    static BFO_USE_IE_TOOLBAR => 2048

    /**
     * @type {Integer (Int32)}
     */
    static BFO_NO_PARENT_FOLDER_SUPPORT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static BFO_NO_REOPEN_NEXT_RESTART => 8192

    /**
     * @type {Integer (Int32)}
     */
    static BFO_GO_HOME_PAGE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static BFO_PREFER_IEPROCESS => 32768

    /**
     * @type {Integer (Int32)}
     */
    static BFO_SHOW_NAVIGATION_CANCELLED => 65536

    /**
     * @type {Integer (Int32)}
     */
    static BFO_USE_IE_STATUSBAR => 131072

    /**
     * @type {Integer (Int32)}
     */
    static BFO_QUERY_ALL => -1
}
