#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class OSPRW extends Win32Enum {

    /**
     * Native name: OSPRW_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 1

    /**
     * Native name: OSPRW_READONLY
     * @type {Integer (Int32)}
     */
    static READONLY => 0

    /**
     * Native name: OSPRW_READWRITE
     * @type {Integer (Int32)}
     */
    static READWRITE => 1

    /**
     * Native name: OSPRW_MIXED
     * @type {Integer (Int32)}
     */
    static MIXED => 2
}
