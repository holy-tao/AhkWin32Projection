#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDRAWI_DDVIDEOPORT_LCL.ahk
#Include .\DDPIXELFORMAT.ahk
#Include .\DDVIDEOPORTBANDWIDTH.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\DDRAWI_DIRECTDRAW_LCL.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class DDHAL_GETVPORTBANDWIDTHDATA extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_LCL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DDRAWI_DDVIDEOPORT_LCL>}
     */
    lpVideoPort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DDPIXELFORMAT>}
     */
    lpddpfFormat {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<DDVIDEOPORTBANDWIDTH>}
     */
    lpBandwidth {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_GETBANDWIDTH>}
     */
    GetVideoPortBandwidth {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
