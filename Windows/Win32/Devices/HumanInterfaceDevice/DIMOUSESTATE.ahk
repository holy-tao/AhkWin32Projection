#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIMOUSESTATE {
    #StructPack 4

    lX : Int32

    lY : Int32

    lZ : Int32

    rgbButtons : Int8[4]

}
