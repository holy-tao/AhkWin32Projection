#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDRAWI_DDRAWSURFACE_LCL.ahk
#Include .\DDRAWI_DIRECTDRAW_GBL.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\DDCOLORCONTROL.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class DDHAL_COLORCONTROLDATA extends Win32Struct {
    static sizeof => 40

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
    lpDDSurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DDCOLORCONTROL>}
     */
    lpColorData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Pointer<LPDDHALCOLORCB_COLORCONTROL>}
     */
    ColorControl {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
