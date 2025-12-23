#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Registry
 * @version v4.0.30319
 */
class REG_SAVE_FORMAT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static REG_STANDARD_FORMAT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_LATEST_FORMAT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REG_NO_COMPRESSION => 4
}
