#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSURFACEDATA.ahk" { DDSURFACEDATA }

/**
 * The DDLOCKININFO structure contains the surface information.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddlockininfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDLOCKININFO {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsurfacedata">DDSURFACEDATA</a> structure that contains the surface information.
     */
    lpSurfaceData : DDSURFACEDATA.Ptr

}
