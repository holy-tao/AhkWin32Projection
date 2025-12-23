#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TASKDIALOG_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static TDF_ENABLE_HYPERLINKS => 1

    /**
     * @type {Integer (Int32)}
     */
    static TDF_USE_HICON_MAIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static TDF_USE_HICON_FOOTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static TDF_ALLOW_DIALOG_CANCELLATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static TDF_USE_COMMAND_LINKS => 16

    /**
     * @type {Integer (Int32)}
     */
    static TDF_USE_COMMAND_LINKS_NO_ICON => 32

    /**
     * @type {Integer (Int32)}
     */
    static TDF_EXPAND_FOOTER_AREA => 64

    /**
     * @type {Integer (Int32)}
     */
    static TDF_EXPANDED_BY_DEFAULT => 128

    /**
     * @type {Integer (Int32)}
     */
    static TDF_VERIFICATION_FLAG_CHECKED => 256

    /**
     * @type {Integer (Int32)}
     */
    static TDF_SHOW_PROGRESS_BAR => 512

    /**
     * @type {Integer (Int32)}
     */
    static TDF_SHOW_MARQUEE_PROGRESS_BAR => 1024

    /**
     * @type {Integer (Int32)}
     */
    static TDF_CALLBACK_TIMER => 2048

    /**
     * @type {Integer (Int32)}
     */
    static TDF_POSITION_RELATIVE_TO_WINDOW => 4096

    /**
     * @type {Integer (Int32)}
     */
    static TDF_RTL_LAYOUT => 8192

    /**
     * @type {Integer (Int32)}
     */
    static TDF_NO_DEFAULT_RADIO_BUTTON => 16384

    /**
     * @type {Integer (Int32)}
     */
    static TDF_CAN_BE_MINIMIZED => 32768

    /**
     * @type {Integer (Int32)}
     */
    static TDF_NO_SET_FOREGROUND => 65536

    /**
     * @type {Integer (Int32)}
     */
    static TDF_SIZE_TO_CONTENT => 16777216
}
