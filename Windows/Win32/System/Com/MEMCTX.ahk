#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class MEMCTX extends Win32Enum {

    /**
     * Native name: MEMCTX_TASK
     * @type {Integer (Int32)}
     */
    static TASK => 1

    /**
     * Native name: MEMCTX_SHARED
     * @type {Integer (Int32)}
     */
    static SHARED => 2

    /**
     * Native name: MEMCTX_MACSYSTEM
     * @type {Integer (Int32)}
     */
    static MACSYSTEM => 3

    /**
     * Native name: MEMCTX_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => -1

    /**
     * Native name: MEMCTX_SAME
     * @type {Integer (Int32)}
     */
    static SAME => -2
}
