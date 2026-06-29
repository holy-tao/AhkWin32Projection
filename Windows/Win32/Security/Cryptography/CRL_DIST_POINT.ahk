#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ALT_NAME_ENTRY.ahk" { CERT_ALT_NAME_ENTRY }
#Import ".\CRL_DIST_POINT_NAME.ahk" { CRL_DIST_POINT_NAME }
#Import ".\CERT_ALT_NAME_INFO.ahk" { CERT_ALT_NAME_INFO }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }

/**
 * Identifies a single certificate revocation list (CRL) distribution point that a certificate user can reference to determine whether certificates have been revoked.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crl_dist_point
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRL_DIST_POINT {
    #StructPack 8

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_dist_point_name">CRL_DIST_POINT_NAME</a> structure that identifies the location of a CRL source. If <b>NULL</b>, the distribution point name defaults to the <b>CRLIssuer</b> name.
     */
    DistPointName : CRL_DIST_POINT_NAME

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a> that contains a byte that indicates the revocation reasons covered by the CRL. 
     * 
     * 
     * 
     * 
     * If <b>NULL</b>, the indicated CRL distribution point distributes a CRL that will contain an entry for this certificate if this certificate has been revoked, regardless of the revocation reason.
     * 
     * The following are currently defined <b>ReasonFlags</b> values. For revocations of several reasons, combine these <b>ReasonFlags</b> by using a bitwise-<b>OR</b> operation.
     * 
     * 
     * <ul>
     * <li>CRL_REASON_UNUSED_FLAG</li>
     * <li>CRL_REASON_KEY_COMPROMISE_FLAG</li>
     * <li>CRL_REASON_CA_COMPROMISE_FLAG</li>
     * <li>CRL_REASON_AFFILIATION_CHANGED_FLAG</li>
     * <li>CRL_REASON_SUPERSEDED_FLAG</li>
     * <li>CRL_REASON_CESSATION_OF_OPERATION_FLAG</li>
     * <li>CRL_REASON_CERTIFICATE_HOLD_FLAG</li>
     * </ul>
     */
    ReasonFlags : CRYPT_BIT_BLOB

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_info">CERT_ALT_NAME_INFO</a> that identifies the authority that issued and signed the CRL. If <b>NULL</b>, the issuer name defaults to the issuer name of the certificate.
     */
    CRLIssuer : CERT_ALT_NAME_INFO

}
