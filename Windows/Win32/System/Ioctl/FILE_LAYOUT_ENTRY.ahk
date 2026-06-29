#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_LAYOUT_ENTRY {
    #StructPack 8

    Version : UInt32

    NextFileOffset : UInt32

    Flags : UInt32

    FileAttributes : UInt32

    FileReferenceNumber : Int64

    FirstNameOffset : UInt32

    FirstStreamOffset : UInt32

    ExtraInfoOffset : UInt32

    ExtraInfoLength : UInt32

}
