#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIRECTSOUNDDEVICE_TYPE.ahk" { DIRECTSOUNDDEVICE_TYPE }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIRECTSOUNDDEVICE_DATAFLOW.ahk" { DIRECTSOUNDDEVICE_DATAFLOW }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A_DATA {
    #StructPack 8

    Type : DIRECTSOUNDDEVICE_TYPE

    DataFlow : DIRECTSOUNDDEVICE_DATAFLOW

    DeviceId : Guid

    Description : PSTR

    Module : PSTR

    Interface : PSTR

    WaveDeviceId : UInt32

}
