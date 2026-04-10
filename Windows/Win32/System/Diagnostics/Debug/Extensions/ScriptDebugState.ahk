#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class ScriptDebugState extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ScriptDebugNoDebugger => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScriptDebugNotExecuting => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScriptDebugExecuting => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScriptDebugBreak => 3
}
