#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\CRYPT_BIT_BLOB.ahk
#Include .\CERT_PUBLIC_KEY_INFO.ahk

/**
 * Contains the information of a certificate.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_INFO extends Win32Struct
{
    static sizeof => 208

    static packingSize => 8

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
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains the serial number of a certificate. The least significant byte is the zero byte of the <b>pbData</b> member of <i>SerialNumber</i>. The index for the last byte of <b>pbData</b>, is one less than the value of the <b>cbData</b> member of <i>SerialNumber</i>. The most significant byte is the last byte of <b>pbData</b>. Leading 0x00 or 0xFF bytes are removed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcompareintegerblob">CertCompareIntegerBlob</a>.
     * @type {CRYPT_INTEGER_BLOB}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumber"))
                this.__SerialNumber := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__SerialNumber
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the signature algorithm type and encoded additional encryption parameters.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    SignatureAlgorithm{
        get {
            if(!this.HasProp("__SignatureAlgorithm"))
                this.__SignatureAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 24)
            return this.__SignatureAlgorithm
        }
    }

    /**
     * The name, in encoded form, of the issuer of the certificate.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Issuer{
        get {
            if(!this.HasProp("__Issuer"))
                this.__Issuer := CRYPT_INTEGER_BLOB(this.ptr + 48)
            return this.__Issuer
        }
    }

    /**
     * Date and time before which the certificate is not valid. For dates between 1950 and 2049 inclusive, the date and time is encoded Coordinated Universal Time (Greenwich Mean Time) format in the form YYMMDDHHMMSS. This member uses a two-digit year and is precise to seconds. For dates before 1950 or after 2049, encoded generalized time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four-digit year, and is precise to milliseconds. Even though generalized time supports millisecond resolution, the <b>NotBefore</b> time is only precise to seconds.
     * @type {FILETIME}
     */
    NotBefore{
        get {
            if(!this.HasProp("__NotBefore"))
                this.__NotBefore := FILETIME(this.ptr + 64)
            return this.__NotBefore
        }
    }

    /**
     * Date and time after which the certificate is not valid. For dates between 1950 and 2049 inclusive, the date and time is encoded Coordinated Universal Time format in the form YYMMDDHHMMSS. This member uses a two-digit year and is precise to seconds. For dates before 1950 or after 2049, encoded generalized time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four-digit year, and is precise to milliseconds. Even though generalized time supports millisecond resolution, the <b>NotAfter</b> time is only precise to seconds.
     * @type {FILETIME}
     */
    NotAfter{
        get {
            if(!this.HasProp("__NotAfter"))
                this.__NotAfter := FILETIME(this.ptr + 72)
            return this.__NotAfter
        }
    }

    /**
     * The encoded name of the subject of the certificate.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Subject{
        get {
            if(!this.HasProp("__Subject"))
                this.__Subject := CRYPT_INTEGER_BLOB(this.ptr + 80)
            return this.__Subject
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_public_key_info">CERT_PUBLIC_KEY_INFO</a> structure that contains the encoded public key and its algorithm. The <b>PublicKey</b> member of the <b>CERT_PUBLIC_KEY_INFO</b> structure contains the encoded public key as a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a>, and the <b>Algorithm</b> member contains the encoded algorithm as a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a>.
     * @type {CERT_PUBLIC_KEY_INFO}
     */
    SubjectPublicKeyInfo{
        get {
            if(!this.HasProp("__SubjectPublicKeyInfo"))
                this.__SubjectPublicKeyInfo := CERT_PUBLIC_KEY_INFO(this.ptr + 96)
            return this.__SubjectPublicKeyInfo
        }
    }

    /**
     * A BLOB that contains a unique identifier of the issuer.
     * @type {CRYPT_BIT_BLOB}
     */
    IssuerUniqueId{
        get {
            if(!this.HasProp("__IssuerUniqueId"))
                this.__IssuerUniqueId := CRYPT_BIT_BLOB(this.ptr + 144)
            return this.__IssuerUniqueId
        }
    }

    /**
     * A BLOB that contains a unique identifier of the subject.
     * @type {CRYPT_BIT_BLOB}
     */
    SubjectUniqueId{
        get {
            if(!this.HasProp("__SubjectUniqueId"))
                this.__SubjectUniqueId := CRYPT_BIT_BLOB(this.ptr + 168)
            return this.__SubjectUniqueId
        }
    }

    /**
     * The number of elements in the <b>rgExtension</b> array.
     * @type {Integer}
     */
    cExtension {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * An array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each of which contains extension information about the certificate.
     * @type {Pointer<CERT_EXTENSION>}
     */
    rgExtension {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }
}
