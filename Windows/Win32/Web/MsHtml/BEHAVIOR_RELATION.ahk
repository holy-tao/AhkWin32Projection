#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class BEHAVIOR_RELATION extends Win32Enum {

    /**
     * Native name: BEHAVIOR_FIRSTRELATION
     * @type {Integer (Int32)}
     */
    static FIRSTRELATION => 0

    /**
     * Native name: BEHAVIOR_SAMEELEMENT
     * @type {Integer (Int32)}
     */
    static SAMEELEMENT => 0

    /**
     * Native name: BEHAVIOR_PARENT
     * @type {Integer (Int32)}
     */
    static PARENT => 1

    /**
     * Native name: BEHAVIOR_CHILD
     * @type {Integer (Int32)}
     */
    static CHILD => 2

    /**
     * Native name: BEHAVIOR_SIBLING
     * @type {Integer (Int32)}
     */
    static SIBLING => 3

    /**
     * Native name: BEHAVIOR_LASTRELATION
     * @type {Integer (Int32)}
     */
    static LASTRELATION => 3

    /**
     * Native name: BEHAVIOR_RELATION_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
