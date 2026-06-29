#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct MIMECONTF {
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
    static MIMECONTF_MAILNEWS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_BROWSER => 2

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_MINIMAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_IMPORT => 8

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_SAVABLE_MAILNEWS => 256

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_SAVABLE_BROWSER => 512

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_EXPORT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_PRIVCONVERTER => 65536

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_VALID => 131072

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_VALID_NLS => 262144

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_MIME_IE4 => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_MIME_LATEST => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static MIMECONTF_MIME_REGISTRY => 1073741824
}
