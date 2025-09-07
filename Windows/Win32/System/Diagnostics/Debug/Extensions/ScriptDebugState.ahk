#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class ScriptDebugState{

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
