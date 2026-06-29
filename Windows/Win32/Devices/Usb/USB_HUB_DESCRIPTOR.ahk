#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_HUB_DESCRIPTOR {
    #StructPack 2

    bDescriptorLength : Int8

    bDescriptorType : Int8

    bNumberOfPorts : Int8

    wHubCharacteristics : UInt16

    bPowerOnToPowerGood : Int8

    bHubControlCurrent : Int8

    bRemoveAndPowerMask : Int8[64]

}
