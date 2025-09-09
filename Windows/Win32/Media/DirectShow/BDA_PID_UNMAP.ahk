#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_PID_UNMAP extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulcPIDs {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    aulPIDs{
        get {
            if(!this.HasProp("__aulPIDsProxyArray"))
                this.__aulPIDsProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "uint")
            return this.__aulPIDsProxyArray
        }
    }
}
