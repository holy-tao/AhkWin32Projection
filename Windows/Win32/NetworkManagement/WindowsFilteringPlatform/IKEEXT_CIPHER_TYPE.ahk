#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of encryption algorithm used for encrypting the Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) messages.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ne-iketypes-ikeext_cipher_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CIPHER_TYPE extends Win32Enum{

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
     * 
     * @type {Integer (Int32)}
     */
    static IKEEXT_CIPHER_AES_GCM_128_16ICV => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static IKEEXT_CIPHER_AES_GCM_256_16ICV => 6

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_CIPHER_TYPE_MAX => 7
}
