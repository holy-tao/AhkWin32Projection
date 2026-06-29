#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct STGFMT {
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
    static STGFMT_STORAGE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STGFMT_NATIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STGFMT_FILE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STGFMT_ANY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STGFMT_DOCFILE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static STGFMT_DOCUMENT => 0
}
