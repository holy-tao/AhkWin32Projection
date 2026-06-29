#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIJOYSTATE2 {
    #StructPack 4

    lX : Int32

    lY : Int32

    lZ : Int32

    lRx : Int32

    lRy : Int32

    lRz : Int32

    rglSlider : Int32[2]

    rgdwPOV : UInt32[4]

    rgbButtons : Int8[128]

    lVX : Int32

    lVY : Int32

    lVZ : Int32

    lVRx : Int32

    lVRy : Int32

    lVRz : Int32

    rglVSlider : Int32[2]

    lAX : Int32

    lAY : Int32

    lAZ : Int32

    lARx : Int32

    lARy : Int32

    lARz : Int32

    rglASlider : Int32[2]

    lFX : Int32

    lFY : Int32

    lFZ : Int32

    lFRx : Int32

    lFRy : Int32

    lFRz : Int32

    rglFSlider : Int32[2]

}
