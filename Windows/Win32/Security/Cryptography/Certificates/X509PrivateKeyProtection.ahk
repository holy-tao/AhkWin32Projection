#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the level of private key protection supported by a cryptographic provider.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-x509privatekeyprotection
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509PrivateKeyProtection extends Win32Enum{

    /**
     * The protection level is not specified.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_UI_NO_PROTECTION_FLAG => 0

    /**
     * A user interface is displayed to indicate that a process is attempting to use the key. The exact behavior is specified by the KSP or CSP being used. Some Microsoft legacy CSPs allow the client to decide whether a password is required to use the key or whether the user must only acknowledge a prompt.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_UI_PROTECT_KEY_FLAG => 1

    /**
     * Specifies strong key protection. The user is typically prompted to enter a password when the key is created and whenever the key is used. The exact behavior is specified by the KSP being used. This value is not supported by the Certificate Enrollment API for legacy CSPs.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_UI_FORCE_HIGH_PROTECTION_FLAG => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_UI_FINGERPRINT_PROTECTION_FLAG => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_UI_APPCONTAINER_ACCESS_MEDIUM_FLAG => 8
}
