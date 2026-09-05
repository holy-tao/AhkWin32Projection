#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class ScriptExecutionKind extends Win32Enum {

    /**
     * Native name: ScriptExecutionNormal
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Native name: ScriptExecutionStepIn
     * @type {Integer (Int32)}
     */
    static StepIn => 1

    /**
     * Native name: ScriptExecutionStepOut
     * @type {Integer (Int32)}
     */
    static StepOut => 2

    /**
     * Native name: ScriptExecutionStepOver
     * @type {Integer (Int32)}
     */
    static StepOver => 3
}
