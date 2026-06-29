#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_DEVICE_DESCRIPTOR.ahk" { USB_DEVICE_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBD_DEVICE_INFORMATION {
    #StructPack 8

    OffsetNext : UInt32

    UsbdDeviceHandle : IntPtr

    DeviceDescriptor : USB_DEVICE_DESCRIPTOR

}
