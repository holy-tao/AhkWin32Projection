#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class BEHAVIOR_RELATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_FIRSTRELATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_SAMEELEMENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_PARENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_CHILD => 2

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_SIBLING => 3

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_LASTRELATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_RELATION_Max => 2147483647
}
