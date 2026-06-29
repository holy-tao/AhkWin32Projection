#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct USN_RECORD {
    #StructPack 8

    RecordLength : UInt32

    MajorVersion : UInt16

    MinorVersion : UInt16

    FileReferenceNumber : Int64

    ParentFileReferenceNumber : Int64

    Usn : Int64

    TimeStamp : Int64

    Reason : UInt32

    SourceInfo : UInt32

    SecurityId : UInt32

    FileAttributes : UInt32

    FileNameLength : UInt16

    FileNameOffset : UInt16

    FileName : WCHAR[1]

}
