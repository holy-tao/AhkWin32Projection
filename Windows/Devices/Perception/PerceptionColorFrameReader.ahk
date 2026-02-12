#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionColorFrameReader.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PerceptionColorFrameReader.ahk
#Include .\PerceptionColorFrameArrivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Reads color frames from a color frame source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframereader
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionColorFrameReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionColorFrameReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionColorFrameReader.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the color frame source this reader gets frames from.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframereader.source
     * @type {PerceptionColorFrameSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * Gets or sets a boolean value indicating whether or not this reader is paused.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframereader.ispaused
     * @type {Boolean} 
     */
    IsPaused {
        get => this.get_IsPaused()
        set => this.put_IsPaused(value)
    }

    /**
     * Subscribes to the FrameArrived event. This event is fired whenever a new frame arrives from the color frame source.
     * @type {TypedEventHandler<PerceptionColorFrameReader, PerceptionColorFrameArrivedEventArgs>}
    */
    OnFrameArrived {
        get {
            if(!this.HasProp("__OnFrameArrived")){
                this.__OnFrameArrived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a4a50ea5-778d-5056-a1cf-546a1be2c010}"),
                    PerceptionColorFrameReader,
                    PerceptionColorFrameArrivedEventArgs
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
     * 
     * @param {TypedEventHandler<PerceptionColorFrameReader, PerceptionColorFrameArrivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameArrived(handler) {
        if (!this.HasProp("__IPerceptionColorFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameReader := IPerceptionColorFrameReader(outPtr)
        }

        return this.__IPerceptionColorFrameReader.add_FrameArrived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameArrived(token) {
        if (!this.HasProp("__IPerceptionColorFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameReader := IPerceptionColorFrameReader(outPtr)
        }

        return this.__IPerceptionColorFrameReader.remove_FrameArrived(token)
    }

    /**
     * 
     * @returns {PerceptionColorFrameSource} 
     */
    get_Source() {
        if (!this.HasProp("__IPerceptionColorFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameReader := IPerceptionColorFrameReader(outPtr)
        }

        return this.__IPerceptionColorFrameReader.get_Source()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaused() {
        if (!this.HasProp("__IPerceptionColorFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameReader := IPerceptionColorFrameReader(outPtr)
        }

        return this.__IPerceptionColorFrameReader.get_IsPaused()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPaused(value) {
        if (!this.HasProp("__IPerceptionColorFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameReader := IPerceptionColorFrameReader(outPtr)
        }

        return this.__IPerceptionColorFrameReader.put_IsPaused(value)
    }

    /**
     * Attempts to read the most recent frame that is available to this color frame reader.
     * @returns {PerceptionColorFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframereader.tryreadlatestframe
     */
    TryReadLatestFrame() {
        if (!this.HasProp("__IPerceptionColorFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameReader := IPerceptionColorFrameReader(outPtr)
        }

        return this.__IPerceptionColorFrameReader.TryReadLatestFrame()
    }

    /**
     * Releases system resources that are exposed by a Windows Runtime object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframereader.close
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
