#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MIB_IPFORWARDROW.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPDESTROW extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {MIB_IPFORWARDROW}
     */
    ForwardRow{
        get {
            if(!this.HasProp("__ForwardRow"))
                this.__ForwardRow := MIB_IPFORWARDROW(0, this)
            return this.__ForwardRow
        }
    }

    /**
     * @type {Integer}
     */
    dwForwardPreference {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwForwardViewSet {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
