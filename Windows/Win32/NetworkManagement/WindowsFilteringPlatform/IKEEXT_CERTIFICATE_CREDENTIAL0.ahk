#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Is used to store credential information specific to certificate authentication. (IKEEXT_CERTIFICATE_CREDENTIAL0)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_certificate_credential0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CERTIFICATE_CREDENTIAL0 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Encoded subject name of the certificate used for authentication.
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
}
