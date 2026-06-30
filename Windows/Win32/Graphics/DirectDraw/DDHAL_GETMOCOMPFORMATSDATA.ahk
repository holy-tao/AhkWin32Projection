#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DDPIXELFORMAT.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\DDRAWI_DIRECTDRAW_LCL.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class DDHAL_GETMOCOMPFORMATSDATA extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_LCL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    lpGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwNumFormats {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<DDPIXELFORMAT>}
     */
    lpFormats {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Pointer<LPDDHALMOCOMPCB_GETFORMATS>}
     */
    GetMoCompFormats {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
