#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDVIDEOPORTDATA.ahk" { DDVIDEOPORTDATA }
#Import ".\DDSURFACEDATA.ahk" { DDSURFACEDATA }

/**
 * The DDFLIPVIDEOPORTINFO structure contains the video port extensions (VPE) object and surface information.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddflipvideoportinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDFLIPVIDEOPORTINFO {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddvideoportdata">DDVIDEOPORTDATA</a> structure that contains the VPE object information.
     */
    lpVideoPortData : DDVIDEOPORTDATA.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsurfacedata">DDSURFACEDATA</a> structure that contains information about the current surface.
     */
    lpCurrentSurface : DDSURFACEDATA.Ptr

    /**
     * Points to a DDSURFACEDATA structure that contains information about the target surface.
     */
    lpTargetSurface : DDSURFACEDATA.Ptr

    /**
     * Indicates whether the surfaces represent <a href="https://docs.microsoft.com/windows-hardware/drivers/">vertical blanking interval (VBI)</a> surfaces or regular surfaces. One of the following: 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDVPFLIP_VBI
     * 
     * </td>
     * <td>
     * Flip the VBI surface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVPFLIP_VIDEO
     * 
     * </td>
     * <td>
     * Flip the normal video surface.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlipVPFlags : UInt32

}
