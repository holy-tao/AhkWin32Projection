#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class SECUREURLHOSTVALIDATE_FLAGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SUHV_PROMPTBEFORENO => 1

    /**
     * @type {Integer (Int32)}
     */
    static SUHV_SILENTYES => 2

    /**
     * @type {Integer (Int32)}
     */
    static SUHV_UNSECURESOURCE => 4

    /**
     * Native name: SECUREURLHOSTVALIDATE_FLAGS_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
