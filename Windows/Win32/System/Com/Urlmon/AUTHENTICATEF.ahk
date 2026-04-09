#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class AUTHENTICATEF extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static AUTHENTICATEF_PROXY => 1

    /**
     * @type {Integer (Int32)}
     */
    static AUTHENTICATEF_BASIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static AUTHENTICATEF_HTTP => 4
}
