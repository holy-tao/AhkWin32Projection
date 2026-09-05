#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IGP_ID extends Win32Enum {

    /**
     * Native name: IGP_GETIMEVERSION
     * @type {Integer (UInt32)}
     */
    static GETIMEVERSION => 4294967292

    /**
     * Native name: IGP_PROPERTY
     * @type {Integer (UInt32)}
     */
    static PROPERTY => 4

    /**
     * Native name: IGP_CONVERSION
     * @type {Integer (UInt32)}
     */
    static CONVERSION => 8

    /**
     * Native name: IGP_SENTENCE
     * @type {Integer (UInt32)}
     */
    static SENTENCE => 12

    /**
     * Native name: IGP_UI
     * @type {Integer (UInt32)}
     */
    static UI => 16

    /**
     * Native name: IGP_SETCOMPSTR
     * @type {Integer (UInt32)}
     */
    static SETCOMPSTR => 20

    /**
     * Native name: IGP_SELECT
     * @type {Integer (UInt32)}
     */
    static SELECT => 24
}
