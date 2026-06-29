#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SET_DAX_ALLOC_ALIGNMENT_HINT_INPUT {
    #StructPack 8

    Flags : UInt32

    AlignmentShift : UInt32

    FileOffsetToAlign : Int64

    FallbackAlignmentShift : UInt32

}
