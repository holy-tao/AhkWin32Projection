#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the security context in which credentials are encrypted when using the CredProtect function.
 * @see https://learn.microsoft.com/windows/win32/api/wincred/ne-wincred-cred_protection_type
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class CRED_PROTECTION_TYPE{

    /**
     * The credentials are not encrypted.
     * @type {Integer (Int32)}
     */
    static CredUnprotected => 0

    /**
     * The credentials are encrypted and can be decrypted only in the security context in which they were encrypted or in the security context of a trusted component.
     * @type {Integer (Int32)}
     */
    static CredUserProtection => 1

    /**
     * The credentials are encrypted and can only be decrypted by a trusted component.
     * @type {Integer (Int32)}
     */
    static CredTrustedProtection => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CredForSystemProtection => 3
}
