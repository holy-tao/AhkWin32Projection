#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIRECTSOUNDDEVICE_TYPE.ahk" { DIRECTSOUNDDEVICE_TYPE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIRECTSOUNDDEVICE_DATAFLOW.ahk" { DIRECTSOUNDDEVICE_DATAFLOW }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA {
    #StructPack 8

    Type : DIRECTSOUNDDEVICE_TYPE

    DataFlow : DIRECTSOUNDDEVICE_DATAFLOW

    DeviceId : Guid

    Description : PWSTR

    Module : PWSTR

    Interface : PWSTR

    WaveDeviceId : UInt32

}
