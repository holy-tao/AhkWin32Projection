#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct POINTER_SEARCH_PHYSICAL {
    #StructPack 8

    Offset : Int64

    Length : Int64

    PointerMin : Int64

    PointerMax : Int64

    Flags : UInt32

    MatchOffsets : IntPtr

    MatchOffsetsSize : UInt32

    MatchOffsetsCount : UInt32

}
