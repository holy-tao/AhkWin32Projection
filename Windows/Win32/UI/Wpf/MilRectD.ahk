#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the width, height, and location of a rectangle.M
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/ns-mileffects-milrectd
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct MilRectD {
    #StructPack 8

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The location of the rectangle's left side.
     */
    left : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The location of the rectangle's top side.
     */
    top : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The location of the rectangle's right side.
     */
    right : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The location of the rectangle's bottom side.
     */
    bottom : Float64

}
