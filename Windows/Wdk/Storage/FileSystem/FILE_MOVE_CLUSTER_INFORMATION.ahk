#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_MOVE_CLUSTER_INFORMATION {
    #StructPack 8

    ClusterCount : UInt32

    RootDirectory : HANDLE

    FileNameLength : UInt32

    FileName : WCHAR[1]

}
