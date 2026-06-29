#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBSCAN_GET_DESCRIPTOR {
    #StructPack 2

    DescriptorType : Int8

    Index : Int8

    LanguageId : UInt16

}
