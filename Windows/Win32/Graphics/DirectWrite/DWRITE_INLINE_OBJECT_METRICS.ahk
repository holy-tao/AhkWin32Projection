#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains properties describing the geometric measurement of an application-defined inline object.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_inline_object_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_INLINE_OBJECT_METRICS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The width of the inline object.
     * @type {Float}
     */
    width {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The height of the inline object.
     * @type {Float}
     */
    height {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The distance from the top of the object to the point where it is lined up with the adjacent text. 
     *      If the baseline is at the bottom, then <b>baseline</b> simply equals <b>height</b>.
     * @type {Float}
     */
    baseline {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A Boolean flag that indicates whether the object is to be placed upright or alongside the text baseline for vertical text.
     * @type {Integer}
     */
    supportsSideways {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
