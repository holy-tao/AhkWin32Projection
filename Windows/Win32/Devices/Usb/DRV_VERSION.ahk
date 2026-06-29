#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct DRV_VERSION {
    #StructPack 4

    major : UInt32

    minor : UInt32

    internal : UInt32

}
