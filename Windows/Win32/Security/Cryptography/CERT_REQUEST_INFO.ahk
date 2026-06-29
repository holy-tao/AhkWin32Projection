#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_ATTRIBUTE.ahk" { CRYPT_ATTRIBUTE }
#Import ".\CERT_PUBLIC_KEY_INFO.ahk" { CERT_PUBLIC_KEY_INFO }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CERT_REQUEST_INFO structure contains information for a certificate request. The subject, subject public key, and attribute BLOBs are encoded.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_request_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_REQUEST_INFO {
    #StructPack 8

    /**
     * The certificate's version number. Defined version number is shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_V1"></a><a id="cert_v1"></a><dl>
     * <dt><b>CERT_V1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * version 1
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwVersion : UInt32

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_NAME_BLOB</a> structure that contains the certificate subject's encoded name.
     */
    Subject : CRYPT_INTEGER_BLOB

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure containing the encoded public key and its algorithm.
     */
    SubjectPublicKeyInfo : CERT_PUBLIC_KEY_INFO

    /**
     * Number of elements in the <b>rgAttribute</b> array.
     */
    cAttribute : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures, each holding attribute information about the certificate.
     */
    rgAttribute : CRYPT_ATTRIBUTE.Ptr

}
