#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * The CLIPOBJ structure describes the clip region used when drawing.
 * @remarks
 * The region, described by CLIPOBJ, can be enumerated as a series of rectangles.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-clipobj
 * @namespace Windows.Win32.Devices.Display
 */
export default struct CLIPOBJ {
    #StructPack 4

    /**
     * Specifies a value that uniquely identifies the clip region. If <b>iUniq</b> is nonzero, the driver uses it as a cache identifier. This allows the driver to recognize a region after downloading and caching it. If the value is zero, the driver should not cache the region because the region will not be used again.
     */
    iUniq : UInt32

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that bounds the part of the region that intersects the drawing. If <b>iDComplexity</b> is DC_RECT, then this is the clipping rectangle to be considered.
     */
    rclBounds : RECTL

    iDComplexity : Int8

    iFComplexity : Int8

    iMode : Int8

    /**
     * Specifies clipping options. This member can be the following value:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * OC_BANK_CLIP
     * 
     * </td>
     * <td>
     * <b>Obsolete</b>. Indicates an engine callback for a banked device.
     * 
     * </td>
     * </tr>
     * </table>
     */
    fjOptions : Int8

}
