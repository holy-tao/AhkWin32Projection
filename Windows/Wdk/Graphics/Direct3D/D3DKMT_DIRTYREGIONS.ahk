#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_DIRTYREGIONS extends Win32Struct
{
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
     * @type {Array<RECT>}
     */
    Rects{
        get {
            if(!this.HasProp("__RectsProxyArray"))
                this.__RectsProxyArray := Win32FixedArray(this.ptr + 8, 16, RECT, "")
            return this.__RectsProxyArray
        }
    }
}
