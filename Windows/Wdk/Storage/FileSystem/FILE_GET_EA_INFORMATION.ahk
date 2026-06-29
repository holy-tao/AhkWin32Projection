#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_GET_EA_INFORMATION {
    #StructPack 4

    NextEntryOffset : UInt32

    EaNameLength : Int8

    EaName : CHAR[1]

}
