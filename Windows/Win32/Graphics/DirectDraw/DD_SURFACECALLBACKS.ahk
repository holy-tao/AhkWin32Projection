#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_SURFACECALLBACKS structure contains entry pointers to the Microsoft DirectDraw surface callback functions that a device driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver initializes this structure in <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenabledirectdraw">DrvEnableDirectDraw</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_surfacecallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_SURFACECALLBACKS {
    #StructPack 8

    /**
     * Specifies the size in bytes of the DD_SURFACECALLBACKS structure. This member is unused by Microsoft Windows 2000 and later versions.
     */
    dwSize : UInt32

    /**
     * Indicates which DirectDrawSurface callback functions the driver has implemented. For every bit set in <b>dwFlags</b>, the driver must initialize the corresponding function pointer member of this structure. This member can be one or more of the following flags:
     * 
     * 
     * <dl>
     * <dt>DDHAL_SURFCB32_DESTROYSURFACE</dt>
     * <dt>DDHAL_SURFCB32_FLIP</dt>
     * <dt>DDHAL_SURFCB32_SETCLIPLIST</dt>
     * <dt>DDHAL_SURFCB32_LOCK</dt>
     * <dt>DDHAL_SURFCB32_UNLOCK</dt>
     * <dt>DDHAL_SURFCB32_BLT</dt>
     * <dt>DDHAL_SURFCB32_SETCOLORKEY</dt>
     * <dt>DDHAL_SURFCB32_ADDATTACHEDSURFACE</dt>
     * <dt>DDHAL_SURFCB32_GETBLTSTATUS</dt>
     * <dt>DDHAL_SURFCB32_GETFLIPSTATUS</dt>
     * <dt>DDHAL_SURFCB32_UPDATEOVERLAY</dt>
     * <dt>DDHAL_SURFCB32_SETOVERLAYPOSITION</dt>
     * <dt>DDHAL_SURFCB32_SETPALETTE</dt>
     * </dl>
     */
    dwFlags : UInt32

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_destroysurface">DdDestroySurface</a> surface callback.
     */
    DestroySurface : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_flip">DdFlip</a> surface callback.
     */
    Flip : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows-hardware/drivers/display/windows-vista-display-driver-model-design-guide">DdSetClipList</a> surface callback.
     */
    SetClipList : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_lock">DdLock</a> surface callback.
     */
    Lock : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_unlock">DdUnlock</a> surface callback.
     */
    Unlock : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_blt">DdBlt</a> surface callback.
     */
    Blt : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_setcolorkey">DdSetColorKey</a> surface callback.
     */
    SetColorKey : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_addattachedsurface">DdAddAttachedSurface</a> surface callback.
     */
    AddAttachedSurface : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_getbltstatus">DdGetBltStatus</a> surface callback.
     */
    GetBltStatus : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_getflipstatus">DdGetFlipStatus</a> surface callback.
     */
    GetFlipStatus : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_updateoverlay">DdUpdateOverlay</a> surface callback.
     */
    UpdateOverlay : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_setoverlayposition">DdSetOverlayPosition</a> surface callback.
     */
    SetOverlayPosition : IntPtr

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    reserved4 : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_setpalette">DdSetPalette</a> surface callback.
     */
    SetPalette : IntPtr

}
