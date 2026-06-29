#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EDeviceControlUseType.ahk" { EDeviceControlUseType }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIOENGINE_DEVICECONTROLS {
    #StructPack 4

    Volume : EDeviceControlUseType

    Mute : EDeviceControlUseType

    PeakMeter : EDeviceControlUseType

}
