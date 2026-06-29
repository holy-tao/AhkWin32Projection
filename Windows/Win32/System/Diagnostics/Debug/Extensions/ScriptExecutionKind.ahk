#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct ScriptExecutionKind {
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
    static ScriptExecutionNormal => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScriptExecutionStepIn => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScriptExecutionStepOut => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScriptExecutionStepOver => 3
}
