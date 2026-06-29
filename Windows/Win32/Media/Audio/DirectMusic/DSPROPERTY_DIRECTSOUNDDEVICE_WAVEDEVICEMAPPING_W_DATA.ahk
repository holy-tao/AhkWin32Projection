#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIRECTSOUNDDEVICE_DATAFLOW.ahk" { DIRECTSOUNDDEVICE_DATAFLOW }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_W_DATA {
    #StructPack 8

    DeviceName : PWSTR

    DataFlow : DIRECTSOUNDDEVICE_DATAFLOW

    DeviceId : Guid

}
