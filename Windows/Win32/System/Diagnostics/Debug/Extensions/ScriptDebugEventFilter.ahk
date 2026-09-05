#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class ScriptDebugEventFilter extends Win32Enum {

    /**
     * Native name: ScriptDebugEventFilterEntry
     * @type {Integer (Int32)}
     */
    static Entry => 0

    /**
     * Native name: ScriptDebugEventFilterException
     * @type {Integer (Int32)}
     */
    static Exception => 1

    /**
     * Native name: ScriptDebugEventFilterUnhandledException
     * @type {Integer (Int32)}
     */
    static UnhandledException => 2

    /**
     * Native name: ScriptDebugEventFilterAbort
     * @type {Integer (Int32)}
     */
    static Abort => 3
}
