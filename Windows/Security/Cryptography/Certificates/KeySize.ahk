#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies commonly used RSA algorithm key sizes. This enumeration type can be used in the [KeySize](certificaterequestproperties_keysize.md) property of a [CertificateRequestProperties](certificaterequestproperties.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keysize
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class KeySize extends Win32Enum{

    /**
     * No size is specified.
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * The key length is 2048 bits.
     * @type {Integer (Int32)}
     */
    static Rsa2048 => 2048

    /**
     * The key length is 4096 bits.
     * @type {Integer (Int32)}
     */
    static Rsa4096 => 4096
}
