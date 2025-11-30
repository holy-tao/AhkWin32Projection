#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class DOM_EVENT_PHASE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DEP_CAPTURING_PHASE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEP_AT_TARGET => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEP_BUBBLING_PHASE => 3

    /**
     * @type {Integer (Int32)}
     */
    static DOM_EVENT_PHASE_Max => 2147483647
}
