#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class SECUREURLHOSTVALIDATE_FLAGS extends Win32Enum{

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
     * @type {Integer (Int32)}
     */
    static SECUREURLHOSTVALIDATE_FLAGS_Max => 2147483647
}
