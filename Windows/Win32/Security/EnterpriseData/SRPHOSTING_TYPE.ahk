#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.EnterpriseData
 */
class SRPHOSTING_TYPE extends Win32Enum {

    /**
     * Native name: SRPHOSTING_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: SRPHOSTING_TYPE_WINHTTP
     * @type {Integer (Int32)}
     */
    static WINHTTP => 1

    /**
     * Native name: SRPHOSTING_TYPE_WININET
     * @type {Integer (Int32)}
     */
    static WININET => 2
}
