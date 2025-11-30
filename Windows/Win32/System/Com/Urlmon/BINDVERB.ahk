#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class BINDVERB extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BINDVERB_GET => 0

    /**
     * @type {Integer (Int32)}
     */
    static BINDVERB_POST => 1

    /**
     * @type {Integer (Int32)}
     */
    static BINDVERB_PUT => 2

    /**
     * @type {Integer (Int32)}
     */
    static BINDVERB_CUSTOM => 3

    /**
     * @type {Integer (Int32)}
     */
    static BINDVERB_RESERVED1 => 4
}
