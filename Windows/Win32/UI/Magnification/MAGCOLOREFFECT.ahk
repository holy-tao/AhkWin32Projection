#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a color transformation matrix that a magnifier control uses to apply a color effect to magnified screen content.
 * @remarks
 * The values in the matrix are for red, blue, green, alpha, and color translation. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/gdiplus/-gdiplus-using-a-color-matrix-to-transform-a-single-color-use">Using a Color Matrix to Transform a Single Color</a> in the Windows GDI+ documentation.
 * @see https://learn.microsoft.com/windows/win32/api/magnification/ns-magnification-magcoloreffect
 * @namespace Windows.Win32.UI.Magnification
 */
class MAGCOLOREFFECT extends Win32Struct {
    static sizeof => 100

    static packingSize => 4

    /**
     * Type: <b>float [5] [5]</b>
     * 
     * The color transformation matrix.
     * @type {Array<Float>}
     */
    transform {
        get {
            if(!this.HasProp("__transformProxyArray"))
                this.__transformProxyArray := Win32FixedArray(this.ptr + 0, 25, Primitive, "float")
            return this.__transformProxyArray
        }
    }
}
