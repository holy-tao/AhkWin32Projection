#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_STORE_SAVE_TO {
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
    static CERT_STORE_SAVE_TO_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_FILENAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_FILENAME_A => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_FILENAME_W => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_MEMORY => 2
}
