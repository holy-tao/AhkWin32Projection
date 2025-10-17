#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Is used to specify various parameters for authentication with certificates.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_certificate_authentication1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CERTIFICATE_AUTHENTICATION1 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Certificate configuration type for inbound peer certificate verification.
     * 
     * See [IKEEXT_CERT_CONFIG_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cert_config_type) for more information.
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
     * @type {Pointer<IKEEXT_CERT_ROOT_CONFIG0>}
     */
    inboundRootArray {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<IKEEXT_CERT_ROOT_CONFIG0>}
     */
    inboundEnterpriseStoreConfig {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<IKEEXT_CERT_ROOT_CONFIG0>}
     */
    inboundTrustedRootStoreConfig {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Certificate configuration type for outbound local certificate verification.
     * 
     * See [IKEEXT_CERT_CONFIG_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cert_config_type) for more information.
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
     * @type {Pointer<IKEEXT_CERT_ROOT_CONFIG0>}
     */
    outboundRootArray {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<IKEEXT_CERT_ROOT_CONFIG0>}
     */
    outboundEnterpriseStoreConfig {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<IKEEXT_CERT_ROOT_CONFIG0>}
     */
    outboundTrustedRootStoreConfig {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * HTTP URL pointing to an encoded certificate or certificate-bundle, that 
     *    will be used by IKEv2 for authenticating local machine to a peer.
     * 
     * Applicable only to IKEv2.
     * 
     * See [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) for more information.
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
