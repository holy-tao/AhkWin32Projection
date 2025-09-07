#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class PIDListSpanningEvent extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    wPIDCount {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    pulPIDs{
        get {
            if(!this.HasProp("__pulPIDsProxyArray"))
                this.__pulPIDsProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "uint")
            return this.__pulPIDsProxyArray
        }
    }
}
