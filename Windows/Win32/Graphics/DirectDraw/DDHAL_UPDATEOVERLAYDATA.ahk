#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include .\DDCOLORKEY.ahk
#Include .\DDOVERLAYFX.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_UPDATEOVERLAYDATA extends Win32Struct
{
    static sizeof => 152

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
     * @type {DDOVERLAYFX}
     */
    overlayFX{
        get {
            if(!this.HasProp("__overlayFX"))
                this.__overlayFX := DDOVERLAYFX(this.ptr + 64)
            return this.__overlayFX
        }
    }

    /**
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }

    /**
     * @type {Pointer<LPDDHALSURFCB_UPDATEOVERLAY>}
     */
    UpdateOverlay {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }
}
