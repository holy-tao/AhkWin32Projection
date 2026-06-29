#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct TBPFLAG {
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
    static TBPF_NOPROGRESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static TBPF_INDETERMINATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static TBPF_NORMAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static TBPF_ERROR => 4

    /**
     * @type {Integer (Int32)}
     */
    static TBPF_PAUSED => 8
}
