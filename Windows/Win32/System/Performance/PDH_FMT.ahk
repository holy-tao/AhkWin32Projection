#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 */
class PDH_FMT extends Win32Enum {

    /**
     * Native name: PDH_FMT_DOUBLE
     * @type {Integer (UInt32)}
     */
    static DOUBLE => 512

    /**
     * Native name: PDH_FMT_LARGE
     * @type {Integer (UInt32)}
     */
    static LARGE => 1024

    /**
     * Native name: PDH_FMT_LONG
     * @type {Integer (UInt32)}
     */
    static LONG => 256
}
