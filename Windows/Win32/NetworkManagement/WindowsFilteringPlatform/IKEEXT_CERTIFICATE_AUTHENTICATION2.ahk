#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_CERT_CONFIG_TYPE.ahk" { IKEEXT_CERT_CONFIG_TYPE }
#Import ".\IKEEXT_CERT_AUTH.ahk" { IKEEXT_CERT_AUTH }
#Import ".\IKEEXT_CERTIFICATE_CRITERIA0.ahk" { IKEEXT_CERTIFICATE_CRITERIA0 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }

/**
 * Is used to specify various parameters for authentication with certificates. (IKEEXT_CERTIFICATE_AUTHENTICATION2)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_certificate_authentication2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CERTIFICATE_AUTHENTICATION2 {
    #StructPack 8

    /**
     * Type: [IKEEXT_CERT_CONFIG_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cert_config_type)</b>
     * 
     * Certificate configuration type for inbound peer certificate verification.
     */
    inboundConfigType : IKEEXT_CERT_CONFIG_TYPE

    inboundRootArraySize : UInt32

    inboundRootCriteria : IKEEXT_CERTIFICATE_CRITERIA0.Ptr

    /**
     * Type: [IKEEXT_CERT_CONFIG_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cert_config_type)</b>
     * 
     * Certificate configuration type for outbound local certificate verification.
     */
    outboundConfigType : IKEEXT_CERT_CONFIG_TYPE

    outboundRootArraySize : UInt32

    outboundRootCriteria : IKEEXT_CERTIFICATE_CRITERIA0.Ptr

    /**
     * Type: <b>UINT32</b>
     */
    flags : IKEEXT_CERT_AUTH

    /**
     * Type: [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob)</b>
     * 
     * HTTP URL pointing to an encoded certificate or certificate-bundle, that 
     *    will be used by IKEv2 for authenticating local machine to a peer.
     * 
     * Applicable only to IKEv2.
     */
    localCertLocationUrl : FWP_BYTE_BLOB

    static __New() {
        DefineProp(this.Prototype, 'inboundEnterpriseStoreArraySize', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'inboundEnterpriseStoreCriteria', { type: IKEEXT_CERTIFICATE_CRITERIA0.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'inboundRootStoreArraySize', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'inboundTrustedRootStoreCriteria', { type: IKEEXT_CERTIFICATE_CRITERIA0.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'outboundEnterpriseStoreArraySize', { type: UInt32, offset: 32 })
        DefineProp(this.Prototype, 'outboundEnterpriseStoreCriteria', { type: IKEEXT_CERTIFICATE_CRITERIA0.Ptr, offset: 40 })
        DefineProp(this.Prototype, 'outboundRootStoreArraySize', { type: UInt32, offset: 32 })
        DefineProp(this.Prototype, 'outboundTrustedRootStoreCriteria', { type: IKEEXT_CERTIFICATE_CRITERIA0.Ptr, offset: 40 })
        this.DeleteProp("__New")
    }
}
