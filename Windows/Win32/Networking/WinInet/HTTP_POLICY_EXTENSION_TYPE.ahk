#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class HTTP_POLICY_EXTENSION_TYPE extends Win32Enum {

    /**
     * Native name: POLICY_EXTENSION_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: POLICY_EXTENSION_TYPE_WINHTTP
     * @type {Integer (Int32)}
     */
    static WINHTTP => 1

    /**
     * Native name: POLICY_EXTENSION_TYPE_WININET
     * @type {Integer (Int32)}
     */
    static WININET => 2
}
