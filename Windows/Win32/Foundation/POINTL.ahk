#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The POINTL structure defines the x- and y-coordinates of a point.
 * @remarks
 * The POINTL structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-point">POINT</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/windef/ns-windef-pointl
 * @namespace Windows.Win32.Foundation
 */
export default struct POINTL {
    #StructPack 4

    /**
     * Specifies the <i>x</i>-coordinate of the point.
     */
    x : Int32

    /**
     * Specifies the <i>y</i>-coordinate of the point.
     */
    y : Int32


    /**
     * Many Win32 APIs take points as 64-bit integer value types.
     * This will return the POINT in a compatible format
     */
    Value => NumGet(this, "uint64")
    
    ToString() {
        return Format("({1}, {2})", this.x, this.y)
    }
    
}
