#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDFLIPOVERLAYINFO structure contains the flip information for the surface.
 * @see https://docs.microsoft.com/windows/win32/api//dxmini/ns-dxmini-ddflipoverlayinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDFLIPOVERLAYINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsurfacedata">DDSURFACEDATA</a> structure that contains information about the current surface.
     * @type {Pointer<DDSURFACEDATA>}
     */
    lpCurrentSurface {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to a DDSURFACEDATA structure that contains information about the target surface.
     * @type {Pointer<DDSURFACEDATA>}
     */
    lpTargetSurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
