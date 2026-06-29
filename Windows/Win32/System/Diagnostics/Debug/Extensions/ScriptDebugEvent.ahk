#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct ScriptDebugEvent {
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
