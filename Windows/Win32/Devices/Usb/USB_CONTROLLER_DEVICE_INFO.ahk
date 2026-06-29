#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_CONTROLLER_DEVICE_INFO {
    #StructPack 4

    PciVendorId : UInt32

    PciDeviceId : UInt32

    PciRevision : UInt32

    NumberOfRootPorts : UInt32

    HcFeatureFlags : UInt32

}
