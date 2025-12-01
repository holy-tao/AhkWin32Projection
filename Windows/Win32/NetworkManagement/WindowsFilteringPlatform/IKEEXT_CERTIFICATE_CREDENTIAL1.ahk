#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Is used to store credential information specific to certificate authentication. (IKEEXT_CERTIFICATE_CREDENTIAL1)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_certificate_credential1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CERTIFICATE_CREDENTIAL1 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Encoded subject name of the certificate used for authentication. Use <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certnametostra">CertNameToStr</a> to convert the encoded name to string.
     * 
     * See [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) for more information.
     * @type {FWP_BYTE_BLOB}
     */
    subjectName{
        get {
            if(!this.HasProp("__subjectName"))
                this.__subjectName := FWP_BYTE_BLOB(0, this)
            return this.__subjectName
        }
    }

    /**
     * SHA thumbprint of the certificate.
     * 
     * See [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) for more information.
     * @type {FWP_BYTE_BLOB}
     */
    certHash{
        get {
            if(!this.HasProp("__certHash"))
                this.__certHash := FWP_BYTE_BLOB(16, this)
            return this.__certHash
        }
    }

    /**
     * Possible values:
     * 
     * <a id="IKEEXT_CERT_CREDENTIAL_FLAG_NAP_CERT"></a>
     * <a id="ikeext_cert_credential_flag_nap_cert"></a>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The encoded certificate. Use <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcreatecertificatecontext">CertCreateCertificateContext</a> to create a certificate context from the encoded certificate.
     * 
     * See [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) for more information.
     * @type {FWP_BYTE_BLOB}
     */
    certificate{
        get {
            if(!this.HasProp("__certificate"))
                this.__certificate := FWP_BYTE_BLOB(40, this)
            return this.__certificate
        }
    }
}
