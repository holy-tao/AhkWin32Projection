#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the security context in which credentials are encrypted when using the CredProtect function.
 * @see https://learn.microsoft.com/windows/win32/api/wincred/ne-wincred-cred_protection_type
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct CRED_PROTECTION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * @type {Integer (Int32)}
     */
    static CredForSystemProtection => 3
}
