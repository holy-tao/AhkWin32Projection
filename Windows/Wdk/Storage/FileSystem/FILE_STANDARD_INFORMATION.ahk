#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_STANDARD_INFORMATION {
    #StructPack 8

    AllocationSize : Int64

    EndOfFile : Int64

    NumberOfLinks : UInt32

    DeletePending : BOOLEAN

    Directory : BOOLEAN

}
