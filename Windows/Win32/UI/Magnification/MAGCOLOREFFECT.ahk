#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a color transformation matrix that a magnifier control uses to apply a color effect to magnified screen content.
 * @remarks
 * The values in the matrix are for red, blue, green, alpha, and color translation. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/gdiplus/-gdiplus-using-a-color-matrix-to-transform-a-single-color-use">Using a Color Matrix to Transform a Single Color</a> in the Windows GDI+ documentation.
 * @see https://learn.microsoft.com/windows/win32/api/magnification/ns-magnification-magcoloreffect
 * @namespace Windows.Win32.UI.Magnification
 */
export default struct MAGCOLOREFFECT {
    #StructPack 4

    /**
     * Type: <b>float [5] [5]</b>
     * 
     * The color transformation matrix.
     */
    transform : Float32[25]

}
