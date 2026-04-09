#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_DIRTYREGIONS extends Win32Struct {
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumRects {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Pointer>}
     */
    Rects {
        get {
            if(!this.HasProp("__RectsProxyArray"))
                this.__RectsProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "ptr")
            return this.__RectsProxyArray
        }
    }
}
