#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class ScriptDebugEvent extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ScriptDebugBreakpoint => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScriptDebugStep => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScriptDebugException => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScriptDebugAsyncBreak => 3
}
