#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_ROOT_PROGRAM_FLAGS {
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
    static CERT_ROOT_PROGRAM_FLAG_LSC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_ROOT_PROGRAM_FLAG_ORG => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_ROOT_PROGRAM_FLAG_SUBJECT_LOGO => 32
}
