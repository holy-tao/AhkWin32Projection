#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRL_ENTRY.ahk" { CRL_ENTRY }
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains the information of a certificate revocation list (CRL).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crl_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRL_INFO {
    #StructPack 8

    /**
     * Version number of the CRL. Currently defined version numbers are shown in the following table. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRL_V1"></a><a id="crl_v1"></a><dl>
     * <dt><b>CRL_V1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * version 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRL_V2"></a><a id="crl_v2"></a><dl>
     * <dt><b>CRL_V2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * version 2
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwVersion : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of a signature algorithm and any associated additional parameters.
     */
    SignatureAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> structure that contains an encoded certificate issuer's name.
     */
    Issuer : CRYPT_INTEGER_BLOB

    /**
     * Indication of the date and time of the CRL's published. If the time is after 1950 and before 2050, it is UTC-time encoded as an 8-byte date/time precise to seconds with a 2-digit year (that is, YYMMDDHHMMSS plus 2 bytes). Otherwise, it is generalized-time encoded as an 8-byte year precise to milliseconds with a 4-byte year.
     */
    ThisUpdate : FILETIME

    /**
     * Indication of the date and time for the CRL's next available scheduled update. If the time is after 1950 and before 2050, it is UTC-time encoded as an 8-byte date/time precise to seconds with a 2-digit year (that is, YYMMDDHHMMSS plus 2 bytes). Otherwise, it is generalized-time encoded as an 8-byte date time precise to milliseconds with a 4-byte year.
     */
    NextUpdate : FILETIME

    /**
     * Number of elements in the <b>rgCRLEntry</b> array.
     */
    cCRLEntry : UInt32

    /**
     * Array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_entry">CRL_ENTRY</a> structures. Each of these structures represents a revoked certificate.
     */
    rgCRLEntry : CRL_ENTRY.Ptr

    /**
     * Number of elements in the <b>rgExtension</b> array.
     */
    cExtension : UInt32

    /**
     * Array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each holding information about the CRL.
     */
    rgExtension : CERT_EXTENSION.Ptr

}
