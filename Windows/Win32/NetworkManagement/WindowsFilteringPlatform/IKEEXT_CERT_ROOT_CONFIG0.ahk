#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Stores the IKE, AuthIP, or IKEv2 certificate root configuration.
 * @remarks
 * 
  * <b>IKEEXT_CERT_ROOT_CONFIG0</b> is a specific implementation of IKEEXT_CERT_ROOT_CONFIG. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_cert_root_config0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CERT_ROOT_CONFIG0 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * X509/ASN.1 encoded name of the certificate root.
     * 
     * See [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) for more information.
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
     * 
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
