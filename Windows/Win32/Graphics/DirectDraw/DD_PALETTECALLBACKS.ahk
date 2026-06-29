#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_PALETTECALLBACKS structure contains entry pointers to the DirectDraw palette callback functions that a device driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver initializes this structure in <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenabledirectdraw">DrvEnableDirectDraw</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_palettecallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_PALETTECALLBACKS {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DD_PALETTECALLBACKS structure.
     */
    dwSize : UInt32

    /**
     * Indicates what DirectDrawPalette callback functions the driver has implemented. For every bit set in <b>dwFlags</b>, the driver must initialize the corresponding function pointer member of this structure. This member can be one or more of the following flags:
     * 
     * 
     * <dl>
     * <dt>DDHAL_PALCB32_DESTROYPALETTE</dt>
     * <dt>DDHAL_PALCB32_SETENTRIES</dt>
     * </dl>
     */
    dwFlags : UInt32

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_palcb_destroypalette">DdDestroyPalette</a> palette callback.
     */
    DestroyPalette : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_palcb_setentries">DdSetEntries</a> palette callback.
     */
    SetEntries : IntPtr

}
