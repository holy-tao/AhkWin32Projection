#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_LAYOUT_NAME_ENTRY {
    #StructPack 8

    NextNameOffset : UInt32

    Flags : UInt32

    ParentFileReferenceNumber : Int64

    FileNameLength : UInt32

    Reserved : UInt32

    FileName : WCHAR[1]

}
