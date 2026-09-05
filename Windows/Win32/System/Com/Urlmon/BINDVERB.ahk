#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class BINDVERB extends Win32Enum {

    /**
     * Native name: BINDVERB_GET
     * @type {Integer (Int32)}
     */
    static GET => 0

    /**
     * Native name: BINDVERB_POST
     * @type {Integer (Int32)}
     */
    static POST => 1

    /**
     * Native name: BINDVERB_PUT
     * @type {Integer (Int32)}
     */
    static PUT => 2

    /**
     * Native name: BINDVERB_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 3

    /**
     * Native name: BINDVERB_RESERVED1
     * @type {Integer (Int32)}
     */
    static RESERVED1 => 4
}
