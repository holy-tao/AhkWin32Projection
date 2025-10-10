#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDSKIPNEXTFIELDINFO structure contains the skip information for the video port extensions (VPE) object.
 * @see https://docs.microsoft.com/windows/win32/api//dxmini/ns-dxmini-ddskipnextfieldinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDSKIPNEXTFIELDINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddvideoportdata">DDVIDEOPORTDATA</a> structure that represents the VPE object.
     * @type {Pointer<DDVIDEOPORTDATA>}
     */
    lpVideoPortData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Indicates whether to skip the next field. One of the following: 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDSKIP_ENABLENEXT
     * 
     * </td>
     * <td>
     * The next field should be restored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDSKIP_SKIPNEXT
     * 
     * </td>
     * <td>
     * The next field should be skipped.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwSkipFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
