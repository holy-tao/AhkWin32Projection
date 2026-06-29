#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIRECTSOUNDDEVICE_TYPE.ahk" { DIRECTSOUNDDEVICE_TYPE }
#Import ".\DIRECTSOUNDDEVICE_DATAFLOW.ahk" { DIRECTSOUNDDEVICE_DATAFLOW }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA {
    #StructPack 4

    DeviceId : Guid

    DescriptionA : CHAR[256]

    DescriptionW : WCHAR[256]

    ModuleA : CHAR[260]

    ModuleW : WCHAR[260]

    Type : DIRECTSOUNDDEVICE_TYPE

    DataFlow : DIRECTSOUNDDEVICE_DATAFLOW

    WaveDeviceId : UInt32

    Devnode : UInt32

}
