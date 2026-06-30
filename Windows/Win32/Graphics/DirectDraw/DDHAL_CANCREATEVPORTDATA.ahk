#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDVIDEOPORTDESC.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\DDRAWI_DIRECTDRAW_LCL.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class DDHAL_CANCREATEVPORTDATA extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_LCL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DDVIDEOPORTDESC>}
     */
    lpDDVideoPortDesc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_CANCREATEVIDEOPORT>}
     */
    CanCreateVideoPort {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
