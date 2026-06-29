#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct XEKL_KEYSIZE {
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
    static XEKL_KEYSIZE_MIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static XEKL_KEYSIZE_MAX => 2

    /**
     * @type {Integer (Int32)}
     */
    static XEKL_KEYSIZE_INC => 3
}
