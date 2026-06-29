#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @architecture X64, Arm64
 */
export default struct DUPLICATE_EXTENTS_DATA32 {
    #StructPack 8

    FileHandle : UInt32

    SourceFileOffset : Int64

    TargetFileOffset : Int64

    ByteCount : Int64

}
