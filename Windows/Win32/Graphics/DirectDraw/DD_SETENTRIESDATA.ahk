#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_PALETTE_GLOBAL.ahk" { DD_PALETTE_GLOBAL }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import "..\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }

/**
 * The DD_SETENTRIESDATA structure contains information necessary to set palette entries.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_setentriesdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_SETENTRIESDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_palette_global">DD_PALETTE_GLOBAL</a> structure that represents the DirectDrawPalette object.
     */
    lpDDPalette : DD_PALETTE_GLOBAL.Ptr

    /**
     * Specifies a zero-based index into the color table of the first entry to be modified.
     */
    dwBase : UInt32

    /**
     * Specifies the number of palette entries that the driver should update.
     */
    dwNumEntries : UInt32

    /**
     * Points to a PALETTEENTRY structure that specifies the color table. See the latest Microsoft DirectX SDK documentation for more information about PALETTEENTRY.
     */
    lpEntries : PALETTEENTRY.Ptr

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_palcb_setentries">DdSetEntries</a> callback. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     */
    SetEntries : IntPtr

}
