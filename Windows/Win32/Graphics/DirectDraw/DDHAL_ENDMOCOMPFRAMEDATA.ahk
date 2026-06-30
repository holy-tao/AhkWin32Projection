#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDRAWI_DDMOTIONCOMP_LCL.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\DDRAWI_DIRECTDRAW_LCL.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class DDHAL_ENDMOCOMPFRAMEDATA extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_LCL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DDRAWI_DDMOTIONCOMP_LCL>}
     */
    lpMoComp {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpInputData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwInputDataSize {
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
     * @type {Pointer<LPDDHALMOCOMPCB_ENDFRAME>}
     */
    EndMoCompFrame {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
