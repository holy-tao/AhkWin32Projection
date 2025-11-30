#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlApplyLocation extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlApplyLocationInside => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlApplyLocationOutside => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlApplyLocation_Max => 2147483647
}
