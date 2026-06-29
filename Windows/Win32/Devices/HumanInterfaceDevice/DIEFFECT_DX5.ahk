#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIENVELOPE.ahk" { DIENVELOPE }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIEFFECT_DX5 {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    dwDuration : UInt32

    dwSamplePeriod : UInt32

    dwGain : UInt32

    dwTriggerButton : UInt32

    dwTriggerRepeatInterval : UInt32

    cAxes : UInt32

    rgdwAxes : IntPtr

    rglDirection : IntPtr

    lpEnvelope : DIENVELOPE.Ptr

    cbTypeSpecificParams : UInt32

    lpvTypeSpecificParams : IntPtr

}
