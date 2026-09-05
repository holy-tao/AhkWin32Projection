#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class ScriptDebugEvent extends Win32Enum {

    /**
     * Native name: ScriptDebugBreakpoint
     * @type {Integer (Int32)}
     */
    static Breakpoint => 0

    /**
     * Native name: ScriptDebugStep
     * @type {Integer (Int32)}
     */
    static Step => 1

    /**
     * Native name: ScriptDebugException
     * @type {Integer (Int32)}
     */
    static Exception => 2

    /**
     * Native name: ScriptDebugAsyncBreak
     * @type {Integer (Int32)}
     */
    static AsyncBreak => 3
}
