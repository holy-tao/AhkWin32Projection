#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that indicate the recipient of a USB control transfer. The recipient is defined in the setup packet of the control request. See Table 9.2 of section 9.3 of the Universal Serial Bus (USB) specification (www.usb.org).
 * @remarks
 * For conceptual information about USB control transfers, see "About the default endpoint" and "Layout of a control transfer" in [How to send a USB control transfer](/windows-hardware/drivers/ddi/content/index).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbcontrolrecipient
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbControlRecipient extends Win32Enum{

    /**
     * The recipient of the control transfer is the device.
     * @type {Integer (Int32)}
     */
    static Device => 0

    /**
     * The recipient of the control transfer is the USB interface that is specified in the request.
     * @type {Integer (Int32)}
     */
    static SpecifiedInterface => 1

    /**
     * The recipient of the control transfer is an endpoint.
     * @type {Integer (Int32)}
     */
    static Endpoint => 2

    /**
     * The recipient of the control transfer is other.
     * @type {Integer (Int32)}
     */
    static Other => 3

    /**
     * The recipient of the control transfer is the default (or the first) USB interface in the selected configuration of the device.If the recipient is the first interface of the active configuration ([DefaultInterface](usbdevice_defaultinterface.md)), [SendControlInTransferAsync](usbdevice_sendcontrolintransferasync_609557051.md) and [SendControlOutTransferAsync](usbdevice_sendcontrolouttransferasync_2044496736.md) methods overwrite the low byte of [UsbSetupPacket.Index](usbsetuppacket_index.md) with the interface number of the default interface.
     * 
     * By using this value, an app can omit the interface number in an interface-recipient request.
     * @type {Integer (Int32)}
     */
    static DefaultInterface => 4
}
