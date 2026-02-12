#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerFrameReader.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\BarcodeScannerFrameReader.ahk
#Include .\BarcodeScannerFrameReaderFrameArrivedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Reads video frames from a camera.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerframereader
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerFrameReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerFrameReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerFrameReader.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [BarcodeScannerProviderConnection](barcodescannerproviderconnection.md) being used by the frame reader.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerframereader.connection
     * @type {BarcodeScannerProviderConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * Event that is raised when a frame is ready to be acquired. This event will not be raised until the frame reader is started by using [StartAsync](barcodescannerframereader_startasync_1931900819.md).
     * @remarks
     * To acquire a frame after it arrives, call [TryAcquireLatestFrameAsync](barcodescannerframereader_tryacquirelatestframeasync_555563326.md). Note that calling **TryAcquireLatestFrameAsync** will always return the latest frame, not the frame that caused this event to be raised.
     * 
     * Use [BarcodeScannerFrameReaderFrameArrivedEventArgs.GetDeferral](barcodescannerframereaderframearrivedeventargs_getdeferral_254836512.md) if processing needs to be done asynchronously outside the scope of the method handler.
     * @type {TypedEventHandler<BarcodeScannerFrameReader, BarcodeScannerFrameReaderFrameArrivedEventArgs>}
    */
    OnFrameArrived {
        get {
            if(!this.HasProp("__OnFrameArrived")){
                this.__OnFrameArrived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{730d5c4a-54e7-57dd-aaa2-08527518c449}"),
                    BarcodeScannerFrameReader,
                    BarcodeScannerFrameReaderFrameArrivedEventArgs
                )
                this.__OnFrameArrivedToken := this.add_FrameArrived(this.__OnFrameArrived.iface)
            }
            return this.__OnFrameArrived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnFrameArrivedToken")) {
            this.remove_FrameArrived(this.__OnFrameArrivedToken)
            this.__OnFrameArrived.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * Starts reading video frames from the camera.
     * @remarks
     * Subscribe to the [FrameArrived](barcodescannerframereader_framearrived.md) event to be notified when new frames arrive, and call [TryAcquireLatestFrameAsync](barcodescannerframereader_tryacquirelatestframeasync_555563326.md) to read the latest frame at any given time.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerframereader.startasync
     */
    StartAsync() {
        if (!this.HasProp("__IBarcodeScannerFrameReader")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerFrameReader := IBarcodeScannerFrameReader(outPtr)
        }

        return this.__IBarcodeScannerFrameReader.StartAsync()
    }

    /**
     * Stops reading video frames from the camera.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerframereader.stopasync
     */
    StopAsync() {
        if (!this.HasProp("__IBarcodeScannerFrameReader")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerFrameReader := IBarcodeScannerFrameReader(outPtr)
        }

        return this.__IBarcodeScannerFrameReader.StopAsync()
    }

    /**
     * Acquires the latest available frame from the camera.
     * @remarks
     * Only the first call to **TryAcquireLatestFrameAsync** will return data. Subsequent calls will return **null** until a new frame arrives. Subscribe to the [FrameArrived](barcodescannerframereader_framearrived.md) event to be notified when new frames arrive.
     * @returns {IAsyncOperation<BarcodeScannerVideoFrame>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerframereader.tryacquirelatestframeasync
     */
    TryAcquireLatestFrameAsync() {
        if (!this.HasProp("__IBarcodeScannerFrameReader")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerFrameReader := IBarcodeScannerFrameReader(outPtr)
        }

        return this.__IBarcodeScannerFrameReader.TryAcquireLatestFrameAsync()
    }

    /**
     * 
     * @returns {BarcodeScannerProviderConnection} 
     */
    get_Connection() {
        if (!this.HasProp("__IBarcodeScannerFrameReader")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerFrameReader := IBarcodeScannerFrameReader(outPtr)
        }

        return this.__IBarcodeScannerFrameReader.get_Connection()
    }

    /**
     * 
     * @param {TypedEventHandler<BarcodeScannerFrameReader, BarcodeScannerFrameReaderFrameArrivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameArrived(handler) {
        if (!this.HasProp("__IBarcodeScannerFrameReader")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerFrameReader := IBarcodeScannerFrameReader(outPtr)
        }

        return this.__IBarcodeScannerFrameReader.add_FrameArrived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameArrived(token) {
        if (!this.HasProp("__IBarcodeScannerFrameReader")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerFrameReader := IBarcodeScannerFrameReader(outPtr)
        }

        return this.__IBarcodeScannerFrameReader.remove_FrameArrived(token)
    }

    /**
     * Disposes of the frame reader and associated resources, and stops requesting video frames.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerframereader.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
