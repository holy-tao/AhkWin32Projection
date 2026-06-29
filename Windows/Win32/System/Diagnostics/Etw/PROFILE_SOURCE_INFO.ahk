#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct PROFILE_SOURCE_INFO {
    #StructPack 8

    NextEntryOffset : UInt32

    Source : UInt32

    MinInterval : UInt32

    MaxInterval : UInt32

    Reserved : Int64

    Description : WCHAR[1]

}
