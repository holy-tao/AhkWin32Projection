#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleWebkitBoxDirection extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxDirectionNormal => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxDirectionReverse => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxDirectionNotSet => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleWebkitBoxDirection_Max => 2147483647
}
