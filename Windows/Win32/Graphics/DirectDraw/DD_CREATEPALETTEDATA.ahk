#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_PALETTE_GLOBAL.ahk" { DD_PALETTE_GLOBAL }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }

/**
 * The DD_CREATEPALETTEDATA structure contains information necessary to create a DirectDrawPalette object for this Microsoft DirectDraw object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_createpalettedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_CREATEPALETTEDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_palette_global">DD_PALETTE_GLOBAL</a> structure representing the DirectDrawPalette object.
     */
    lpDDPalette : DD_PALETTE_GLOBAL.Ptr

    /**
     * Points to an array of 2, 4, 16, or 256 PALETTEENTRY structures used to initialize the colors for this DirectDrawPalette object. See the latest Microsoft DirectX SDK documentation for more information about PALETTEENTRY.
     */
    lpColorTable : PALETTEENTRY.Ptr

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createpalette">DdCreatePalette</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     */
    CreatePalette : IntPtr

    /**
     * Specifies a BOOL value that is set to <b>TRUE</b> to indicate that this process has exclusive mode and <b>FALSE</b> otherwise.
     */
    is_excl : BOOL

}
