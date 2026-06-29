#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct JOYCALIBRATE {
    #StructPack 4

    wXbase : UInt32

    wXdelta : UInt32

    wYbase : UInt32

    wYdelta : UInt32

    wZbase : UInt32

    wZdelta : UInt32

}
