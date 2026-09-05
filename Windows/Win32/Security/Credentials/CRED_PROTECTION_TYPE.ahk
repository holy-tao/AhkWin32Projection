#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the security context in which credentials are encrypted when using the CredProtect function.
 * @see https://learn.microsoft.com/windows/win32/api/wincred/ne-wincred-cred_protection_type
 * @namespace Windows.Win32.Security.Credentials
 */
class CRED_PROTECTION_TYPE extends Win32Enum {

    /**
     * The credentials are not encrypted.
     * Native name: CredUnprotected
     * @type {Integer (Int32)}
     */
    static Unprotected => 0

    /**
     * The credentials are encrypted and can be decrypted only in the security context in which they were encrypted or in the security context of a trusted component.
     * Native name: CredUserProtection
     * @type {Integer (Int32)}
     */
    static UserProtection => 1

    /**
     * The credentials are encrypted and can only be decrypted by a trusted component.
     * Native name: CredTrustedProtection
     * @type {Integer (Int32)}
     */
    static TrustedProtection => 2

    /**
     * Native name: CredForSystemProtection
     * @type {Integer (Int32)}
     */
    static ForSystemProtection => 3
}
