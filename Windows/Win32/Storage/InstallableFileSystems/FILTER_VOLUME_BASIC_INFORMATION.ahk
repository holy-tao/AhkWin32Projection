#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
export default struct FILTER_VOLUME_BASIC_INFORMATION {
    #StructPack 2

    FilterVolumeNameLength : UInt16

    FilterVolumeName : WCHAR[1]

}
