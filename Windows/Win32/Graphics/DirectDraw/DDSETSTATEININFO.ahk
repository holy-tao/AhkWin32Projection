#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDVIDEOPORTDATA.ahk" { DDVIDEOPORTDATA }
#Import ".\DDSURFACEDATA.ahk" { DDSURFACEDATA }

/**
 * The DDSETSTATEININFO structure contains the surface and video port extensions (VPE) object information.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddsetstateininfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDSETSTATEININFO {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsurfacedata">DDSURFACEDATA</a> structure that contains the surface information.
     */
    lpSurfaceData : DDSURFACEDATA.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddvideoportdata">DDVIDEOPORTDATA</a> structure that contains the VPE object information.
     */
    lpVideoPortData : DDVIDEOPORTDATA.Ptr

}
