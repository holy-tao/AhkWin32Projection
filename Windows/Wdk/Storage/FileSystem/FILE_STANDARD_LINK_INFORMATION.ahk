#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_STANDARD_LINK_INFORMATION {
    #StructPack 4

    NumberOfAccessibleLinks : UInt32

    TotalNumberOfLinks : UInt32

    DeletePending : BOOLEAN

    Directory : BOOLEAN

}
