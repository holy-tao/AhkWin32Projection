#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_LOGOTYPE_IMAGE_INFO_TYPE {
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
    static CERT_LOGOTYPE_GRAY_SCALE_IMAGE_INFO_CHOICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_LOGOTYPE_COLOR_IMAGE_INFO_CHOICE => 2
}
