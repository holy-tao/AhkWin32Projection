#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MPRAPI_OBJECT_HEADER.ahk
#Include ..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk
#Include .\MPR_VPN_TRAFFIC_SELECTORS.ahk
#Include .\ROUTER_IKEv2_IF_CUSTOM_CONFIG2.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_IF_CUSTOMINFOEX2 extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {MPRAPI_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := MPRAPI_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {ROUTER_IKEv2_IF_CUSTOM_CONFIG2}
     */
    customIkev2Config{
        get {
            if(!this.HasProp("__customIkev2Config"))
                this.__customIkev2Config := ROUTER_IKEv2_IF_CUSTOM_CONFIG2(this.ptr + 8)
            return this.__customIkev2Config
        }
    }
}
