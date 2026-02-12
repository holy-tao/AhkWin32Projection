#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUsbBulkInPipe.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the pipe that the underlying USB driver opens to communicate with a USB bulk IN endpoint of the device. The app can get an input stream from the pipe and access data is being read from the endpoint.
 * @remarks
 * This code example shows how to read data from a bulk IN pipe. The example assumes that the app has previously obtained the [UsbDevice](usbdevice.md) object.
 * 
 * ```csharp
 * UsbDevice device;
 * UInt32 readLen = 8;
 * 
 * // Get the UsbDevice object. Not shown.
 * 
 * ...
 *             
 * UsbBulkInPipe bulkIn = device.DefaultInterface.BulkInPipes[0];
 * 
 * DataReader reader = new DataReader(bulkIn.InputStream);
 *             
 * await reader.LoadAsync(readLen);
 *             
 * UInt64 data = reader.ReadUInt64();
 *             
 * ShowData(data);
 * 
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkinpipe
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class UsbBulkInPipe extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUsbBulkInPipe

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUsbBulkInPipe.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the maximum number of bytes that can be read from the bulk IN pipe in a single transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkinpipe.maxtransfersizebytes
     * @type {Integer} 
     */
    MaxTransferSizeBytes {
        get => this.get_MaxTransferSizeBytes()
    }

    /**
     * Gets the object that represents endpoint descriptor associated with the USB bulk IN endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkinpipe.endpointdescriptor
     * @type {UsbBulkInEndpointDescriptor} 
     */
    EndpointDescriptor {
        get => this.get_EndpointDescriptor()
    }

    /**
     * Gets or sets configuration flags that controls the behavior of the pipe that reads data from a USB bulk IN endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkinpipe.readoptions
     * @type {Integer} 
     */
    ReadOptions {
        get => this.get_ReadOptions()
        set => this.put_ReadOptions(value)
    }

    /**
     * Input stream that stores the data that the bulk IN pipe received from the endpoint.
     * @remarks
     * To access data read from a bulk IN pipe, get the input stream from the pipe, and then use the [DataReader](../windows.storage.streams/datareader.md) to read data.
     * 
     * ```
     *   auto stream = DeviceList::Current->Fx2Device->Configuration->UsbInterfaces->GetAt(0)->BulkInPipes->GetAt(0)->InputStream;  
     *   
     *     Windows::Storage::Streams::DataReader^ reader = ref new Windows::Storage::Streams::DataReader(stream);  
     *   
     *     Concurrency::create_task(reader->LoadAsync(TRANSFER_SIZE))  
     *         .then ([this, reader] (uint32 result) 
     *     {  
     *   
     *            //Your code.  
     *   
     *   
     *     });
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkinpipe.inputstream
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
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
    get_MaxTransferSizeBytes() {
        if (!this.HasProp("__IUsbBulkInPipe")) {
            if ((queryResult := this.QueryInterface(IUsbBulkInPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkInPipe := IUsbBulkInPipe(outPtr)
        }

        return this.__IUsbBulkInPipe.get_MaxTransferSizeBytes()
    }

    /**
     * 
     * @returns {UsbBulkInEndpointDescriptor} 
     */
    get_EndpointDescriptor() {
        if (!this.HasProp("__IUsbBulkInPipe")) {
            if ((queryResult := this.QueryInterface(IUsbBulkInPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkInPipe := IUsbBulkInPipe(outPtr)
        }

        return this.__IUsbBulkInPipe.get_EndpointDescriptor()
    }

    /**
     * Starts an asynchronous operation to clear a stall condition (endpoint halt) on the USB bulk IN endpoint that is associated with the pipe.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkinpipe.clearstallasync
     */
    ClearStallAsync() {
        if (!this.HasProp("__IUsbBulkInPipe")) {
            if ((queryResult := this.QueryInterface(IUsbBulkInPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkInPipe := IUsbBulkInPipe(outPtr)
        }

        return this.__IUsbBulkInPipe.ClearStallAsync()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadOptions(value) {
        if (!this.HasProp("__IUsbBulkInPipe")) {
            if ((queryResult := this.QueryInterface(IUsbBulkInPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkInPipe := IUsbBulkInPipe(outPtr)
        }

        return this.__IUsbBulkInPipe.put_ReadOptions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadOptions() {
        if (!this.HasProp("__IUsbBulkInPipe")) {
            if ((queryResult := this.QueryInterface(IUsbBulkInPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkInPipe := IUsbBulkInPipe(outPtr)
        }

        return this.__IUsbBulkInPipe.get_ReadOptions()
    }

    /**
     * Discards any data that is cached in the bulk IN pipe.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.usb.usbbulkinpipe.flushbuffer
     */
    FlushBuffer() {
        if (!this.HasProp("__IUsbBulkInPipe")) {
            if ((queryResult := this.QueryInterface(IUsbBulkInPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkInPipe := IUsbBulkInPipe(outPtr)
        }

        return this.__IUsbBulkInPipe.FlushBuffer()
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        if (!this.HasProp("__IUsbBulkInPipe")) {
            if ((queryResult := this.QueryInterface(IUsbBulkInPipe.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUsbBulkInPipe := IUsbBulkInPipe(outPtr)
        }

        return this.__IUsbBulkInPipe.get_InputStream()
    }

;@endregion Instance Methods
}
