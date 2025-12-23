#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class RPCOPT_PROPERTIES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COMBND_RPCTIMEOUT => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMBND_SERVER_LOCALITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMBND_RESERVED1 => 4

    /**
     * @type {Integer (Int32)}
     */
    static COMBND_RESERVED2 => 5

    /**
     * @type {Integer (Int32)}
     */
    static COMBND_RESERVED3 => 8

    /**
     * @type {Integer (Int32)}
     */
    static COMBND_RESERVED4 => 16
}
