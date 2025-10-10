#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Contains a set of criteria to applied to an authentication method.
 * @remarks
 * 
  * The <b>certData</b> member refers to the encoded name of the root certificate, while the <b>certHash</b>, <b>eku</b>, and <b>name</b> members refer to criteria on the end certificate.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_certificate_criteria0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CERTIFICATE_CRITERIA0 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob)</b>
     * 
     * X509/ASN.1 encoded name of the root certificate. Should be empty when
     *    specifying Enterprise or trusted root store config.
     * @type {FWP_BYTE_BLOB}
     */
    certData{
        get {
            if(!this.HasProp("__certData"))
                this.__certData := FWP_BYTE_BLOB(this.ptr + 0)
            return this.__certData
        }
    }

    /**
     * Type: [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob)</b>
     * 
     *   16-character hexadecimal string that represents the ID, thumbprint or HASH of the end certificate.
     * @type {FWP_BYTE_BLOB}
     */
    certHash{
        get {
            if(!this.HasProp("__certHash"))
                this.__certHash := FWP_BYTE_BLOB(this.ptr + 16)
            return this.__certHash
        }
    }

    /**
     * Type: [IKEEXT_CERT_EKUS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_cert_ekus0)*</b>
     * 
     * The specific extended key usage (EKU) object identifiers (OIDs) selected for the criteria on the end certificate.
     * @type {Pointer<IKEEXT_CERT_EKUS0>}
     */
    eku {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: [IKEEXT_CERT_NAME0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_cert_name0)*</b>
     * 
     * The name/subject selected for the criteria on the end certificate.
     * @type {Pointer<IKEEXT_CERT_NAME0>}
     */
    name {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Reserved for system use.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
