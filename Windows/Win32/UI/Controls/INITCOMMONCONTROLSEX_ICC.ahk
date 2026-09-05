#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class INITCOMMONCONTROLSEX_ICC extends Win32BitflagEnum {

    /**
     * Native name: ICC_ANIMATE_CLASS
     * @type {Integer (UInt32)}
     */
    static ANIMATE_CLASS => 128

    /**
     * Native name: ICC_BAR_CLASSES
     * @type {Integer (UInt32)}
     */
    static BAR_CLASSES => 4

    /**
     * Native name: ICC_COOL_CLASSES
     * @type {Integer (UInt32)}
     */
    static COOL_CLASSES => 1024

    /**
     * Native name: ICC_DATE_CLASSES
     * @type {Integer (UInt32)}
     */
    static DATE_CLASSES => 256

    /**
     * Native name: ICC_HOTKEY_CLASS
     * @type {Integer (UInt32)}
     */
    static HOTKEY_CLASS => 64

    /**
     * Native name: ICC_INTERNET_CLASSES
     * @type {Integer (UInt32)}
     */
    static INTERNET_CLASSES => 2048

    /**
     * Native name: ICC_LINK_CLASS
     * @type {Integer (UInt32)}
     */
    static LINK_CLASS => 32768

    /**
     * Native name: ICC_LISTVIEW_CLASSES
     * @type {Integer (UInt32)}
     */
    static LISTVIEW_CLASSES => 1

    /**
     * Native name: ICC_NATIVEFNTCTL_CLASS
     * @type {Integer (UInt32)}
     */
    static NATIVEFNTCTL_CLASS => 8192

    /**
     * Native name: ICC_PAGESCROLLER_CLASS
     * @type {Integer (UInt32)}
     */
    static PAGESCROLLER_CLASS => 4096

    /**
     * Native name: ICC_PROGRESS_CLASS
     * @type {Integer (UInt32)}
     */
    static PROGRESS_CLASS => 32

    /**
     * Native name: ICC_STANDARD_CLASSES
     * @type {Integer (UInt32)}
     */
    static STANDARD_CLASSES => 16384

    /**
     * Native name: ICC_TAB_CLASSES
     * @type {Integer (UInt32)}
     */
    static TAB_CLASSES => 8

    /**
     * Native name: ICC_TREEVIEW_CLASSES
     * @type {Integer (UInt32)}
     */
    static TREEVIEW_CLASSES => 2

    /**
     * Native name: ICC_UPDOWN_CLASS
     * @type {Integer (UInt32)}
     */
    static UPDOWN_CLASS => 16

    /**
     * Native name: ICC_USEREX_CLASSES
     * @type {Integer (UInt32)}
     */
    static USEREX_CLASSES => 512

    /**
     * Native name: ICC_WIN95_CLASSES
     * @type {Integer (UInt32)}
     */
    static WIN95_CLASSES => 255
}
