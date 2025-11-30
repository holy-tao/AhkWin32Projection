#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class BEHAVIOR_EVENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOREVENT_FIRST => 0

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOREVENT_CONTENTREADY => 0

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOREVENT_DOCUMENTREADY => 1

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOREVENT_APPLYSTYLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOREVENT_DOCUMENTCONTEXTCHANGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOREVENT_CONTENTSAVE => 4

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOREVENT_LAST => 4

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_EVENT_Max => 2147483647
}
