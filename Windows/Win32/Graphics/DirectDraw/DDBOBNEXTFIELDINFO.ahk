#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSURFACEDATA.ahk" { DDSURFACEDATA }

/**
 * The DDBOBNEXTFIELDINFO structure contains the bob information for the surface.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddbobnextfieldinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDBOBNEXTFIELDINFO {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsurfacedata">DDSURFACEDATA</a> structure that represents the surface.
     */
    lpSurface : DDSURFACEDATA.Ptr

}
