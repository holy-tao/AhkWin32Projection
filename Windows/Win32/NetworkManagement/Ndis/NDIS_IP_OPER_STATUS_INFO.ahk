#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_OBJECT_HEADER.ahk
#Include .\NDIS_IP_OPER_STATUS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_IP_OPER_STATUS_INFO extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NumberofAddressFamiliesReturned {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<NDIS_IP_OPER_STATUS>}
     */
    IpOperationalStatus{
        get {
            if(!this.HasProp("__IpOperationalStatusProxyArray"))
                this.__IpOperationalStatusProxyArray := Win32FixedArray(this.ptr + 16, 32, NDIS_IP_OPER_STATUS, "")
            return this.__IpOperationalStatusProxyArray
        }
    }
}
