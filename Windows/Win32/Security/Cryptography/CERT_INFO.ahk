#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }
#Import ".\CERT_PUBLIC_KEY_INFO.ahk" { CERT_PUBLIC_KEY_INFO }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains the information of a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_INFO {
    #StructPack 8

    /**
     * The version number of a certificate. This member can be one of the following version numbers.
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
     * Version 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_V2"></a><a id="cert_v2"></a><dl>
     * <dt><b>CERT_V2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version 2
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_V3"></a><a id="cert_v3"></a><dl>
     * <dt><b>CERT_V3</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version 3
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwVersion : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains the serial number of a certificate. The least significant byte is the zero byte of the <b>pbData</b> member of <i>SerialNumber</i>. The index for the last byte of <b>pbData</b>, is one less than the value of the <b>cbData</b> member of <i>SerialNumber</i>. The most significant byte is the last byte of <b>pbData</b>. Leading 0x00 or 0xFF bytes are removed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcompareintegerblob">CertCompareIntegerBlob</a>.
     */
    SerialNumber : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the signature algorithm type and encoded additional encryption parameters.
     */
    SignatureAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * The name, in encoded form, of the issuer of the certificate.
     */
    Issuer : CRYPT_INTEGER_BLOB

    /**
     * Date and time before which the certificate is not valid. For dates between 1950 and 2049 inclusive, the date and time is encoded Coordinated Universal Time (Greenwich Mean Time) format in the form YYMMDDHHMMSS. This member uses a two-digit year and is precise to seconds. For dates before 1950 or after 2049, encoded generalized time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four-digit year, and is precise to milliseconds. Even though generalized time supports millisecond resolution, the <b>NotBefore</b> time is only precise to seconds.
     */
    NotBefore : FILETIME

    /**
     * Date and time after which the certificate is not valid. For dates between 1950 and 2049 inclusive, the date and time is encoded Coordinated Universal Time format in the form YYMMDDHHMMSS. This member uses a two-digit year and is precise to seconds. For dates before 1950 or after 2049, encoded generalized time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four-digit year, and is precise to milliseconds. Even though generalized time supports millisecond resolution, the <b>NotAfter</b> time is only precise to seconds.
     */
    NotAfter : FILETIME

    /**
     * The encoded name of the subject of the certificate.
     */
    Subject : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure that contains the encoded public key and its algorithm. The <b>PublicKey</b> member of the <b>CERT_PUBLIC_KEY_INFO</b> structure contains the encoded public key as a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a>, and the <b>Algorithm</b> member contains the encoded algorithm as a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a>.
     */
    SubjectPublicKeyInfo : CERT_PUBLIC_KEY_INFO

    /**
     * A BLOB that contains a unique identifier of the issuer.
     */
    IssuerUniqueId : CRYPT_BIT_BLOB

    /**
     * A BLOB that contains a unique identifier of the subject.
     */
    SubjectUniqueId : CRYPT_BIT_BLOB

    /**
     * The number of elements in the <b>rgExtension</b> array.
     */
    cExtension : UInt32

    /**
     * An array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each of which contains extension information about the certificate.
     */
    rgExtension : CERT_EXTENSION.Ptr

}
