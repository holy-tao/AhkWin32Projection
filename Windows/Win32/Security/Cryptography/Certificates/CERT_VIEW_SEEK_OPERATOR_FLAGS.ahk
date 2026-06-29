#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CERT_VIEW_SEEK_OPERATOR_FLAGS {
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
    static CVR_SEEK_EQ => 1

    /**
     * @type {Integer (Int32)}
     */
    static CVR_SEEK_LE => 4

    /**
     * @type {Integer (Int32)}
     */
    static CVR_SEEK_LT => 2

    /**
     * @type {Integer (Int32)}
     */
    static CVR_SEEK_GE => 8

    /**
     * @type {Integer (Int32)}
     */
    static CVR_SEEK_GT => 16
}
