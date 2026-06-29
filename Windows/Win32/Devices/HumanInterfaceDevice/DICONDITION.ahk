#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DICONDITION {
    #StructPack 4

    lOffset : Int32

    lPositiveCoefficient : Int32

    lNegativeCoefficient : Int32

    dwPositiveSaturation : UInt32

    dwNegativeSaturation : UInt32

    lDeadBand : Int32

}
