#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_REVOCATION_CRL_INFO.ahk" { CERT_REVOCATION_CRL_INFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Indicates the revocation status of a certificate in a CERT_CHAIN_ELEMENT.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_revocation_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_REVOCATION_INFO {
    #StructPack 8

    /**
     * Size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Currently defined values are:
     * 
     * <ul>
     * <li>CERT_TRUST_IS_REVOKED</li>
     * <li>CERT_TRUST_REVOCATION_STATUS_IS_UNKNOWN</li>
     * </ul>
     */
    dwRevocationResult : UInt32

    /**
     * Not currently used and is set to <b>NULL</b>.
     */
    pszRevocationOid : PSTR

    /**
     * Not currently used and is set to <b>NULL</b>.
     */
    pvOidSpecificInfo : IntPtr

    /**
     * BOOL set to <b>TRUE</b> if dwFreshnessTime has been updated.
     */
    fHasFreshnessTime : BOOL

    /**
     * If <b>fHasFreshnessTime</b> is <b>TRUE</b>, holds the CurrentTime minus the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list's</a> (CRL's). This time is in seconds.
     */
    dwFreshnessTime : UInt32

    /**
     * For CRL base revocation checking, a non-<b>NULL</b> pointer to a CERT_REVOCATION_CRL_INFO structure.
     */
    pCrlInfo : CERT_REVOCATION_CRL_INFO.Ptr

}
