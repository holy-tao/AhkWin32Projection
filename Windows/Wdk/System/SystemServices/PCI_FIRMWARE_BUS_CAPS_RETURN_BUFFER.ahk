#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_FIRMWARE_BUS_CAPS_RETURN_BUFFER {
    #StructPack 8

    Version : UInt16

    Status : UInt16

    Length : UInt32

    Caps : IntPtr

}
