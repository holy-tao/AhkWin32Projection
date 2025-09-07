#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_DATA_SET_TOPOLOGY_ID_QUERY_OUTPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    TopologyRangeBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    TopologyId{
        get {
            if(!this.HasProp("__TopologyIdProxyArray"))
                this.__TopologyIdProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__TopologyIdProxyArray
        }
    }
}
