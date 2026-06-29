#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_PIPE_WAIT_FOR_BUFFER {
    #StructPack 8

    Timeout : Int64

    NameLength : UInt32

    TimeoutSpecified : BOOLEAN

    Name : WCHAR[1]

}
