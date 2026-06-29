#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_CLIPPER_LOCAL structure contains local data for each individual DirectDrawClipper object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_clipper_local
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_CLIPPER_LOCAL {
    #StructPack 8

    /**
     * Is reserved for use by the display driver.
     */
    dwReserved1 : IntPtr

}
