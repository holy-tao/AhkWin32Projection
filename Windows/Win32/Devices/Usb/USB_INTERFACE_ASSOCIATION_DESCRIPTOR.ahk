#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_INTERFACE_ASSOCIATION_DESCRIPTOR {
    #StructPack 1

    bLength : Int8

    bDescriptorType : Int8

    bFirstInterface : Int8

    bInterfaceCount : Int8

    bFunctionClass : Int8

    bFunctionSubClass : Int8

    bFunctionProtocol : Int8

    iFunction : Int8

}
