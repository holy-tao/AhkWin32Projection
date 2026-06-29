#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_FULL_EA_INFORMATION {
    #StructPack 4

    NextEntryOffset : UInt32

    Flags : Int8

    EaNameLength : Int8

    EaValueLength : UInt16

    EaName : CHAR[1]

}
