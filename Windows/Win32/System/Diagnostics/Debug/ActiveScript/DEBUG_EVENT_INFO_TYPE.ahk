#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct DEBUG_EVENT_INFO_TYPE {
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
    static DEIT_GENERAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEIT_ASMJS_IN_DEBUGGING => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEIT_ASMJS_SUCCEEDED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEIT_ASMJS_FAILED => 3
}
