#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }

/**
 * The DD_FLIPTOGDISURFACEDATA structure contains the GDI surface notification information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_fliptogdisurfacedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_FLIPTOGDISURFACEDATA {
    #StructPack 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Indicates that Microsoft DirectDraw is flipping to a GDI surface when <b>TRUE</b>; indicates that DirectDraw is flipping from a GDI surface when <b>FALSE</b>.
     */
    dwToGDI : UInt32

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    dwReserved : UInt32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_fliptogdisurface">DdFlipToGDISurface</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     */
    FlipToGDISurface : IntPtr

}
