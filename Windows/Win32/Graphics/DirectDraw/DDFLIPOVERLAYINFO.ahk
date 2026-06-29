#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSURFACEDATA.ahk" { DDSURFACEDATA }

/**
 * The DDFLIPOVERLAYINFO structure contains the flip information for the surface.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddflipoverlayinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDFLIPOVERLAYINFO {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsurfacedata">DDSURFACEDATA</a> structure that contains information about the current surface.
     */
    lpCurrentSurface : DDSURFACEDATA.Ptr

    /**
     * Points to a DDSURFACEDATA structure that contains information about the target surface.
     */
    lpTargetSurface : DDSURFACEDATA.Ptr

    /**
     * Specifies the polarity of the data in the field being flipped. One of the following flags is returned: 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDFLIP_EVEN
     * 
     * </td>
     * <td>
     * The target surface contains the even field of video data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDFLIP_ODD
     * 
     * </td>
     * <td>
     * The target surface contains the odd field of video data.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

}
