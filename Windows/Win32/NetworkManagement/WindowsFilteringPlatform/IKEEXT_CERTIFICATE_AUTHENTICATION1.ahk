#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\IKEEXT_CERT_CONFIG_TYPE.ahk" { IKEEXT_CERT_CONFIG_TYPE }
#Import ".\IKEEXT_CERT_ROOT_CONFIG0.ahk" { IKEEXT_CERT_ROOT_CONFIG0 }
#Import ".\IKEEXT_CERT_AUTH.ahk" { IKEEXT_CERT_AUTH }

/**
 * Is used to specify various parameters for authentication with certificates. (IKEEXT_CERTIFICATE_AUTHENTICATION1)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_certificate_authentication1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CERTIFICATE_AUTHENTICATION1 {
    #StructPack 8

    /**
     * Certificate configuration type for inbound peer certificate verification.
     * 
     * See [IKEEXT_CERT_CONFIG_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cert_config_type) for more information.
     */
    inboundConfigType : IKEEXT_CERT_CONFIG_TYPE

    inboundRootArraySize : UInt32

    inboundRootArray : IKEEXT_CERT_ROOT_CONFIG0.Ptr

    /**
     * Certificate configuration type for outbound local certificate verification.
     * 
     * See [IKEEXT_CERT_CONFIG_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cert_config_type) for more information.
     */
    outboundConfigType : IKEEXT_CERT_CONFIG_TYPE

    outboundRootArraySize : UInt32

    outboundRootArray : IKEEXT_CERT_ROOT_CONFIG0.Ptr

    flags : IKEEXT_CERT_AUTH

    /**
     * HTTP URL pointing to an encoded certificate or certificate-bundle, that 
     *    will be used by IKEv2 for authenticating local machine to a peer.
     * 
     * Applicable only to IKEv2.
     * 
     * See [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) for more information.
     */
    localCertLocationUrl : FWP_BYTE_BLOB

    static __New() {
        DefineProp(this.Prototype, 'inboundEnterpriseStoreConfig', { type: IKEEXT_CERT_ROOT_CONFIG0.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'inboundTrustedRootStoreConfig', { type: IKEEXT_CERT_ROOT_CONFIG0.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'outboundEnterpriseStoreConfig', { type: IKEEXT_CERT_ROOT_CONFIG0.Ptr, offset: 32 })
        DefineProp(this.Prototype, 'outboundTrustedRootStoreConfig', { type: IKEEXT_CERT_ROOT_CONFIG0.Ptr, offset: 32 })
        this.DeleteProp("__New")
    }
}
