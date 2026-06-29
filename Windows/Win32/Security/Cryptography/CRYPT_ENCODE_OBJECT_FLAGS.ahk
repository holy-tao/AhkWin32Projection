#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_ENCODE_OBJECT_FLAGS {
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
    static CRYPT_ENCODE_ALLOC_FLAG => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ENCODE_ENABLE_PUNYCODE_FLAG => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_UNICODE_NAME_ENCODE_DISABLE_CHECK_TYPE_FLAG => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_UNICODE_NAME_ENCODE_ENABLE_T61_UNICODE_FLAG => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_UNICODE_NAME_ENCODE_ENABLE_UTF8_UNICODE_FLAG => 536870912
}
