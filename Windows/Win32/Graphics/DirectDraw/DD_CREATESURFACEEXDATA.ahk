#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * The DD_CREATESURFACEEXDATA structure contains information required for the driver to create a surface and associate with it a supplied texture handle.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_createsurfaceexdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_CREATESURFACEEXDATA {
    #StructPack 8

    /**
     * Specifies a set of flags for the <b>D3dCreateSurfaceEx</b> function that are currently not used and always zero.
     */
    dwFlags : UInt32

    /**
     * Specifies a handle to the DirectDraw object created by the application. This is the scope within which the <b>lpDDSLcl</b> handles exist. A <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure describes the driver.
     */
    lpDDLcl : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Specifies a handle to the DirectDraw surface to be created for Direct3D. These handles are unique within each different DD_DIRECTDRAW_LOCAL structure. A <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure represents the created surface object.
     */
    lpDDSLcl : DD_SURFACE_LOCAL.Ptr

    /**
     * Specifies the location where the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurfaceex">D3dCreateSurfaceEx</a> callback. A return code of D3D_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-codes-for-direct3d-driver-callbacks">Return Codes for Direct3D Driver Callbacks</a>.
     */
    ddRVal : HRESULT

}
