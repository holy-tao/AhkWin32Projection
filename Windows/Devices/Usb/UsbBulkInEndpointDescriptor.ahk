#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbBulkInEndpointDescriptor.ahk
#Include ..\..\..\Guid.ahk

/**
 * The endpoint descriptor for a USB bulk IN endpoint. The descriptor specifies the endpoint type, direction, number and also the maximum number of bytes that can be read from the endpoint, in a single transfer.
 * @remarks
 * **JavaScript (Usage)**
 * 
 * 
 * 
 * ```
 * var descriptorBulkInEp = device.defaultInterface.descriptors.getAt(1);
 * var usbEndpointDescriptor = Windows.Devices.Usb.UsbEndpointDescriptor.parse(descriptorBulkInEp);
 * var usbBulkInEndpointDescriptor = usbEndpointDescriptor.asBulkInEndpointDescriptor();
 * 
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkinendpointdescriptor
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbBulkInEndpointDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbBulkInEndpointDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbBulkInEndpointDescriptor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the maximum number of bytes that can be sent to or received from this endpoint, in a single packet.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkinendpointdescriptor.maxpacketsize
     * @type {Integer} 
     */
    MaxPacketSize {
        get => this.get_MaxPacketSize()
    }

    /**
     * Gets the USB endpoint number of the bulk IN endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkinendpointdescriptor.endpointnumber
     * @type {Integer} 
     */
    EndpointNumber {
        get => this.get_EndpointNumber()
    }

    /**
     * Gets the object that represents the pipe that the host opens to communicate with the bulk IN endpoint.
     * @remarks
     * If the alternate setting, which defines this bulk endpoint, is not currently selected, the property returns NULL.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkinendpointdescriptor.pipe
     * @type {UsbBulkInPipe} 
     */
    Pipe {
        get => this.get_Pipe()
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
    get_MaxPacketSize() {
        if (!this.HasProp("__IUsbBulkInEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbBulkInEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkInEndpointDescriptor := IUsbBulkInEndpointDescriptor(outPtr)
        }

        return this.__IUsbBulkInEndpointDescriptor.get_MaxPacketSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EndpointNumber() {
        if (!this.HasProp("__IUsbBulkInEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbBulkInEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkInEndpointDescriptor := IUsbBulkInEndpointDescriptor(outPtr)
        }

        return this.__IUsbBulkInEndpointDescriptor.get_EndpointNumber()
    }

    /**
     * 
     * @returns {UsbBulkInPipe} 
     */
    get_Pipe() {
        if (!this.HasProp("__IUsbBulkInEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbBulkInEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkInEndpointDescriptor := IUsbBulkInEndpointDescriptor(outPtr)
        }

        return this.__IUsbBulkInEndpointDescriptor.get_Pipe()
    }

;@endregion Instance Methods
}
