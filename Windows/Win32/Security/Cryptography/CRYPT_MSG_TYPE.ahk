#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_MSG_TYPE {
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
    static CMSG_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CMSG_SIGNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CMSG_ENVELOPED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CMSG_SIGNED_AND_ENVELOPED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CMSG_HASHED => 5
}
