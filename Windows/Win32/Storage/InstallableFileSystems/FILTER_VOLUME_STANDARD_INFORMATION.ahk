#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_FILESYSTEM_TYPE.ahk" { FLT_FILESYSTEM_TYPE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
export default struct FILTER_VOLUME_STANDARD_INFORMATION {
    #StructPack 4

    NextEntryOffset : UInt32

    Flags : UInt32

    FrameID : UInt32

    FileSystemType : FLT_FILESYSTEM_TYPE

    FilterVolumeNameLength : UInt16

    FilterVolumeName : WCHAR[1]

}
