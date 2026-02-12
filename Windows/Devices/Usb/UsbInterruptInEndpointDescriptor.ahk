#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbInterruptInEndpointDescriptor.ahk
#Include ..\..\..\Guid.ahk

/**
 * The endpoint descriptor for a USB interrupt IN endpoint. The descriptor specifies the endpoint type, direction, number and also the maximum number of bytes that can be read from the endpoint, in a single transfer. The app can also get information about how often the host polls the endpoint for data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptinendpointdescriptor
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbInterruptInEndpointDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbInterruptInEndpointDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbInterruptInEndpointDescriptor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the maximum number of bytes that can be sent to or received (in a packet) from this endpoint.
     * @remarks
     * The MaxPacketSize property value does not necessarily indicate the number of bytes that will be read at a time, in one interval.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptinendpointdescriptor.maxpacketsize
     * @type {Integer} 
     */
    MaxPacketSize {
        get => this.get_MaxPacketSize()
    }

    /**
     * Gets the USB endpoint number of the interrupt IN endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptinendpointdescriptor.endpointnumber
     * @type {Integer} 
     */
    EndpointNumber {
        get => this.get_EndpointNumber()
    }

    /**
     * Gets the poling interval of the USB interrupt endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptinendpointdescriptor.interval
     * @type {TimeSpan} 
     */
    Interval {
        get => this.get_Interval()
    }

    /**
     * Gets the object that represents the pipe that the host opens to communicate with the interrupt IN endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptinendpointdescriptor.pipe
     * @type {UsbInterruptInPipe} 
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
        if (!this.HasProp("__IUsbInterruptInEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptInEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptInEndpointDescriptor := IUsbInterruptInEndpointDescriptor(outPtr)
        }

        return this.__IUsbInterruptInEndpointDescriptor.get_MaxPacketSize()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EndpointNumber() {
        if (!this.HasProp("__IUsbInterruptInEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptInEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptInEndpointDescriptor := IUsbInterruptInEndpointDescriptor(outPtr)
        }

        return this.__IUsbInterruptInEndpointDescriptor.get_EndpointNumber()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Interval() {
        if (!this.HasProp("__IUsbInterruptInEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptInEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptInEndpointDescriptor := IUsbInterruptInEndpointDescriptor(outPtr)
        }

        return this.__IUsbInterruptInEndpointDescriptor.get_Interval()
    }

    /**
     * 
     * @returns {UsbInterruptInPipe} 
     */
    get_Pipe() {
        if (!this.HasProp("__IUsbInterruptInEndpointDescriptor")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptInEndpointDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptInEndpointDescriptor := IUsbInterruptInEndpointDescriptor(outPtr)
        }

        return this.__IUsbInterruptInEndpointDescriptor.get_Pipe()
    }

;@endregion Instance Methods
}
