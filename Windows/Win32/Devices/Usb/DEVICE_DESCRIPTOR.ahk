#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct DEVICE_DESCRIPTOR {
    #StructPack 2

    usVendorId : UInt16

    usProductId : UInt16

    usBcdDevice : UInt16

    usLanguageId : UInt16

}
