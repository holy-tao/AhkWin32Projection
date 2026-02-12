#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbBulkOutPipe.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the pipe that the underlying USB driver opens to communicate with a USB bulk OUT endpoint of the device. The object provides access to an output stream to which the app can write data to send to the endpoint.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkoutpipe
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbBulkOutPipe extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbBulkOutPipe

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbBulkOutPipe.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the object that represents the endpoint descriptor associated with the USB bulk OUT endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkoutpipe.endpointdescriptor
     * @type {UsbBulkOutEndpointDescriptor} 
     */
    EndpointDescriptor {
        get => this.get_EndpointDescriptor()
    }

    /**
     * Gets or sets configuration flags that controls the behavior of the pipe that writes data to a USB bulk IN endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkoutpipe.writeoptions
     * @type {Integer} 
     */
    WriteOptions {
        get => this.get_WriteOptions()
        set => this.put_WriteOptions(value)
    }

    /**
     * Gets an output stream to which the app can write data to send to the endpoint.
     * @remarks
     * To write data, first get the output stream from the pipe by using [OutputStream](usbinterruptoutpipe_outputstream.md) property and then use the [DataWriter](../windows.storage.streams/datawriter.md) object to write the actual buffer.
     * 
     * ```
     *     Windows::Storage::Streams::Buffer^ buffer = ref new Windows::Storage::Streams::Buffer(TRANSFER_SIZE);  
     *   
     *     buffer->Length = TRANSFER_SIZE;  
     *   
     *     auto stream = DeviceList::Current->Fx2Device->Configuration->UsbInterfaces->GetAt(0)->BulkOutPipes->GetAt(0)->OutputStream;  
     *   
     *     Windows::Storage::Streams::DataWriter^ writer = ref new Windows::Storage::Streams::DataWriter(stream);  
     *   
     *     writer->WriteBuffer(buffer);  
     *   
     *  
     *     });  
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkoutpipe.outputstream
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
     * @returns {UsbBulkOutEndpointDescriptor} 
     */
    get_EndpointDescriptor() {
        if (!this.HasProp("__IUsbBulkOutPipe")) {
            if ((queryResult := this.QueryInterface(IUsbBulkOutPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkOutPipe := IUsbBulkOutPipe(outPtr)
        }

        return this.__IUsbBulkOutPipe.get_EndpointDescriptor()
    }

    /**
     * Starts an asynchronous operation to clear a stall condition (endpoint halt) on the USB bulk OUT endpoint that is associated with the pipe.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkoutpipe.clearstallasync
     */
    ClearStallAsync() {
        if (!this.HasProp("__IUsbBulkOutPipe")) {
            if ((queryResult := this.QueryInterface(IUsbBulkOutPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkOutPipe := IUsbBulkOutPipe(outPtr)
        }

        return this.__IUsbBulkOutPipe.ClearStallAsync()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WriteOptions(value) {
        if (!this.HasProp("__IUsbBulkOutPipe")) {
            if ((queryResult := this.QueryInterface(IUsbBulkOutPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkOutPipe := IUsbBulkOutPipe(outPtr)
        }

        return this.__IUsbBulkOutPipe.put_WriteOptions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteOptions() {
        if (!this.HasProp("__IUsbBulkOutPipe")) {
            if ((queryResult := this.QueryInterface(IUsbBulkOutPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkOutPipe := IUsbBulkOutPipe(outPtr)
        }

        return this.__IUsbBulkOutPipe.get_WriteOptions()
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        if (!this.HasProp("__IUsbBulkOutPipe")) {
            if ((queryResult := this.QueryInterface(IUsbBulkOutPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkOutPipe := IUsbBulkOutPipe(outPtr)
        }

        return this.__IUsbBulkOutPipe.get_OutputStream()
    }

;@endregion Instance Methods
}
