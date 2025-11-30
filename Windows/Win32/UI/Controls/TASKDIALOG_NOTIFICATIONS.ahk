#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TASKDIALOG_NOTIFICATIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TDN_CREATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static TDN_NAVIGATED => 1

    /**
     * @type {Integer (Int32)}
     */
    static TDN_BUTTON_CLICKED => 2

    /**
     * @type {Integer (Int32)}
     */
    static TDN_HYPERLINK_CLICKED => 3

    /**
     * @type {Integer (Int32)}
     */
    static TDN_TIMER => 4

    /**
     * @type {Integer (Int32)}
     */
    static TDN_DESTROYED => 5

    /**
     * @type {Integer (Int32)}
     */
    static TDN_RADIO_BUTTON_CLICKED => 6

    /**
     * @type {Integer (Int32)}
     */
    static TDN_DIALOG_CONSTRUCTED => 7

    /**
     * @type {Integer (Int32)}
     */
    static TDN_VERIFICATION_CLICKED => 8

    /**
     * @type {Integer (Int32)}
     */
    static TDN_HELP => 9

    /**
     * @type {Integer (Int32)}
     */
    static TDN_EXPANDO_BUTTON_CLICKED => 10
}
