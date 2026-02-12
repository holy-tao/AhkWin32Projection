#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Identifies the Human Interface Device (HID) usage details for the input device.
  * 
  * A Human Interface Device (HID) usage describes what a Human Interface Device (HID)-compliant control is measuring or reporting and can also indicate the control's intended use. A specific control usage is defined by its usage page, a usage ID, a name, and a description.
 * @remarks
 * A Human Interface Device (HID) usage describes what a Human Interface Device (HID)-compliant control is measuring or reporting and can also indicate the control's intended use. A specific control usage is defined by its usage page, a usage ID, a name, and a description. For more info, see [Device Class Definition for HID 1.11](https://www.usb.org/document-library/device-class-definition-hid-111).
 * 
 * > [!NOTE]
 * > The core of the Microsoft interactive input device architecture is based on the Universal Serial Bus (USB) standard Device Class Definition for Human Interface Device (HID), which is defined by the [ Implementers Forum, Inc.](https://www.usb.org/home)
 * 
 * The Universal Serial Bus (USB) Human Interface Device (HID) standard defines the configuration and communication protocols for Human Interface Device (HID), such as keyboards, mouse devices, joysticks, and virtual reality devices, that humans use to enter data directly into a computer. (For detailed information about the USB HID standard, see the [USB Implementers Forum](https://www.usb.org/home) website.)
 * 
 * Although the core of the Windows input architecture is based on the Universal Serial Bus (USB) Human Interface Device (HID) standard, the architecture is not limited to Universal Serial Bus (USB) devices. The input architecture also supports serial port devices, i8042 port devices, and proprietary input devices.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.pointerdeviceusage
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class PointerDeviceUsage extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * The Human Interface Device (HID) usage page of the pointer device. Human Interface Device (HID) usages are organized into usage pages that specify classes of related devices. For example, touch digitizers (0x0D) and generic input (0x01).
     * @type {Integer}
     */
    UsagePage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The Human Interface Device (HID) pointer device usage ID that specifies a device or property in the **UsagePage**. For example, 0x04 indicates a touch screen device and 0x47 indicates touch confidence.
     * 
     * > [!NOTE]
     * > A usage ID of zero is reserved.
     * @type {Integer}
     */
    Usage {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The minimum logical value for **Usage**.
     * @type {Integer}
     */
    MinLogical {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The maximum logical value for **Usage**.
     * @type {Integer}
     */
    MaxLogical {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The minimum physical value for **Usage**.
     * @type {Integer}
     */
    MinPhysical {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The maximum physical value for **Usage**.
     * @type {Integer}
     */
    MaxPhysical {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The Human Interface Device (HID) unit of measure.
     * @type {Integer}
     */
    Unit {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The multiplier used to convert the usage value reported by the device to a physical value in units of **Unit**. (Valid only for usages that indicate a static or dynamic value associated with a control, such as pressure or width and height of the touch contact.)
     * @type {Float}
     */
    PhysicalMultiplier {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }
}
