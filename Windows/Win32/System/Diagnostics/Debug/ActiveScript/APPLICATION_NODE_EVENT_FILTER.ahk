#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class APPLICATION_NODE_EVENT_FILTER extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_EXCLUDE_NOTHING => 0

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_EXCLUDE_ANONYMOUS_CODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_EXCLUDE_EVAL_CODE => 2
}
