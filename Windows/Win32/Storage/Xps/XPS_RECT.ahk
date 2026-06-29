#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the width, height, and location of a rectangle. (XPS_RECT)
 * @remarks
 * The measurement units depend on the context and are not specified in the structure.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_rect
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_RECT {
    #StructPack 4

    /**
     * The x-coordinate of the rectangle's left side.
     */
    x : Float32

    /**
     * The y-coordinate of the rectangle's top side.
     */
    y : Float32

    /**
     * A non-negative value that represents the  object's size in the horizontal (x) dimension.
     */
    width : Float32

    /**
     * A non-negative value that represents the  object's size in the vertical (y) dimension.
     */
    height : Float32

}
