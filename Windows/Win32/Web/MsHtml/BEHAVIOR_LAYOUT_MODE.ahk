#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class BEHAVIOR_LAYOUT_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORLAYOUTMODE_NATURAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORLAYOUTMODE_MINWIDTH => 2

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORLAYOUTMODE_MAXWIDTH => 4

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORLAYOUTMODE_MEDIA_RESOLUTION => 16384

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORLAYOUTMODE_FINAL_PERCENT => 32768

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_LAYOUT_MODE_Max => 2147483647
}
