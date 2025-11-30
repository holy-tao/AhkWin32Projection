#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class SCRIPT_INVOCATION_CONTEXT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SICT_Event => 0

    /**
     * @type {Integer (Int32)}
     */
    static SICT_SetTimeout => 1

    /**
     * @type {Integer (Int32)}
     */
    static SICT_SetInterval => 2

    /**
     * @type {Integer (Int32)}
     */
    static SICT_SetImmediate => 3

    /**
     * @type {Integer (Int32)}
     */
    static SICT_RequestAnimationFrame => 4

    /**
     * @type {Integer (Int32)}
     */
    static SICT_ToString => 5

    /**
     * @type {Integer (Int32)}
     */
    static SICT_MutationObserverCheckpoint => 6

    /**
     * @type {Integer (Int32)}
     */
    static SICT_WWAExecUnsafeLocalFunction => 7

    /**
     * @type {Integer (Int32)}
     */
    static SICT_WWAExecAtPriority => 8
}
