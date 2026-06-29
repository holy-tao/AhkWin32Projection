#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct INDICATOR_LIST {
    #StructPack 2

    MakeCode : UInt16

    IndicatorFlags : UInt16

}
