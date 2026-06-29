#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SIZE structure defines the width and height of a rectangle.
 * @remarks
 * The rectangle dimensions stored in this structure can correspond to viewport extents, window extents, text extents, bitmap dimensions, or the aspect-ratio filter for some extended functions.
 * @see https://learn.microsoft.com/windows/win32/api/windef/ns-windef-size
 * @namespace Windows.Win32.Foundation
 */
export default struct SIZE {
    #StructPack 4

    /**
     * Specifies the rectangle's width. The units depend on which function uses this structure.
     */
    cx : Int32

    /**
     * Specifies the rectangle's height. The units depend on which function uses this structure.
     */
    cy : Int32

}
