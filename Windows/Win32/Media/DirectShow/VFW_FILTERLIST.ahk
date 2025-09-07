#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VFW_FILTERLIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cFilters {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Guid>}
     */
    aClsId{
        get {
            if(!this.HasProp("__aClsIdProxyArray"))
                this.__aClsIdProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "ptr")
            return this.__aClsIdProxyArray
        }
    }
}
