#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class AUTHENTICATEF extends Win32Enum {

    /**
     * Native name: AUTHENTICATEF_PROXY
     * @type {Integer (Int32)}
     */
    static PROXY => 1

    /**
     * Native name: AUTHENTICATEF_BASIC
     * @type {Integer (Int32)}
     */
    static BASIC => 2

    /**
     * Native name: AUTHENTICATEF_HTTP
     * @type {Integer (Int32)}
     */
    static HTTP => 4
}
