#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_LUT_RGB256WORDS {
    #StructPack 2

    Red : UInt16[256]

    Green : UInt16[256]

    Blue : UInt16[256]

}
