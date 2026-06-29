#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Information about the credential name of the security context.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_credentialnamew
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset Unicode
 */
export default struct SecPkgContext_CredentialNameW {
    #StructPack 8

    /**
     * The credential type.
     */
    CredentialType : UInt32

    /**
     * The credential name.
     */
    sCredentialName : IntPtr

}
