#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class DEBUG_STACKFRAME_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DST_SCRIPT_FRAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static DST_INTERNAL_FRAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static DST_INVOCATION_FRAME => 2
}
