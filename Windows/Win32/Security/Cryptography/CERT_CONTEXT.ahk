#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCERTSTORE.ahk

/**
 * Contains both the encoded and decoded representations of a certificate.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_context
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CONTEXT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type of encoding used. It is always acceptable to specify both the certificate and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">message encoding types</a> by combining them with a bitwise-<b>OR</b> operation as shown in the following example:
     * 
     * X509_ASN_ENCODING | PKCS_7_ASN_ENCODING Currently defined encoding types are:
     * 
     * <ul>
     * <li>X509_ASN_ENCODING</li>
     * <li>PKCS_7_ASN_ENCODING</li>
     * </ul>
     * @type {Integer}
     */
    dwCertEncodingType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a buffer that contains the encoded certificate.
     * @type {Pointer<Integer>}
     */
    pbCertEncoded {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size, in bytes, of the encoded certificate.
     * @type {Integer}
     */
    cbCertEncoded {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a> structure that contains the certificate information.
     * @type {Pointer<CERT_INFO>}
     */
    pCertInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a> that contains the certificate <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>.
     * @type {HCERTSTORE}
     */
    hCertStore{
        get {
            if(!this.HasProp("__hCertStore"))
                this.__hCertStore := HCERTSTORE(32, this)
            return this.__hCertStore
        }
    }
}
