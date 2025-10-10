#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDFLIPVIDEOPORTINFO structure contains the video port extensions (VPE) object and surface information.
 * @see https://docs.microsoft.com/windows/win32/api//dxmini/ns-dxmini-ddflipvideoportinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDFLIPVIDEOPORTINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddvideoportdata">DDVIDEOPORTDATA</a> structure that contains the VPE object information.
     * @type {Pointer<DDVIDEOPORTDATA>}
     */
    lpVideoPortData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsurfacedata">DDSURFACEDATA</a> structure that contains information about the current surface.
     * @type {Pointer<DDSURFACEDATA>}
     */
    lpCurrentSurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to a DDSURFACEDATA structure that contains information about the target surface.
     * @type {Pointer<DDSURFACEDATA>}
     */
    lpTargetSurface {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

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
     * @type {Integer}
     */
    dwFlipVPFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
