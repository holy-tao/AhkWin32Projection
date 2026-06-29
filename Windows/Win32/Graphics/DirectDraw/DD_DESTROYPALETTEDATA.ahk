#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_PALETTE_GLOBAL.ahk" { DD_PALETTE_GLOBAL }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }

/**
 * The DD_DESTROYPALETTEDATA structure contains information necessary to destroy the specified palette.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_destroypalettedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_DESTROYPALETTEDATA {
    #StructPack 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_palette_global">DD_PALETTE_GLOBAL</a> structure representing the palette object to be destroyed.
     */
    lpDDPalette : DD_PALETTE_GLOBAL.Ptr

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_palcb_destroypalette">DdDestroyPalette</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     */
    DestroyPalette : IntPtr

}
