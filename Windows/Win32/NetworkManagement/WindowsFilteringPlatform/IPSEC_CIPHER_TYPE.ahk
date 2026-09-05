#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of encryption algorithm used in an IPsec SA for data privacy.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_cipher_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IPSEC_CIPHER_TYPE extends Win32Enum {

    /**
     * Specifies DES encryption.
     * Native name: IPSEC_CIPHER_TYPE_DES
     * @type {Integer (Int32)}
     */
    static DES => 1

    /**
     * Specifies 3DES encryption.
     * Native name: IPSEC_CIPHER_TYPE_3DES
     * @type {Integer (Int32)}
     */
    static 3DES => 2

    /**
     * Specifies AES-128 encryption.
     * Native name: IPSEC_CIPHER_TYPE_AES_128
     * @type {Integer (Int32)}
     */
    static AES_128 => 3

    /**
     * Specifies AES-192 encryption.
     * Native name: IPSEC_CIPHER_TYPE_AES_192
     * @type {Integer (Int32)}
     */
    static AES_192 => 4

    /**
     * Specifies AES-256 encryption.
     * Native name: IPSEC_CIPHER_TYPE_AES_256
     * @type {Integer (Int32)}
     */
    static AES_256 => 5

    /**
     * Maximum value for testing only.
     * Native name: IPSEC_CIPHER_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 6
}
