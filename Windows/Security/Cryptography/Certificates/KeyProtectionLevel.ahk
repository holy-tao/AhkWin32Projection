#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the key protection level. This enumeration type is used in the [KeyProtectionLevel](certificaterequestproperties_keyprotectionlevel.md) property of a [CertificateRequestProperties](certificaterequestproperties.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyprotectionlevel
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class KeyProtectionLevel extends Win32Enum{

    /**
     * No strong key protection.
     * @type {Integer (Int32)}
     */
    static NoConsent => 0

    /**
     * The user is notified through a dialog box when the private key is created or used.
     * @type {Integer (Int32)}
     */
    static ConsentOnly => 1

    /**
     * The user is prompted to enter a password for the key when the key is created or used.
     * @type {Integer (Int32)}
     */
    static ConsentWithPassword => 2

    /**
     * The user is prompted to enter a fingerprint verification for the key when the key is created or used.
     * @type {Integer (Int32)}
     */
    static ConsentWithFingerprint => 3
}
