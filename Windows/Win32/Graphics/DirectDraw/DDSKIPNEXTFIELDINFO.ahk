#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDVIDEOPORTDATA.ahk" { DDVIDEOPORTDATA }

/**
 * The DDSKIPNEXTFIELDINFO structure contains the skip information for the video port extensions (VPE) object.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddskipnextfieldinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDSKIPNEXTFIELDINFO {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddvideoportdata">DDVIDEOPORTDATA</a> structure that represents the VPE object.
     */
    lpVideoPortData : DDVIDEOPORTDATA.Ptr

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
     */
    dwSkipFlags : UInt32

}
