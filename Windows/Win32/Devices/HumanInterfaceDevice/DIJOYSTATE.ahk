#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIJOYSTATE {
    #StructPack 4

    lX : Int32

    lY : Int32

    lZ : Int32

    lRx : Int32

    lRy : Int32

    lRz : Int32

    rglSlider : Int32[2]

    rgdwPOV : UInt32[4]

    rgbButtons : Int8[32]

}
