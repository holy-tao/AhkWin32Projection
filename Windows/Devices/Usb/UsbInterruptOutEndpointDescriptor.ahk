#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbInterruptOutEndpointDescriptor.ahk
#Include ..\..\..\Guid.ahk

/**
 * The endpoint descriptor for a USB interrupt OUT endpoint. The descriptor specifies the endpoint type, direction, number and also the maximum number of bytes that can be written to the endpoint, in a single transfer. The app can also get information about how often the host polls the endpoint to send data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptoutendpointdescriptor
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbInterruptOutEndpointDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbInterruptOutEndpointDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbInterruptOutEndpointDescriptor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the maximum number of bytes that can be sent to or received from this endpoint.
     * @remarks
     * The MaxPacketSize property value does not necessarily indicate the number of bytes that will be written at a time, in one interval.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptoutendpointdescriptor.maxpacketsize
     * @type {Integer} 
     */
    MaxPacketSize {
        get => this.get_MaxPacketSize()
    }

    /**
     * Gets the USB endpoint number of the interrupt OUT endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptoutendpointdescriptor.endpointnumber
     * @type {Integer} 
     */
    EndpointNumber {
        get => this.get_EndpointNumber()
    }

    /**
     * Gets the poling interval of the USB interrupt endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptoutendpointdescriptor.interval
     * @type {TimeSpan} 
     */
    Interval {
        get => this.get_Interval()
    }

    /**
     * Gets the object that represents the pipe that the host opens to communicate with the interrupt OUT endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptoutendpointdescriptor.pipe
     * @type {UsbInterruptOutPipe} 
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
        if (!this.HasProp("__IUsbInterruptOutEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptOutEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptOutEndpointDescriptor := IUsbInterruptOutEndpointDescriptor(outPtr)
        }

        return this.__IUsbInterruptOutEndpointDescriptor.get_MaxPacketSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EndpointNumber() {
        if (!this.HasProp("__IUsbInterruptOutEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptOutEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptOutEndpointDescriptor := IUsbInterruptOutEndpointDescriptor(outPtr)
        }

        return this.__IUsbInterruptOutEndpointDescriptor.get_EndpointNumber()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Interval() {
        if (!this.HasProp("__IUsbInterruptOutEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptOutEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptOutEndpointDescriptor := IUsbInterruptOutEndpointDescriptor(outPtr)
        }

        return this.__IUsbInterruptOutEndpointDescriptor.get_Interval()
    }

    /**
     * 
     * @returns {UsbInterruptOutPipe} 
     */
    get_Pipe() {
        if (!this.HasProp("__IUsbInterruptOutEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptOutEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptOutEndpointDescriptor := IUsbInterruptOutEndpointDescriptor(outPtr)
        }

        return this.__IUsbInterruptOutEndpointDescriptor.get_Pipe()
    }

;@endregion Instance Methods
}
