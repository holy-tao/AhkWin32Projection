#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbInterruptInPipe.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\UsbInterruptInPipe.ahk
#Include .\UsbInterruptInEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the pipe that the underlying USB driver opens to communicate with a USB interrupt IN endpoint of the device. The object also enables the app to specify an event handler. That handler that gets invoked when data is read from the endpoint.
 * @remarks
 * When the app registers an event handler, the host controller polls the endpoint for data at regular intervals. That interval value can be obtained in the [Interval](usbinterruptinendpointdescriptor_interval.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptinpipe
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbInterruptInPipe extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbInterruptInPipe

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbInterruptInPipe.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the object that represents the endpoint descriptor associated with the USB interrupt IN endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptinpipe.endpointdescriptor
     * @type {UsbInterruptInEndpointDescriptor} 
     */
    EndpointDescriptor {
        get => this.get_EndpointDescriptor()
    }

    /**
     * Raised when the interrupt pipe receives data from the interrupt IN endpoint.
     * @type {TypedEventHandler<UsbInterruptInPipe, UsbInterruptInEventArgs>}
    */
    OnDataReceived {
        get {
            if(!this.HasProp("__OnDataReceived")){
                this.__OnDataReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e6db9449-f36a-50f2-926c-2afd85c49f01}"),
                    UsbInterruptInPipe,
                    UsbInterruptInEventArgs
                )
                this.__OnDataReceivedToken := this.add_DataReceived(this.__OnDataReceived.iface)
            }
            return this.__OnDataReceived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDataReceivedToken")) {
            this.remove_DataReceived(this.__OnDataReceivedToken)
            this.__OnDataReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {UsbInterruptInEndpointDescriptor} 
     */
    get_EndpointDescriptor() {
        if (!this.HasProp("__IUsbInterruptInPipe")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptInPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptInPipe := IUsbInterruptInPipe(outPtr)
        }

        return this.__IUsbInterruptInPipe.get_EndpointDescriptor()
    }

    /**
     * Starts an asynchronous operation to clear a stall condition (endpoint halt) on the USB interrupt IN endpoint that is associated with the pipe.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbinterruptinpipe.clearstallasync
     */
    ClearStallAsync() {
        if (!this.HasProp("__IUsbInterruptInPipe")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptInPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptInPipe := IUsbInterruptInPipe(outPtr)
        }

        return this.__IUsbInterruptInPipe.ClearStallAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<UsbInterruptInPipe, UsbInterruptInEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DataReceived(handler) {
        if (!this.HasProp("__IUsbInterruptInPipe")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptInPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptInPipe := IUsbInterruptInPipe(outPtr)
        }

        return this.__IUsbInterruptInPipe.add_DataReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DataReceived(token) {
        if (!this.HasProp("__IUsbInterruptInPipe")) {
            if ((queryResult := this.QueryInterface(IUsbInterruptInPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbInterruptInPipe := IUsbInterruptInPipe(outPtr)
        }

        return this.__IUsbInterruptInPipe.remove_DataReceived(token)
    }

;@endregion Instance Methods
}
