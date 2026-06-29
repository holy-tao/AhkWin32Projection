#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_FLAGS {
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
    static CRYPT_XML_FLAG_DISABLE_EXTENSIONS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_FLAG_NO_SERIALIZE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_XML_SIGN_ADD_KEYVALUE => 1
}
