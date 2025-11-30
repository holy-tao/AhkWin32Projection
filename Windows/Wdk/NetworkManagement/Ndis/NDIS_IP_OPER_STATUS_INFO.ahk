#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_IP_OPER_STATUS.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_IP_OPER_STATUS_INFO extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * @type {Pointer<NDIS_OBJECT_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumberofAddressFamiliesReturned {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<NDIS_IP_OPER_STATUS>}
     */
    IpOperationalStatus{
        get {
            if(!this.HasProp("__IpOperationalStatusProxyArray"))
                this.__IpOperationalStatusProxyArray := Win32FixedArray(this.ptr + 16, 32, Primitive, "ptr")
            return this.__IpOperationalStatusProxyArray
        }
    }
}
