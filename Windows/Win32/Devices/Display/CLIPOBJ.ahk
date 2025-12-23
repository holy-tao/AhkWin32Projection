#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * The CLIPOBJ structure describes the clip region used when drawing.
 * @remarks
 * The region, described by CLIPOBJ, can be enumerated as a series of rectangles.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-clipobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class CLIPOBJ extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Specifies a value that uniquely identifies the clip region. If <b>iUniq</b> is nonzero, the driver uses it as a cache identifier. This allows the driver to recognize a region after downloading and caching it. If the value is zero, the driver should not cache the region because the region will not be used again.
     * @type {Integer}
     */
    iUniq {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that bounds the part of the region that intersects the drawing. If <b>iDComplexity</b> is DC_RECT, then this is the clipping rectangle to be considered.
     * @type {RECTL}
     */
    rclBounds{
        get {
            if(!this.HasProp("__rclBounds"))
                this.__rclBounds := RECTL(4, this)
            return this.__rclBounds
        }
    }

    /**
     * 
     * @type {Integer}
     */
    iDComplexity {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    iFComplexity {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * 
     * @type {Integer}
     */
    iMode {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }

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
     * @type {Integer}
     */
    fjOptions {
        get => NumGet(this, 23, "char")
        set => NumPut("char", value, this, 23)
    }
}
