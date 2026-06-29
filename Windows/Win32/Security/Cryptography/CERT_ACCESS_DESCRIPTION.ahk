#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ALT_NAME_ENTRY.ahk" { CERT_ALT_NAME_ENTRY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_OTHER_NAME.ahk" { CERT_OTHER_NAME }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CERT_ACCESS_DESCRIPTION structure is a member of a CERT_AUTHORITY_INFO_ACCESS structure.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_access_description
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_ACCESS_DESCRIPTION {
    #StructPack 8

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for the method of access.
     * 
     * The following are currently defined PKIX Access Method OIDs:
     * 
     * <ul>
     * <li>szOID_PKIX_CA_ISSUERS</li>
     * <li>szOID_PKIX_CA_REPOSITORY</li>
     * <li>szOID_PKIX_OCSP</li>
     * <li>szOID_PKIX_TIME_STAMPING</li>
     * </ul>
     * The default provider does not support the szOID_PKIX_TIME_STAMPING method.
     */
    pszAccessMethod : PSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_entry">CERT_ALT_NAME_ENTRY</a> structure that describes the online status server and the access protocol to obtain current certificate status information for the certificate containing the extension. 
     * 
     * 
     * 
     * 
     * For the szOID_PKIX_OCSP access method, <b>AccessLocation</b> describes the online status server and the access protocol needed to obtain status information about the certificate containing this extension.
     * 
     * For the szOID_PKIX_CA_ISSUERS access method, <b>AccessLocation</b> obtains information on the CAs that issued certificates superior to the CA that issued the certificate containing this extension. The CA issuer's description is intended to aid certificate users in the selection of a certification path that terminates at a point trusted by the certificate user.
     * 
     * For the szOID_PKIX_CA_REPOSITORY method, <b>AccessLocation</b> specifies either the URI, directory name, or email address of the certificate and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> (CRL) repository for a  subject that is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA).
     */
    AccessLocation : CERT_ALT_NAME_ENTRY

}
