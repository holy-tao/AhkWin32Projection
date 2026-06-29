#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VOLUME_NUMBER {
    #StructPack 4

    VolumeNumber : UInt32

    VolumeManagerName : WCHAR[8]

}
