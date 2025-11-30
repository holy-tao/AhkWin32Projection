#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class DEBUG_EVENT_INFO_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DEIT_GENERAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEIT_ASMJS_IN_DEBUGGING => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEIT_ASMJS_SUCCEEDED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEIT_ASMJS_FAILED => 3
}
