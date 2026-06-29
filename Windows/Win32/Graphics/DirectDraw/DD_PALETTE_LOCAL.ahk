#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_PALETTE_LOCAL structure contains palette-related data that is unique to an individual palette object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_palette_local
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_PALETTE_LOCAL {
    #StructPack 8

    /**
     * Reserved for system use.
     */
    dwReserved0 : UInt32

    /**
     * Reserved for use by the display driver
     */
    dwReserved1 : IntPtr

}
