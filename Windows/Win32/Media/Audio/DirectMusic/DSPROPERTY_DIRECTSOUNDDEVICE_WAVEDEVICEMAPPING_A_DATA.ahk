#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIRECTSOUNDDEVICE_DATAFLOW.ahk" { DIRECTSOUNDDEVICE_DATAFLOW }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_A_DATA {
    #StructPack 8

    DeviceName : PSTR

    DataFlow : DIRECTSOUNDDEVICE_DATAFLOW

    DeviceId : Guid

}
