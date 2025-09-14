#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include .\DDCOLORKEY.ahk
#Include .\DDBLTFX.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_BLTDATA extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_GBL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_LCL>}
     */
    lpDDDestSurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {RECTL}
     */
    rDest{
        get {
            if(!this.HasProp("__rDest"))
                this.__rDest := RECTL(this.ptr + 16)
            return this.__rDest
        }
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_LCL>}
     */
    lpDDSrcSurface {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {RECTL}
     */
    rSrc{
        get {
            if(!this.HasProp("__rSrc"))
                this.__rSrc := RECTL(this.ptr + 40)
            return this.__rSrc
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwROPFlags {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {DDBLTFX}
     */
    bltFX{
        get {
            if(!this.HasProp("__bltFX"))
                this.__bltFX := DDBLTFX(this.ptr + 64)
            return this.__bltFX
        }
    }

    /**
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 168, "int")
        set => NumPut("int", value, this, 168)
    }

    /**
     * @type {Pointer<LPDDHALSURFCB_BLT>}
     */
    Blt {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    IsClipped {
        get => NumGet(this, 184, "int")
        set => NumPut("int", value, this, 184)
    }

    /**
     * @type {RECTL}
     */
    rOrigDest{
        get {
            if(!this.HasProp("__rOrigDest"))
                this.__rOrigDest := RECTL(this.ptr + 192)
            return this.__rOrigDest
        }
    }

    /**
     * @type {RECTL}
     */
    rOrigSrc{
        get {
            if(!this.HasProp("__rOrigSrc"))
                this.__rOrigSrc := RECTL(this.ptr + 208)
            return this.__rOrigSrc
        }
    }

    /**
     * @type {Integer}
     */
    dwRectCnt {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {Pointer<RECT>}
     */
    prDestRects {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }
}
