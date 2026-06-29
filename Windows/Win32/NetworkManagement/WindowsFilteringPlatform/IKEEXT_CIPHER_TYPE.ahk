#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of encryption algorithm used for encrypting the Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) messages.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_cipher_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CIPHER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies DES encryption.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CIPHER_DES => 0

    /**
     * Specifies 3DES encryption.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CIPHER_3DES => 1

    /**
     * Specifies AES-128 encryption.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CIPHER_AES_128 => 2

    /**
     * Specifies AES-192 encryption.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CIPHER_AES_192 => 3

    /**
     * Specifies AES-256 encryption.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CIPHER_AES_256 => 4

    /**
     * @type {Integer (Int32)}
     */
    static IKEEXT_CIPHER_AES_GCM_128_16ICV => 5

    /**
     * @type {Integer (Int32)}
     */
    static IKEEXT_CIPHER_AES_GCM_256_16ICV => 6

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CIPHER_TYPE_MAX => 7
}
