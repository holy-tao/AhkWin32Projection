#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionDepthFrameReader.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PerceptionDepthFrameReader.ahk
#Include .\PerceptionDepthFrameArrivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Reads depth frames from a depth frame source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframereader
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionDepthFrameReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionDepthFrameReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionDepthFrameReader.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the depth frame source this reader gets frames from.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframereader.source
     * @type {PerceptionDepthFrameSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * Gets a boolean value indicating whether or not this reader is paused.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframereader.ispaused
     * @type {Boolean} 
     */
    IsPaused {
        get => this.get_IsPaused()
        set => this.put_IsPaused(value)
    }

    /**
     * Subscribes to the FrameArrived event. This event is fired whenever a new frame arrives from the depth frame source.
     * @type {TypedEventHandler<PerceptionDepthFrameReader, PerceptionDepthFrameArrivedEventArgs>}
    */
    OnFrameArrived {
        get {
            if(!this.HasProp("__OnFrameArrived")){
                this.__OnFrameArrived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4d529b7e-eea0-511b-8285-47e8c85d0295}"),
                    PerceptionDepthFrameReader,
                    PerceptionDepthFrameArrivedEventArgs
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
     * @param {TypedEventHandler<PerceptionDepthFrameReader, PerceptionDepthFrameArrivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameArrived(handler) {
        if (!this.HasProp("__IPerceptionDepthFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameReader := IPerceptionDepthFrameReader(outPtr)
        }

        return this.__IPerceptionDepthFrameReader.add_FrameArrived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameArrived(token) {
        if (!this.HasProp("__IPerceptionDepthFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameReader := IPerceptionDepthFrameReader(outPtr)
        }

        return this.__IPerceptionDepthFrameReader.remove_FrameArrived(token)
    }

    /**
     * 
     * @returns {PerceptionDepthFrameSource} 
     */
    get_Source() {
        if (!this.HasProp("__IPerceptionDepthFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameReader := IPerceptionDepthFrameReader(outPtr)
        }

        return this.__IPerceptionDepthFrameReader.get_Source()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaused() {
        if (!this.HasProp("__IPerceptionDepthFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameReader := IPerceptionDepthFrameReader(outPtr)
        }

        return this.__IPerceptionDepthFrameReader.get_IsPaused()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPaused(value) {
        if (!this.HasProp("__IPerceptionDepthFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameReader := IPerceptionDepthFrameReader(outPtr)
        }

        return this.__IPerceptionDepthFrameReader.put_IsPaused(value)
    }

    /**
     * Attempts to read the most recent frame that is available to this depth frame reader.
     * @returns {PerceptionDepthFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframereader.tryreadlatestframe
     */
    TryReadLatestFrame() {
        if (!this.HasProp("__IPerceptionDepthFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameReader := IPerceptionDepthFrameReader(outPtr)
        }

        return this.__IPerceptionDepthFrameReader.TryReadLatestFrame()
    }

    /**
     * Releases system resources that are exposed by a Windows Runtime object
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframereader.close
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
