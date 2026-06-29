#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDSURFACEDESC.ahk" { DDSURFACEDESC }
#Import ".\DD_DIRECTDRAW_GLOBAL.ahk" { DD_DIRECTDRAW_GLOBAL }

/**
 * The DD_CANCREATESURFACEDATA structure contains information necessary to indicate whether a surface--in the case of CanCreateD3DBuffer, a buffer--can be created.
 * @remarks
 * The DirectDraw surface description pointed to by the <b>lpDDSurfaceDesc</b> member is actually a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550340(v=vs.85)">DDSURFACEDESC2</a> structure (rather than a DDSURFACEDESC structure) for DirectDraw 6.0 and later runtimes. Therefore, if you need information at surface-creation time from those members that are in the DDSURFACEDESC2 structure but not in the DDSURFACEDESC structure, you can simply cast the pointer to a DDSURFACEDESC structure to a pointer to a DDSURFACEDESC2 structure prior to use. The following example shows how the value of <b>dwTextureStage</b> (a member of the DDSURFACEDESC2 structure, but not also of the DDSURFACEDESC structure) can be obtained from a pointer to a DDSURFACEDESC structure.
 * 
 * 
 * ```
 * DDSURFACEDESC2* pddsd = (DDSURFACEDESC2*)pccsd->lpDDSurfaceDesc;
 * DWORD dwStage = pddsd->dwTextureStage;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_cancreatesurfacedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_CANCREATESURFACEDATA {
    #StructPack 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     */
    lpDD : DD_DIRECTDRAW_GLOBAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddsurfacedesc">DDSURFACEDESC</a> structure that contains a description of the surface or buffer to be created. See the Remarks section for additional information about this member.
     */
    lpDDSurfaceDesc : DDSURFACEDESC.Ptr

    /**
     * Indicates whether the pixel format of the surface to be created differs from that of the primary surface. For the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_cancreatesurface">CanCreateD3DBuffer</a> D3DBuffer callback, this member is always set to <b>FALSE</b> because the driver is attempting to create a buffer that contains vertex data or commands, rather than pixel data.
     */
    bIsDifferentPixelFormat : UInt32

    /**
     * Specifies the location in which the driver writes the return value of either the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549213(v=vs.85)">DdCanCreateSurface</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_cancreatesurface">CanCreateD3DBuffer</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     */
    CanCreateSurface : IntPtr

}
