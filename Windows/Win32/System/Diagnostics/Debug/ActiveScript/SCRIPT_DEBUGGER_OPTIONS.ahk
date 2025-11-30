#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class SCRIPT_DEBUGGER_OPTIONS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static SDO_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SDO_ENABLE_FIRST_CHANCE_EXCEPTIONS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SDO_ENABLE_WEB_WORKER_SUPPORT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SDO_ENABLE_NONUSER_CODE_SUPPORT => 4

    /**
     * @type {Integer (Int32)}
     */
    static SDO_ENABLE_LIBRARY_STACK_FRAME => 8
}
