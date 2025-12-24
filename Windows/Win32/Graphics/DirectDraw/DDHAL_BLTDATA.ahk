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
    static sizeof => 256

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
                this.__rDest := RECTL(16, this)
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
                this.__rSrc := RECTL(40, this)
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
                this.__bltFX := DDBLTFX(64, this)
            return this.__bltFX
        }
    }

    /**
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 192, "int")
        set => NumPut("int", value, this, 192)
    }

    /**
     * @type {Pointer<LPDDHALSURFCB_BLT>}
     */
    Blt {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {BOOL}
     */
    IsClipped {
        get => NumGet(this, 208, "int")
        set => NumPut("int", value, this, 208)
    }

    /**
     * @type {RECTL}
     */
    rOrigDest{
        get {
            if(!this.HasProp("__rOrigDest"))
                this.__rOrigDest := RECTL(212, this)
            return this.__rOrigDest
        }
    }

    /**
     * @type {RECTL}
     */
    rOrigSrc{
        get {
            if(!this.HasProp("__rOrigSrc"))
                this.__rOrigSrc := RECTL(228, this)
            return this.__rOrigSrc
        }
    }

    /**
     * @type {Integer}
     */
    dwRectCnt {
        get => NumGet(this, 244, "uint")
        set => NumPut("uint", value, this, 244)
    }

    /**
     * @type {Pointer<RECT>}
     */
    prDestRects {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }
}
