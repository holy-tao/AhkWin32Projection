#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_FS_ATTRIBUTE_INFORMATION {
    #StructPack 4

    FileSystemAttributes : UInt32

    MaximumComponentNameLength : Int32

    FileSystemNameLength : UInt32

    FileSystemName : WCHAR[1]

}
