#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * The DD_SETOVERLAYPOSITIONDATA structure contains information necessary to change the display coordinates of an overlay surface.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_setoverlaypositiondata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_SETOVERLAYPOSITIONDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that represents the Microsoft DirectDraw overlay surface.
     */
    lpDDSrcSurface : DD_SURFACE_LOCAL.Ptr

    /**
     * Points to a DD_SURFACE_LOCAL structure representing the surface that is being overlaid.
     */
    lpDDDestSurface : DD_SURFACE_LOCAL.Ptr

    /**
     * Specifies the x-coordinate of the upper left corner of the overlay, in pixels.
     */
    lXPos : Int32

    /**
     * Specifies the y coordinate of the upper left corner of the overlay, in pixels.
     */
    lYPos : Int32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_setoverlayposition">DdSetOverlayPosition</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     */
    SetOverlayPosition : IntPtr

}
