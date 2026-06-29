#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TXF_LOG_RECORD_TYPE {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static TXF_LOG_RECORD_TYPE_AFFECTED_FILE => 4

    /**
     * @type {Integer (UInt16)}
     */
    static TXF_LOG_RECORD_TYPE_TRUNCATE => 2

    /**
     * @type {Integer (UInt16)}
     */
    static TXF_LOG_RECORD_TYPE_WRITE => 1
}
