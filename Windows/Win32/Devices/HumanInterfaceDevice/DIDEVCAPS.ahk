#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIDEVCAPS {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    dwDevType : UInt32

    dwAxes : UInt32

    dwButtons : UInt32

    dwPOVs : UInt32

    dwFFSamplePeriod : UInt32

    dwFFMinTimeResolution : UInt32

    dwFirmwareRevision : UInt32

    dwHardwareRevision : UInt32

    dwFFDriverVersion : UInt32

}
