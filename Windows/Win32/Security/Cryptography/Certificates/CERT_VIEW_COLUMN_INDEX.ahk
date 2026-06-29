#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CERT_VIEW_COLUMN_INDEX {
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
    static CV_COLUMN_LOG_DEFAULT => -2

    /**
     * @type {Integer (Int32)}
     */
    static CV_COLUMN_LOG_FAILED_DEFAULT => -3

    /**
     * @type {Integer (Int32)}
     */
    static CV_COLUMN_QUEUE_DEFAULT => -1
}
