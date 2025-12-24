#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\Win32\Foundation\RECTL.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DHAL_DP2TEXBLT extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwDDDestSurface {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwDDSrcSurface {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {POINT}
     */
    pDest{
        get {
            if(!this.HasProp("__pDest"))
                this.__pDest := POINT(8, this)
            return this.__pDest
        }
    }

    /**
     * @type {RECTL}
     */
    rSrc{
        get {
            if(!this.HasProp("__rSrc"))
                this.__rSrc := RECTL(16, this)
            return this.__rSrc
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
