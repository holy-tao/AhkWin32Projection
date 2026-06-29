#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DUPLICATE_EXTENTS_DATA_EX {
    #StructPack 8

    Size : IntPtr

    FileHandle : HANDLE

    SourceFileOffset : Int64

    TargetFileOffset : Int64

    ByteCount : Int64

    Flags : UInt32

}
