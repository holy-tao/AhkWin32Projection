#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlApplyLocation extends Win32Enum {

    /**
     * Native name: htmlApplyLocationInside
     * @type {Integer (Int32)}
     */
    static Inside => 0

    /**
     * Native name: htmlApplyLocationOutside
     * @type {Integer (Int32)}
     */
    static Outside => 1

    /**
     * Native name: htmlApplyLocation_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
