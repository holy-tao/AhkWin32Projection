#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains a basic online certificate status protocol (OCSP) response as specified by RFC 2560.
 * @remarks
 * OCSP responder applications encode this structure and store it in an <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_basic_signed_response_info">OCSP_BASIC_SIGNED_RESPONSE_INFO</a> <b>ToBeSigned</b> member. Conversely, OCSP client applications decode the <b>OCSP_BASIC_SIGNED_RESPONSE_INFO</b> structure to obtain this structure.
  * 
  * OCSP applications can encode or decode this structure by using <b>X509_ASN_ENCODING</b> or <b>PKCS_7_ASN_ENCODING</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_basic_response_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class OCSP_BASIC_RESPONSE_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A value that indicates the protocol version of the response.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that indicates the type of ID the responder used in this response.
     * @type {Integer}
     */
    dwResponderIdChoice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    ByNameResponderId{
        get {
            if(!this.HasProp("__ByNameResponderId"))
                this.__ByNameResponderId := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__ByNameResponderId
        }
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    ByKeyResponderId{
        get {
            if(!this.HasProp("__ByKeyResponderId"))
                this.__ByKeyResponderId := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__ByKeyResponderId
        }
    }

    /**
     * The date and time at which the response was signed.
     * @type {FILETIME}
     */
    ProducedAt{
        get {
            if(!this.HasProp("__ProducedAt"))
                this.__ProducedAt := FILETIME(this.ptr + 24)
            return this.__ProducedAt
        }
    }

    /**
     * The number of elements in the <i>rgResponseEntry</i> array.
     * @type {Integer}
     */
    cResponseEntry {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_basic_response_entry">OCSP_BASIC_RESPONSE_ENTRY</a> structures, each of which contains a certificate status.
     * @type {Pointer<OCSP_BASIC_RESPONSE_ENTRY>}
     */
    rgResponseEntry {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The number of elements in the <b>rgExtension</b> array.
     * @type {Integer}
     */
    cExtension {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each of which contains additional information about the response.
     * @type {Pointer<CERT_EXTENSION>}
     */
    rgExtension {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
