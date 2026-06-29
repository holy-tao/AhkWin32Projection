#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHFMT_RET {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static SHFMT_ERROR => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static SHFMT_CANCEL => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static SHFMT_NOFORMAT => 4294967293
}
