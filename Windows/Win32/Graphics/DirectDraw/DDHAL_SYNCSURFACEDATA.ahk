#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_SYNCSURFACEDATA extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_LCL>}
     */
    lpDD {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_LCL>}
     */
    lpDDSurface {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwSurfaceOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    fpLockPtr {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    lPitch {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwOverlayOffset {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    dwOverlaySrcWidth {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    dwOverlaySrcHeight {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    dwOverlayDestWidth {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    dwOverlayDestHeight {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Pointer}
     */
    dwDriverReserved1 {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer}
     */
    dwDriverReserved2 {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer}
     */
    dwDriverReserved3 {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }
}
