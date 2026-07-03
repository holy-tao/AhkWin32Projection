#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_CALLBACKS structure contains entry pointers to the callback functions that a device driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. GDI allocates the memory for this structure and calls the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenabledirectdraw">DrvEnableDirectDraw</a> function to initialize it.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_callbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_CALLBACKS {
    #StructPack 8

    /**
     * Specifies the size in bytes of this structure.
     */
    dwSize : UInt32

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
     */
    dwFlags : UInt32

    /**
     * Unused on Microsoft Windows 2000 and later and should be ignored by the driver.
     */
    DestroyDriver : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549263(v=vs.85)">DdCreateSurface</a> callback.
     */
    CreateSurface : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_setcolorkey">DdSetColorKey</a> callback.
     */
    SetColorKey : IntPtr

    /**
     * Unused on Windows 2000 and later and should be ignored by the driver.
     */
    SetMode : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_waitforverticalblank">DdWaitForVerticalBlank</a> callback.
     */
    WaitForVerticalBlank : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549213(v=vs.85)">DdCanCreateSurface</a> callback.
     */
    CanCreateSurface : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createpalette">DdCreatePalette</a> callback.
     */
    CreatePalette : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getscanline">DdGetScanLine</a> callback.
     */
    GetScanLine : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mapmemory">DdMapMemory</a> callback.
     */
    MapMemory : IntPtr

}
