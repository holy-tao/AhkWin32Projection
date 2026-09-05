#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class VALIDATEUNC_OPTION extends Win32BitflagEnum {

    /**
     * Native name: VALIDATEUNC_CONNECT
     * @type {Integer (Int32)}
     */
    static CONNECT => 1

    /**
     * Native name: VALIDATEUNC_NOUI
     * @type {Integer (Int32)}
     */
    static NOUI => 2

    /**
     * Native name: VALIDATEUNC_PRINT
     * @type {Integer (Int32)}
     */
    static PRINT => 4

    /**
     * Native name: VALIDATEUNC_PERSIST
     * @type {Integer (Int32)}
     */
    static PERSIST => 8

    /**
     * Native name: VALIDATEUNC_VALID
     * @type {Integer (Int32)}
     */
    static VALID => 15
}
