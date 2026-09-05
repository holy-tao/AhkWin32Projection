#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class APPLICATION_NODE_EVENT_FILTER extends Win32Enum {

    /**
     * Native name: FILTER_EXCLUDE_NOTHING
     * @type {Integer (Int32)}
     */
    static EXCLUDE_NOTHING => 0

    /**
     * Native name: FILTER_EXCLUDE_ANONYMOUS_CODE
     * @type {Integer (Int32)}
     */
    static EXCLUDE_ANONYMOUS_CODE => 1

    /**
     * Native name: FILTER_EXCLUDE_EVAL_CODE
     * @type {Integer (Int32)}
     */
    static EXCLUDE_EVAL_CODE => 2
}
