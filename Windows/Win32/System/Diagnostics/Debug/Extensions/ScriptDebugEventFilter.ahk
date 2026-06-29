#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct ScriptDebugEventFilter {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
