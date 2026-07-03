#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDSURFACEDESC.ahk" { DDSURFACEDESC }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * The DD_CREATESURFACEDATA structure contains information necessary to create a surface--in the case of CreateD3DBuffer, a command or vertex buffer.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_createsurfacedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_CREATESURFACEDATA {
    #StructPack 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddsurfacedesc">DDSURFACEDESC</a> structure describing the surface or buffer that the driver should create.
     */
    lpDDSurfaceDesc : DDSURFACEDESC.Ptr

    /**
     * Points to a list of <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structures describing the surface objects created by the driver. On Microsoft Windows 2000 and later, there is usually only one entry in this array. However, if the driver supports the Windows 98/Me-style surface creation techniques using <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> with GUID_NTPrivateDriverCaps, and the driver sets the DDHAL_PRIVATECAP_ATOMICSURFACECREATION flag, the member contains a list of surfaces (usually more than one).
     */
    lplpSList : IntPtr

    /**
     * Specifies the number of surfaces in the list to which <b>lplpSList</b> points. This value is usually 1 on Windows 2000 and later. However, if the driver support the Windows 98/Me-style surface creation techniques using <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> with GUID_NTPrivateDriverCaps, the member contains the actual number of surfaces in the list (usually more than one).
     */
    dwSCnt : UInt32

    /**
     * Specifies the location in which the driver writes the return value of either the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549263(v=vs.85)">DdCreateSurface</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurface">CreateD3DBuffer</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     */
    CreateSurface : IntPtr

}
