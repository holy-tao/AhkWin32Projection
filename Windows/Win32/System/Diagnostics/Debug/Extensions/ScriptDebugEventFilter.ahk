#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class ScriptDebugEventFilter extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ScriptDebugEventFilterEntry => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScriptDebugEventFilterException => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScriptDebugEventFilterUnhandledException => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScriptDebugEventFilterAbort => 3
}
