#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct BACKLIGHT_REDUCTION_GAMMA_RAMP {
    #StructPack 2

    R : UInt16[256]

    G : UInt16[256]

    B : UInt16[256]

}
