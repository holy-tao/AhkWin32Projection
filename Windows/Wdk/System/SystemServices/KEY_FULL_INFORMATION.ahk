#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KEY_FULL_INFORMATION {
    #StructPack 8

    LastWriteTime : Int64

    TitleIndex : UInt32

    ClassOffset : UInt32

    ClassLength : UInt32

    SubKeys : UInt32

    MaxNameLen : UInt32

    MaxClassLen : UInt32

    Values : UInt32

    MaxValueNameLen : UInt32

    MaxValueDataLen : UInt32

    Class : WCHAR[1]

}
