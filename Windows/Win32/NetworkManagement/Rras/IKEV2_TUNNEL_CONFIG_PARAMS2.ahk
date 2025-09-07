#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk

/**
 * Gets or sets tunnel parameters for Internet Key Exchange version 2 (IKEv2) devices.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ikev2_tunnel_config_params2
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class IKEV2_TUNNEL_CONFIG_PARAMS2 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A value that specifies the time, in seconds, after which the connection will be disconnected if there is no traffic.
     * @type {Integer}
     */
    dwIdleTimeout {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that specifies the retransmission timeout for IKEv2 request packets. IKEv2 expects a response for every request packet sent, this value specifies the time after which the connection is deleted in case a response is not received.
     * @type {Integer}
     */
    dwNetworkBlackoutTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A value that specifies the lifetime, in seconds, of a security association (SA), after which the SA is no longer valid.
     * @type {Integer}
     */
    dwSaLifeTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A value that specifies the number of kilobytes that are allowed to be transferred using a SA before it must be renegotiated.
     * @type {Integer}
     */
    dwSaDataSizeForRenegotiation {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Not implemented. Must be set to 0.
     * @type {Integer}
     */
    dwConfigOptions {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A value that specifies the number of certificates in <b>certificateNames</b>.
     * @type {Integer}
     */
    dwTotalCertificates {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * An array of CERT_NAME_BLOB structures that contain X.509 public key infrastructure certificates.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    certificateNames {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The encryption type to be used for IKEv2.
     * @type {CRYPT_INTEGER_BLOB}
     */
    machineCertificateName{
        get {
            if(!this.HasProp("__machineCertificateName"))
                this.__machineCertificateName := CRYPT_INTEGER_BLOB(this.ptr + 32)
            return this.__machineCertificateName
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwEncryptionType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A value that specifies the custom IKEv2 configurations to be used during  the SA negotiation. If <b>customPolicy</b> is set to <b>NULL</b>, no custom IKEv2 configuration is available.
     * @type {Pointer<ROUTER_CUSTOM_IKEv2_POLICY0>}
     */
    customPolicy {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
