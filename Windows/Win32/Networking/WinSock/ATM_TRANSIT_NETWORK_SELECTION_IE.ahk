#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ATM_TRANSIT_NETWORK_SELECTION_IE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * @type {Integer}
     */
    TypeOfNetworkId {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NetworkIdPlan {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    NetworkIdLength {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    NetworkId{
        get {
            if(!this.HasProp("__NetworkIdProxyArray"))
                this.__NetworkIdProxyArray := Win32FixedArray(this.ptr + 3, 1, Primitive, "char")
            return this.__NetworkIdProxyArray
        }
    }
}
