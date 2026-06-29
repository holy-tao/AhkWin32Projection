#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_GROUP_ID {
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
    static CRYPT_XML_GROUP_ID_HASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_GROUP_ID_SIGN => 2
}
