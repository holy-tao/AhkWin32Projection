#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct ALTERNATE_INTERFACE {
    #StructPack 2

    InterfaceNumber : UInt16

    AlternateInterfaceNumber : UInt16

}
