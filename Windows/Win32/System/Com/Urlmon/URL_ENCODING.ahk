#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class URL_ENCODING extends Win32Enum {

    /**
     * Native name: URL_ENCODING_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: URL_ENCODING_ENABLE_UTF8
     * @type {Integer (Int32)}
     */
    static ENABLE_UTF8 => 268435456

    /**
     * Native name: URL_ENCODING_DISABLE_UTF8
     * @type {Integer (Int32)}
     */
    static DISABLE_UTF8 => 536870912
}
