#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an x- and y-coordinate pair in two-dimensional space. (XPS_POINT)
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_point
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_POINT {
    #StructPack 4

    /**
     * The x-coordinate of a point.
     */
    x : Float32

    /**
     * The y-coordinate of a point.
     */
    y : Float32

}
