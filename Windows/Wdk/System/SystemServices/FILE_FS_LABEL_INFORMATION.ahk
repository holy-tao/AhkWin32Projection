#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_FS_LABEL_INFORMATION {
    #StructPack 4

    VolumeLabelLength : UInt32

    VolumeLabel : WCHAR[1]

}
