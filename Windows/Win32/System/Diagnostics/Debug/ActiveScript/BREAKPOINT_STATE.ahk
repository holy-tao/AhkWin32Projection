#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class BREAKPOINT_STATE extends Win32Enum {

    /**
     * Native name: BREAKPOINT_DELETED
     * @type {Integer (Int32)}
     */
    static DELETED => 0

    /**
     * Native name: BREAKPOINT_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 1

    /**
     * Native name: BREAKPOINT_ENABLED
     * @type {Integer (Int32)}
     */
    static ENABLED => 2
}
