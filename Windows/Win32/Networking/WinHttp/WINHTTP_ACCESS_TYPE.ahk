#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
class WINHTTP_ACCESS_TYPE extends Win32Enum {

    /**
     * Native name: WINHTTP_ACCESS_TYPE_NO_PROXY
     * @type {Integer (UInt32)}
     */
    static NO_PROXY => 1

    /**
     * Native name: WINHTTP_ACCESS_TYPE_DEFAULT_PROXY
     * @type {Integer (UInt32)}
     */
    static DEFAULT_PROXY => 0

    /**
     * Native name: WINHTTP_ACCESS_TYPE_NAMED_PROXY
     * @type {Integer (UInt32)}
     */
    static NAMED_PROXY => 3

    /**
     * Native name: WINHTTP_ACCESS_TYPE_AUTOMATIC_PROXY
     * @type {Integer (UInt32)}
     */
    static AUTOMATIC_PROXY => 4
}
