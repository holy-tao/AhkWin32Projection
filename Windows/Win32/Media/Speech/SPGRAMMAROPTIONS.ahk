#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPGRAMMAROPTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_SAPI => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_SRGS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_UPS => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_SRGS_MS_SCRIPT => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_SRGS_W3C_SCRIPT => 256

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_SRGS_STG_SCRIPT => 512

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_SRGS_SCRIPT => 778

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_FILE => 16

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_HTTP => 32

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_RES => 64

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_OBJECT => 128

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_DEFAULT => 1019

    /**
     * @type {Integer (Int32)}
     */
    static SPGO_ALL => 1023
}
