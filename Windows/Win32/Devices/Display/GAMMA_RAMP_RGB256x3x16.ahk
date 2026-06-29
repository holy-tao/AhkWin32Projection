#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct GAMMA_RAMP_RGB256x3x16 {
    #StructPack 2

    Red : UInt16[256]

    Green : UInt16[256]

    Blue : UInt16[256]

}
