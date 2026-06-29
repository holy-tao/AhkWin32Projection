#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STREAM_LAYOUT_ENTRY {
    #StructPack 8

    Version : UInt32

    NextStreamOffset : UInt32

    Flags : UInt32

    ExtentInformationOffset : UInt32

    AllocationSize : Int64

    EndOfFile : Int64

    StreamInformationOffset : UInt32

    AttributeTypeCode : UInt32

    AttributeFlags : UInt32

    StreamIdentifierLength : UInt32

    StreamIdentifier : WCHAR[1]

}
