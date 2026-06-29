#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
export default struct FILTER_FULL_INFORMATION {
    #StructPack 4

    NextEntryOffset : UInt32

    FrameID : UInt32

    NumberOfInstances : UInt32

    FilterNameLength : UInt16

    FilterNameBuffer : WCHAR[1]

}
