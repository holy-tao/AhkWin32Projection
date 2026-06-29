#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_FILESYSTEM_INFO {
    #StructPack 4

    FileSystemType : WCHAR[64]

    VolumeName : WCHAR[256]

    SerialNumber : UInt32

}
