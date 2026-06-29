#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct DEBUG_STACKFRAME_TYPE {
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
    static DST_SCRIPT_FRAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static DST_INTERNAL_FRAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static DST_INVOCATION_FRAME => 2
}
