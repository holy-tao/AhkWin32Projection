#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the credential name and type.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-_secpkgcontext_credentialnamea
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
export default struct SecPkgContext_CredentialNameA {
    #StructPack 8

    /**
     * Indicates the type of credential name.
     */
    CredentialType : UInt32

    /**
     * Contains the credential name.
     */
    sCredentialName : IntPtr

}
