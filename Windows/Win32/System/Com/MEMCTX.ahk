#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class MEMCTX extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MEMCTX_TASK => 1

    /**
     * @type {Integer (Int32)}
     */
    static MEMCTX_SHARED => 2

    /**
     * @type {Integer (Int32)}
     */
    static MEMCTX_MACSYSTEM => 3

    /**
     * @type {Integer (Int32)}
     */
    static MEMCTX_UNKNOWN => -1

    /**
     * @type {Integer (Int32)}
     */
    static MEMCTX_SAME => -2
}
