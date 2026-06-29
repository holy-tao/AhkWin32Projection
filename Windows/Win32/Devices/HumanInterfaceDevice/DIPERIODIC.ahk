#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIPERIODIC {
    #StructPack 4

    dwMagnitude : UInt32

    lOffset : Int32

    dwPhase : UInt32

    dwPeriod : UInt32

}
