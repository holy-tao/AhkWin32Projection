#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Registry
 */
class REG_SAVE_FORMAT extends Win32Enum {

    /**
     * Native name: REG_STANDARD_FORMAT
     * @type {Integer (UInt32)}
     */
    static STANDARD_FORMAT => 1

    /**
     * Native name: REG_LATEST_FORMAT
     * @type {Integer (UInt32)}
     */
    static LATEST_FORMAT => 2

    /**
     * Native name: REG_NO_COMPRESSION
     * @type {Integer (UInt32)}
     */
    static NO_COMPRESSION => 4
}
