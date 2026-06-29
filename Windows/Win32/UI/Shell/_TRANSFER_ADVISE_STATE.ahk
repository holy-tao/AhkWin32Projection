#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct _TRANSFER_ADVISE_STATE {
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
    static TS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TS_PERFORMING => 1

    /**
     * @type {Integer (Int32)}
     */
    static TS_PREPARING => 2

    /**
     * @type {Integer (Int32)}
     */
    static TS_INDETERMINATE => 4
}
