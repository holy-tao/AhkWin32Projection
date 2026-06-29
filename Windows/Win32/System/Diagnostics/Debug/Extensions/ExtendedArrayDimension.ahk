#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct ExtendedArrayDimension {
    #StructPack 8

    DimensionFlags : Int64

    LowerBound : Int64

    Length : Int64

    Stride : Int64

}
