#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_CALLBACKS structure contains entry pointers to the callback functions that a device driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. GDI allocates the memory for this structure and calls the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenabledirectdraw">DrvEnableDirectDraw</a> function to initialize it.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_callbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_CALLBACKS extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Specifies the size in bytes of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates what Microsoft DirectDraw callback functions the driver has implemented. For every bit set in <b>dwFlags</b>, the driver must initialize the corresponding function pointer member of this structure. This member can be one or more of the following flags:
     * 
     * 
     * <dl>
     * <dt>DDHAL_CB32_CANCREATESURFACE</dt>
     * <dt>DDHAL_CB32_CREATEPALETTE</dt>
     * <dt>DDHAL_CB32_CREATESURFACE</dt>
     * <dt>DDHAL_CB32_GETSCANLINE</dt>
     * <dt>DDHAL_CB32_MAPMEMORY</dt>
     * <dt>DDHAL_CB32_SETCOLORKEY</dt>
     * <dt>DDHAL_CB32_SETMODE</dt>
     * <dt>DDHAL_CB32_WAITFORVERTICALBLANK</dt>
     * </dl>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Unused on Microsoft Windows 2000 and later and should be ignored by the driver.
     * @type {Pointer<PDD_DESTROYDRIVER>}
     */
    DestroyDriver {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549263(v=vs.85)">DdCreateSurface</a> callback.
     * @type {Pointer<PDD_CREATESURFACE>}
     */
    CreateSurface {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_setcolorkey">DdSetColorKey</a> callback.
     * @type {Pointer<PDD_SETCOLORKEY>}
     */
    SetColorKey {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Unused on Windows 2000 and later and should be ignored by the driver.
     * @type {Pointer<PDD_SETMODE>}
     */
    SetMode {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_waitforverticalblank">DdWaitForVerticalBlank</a> callback.
     * @type {Pointer<PDD_WAITFORVERTICALBLANK>}
     */
    WaitForVerticalBlank {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549213(v=vs.85)">DdCanCreateSurface</a> callback.
     * @type {Pointer<PDD_CANCREATESURFACE>}
     */
    CanCreateSurface {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createpalette">DdCreatePalette</a> callback.
     * @type {Pointer<PDD_CREATEPALETTE>}
     */
    CreatePalette {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getscanline">DdGetScanLine</a> callback.
     * @type {Pointer<PDD_GETSCANLINE>}
     */
    GetScanLine {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mapmemory">DdMapMemory</a> callback.
     * @type {Pointer<PDD_MAPMEMORY>}
     */
    MapMemory {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
