#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class ScriptDebugState extends Win32Enum {

    /**
     * Native name: ScriptDebugNoDebugger
     * @type {Integer (Int32)}
     */
    static NoDebugger => 0

    /**
     * Native name: ScriptDebugNotExecuting
     * @type {Integer (Int32)}
     */
    static NotExecuting => 1

    /**
     * Native name: ScriptDebugExecuting
     * @type {Integer (Int32)}
     */
    static Executing => 2

    /**
     * Native name: ScriptDebugBreak
     * @type {Integer (Int32)}
     */
    static Break => 3
}
