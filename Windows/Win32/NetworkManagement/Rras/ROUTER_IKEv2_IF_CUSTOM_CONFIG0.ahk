#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk

/**
 * Gets or sets IKEv2 tunnel configuration parameter for IKEv2 tunnel based demand dial interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-router_ikev2_if_custom_config0
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class ROUTER_IKEv2_IF_CUSTOM_CONFIG0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A value that specifies the lifetime of a security association (SA) after which the SA is no longer valid.  This value must be between 300 and 17,279,999 seconds.
     * @type {Integer}
     */
    dwSaLifeTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that specifies the number of kilobytes that are allowed to transfer using a SA. Afterwards, the SA will be renegotiated. This value must be greater than or equal to 1024 KB.
     * @type {Integer}
     */
    dwSaDataSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A value that specifies the configured certificate that will be sent to the peer for authentication during the main mode SA negotiation for the IKE2 tunnel based VPN connections.
     * @type {CRYPT_INTEGER_BLOB}
     */
    certificateName{
        get {
            if(!this.HasProp("__certificateName"))
                this.__certificateName := CRYPT_INTEGER_BLOB(8, this)
            return this.__certificateName
        }
    }

    /**
     * A value that specifies the custom IKEv2 configurations that will be used during  the SA negotiation. If set to <b>NULL</b>, no custom IKEv2configuration is available.
     * @type {Pointer<ROUTER_CUSTOM_IKEv2_POLICY0>}
     */
    customPolicy {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
