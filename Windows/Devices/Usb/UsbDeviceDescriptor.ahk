#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbDeviceDescriptor.ahk
#Include ..\..\..\Guid.ahk

/**
 * Derives information from the USB device descriptor of the device. For an explanation of the device descriptor, see Table 9.8 in the Universal Serial Bus Specification.
 * @remarks
 * The UsbDeviceDescriptor class does not include manufacturer, product, and serial number strings that are included in a device-defined descriptor. You can obtain those strings by using the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) namespace. For information about a USB device descriptor, see the top portion of this topic: [USB device descriptors](/windows-hardware/drivers/ddi/content/index).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevicedescriptor
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbDeviceDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbDeviceDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbDeviceDescriptor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the **bcdUSB** field of the USB device descriptor. The value indicates the version of the USB specification to which the device conforms.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevicedescriptor.bcdusb
     * @type {Integer} 
     */
    BcdUsb {
        get => this.get_BcdUsb()
    }

    /**
     * Gets the **bMaxPacketSize0** field of the USB device descriptor. The value indicates the maximum packet size, in bytes, for endpoint zero of the device. This value can be 8, 16, 32, or 64.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevicedescriptor.maxpacketsize0
     * @type {Integer} 
     */
    MaxPacketSize0 {
        get => this.get_MaxPacketSize0()
    }

    /**
     * Gets the **idVendor** field of the USB device descriptor. The value indicates the vendor identifier for the device as assigned by the USB specification committee.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevicedescriptor.vendorid
     * @type {Integer} 
     */
    VendorId {
        get => this.get_VendorId()
    }

    /**
     * Gets the **idProduct** field of the USB device descriptor. This value indicates the device-specific product identifier and is assigned by the manufacturer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevicedescriptor.productid
     * @type {Integer} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * Gets the **bcdDeviceRevision** field of the USB device descriptor. The value indicates the revision number defined by the device and is a binary-coded decimal number.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevicedescriptor.bcddevicerevision
     * @type {Integer} 
     */
    BcdDeviceRevision {
        get => this.get_BcdDeviceRevision()
    }

    /**
     * Gets the **bNumConfigurations** field of the USB device descriptor. The value indicates the total count of USB configurations supported by the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbdevicedescriptor.numberofconfigurations
     * @type {Integer} 
     */
    NumberOfConfigurations {
        get => this.get_NumberOfConfigurations()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BcdUsb() {
        if (!this.HasProp("__IUsbDeviceDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbDeviceDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDeviceDescriptor := IUsbDeviceDescriptor(outPtr)
        }

        return this.__IUsbDeviceDescriptor.get_BcdUsb()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPacketSize0() {
        if (!this.HasProp("__IUsbDeviceDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbDeviceDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDeviceDescriptor := IUsbDeviceDescriptor(outPtr)
        }

        return this.__IUsbDeviceDescriptor.get_MaxPacketSize0()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VendorId() {
        if (!this.HasProp("__IUsbDeviceDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbDeviceDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDeviceDescriptor := IUsbDeviceDescriptor(outPtr)
        }

        return this.__IUsbDeviceDescriptor.get_VendorId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProductId() {
        if (!this.HasProp("__IUsbDeviceDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbDeviceDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDeviceDescriptor := IUsbDeviceDescriptor(outPtr)
        }

        return this.__IUsbDeviceDescriptor.get_ProductId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BcdDeviceRevision() {
        if (!this.HasProp("__IUsbDeviceDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbDeviceDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDeviceDescriptor := IUsbDeviceDescriptor(outPtr)
        }

        return this.__IUsbDeviceDescriptor.get_BcdDeviceRevision()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfConfigurations() {
        if (!this.HasProp("__IUsbDeviceDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbDeviceDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbDeviceDescriptor := IUsbDeviceDescriptor(outPtr)
        }

        return this.__IUsbDeviceDescriptor.get_NumberOfConfigurations()
    }

;@endregion Instance Methods
}
