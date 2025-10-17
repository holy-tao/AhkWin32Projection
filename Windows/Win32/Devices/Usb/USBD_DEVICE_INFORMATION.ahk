#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_DEVICE_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBD_DEVICE_INFORMATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    OffsetNext {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    UsbdDeviceHandle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {USB_DEVICE_DESCRIPTOR}
     */
    DeviceDescriptor{
        get {
            if(!this.HasProp("__DeviceDescriptor"))
                this.__DeviceDescriptor := USB_DEVICE_DESCRIPTOR(16, this)
            return this.__DeviceDescriptor
        }
    }
}
