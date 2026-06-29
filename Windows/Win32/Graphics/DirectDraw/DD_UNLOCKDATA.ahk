#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * The DD_UNLOCKDATA structure contains information necessary to do an unlock as defined by Microsoft DirectDraw parameter structures.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_unlockdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_UNLOCKDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that describes the surface--in the case of <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff570106(v=vs.85)">UnlockD3DBuffer</a>, a buffer--to be unlocked.
     */
    lpDDSurface : DD_SURFACE_LOCAL.Ptr

    /**
     * Specifies the location in which the driver writes the return value of either the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_unlock">DdUnlock</a> or <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff570106(v=vs.85)">UnlockD3DBuffer</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     */
    Unlock : IntPtr

}
