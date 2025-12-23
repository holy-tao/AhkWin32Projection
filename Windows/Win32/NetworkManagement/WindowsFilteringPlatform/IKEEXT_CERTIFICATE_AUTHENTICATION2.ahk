#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Is used to specify various parameters for authentication with certificates. (IKEEXT_CERTIFICATE_AUTHENTICATION2)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_certificate_authentication2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CERTIFICATE_AUTHENTICATION2 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: [IKEEXT_CERT_CONFIG_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cert_config_type)</b>
     * 
     * Certificate configuration type for inbound peer certificate verification.
     * @type {Integer}
     */
    inboundConfigType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    inboundRootArraySize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<IKEEXT_CERTIFICATE_CRITERIA0>}
     */
    inboundRootCriteria {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    inboundEnterpriseStoreArraySize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<IKEEXT_CERTIFICATE_CRITERIA0>}
     */
    inboundEnterpriseStoreCriteria {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    inboundRootStoreArraySize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<IKEEXT_CERTIFICATE_CRITERIA0>}
     */
    inboundTrustedRootStoreCriteria {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: [IKEEXT_CERT_CONFIG_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cert_config_type)</b>
     * 
     * Certificate configuration type for outbound local certificate verification.
     * @type {Integer}
     */
    outboundConfigType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    outboundRootArraySize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<IKEEXT_CERTIFICATE_CRITERIA0>}
     */
    outboundRootCriteria {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    outboundEnterpriseStoreArraySize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<IKEEXT_CERTIFICATE_CRITERIA0>}
     */
    outboundEnterpriseStoreCriteria {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    outboundRootStoreArraySize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<IKEEXT_CERTIFICATE_CRITERIA0>}
     */
    outboundTrustedRootStoreCriteria {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>UINT32</b>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob)</b>
     * 
     * HTTP URL pointing to an encoded certificate or certificate-bundle, that 
     *    will be used by IKEv2 for authenticating local machine to a peer.
     * 
     * Applicable only to IKEv2.
     * @type {FWP_BYTE_BLOB}
     */
    localCertLocationUrl{
        get {
            if(!this.HasProp("__localCertLocationUrl"))
                this.__localCertLocationUrl := FWP_BYTE_BLOB(56, this)
            return this.__localCertLocationUrl
        }
    }
}
