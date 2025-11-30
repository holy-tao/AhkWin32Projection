#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class BEHAVIOR_LAYOUT_INFO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORLAYOUTINFO_FULLDELEGATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORLAYOUTINFO_MODIFYNATURAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIORLAYOUTINFO_MAPSIZE => 4

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_LAYOUT_INFO_Max => 2147483647
}
