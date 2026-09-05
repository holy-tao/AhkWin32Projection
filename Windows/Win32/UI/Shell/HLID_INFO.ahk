#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class HLID_INFO extends Win32Enum {

    /**
     * Native name: HLID_INVALID
     * @type {Integer (UInt32)}
     */
    static INVALID => 0

    /**
     * Native name: HLID_PREVIOUS
     * @type {Integer (UInt32)}
     */
    static PREVIOUS => 4294967295

    /**
     * Native name: HLID_NEXT
     * @type {Integer (UInt32)}
     */
    static NEXT => 4294967294

    /**
     * Native name: HLID_CURRENT
     * @type {Integer (UInt32)}
     */
    static CURRENT => 4294967293

    /**
     * Native name: HLID_STACKBOTTOM
     * @type {Integer (UInt32)}
     */
    static STACKBOTTOM => 4294967292

    /**
     * Native name: HLID_STACKTOP
     * @type {Integer (UInt32)}
     */
    static STACKTOP => 4294967291
}
