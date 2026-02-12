#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionInfraredFrameReader.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PerceptionInfraredFrameReader.ahk
#Include .\PerceptionInfraredFrameArrivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Reads infrared frames from a infrared frame source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframereader
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionInfraredFrameReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionInfraredFrameReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionInfraredFrameReader.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the infrared frame source this reader gets frames from.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframereader.source
     * @type {PerceptionInfraredFrameSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * Gets a boolean value indicating whether or not this reader is paused.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframereader.ispaused
     * @type {Boolean} 
     */
    IsPaused {
        get => this.get_IsPaused()
        set => this.put_IsPaused(value)
    }

    /**
     * Subscribes to the FrameArrived event. This event is fired whenever a new frame arrives from the infrared frame source.
     * @type {TypedEventHandler<PerceptionInfraredFrameReader, PerceptionInfraredFrameArrivedEventArgs>}
    */
    OnFrameArrived {
        get {
            if(!this.HasProp("__OnFrameArrived")){
                this.__OnFrameArrived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{687fef67-8871-56fe-8e7e-1d2929cc6f42}"),
                    PerceptionInfraredFrameReader,
                    PerceptionInfraredFrameArrivedEventArgs
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
     * @param {TypedEventHandler<PerceptionInfraredFrameReader, PerceptionInfraredFrameArrivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameArrived(handler) {
        if (!this.HasProp("__IPerceptionInfraredFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameReader := IPerceptionInfraredFrameReader(outPtr)
        }

        return this.__IPerceptionInfraredFrameReader.add_FrameArrived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameArrived(token) {
        if (!this.HasProp("__IPerceptionInfraredFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameReader := IPerceptionInfraredFrameReader(outPtr)
        }

        return this.__IPerceptionInfraredFrameReader.remove_FrameArrived(token)
    }

    /**
     * 
     * @returns {PerceptionInfraredFrameSource} 
     */
    get_Source() {
        if (!this.HasProp("__IPerceptionInfraredFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameReader := IPerceptionInfraredFrameReader(outPtr)
        }

        return this.__IPerceptionInfraredFrameReader.get_Source()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaused() {
        if (!this.HasProp("__IPerceptionInfraredFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameReader := IPerceptionInfraredFrameReader(outPtr)
        }

        return this.__IPerceptionInfraredFrameReader.get_IsPaused()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPaused(value) {
        if (!this.HasProp("__IPerceptionInfraredFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameReader := IPerceptionInfraredFrameReader(outPtr)
        }

        return this.__IPerceptionInfraredFrameReader.put_IsPaused(value)
    }

    /**
     * Attempts to read the most recent frame that is available to this infrared frame reader.
     * @returns {PerceptionInfraredFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframereader.tryreadlatestframe
     */
    TryReadLatestFrame() {
        if (!this.HasProp("__IPerceptionInfraredFrameReader")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameReader := IPerceptionInfraredFrameReader(outPtr)
        }

        return this.__IPerceptionInfraredFrameReader.TryReadLatestFrame()
    }

    /**
     * Releases system resources that are exposed by a Windows Runtime object
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframereader.close
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
