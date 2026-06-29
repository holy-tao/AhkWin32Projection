#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }
#Import "..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Gets or sets IKEv2 tunnel configuration parameter for IKEv2 tunnel based demand dial interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-router_ikev2_if_custom_config0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct ROUTER_IKEv2_IF_CUSTOM_CONFIG0 {
    #StructPack 8

    /**
     * A value that specifies the lifetime of a security association (SA) after which the SA is no longer valid.  This value must be between 300 and 17,279,999 seconds.
     */
    dwSaLifeTime : UInt32

    /**
     * A value that specifies the number of kilobytes that are allowed to transfer using a SA. Afterwards, the SA will be renegotiated. This value must be greater than or equal to 1024 KB.
     */
    dwSaDataSize : UInt32

    /**
     * A value that specifies the configured certificate that will be sent to the peer for authentication during the main mode SA negotiation for the IKE2 tunnel based VPN connections.
     */
    certificateName : CRYPT_INTEGER_BLOB

    /**
     * A value that specifies the custom IKEv2 configurations that will be used during  the SA negotiation. If set to <b>NULL</b>, no custom IKEv2configuration is available.
     */
    customPolicy : ROUTER_CUSTOM_IKEv2_POLICY0.Ptr

}
