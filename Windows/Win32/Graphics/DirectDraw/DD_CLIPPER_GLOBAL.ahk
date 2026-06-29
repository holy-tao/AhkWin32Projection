#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_CLIPPER_GLOBAL structure contains the global DirectDrawClipper data that can be shared between object instances.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_clipper_global
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_CLIPPER_GLOBAL {
    #StructPack 8

    /**
     * Reserved for use by the display driver.
     */
    dwReserved1 : IntPtr

}
