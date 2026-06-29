#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_PALETTE_GLOBAL structure contains the global DirectDrawPalette data that can be shared between object instances.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_palette_global
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_PALETTE_GLOBAL {
    #StructPack 8

    /**
     * Reserved for use by the display driver.
     */
    dwReserved1 : IntPtr

}
