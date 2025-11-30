#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IGP_ID extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_GETIMEVERSION => 4294967292

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_PROPERTY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_CONVERSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_SENTENCE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_UI => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_SETCOMPSTR => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IGP_SELECT => 24
}
