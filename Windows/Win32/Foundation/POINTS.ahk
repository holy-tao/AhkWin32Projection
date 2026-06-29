#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The POINTS structure defines the x- and y-coordinates of a point.
 * @remarks
 * The POINTS structure is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-point">POINT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structures. The difference is that the members of the POINTS structure are of type SHORT, while those of the other two structures are of type LONG.
 * @see https://learn.microsoft.com/windows/win32/api/windef/ns-windef-points
 * @namespace Windows.Win32.Foundation
 */
export default struct POINTS {
    #StructPack 2

    /**
     * Specifies the <i>x</i>-coordinate of the point.
     */
    x : Int16

    /**
     * Specifies the <i>y</i>-coordinate of the point.
     */
    y : Int16

}
