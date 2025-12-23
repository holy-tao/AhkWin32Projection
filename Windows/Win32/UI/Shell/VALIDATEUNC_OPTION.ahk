#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class VALIDATEUNC_OPTION extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static VALIDATEUNC_CONNECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static VALIDATEUNC_NOUI => 2

    /**
     * @type {Integer (Int32)}
     */
    static VALIDATEUNC_PRINT => 4

    /**
     * @type {Integer (Int32)}
     */
    static VALIDATEUNC_PERSIST => 8

    /**
     * @type {Integer (Int32)}
     */
    static VALIDATEUNC_VALID => 15
}
