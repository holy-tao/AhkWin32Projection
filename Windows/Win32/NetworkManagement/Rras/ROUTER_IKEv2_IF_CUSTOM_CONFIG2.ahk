#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk
#Include .\MPR_VPN_TRAFFIC_SELECTORS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class ROUTER_IKEv2_IF_CUSTOM_CONFIG2 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSaLifeTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwSaDataSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    certificateName{
        get {
            if(!this.HasProp("__certificateName"))
                this.__certificateName := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__certificateName
        }
    }

    /**
     * @type {Pointer<ROUTER_CUSTOM_IKEv2_POLICY0>}
     */
    customPolicy {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    certificateHash{
        get {
            if(!this.HasProp("__certificateHash"))
                this.__certificateHash := CRYPT_INTEGER_BLOB(this.ptr + 32)
            return this.__certificateHash
        }
    }

    /**
     * @type {Integer}
     */
    dwMmSaLifeTime {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {MPR_VPN_TRAFFIC_SELECTORS}
     */
    vpnTrafficSelectors{
        get {
            if(!this.HasProp("__vpnTrafficSelectors"))
                this.__vpnTrafficSelectors := MPR_VPN_TRAFFIC_SELECTORS(this.ptr + 56)
            return this.__vpnTrafficSelectors
        }
    }
}
