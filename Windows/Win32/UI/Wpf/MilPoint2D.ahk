#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an x- and y-coordinate pair in two-dimensional space.M
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/ns-mileffects-milpoint2d
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct MilPoint2D {
    #StructPack 8

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The x-coordinate value of the point.
     */
    X : Float64

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The y-coordinate value of the point.
     */
    Y : Float64

}
