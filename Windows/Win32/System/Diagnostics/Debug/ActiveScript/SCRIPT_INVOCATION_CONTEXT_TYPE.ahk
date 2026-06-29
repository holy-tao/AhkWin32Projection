#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct SCRIPT_INVOCATION_CONTEXT_TYPE {
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
    static SICT_Event => 0

    /**
     * @type {Integer (Int32)}
     */
    static SICT_SetTimeout => 1

    /**
     * @type {Integer (Int32)}
     */
    static SICT_SetInterval => 2

    /**
     * @type {Integer (Int32)}
     */
    static SICT_SetImmediate => 3

    /**
     * @type {Integer (Int32)}
     */
    static SICT_RequestAnimationFrame => 4

    /**
     * @type {Integer (Int32)}
     */
    static SICT_ToString => 5

    /**
     * @type {Integer (Int32)}
     */
    static SICT_MutationObserverCheckpoint => 6

    /**
     * @type {Integer (Int32)}
     */
    static SICT_WWAExecUnsafeLocalFunction => 7

    /**
     * @type {Integer (Int32)}
     */
    static SICT_WWAExecAtPriority => 8
}
