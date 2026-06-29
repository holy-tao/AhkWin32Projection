#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_FS_VOLUME_INFORMATION {
    #StructPack 8

    VolumeCreationTime : Int64

    VolumeSerialNumber : UInt32

    VolumeLabelLength : UInt32

    SupportsObjects : BOOLEAN

    VolumeLabel : WCHAR[1]

}
