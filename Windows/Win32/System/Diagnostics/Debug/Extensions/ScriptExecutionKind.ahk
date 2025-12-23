#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class ScriptExecutionKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ScriptExecutionNormal => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScriptExecutionStepIn => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScriptExecutionStepOut => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScriptExecutionStepOver => 3
}
