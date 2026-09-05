#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of encryption algorithm used for encrypting the Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) messages.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_cipher_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_CIPHER_TYPE extends Win32Enum {

    /**
     * Specifies DES encryption.
     * Native name: IKEEXT_CIPHER_DES
     * @type {Integer (Int32)}
     */
    static DES => 0

    /**
     * Specifies 3DES encryption.
     * Native name: IKEEXT_CIPHER_3DES
     * @type {Integer (Int32)}
     */
    static 3DES => 1

    /**
     * Specifies AES-128 encryption.
     * Native name: IKEEXT_CIPHER_AES_128
     * @type {Integer (Int32)}
     */
    static AES_128 => 2

    /**
     * Specifies AES-192 encryption.
     * Native name: IKEEXT_CIPHER_AES_192
     * @type {Integer (Int32)}
     */
    static AES_192 => 3

    /**
     * Specifies AES-256 encryption.
     * Native name: IKEEXT_CIPHER_AES_256
     * @type {Integer (Int32)}
     */
    static AES_256 => 4

    /**
     * Native name: IKEEXT_CIPHER_AES_GCM_128_16ICV
     * @type {Integer (Int32)}
     */
    static AES_GCM_128_16ICV => 5

    /**
     * Native name: IKEEXT_CIPHER_AES_GCM_256_16ICV
     * @type {Integer (Int32)}
     */
    static AES_GCM_256_16ICV => 6

    /**
     * Maximum value for testing purposes.
     * Native name: IKEEXT_CIPHER_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 7
}
