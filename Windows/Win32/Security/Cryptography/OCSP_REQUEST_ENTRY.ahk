#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\OCSP_CERT_ID.ahk

/**
 * Contains information about a single certificate in an online certificate status protocol (OCSP) request.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_request_entry
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class OCSP_REQUEST_ENTRY extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_cert_id">OCSP_CERT_ID</a> structure that specifies the target certificate.
     * @type {OCSP_CERT_ID}
     */
    CertId{
        get {
            if(!this.HasProp("__CertId"))
                this.__CertId := OCSP_CERT_ID(this.ptr + 0)
            return this.__CertId
        }
    }

    /**
     * The number of elements in the <b>rgExtension</b> array.
     * @type {Integer}
     */
    cExtension {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each of which contains information about the <b>CertId</b> certificate.
     * @type {Pointer<CERT_EXTENSION>}
     */
    rgExtension {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
