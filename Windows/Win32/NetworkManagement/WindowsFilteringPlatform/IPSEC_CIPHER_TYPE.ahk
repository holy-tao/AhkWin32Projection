#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of encryption algorithm used in an IPsec SA for data privacy.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_cipher_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_CIPHER_TYPE extends Win32Enum{

    /**
     * Specifies DES encryption.
     * @type {Integer (Int32)}
     */
    static IPSEC_CIPHER_TYPE_DES => 1

    /**
     * Specifies 3DES encryption.
     * @type {Integer (Int32)}
     */
    static IPSEC_CIPHER_TYPE_3DES => 2

    /**
     * Specifies AES-128 encryption.
     * @type {Integer (Int32)}
     */
    static IPSEC_CIPHER_TYPE_AES_128 => 3

    /**
     * Specifies AES-192 encryption.
     * @type {Integer (Int32)}
     */
    static IPSEC_CIPHER_TYPE_AES_192 => 4

    /**
     * Specifies AES-256 encryption.
     * @type {Integer (Int32)}
     */
    static IPSEC_CIPHER_TYPE_AES_256 => 5

    /**
     * Maximum value for testing only.
     * @type {Integer (Int32)}
     */
    static IPSEC_CIPHER_TYPE_MAX => 6
}
