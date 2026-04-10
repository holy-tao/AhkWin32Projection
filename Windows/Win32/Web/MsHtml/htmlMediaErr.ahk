#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlMediaErr extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaErrAborted => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaErrNetwork => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaErrDecode => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaErrSrcNotSupported => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlMediaErr_Max => 2147483647
}
