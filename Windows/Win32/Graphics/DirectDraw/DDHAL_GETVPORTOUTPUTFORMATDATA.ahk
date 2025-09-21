#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_GETVPORTOUTPUTFORMATDATA extends Win32Struct
{
    static sizeof => 56

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<DDPIXELFORMAT>}
     */
    lpddpfInputFormat {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<DDPIXELFORMAT>}
     */
    lpddpfOutputFormats {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwNumFormats {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_GETOUTPUTFORMATS>}
     */
    GetVideoPortOutputFormats {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
