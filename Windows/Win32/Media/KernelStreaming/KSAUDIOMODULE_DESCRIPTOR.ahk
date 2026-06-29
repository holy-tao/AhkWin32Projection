#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIOMODULE_DESCRIPTOR {
    #StructPack 4

    ClassId : Guid

    InstanceId : UInt32

    VersionMajor : UInt32

    VersionMinor : UInt32

    Name : WCHAR[128]

}
