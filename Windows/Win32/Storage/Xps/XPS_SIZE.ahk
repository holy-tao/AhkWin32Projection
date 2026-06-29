#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the size of an object.
 * @remarks
 * The measurement units are not specified in the structure.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_size
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_SIZE {
    #StructPack 4

    /**
     * A non-negative value that represents the  object's size in the horizontal (x) dimension.
     */
    width : Float32

    /**
     * A non-negative value that represents the  object's size in the vertical (y) dimension.
     */
    height : Float32

}
