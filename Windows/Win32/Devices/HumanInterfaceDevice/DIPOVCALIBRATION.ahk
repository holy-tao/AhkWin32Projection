#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIPOVCALIBRATION {
    #StructPack 4

    lMin : Int32[5]

    lMax : Int32[5]

}
