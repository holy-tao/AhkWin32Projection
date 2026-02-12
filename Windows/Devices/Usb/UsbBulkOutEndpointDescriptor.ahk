#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbBulkOutEndpointDescriptor.ahk
#Include ..\..\..\Guid.ahk

/**
 * The endpoint descriptor for a USB bulk OUT endpoint. The descriptor specifies the endpoint type, direction, number and also the maximum number of bytes that can be written to the endpoint, in a single transfer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkoutendpointdescriptor
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbBulkOutEndpointDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbBulkOutEndpointDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbBulkOutEndpointDescriptor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the maximum number of bytes that can be sent to or received from this endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkoutendpointdescriptor.maxpacketsize
     * @type {Integer} 
     */
    MaxPacketSize {
        get => this.get_MaxPacketSize()
    }

    /**
     * Gets the USB endpoint number of the bulk OUT endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkoutendpointdescriptor.endpointnumber
     * @type {Integer} 
     */
    EndpointNumber {
        get => this.get_EndpointNumber()
    }

    /**
     * Gets the object that represents the pipe that the host opens to communicate with the bulk IN endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkoutendpointdescriptor.pipe
     * @type {UsbBulkOutPipe} 
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
        if (!this.HasProp("__IUsbBulkOutEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbBulkOutEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkOutEndpointDescriptor := IUsbBulkOutEndpointDescriptor(outPtr)
        }

        return this.__IUsbBulkOutEndpointDescriptor.get_MaxPacketSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EndpointNumber() {
        if (!this.HasProp("__IUsbBulkOutEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbBulkOutEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkOutEndpointDescriptor := IUsbBulkOutEndpointDescriptor(outPtr)
        }

        return this.__IUsbBulkOutEndpointDescriptor.get_EndpointNumber()
    }

    /**
     * 
     * @returns {UsbBulkOutPipe} 
     */
    get_Pipe() {
        if (!this.HasProp("__IUsbBulkOutEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbBulkOutEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkOutEndpointDescriptor := IUsbBulkOutEndpointDescriptor(outPtr)
        }

        return this.__IUsbBulkOutEndpointDescriptor.get_Pipe()
    }

;@endregion Instance Methods
}
