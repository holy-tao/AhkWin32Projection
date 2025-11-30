#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PDH_FMT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_FMT_DOUBLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_FMT_LARGE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_FMT_LONG => 256
}
