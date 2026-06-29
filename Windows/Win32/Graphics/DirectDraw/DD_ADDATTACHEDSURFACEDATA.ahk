#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * The DD_ADDATTACHEDSURFACEDATA structure contains information necessary to attach a surface to another surface.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_addattachedsurfacedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_ADDATTACHEDSURFACEDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that represents the surface to which another surface is being attached.
     */
    lpDDSurface : DD_SURFACE_LOCAL.Ptr

    /**
     * Points to a DD_SURFACE_LOCAL structure that represents the surface to be attached.
     */
    lpSurfAttached : DD_SURFACE_LOCAL.Ptr

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_addattachedsurface">DdAddAttachedSurface</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Unused on Microsoft Windows 2000 and later.
     */
    AddAttachedSurface : IntPtr

}
