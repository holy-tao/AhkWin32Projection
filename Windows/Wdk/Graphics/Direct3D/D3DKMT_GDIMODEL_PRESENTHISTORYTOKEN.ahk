#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_GDIMODEL_PRESENTHISTORYTOKEN extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    hLogicalSurface {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    hPhysicalSurface {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {RECT}
     */
    ScrollRect{
        get {
            if(!this.HasProp("__ScrollRect"))
                this.__ScrollRect := RECT(16, this)
            return this.__ScrollRect
        }
    }

    /**
     * @type {POINT}
     */
    ScrollOffset{
        get {
            if(!this.HasProp("__ScrollOffset"))
                this.__ScrollOffset := POINT(32, this)
            return this.__ScrollOffset
        }
    }

    /**
     * @type {Pointer<D3DKMT_DIRTYREGIONS>}
     */
    DirtyRegions {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
