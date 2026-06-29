#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLFS_LOG_NAME_INFORMATION {
    #StructPack 2

    NameLengthInBytes : UInt16

    Name : WCHAR[1]

}
