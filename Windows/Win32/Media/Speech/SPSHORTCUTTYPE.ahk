#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPSHORTCUTTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPSHT_NotOverriden => -1

    /**
     * @type {Integer (Int32)}
     */
    static SPSHT_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPSHT_EMAIL => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SPSHT_OTHER => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_RESERVED1 => 12288

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_RESERVED2 => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_RESERVED3 => 20480

    /**
     * @type {Integer (Int32)}
     */
    static SPPS_RESERVED4 => 61440
}
