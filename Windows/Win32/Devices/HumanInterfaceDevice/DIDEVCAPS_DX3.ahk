#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIDEVCAPS_DX3 {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    dwDevType : UInt32

    dwAxes : UInt32

    dwButtons : UInt32

    dwPOVs : UInt32

}
