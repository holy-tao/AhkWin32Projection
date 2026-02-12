#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbInterruptOutPipe.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the pipe that the underlying USB driver opens to communicate with a USB interrupt OUT endpoint of the device. The object provides access to an output stream to which the app can write data to send to the endpoint.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptoutpipe
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbInterruptOutPipe extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbInterruptOutPipe

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbInterruptOutPipe.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the object that represents the endpoint descriptor associated with the USB interrupt OUT endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptoutpipe.endpointdescriptor
     * @type {UsbInterruptOutEndpointDescriptor} 
     */
    EndpointDescriptor {
        get => this.get_EndpointDescriptor()
    }

    /**
     * Gets or sets configuration flags that controls the behavior of the pipe that writes data to a USB interrupt OUT endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptoutpipe.writeoptions
     * @type {Integer} 
     */
    WriteOptions {
        get => this.get_WriteOptions()
        set => this.put_WriteOptions(value)
    }

    /**
     * Gets an output stream to which the app can write data to send to the endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptoutpipe.outputstream
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UsbInterruptOutEndpointDescriptor} 
     */
    get_EndpointDescriptor() {
        if (!this.HasProp("__IUsbInterruptOutPipe")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptOutPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptOutPipe := IUsbInterruptOutPipe(outPtr)
        }

        return this.__IUsbInterruptOutPipe.get_EndpointDescriptor()
    }

    /**
     * Starts an asynchronous operation to clear a stall condition (endpoint halt) on the USB interrupt OUT endpoint that is associated with the pipe.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptoutpipe.clearstallasync
     */
    ClearStallAsync() {
        if (!this.HasProp("__IUsbInterruptOutPipe")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptOutPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptOutPipe := IUsbInterruptOutPipe(outPtr)
        }

        return this.__IUsbInterruptOutPipe.ClearStallAsync()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WriteOptions(value) {
        if (!this.HasProp("__IUsbInterruptOutPipe")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptOutPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptOutPipe := IUsbInterruptOutPipe(outPtr)
        }

        return this.__IUsbInterruptOutPipe.put_WriteOptions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteOptions() {
        if (!this.HasProp("__IUsbInterruptOutPipe")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptOutPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptOutPipe := IUsbInterruptOutPipe(outPtr)
        }

        return this.__IUsbInterruptOutPipe.get_WriteOptions()
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        if (!this.HasProp("__IUsbInterruptOutPipe")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptOutPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptOutPipe := IUsbInterruptOutPipe(outPtr)
        }

        return this.__IUsbInterruptOutPipe.get_OutputStream()
    }

;@endregion Instance Methods
}
