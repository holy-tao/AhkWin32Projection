#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\OCSP_CERT_ID.ahk" { OCSP_CERT_ID }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\OCSP_BASIC_REVOKED_INFO.ahk" { OCSP_BASIC_REVOKED_INFO }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains the current certificate status for a single certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_basic_response_entry
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct OCSP_BASIC_RESPONSE_ENTRY {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_cert_id">OCSP_CERT_ID</a> structure that specifies the target certificate of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">online certificate status protocol</a> (OCSP) response.
     */
    CertId : OCSP_CERT_ID

    /**
     * A value that indicates the target certificate revocation status.
     * 
     * 
     * <a href="https://www.ietf.org/rfc/rfc2560.txt">RFC 2560</a> defines the following possible values for certificate status.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OCSP_BASIC_GOOD_CERT_STATUS"></a><a id="ocsp_basic_good_cert_status"></a><dl>
     * <dt><b>OCSP_BASIC_GOOD_CERT_STATUS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is not revoked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OCSP_BASIC_REVOKED_CERT_STATUS"></a><a id="ocsp_basic_revoked_cert_status"></a><dl>
     * <dt><b>OCSP_BASIC_REVOKED_CERT_STATUS</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is revoked either permanently or temporarily.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OCSP_BASIC_UNKNOWN_CERT_STATUS"></a><a id="ocsp_basic_unknown_cert_status"></a><dl>
     * <dt><b>OCSP_BASIC_UNKNOWN_CERT_STATUS</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The responder has no information for the target certificate.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwCertStatus : UInt32

    pRevokedInfo : OCSP_BASIC_REVOKED_INFO.Ptr

    /**
     * The date and time at which the response indicated by <i>dwCertStatus</i> is known to be correct.
     */
    ThisUpdate : FILETIME

    /**
     * The date and time on or before which newer information will be available for the certificate status. A value of zero indicates that the certificate status never expires.
     */
    NextUpdate : FILETIME

    /**
     * The number of elements in the <b>rgExtension</b> array.
     */
    cExtension : UInt32

    /**
     * An array of pointers to  <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each of which contains additional information about the response.
     */
    rgExtension : CERT_EXTENSION.Ptr

}
