#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_LOGOTYPE_CHOICE {
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
    static CERT_LOGOTYPE_NO_IMAGE_RESOLUTION_CHOICE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_LOGOTYPE_BITS_IMAGE_RESOLUTION_CHOICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_LOGOTYPE_TABLE_SIZE_IMAGE_RESOLUTION_CHOICE => 2
}
