#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlMediaErr extends Win32Enum {

    /**
     * Native name: htmlMediaErrAborted
     * @type {Integer (Int32)}
     */
    static Aborted => 0

    /**
     * Native name: htmlMediaErrNetwork
     * @type {Integer (Int32)}
     */
    static Network => 1

    /**
     * Native name: htmlMediaErrDecode
     * @type {Integer (Int32)}
     */
    static Decode => 2

    /**
     * Native name: htmlMediaErrSrcNotSupported
     * @type {Integer (Int32)}
     */
    static SrcNotSupported => 3

    /**
     * Native name: htmlMediaErr_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
