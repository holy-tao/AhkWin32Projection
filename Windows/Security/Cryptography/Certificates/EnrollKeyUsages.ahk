#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the cryptographic operations that can be performed by the private key. This enumeration type is used in the [KeyUsages](certificaterequestproperties_keyusages.md) property of a [CertificateRequestProperties](certificaterequestproperties.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.enrollkeyusages
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class EnrollKeyUsages extends Win32BitflagEnum{

    /**
     * No usage is specified for the key.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The key can be used for decryption.
     * @type {Integer (UInt32)}
     */
    static Decryption => 1

    /**
     * The key can be used for signing.
     * @type {Integer (UInt32)}
     */
    static Signing => 2

    /**
     * The key can be used for secret agreement encryption.
     * @type {Integer (UInt32)}
     */
    static KeyAgreement => 4

    /**
     * The key can be used for decryption, signing. and key agreement.
     * @type {Integer (UInt32)}
     */
    static All => 16777215
}
