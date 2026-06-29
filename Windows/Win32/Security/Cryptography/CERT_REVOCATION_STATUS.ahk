#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_REVOCATION_STATUS_REASON.ahk" { CERT_REVOCATION_STATUS_REASON }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information on the revocation status of the certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_revocation_status
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_REVOCATION_STATUS {
    #StructPack 4

    /**
     * Size of this structure in bytes. 
     * 
     * 
     * 
     * 
     * Upon input to 
     * <b>CERT_REVOCATION_STATUS</b>, <b>cbSize</b> must be set to a size greater than or equal to the size of a <b>CERT_REVOCATION_STATUS</b> structure. Otherwise, <b>CERT_REVOCATION_STATUS</b> returns <b>FALSE</b> and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns E_INVALIDARG.
     */
    cbSize : UInt32 := this.Size

    /**
     * Specifies an index value for the <i>rgpvContext</i> array passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyrevocation">CertVerifyRevocation</a>. It is the index of the first <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a> in that array that was revoked or that could not be checked for revocation. For information about the contexts that were not checked, <b>CertVerifyRevocation</b> is called again, specifying a <i>rgpvContext</i> array that contains the unchecked contexts from the original list.
     */
    dwIndex : UInt32

    /**
     * Specifies the returned error status. This value matches the return value of <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> on return from the call to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyrevocation">CertVerifyRevocation</a>. For the list of these error values, see the table in the Return Values section of 
     * <b>CertVerifyRevocation</b>.
     */
    dwError : UInt32

    dwReason : CERT_REVOCATION_STATUS_REASON

    /**
     * Depending on <b>cbSize</b>, this structure can contain this member. If this member is <b>TRUE</b>, the revocation freshness time returned by <b>dwFreshnessTime</b> is valid.
     */
    fHasFreshnessTime : BOOL

    /**
     * Depending on <b>cbSize</b>, this structure can contain this member. If present, this member gives the time in seconds between the current time and when the CRL was published.
     */
    dwFreshnessTime : UInt32

}
