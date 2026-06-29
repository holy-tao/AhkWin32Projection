#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_FILE {
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
    static WER_FILE_ANONYMOUS_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FILE_DELETE_WHEN_DONE => 1
}
