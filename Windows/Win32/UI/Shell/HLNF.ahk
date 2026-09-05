#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class HLNF extends Win32BitflagEnum {

    /**
     * Native name: HLNF_INTERNALJUMP
     * @type {Integer (UInt32)}
     */
    static INTERNALJUMP => 1

    /**
     * Native name: HLNF_OPENINNEWWINDOW
     * @type {Integer (UInt32)}
     */
    static OPENINNEWWINDOW => 2

    /**
     * Native name: HLNF_NAVIGATINGBACK
     * @type {Integer (UInt32)}
     */
    static NAVIGATINGBACK => 4

    /**
     * Native name: HLNF_NAVIGATINGFORWARD
     * @type {Integer (UInt32)}
     */
    static NAVIGATINGFORWARD => 8

    /**
     * Native name: HLNF_NAVIGATINGTOSTACKITEM
     * @type {Integer (UInt32)}
     */
    static NAVIGATINGTOSTACKITEM => 16

    /**
     * Native name: HLNF_CREATENOHISTORY
     * @type {Integer (UInt32)}
     */
    static CREATENOHISTORY => 32
}
