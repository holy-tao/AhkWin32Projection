#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SecPkgContext_PasswordExpiry structure contains information about the expiration of a password or other credential used for the security context. This structure is returned by QueryContextAttributes (General).
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_passwordexpiry
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_PasswordExpiry {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/timestamp">TimeStamp</a> variable that indicates when the credentials for the security context expire. For password-based packages, this variable indicates when the password expires. For <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a>, this variable indicates when the ticket expires.
     */
    tsPasswordExpires : Int64

}
