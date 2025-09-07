#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_DeinterlaceQueryAvailableModes extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumGuids {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Guid>}
     */
    Guids{
        get {
            if(!this.HasProp("__GuidsProxyArray"))
                this.__GuidsProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "ptr")
            return this.__GuidsProxyArray
        }
    }
}
