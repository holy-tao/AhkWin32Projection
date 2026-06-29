#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ROUTER_CUSTOM_IKEv2_POLICY0.ahk" { ROUTER_CUSTOM_IKEv2_POLICY0 }
#Import "..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Gets or sets tunnel parameters for Internet Key Exchange version 2 (IKEv2) devices.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ikev2_tunnel_config_params2
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct IKEV2_TUNNEL_CONFIG_PARAMS2 {
    #StructPack 8

    /**
     * A value that specifies the time, in seconds, after which the connection will be disconnected if there is no traffic.
     */
    dwIdleTimeout : UInt32

    /**
     * A value that specifies the retransmission timeout for IKEv2 request packets. IKEv2 expects a response for every request packet sent, this value specifies the time after which the connection is deleted in case a response is not received.
     */
    dwNetworkBlackoutTime : UInt32

    /**
     * A value that specifies the lifetime, in seconds, of a security association (SA), after which the SA is no longer valid.
     */
    dwSaLifeTime : UInt32

    /**
     * A value that specifies the number of kilobytes that are allowed to be transferred using a SA before it must be renegotiated.
     */
    dwSaDataSizeForRenegotiation : UInt32

    /**
     * Not implemented. Must be set to 0.
     */
    dwConfigOptions : UInt32

    /**
     * A value that specifies the number of certificates in <b>certificateNames</b>.
     */
    dwTotalCertificates : UInt32

    /**
     * An array of CERT_NAME_BLOB structures that contain X.509 public key infrastructure certificates.
     */
    certificateNames : CRYPT_INTEGER_BLOB.Ptr

    /**
     * The encryption type to be used for IKEv2.
     */
    machineCertificateName : CRYPT_INTEGER_BLOB

    dwEncryptionType : UInt32

    /**
     * A value that specifies the custom IKEv2 configurations to be used during  the SA negotiation. If <b>customPolicy</b> is set to <b>NULL</b>, no custom IKEv2 configuration is available.
     */
    customPolicy : ROUTER_CUSTOM_IKEv2_POLICY0.Ptr

}
