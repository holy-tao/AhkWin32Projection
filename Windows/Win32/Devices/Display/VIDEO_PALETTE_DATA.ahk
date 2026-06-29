#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_PALETTE_DATA {
    #StructPack 2

    NumEntries : UInt16

    FirstEntry : UInt16

    Colors : UInt16[1]

}
