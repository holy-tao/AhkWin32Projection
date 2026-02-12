#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionColorFrameSourceWatcher.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PerceptionColorFrameSourceWatcher.ahk
#Include .\PerceptionColorFrameSourceAddedEventArgs.ahk
#Include .\PerceptionColorFrameSourceRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Monitors changes to the list of color frame sources, and provides notifications when the list changes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesourcewatcher
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionColorFrameSourceWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionColorFrameSourceWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionColorFrameSourceWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the operational status of the color frame source watcher.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesourcewatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Subscribes to the SourceAdded event.
     * @remarks
     * When the Start method is called, this event is fired for every color frame source already known to the system, then the EnumerationCompleted event is fired. New color frame sources that are subsequently added will trigger additional SourceAdded events.
     * @type {TypedEventHandler<PerceptionColorFrameSourceWatcher, PerceptionColorFrameSourceAddedEventArgs>}
    */
    OnSourceAdded {
        get {
            if(!this.HasProp("__OnSourceAdded")){
                this.__OnSourceAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7202e817-22b8-5e7b-86b5-c4a90ccc23aa}"),
                    PerceptionColorFrameSourceWatcher,
                    PerceptionColorFrameSourceAddedEventArgs
                )
                this.__OnSourceAddedToken := this.add_SourceAdded(this.__OnSourceAdded.iface)
            }
            return this.__OnSourceAdded
        }
    }

    /**
     * Subscribes to the SourceRemoved event. This event is fired once for every color frame source that is removed.
     * @type {TypedEventHandler<PerceptionColorFrameSourceWatcher, PerceptionColorFrameSourceRemovedEventArgs>}
    */
    OnSourceRemoved {
        get {
            if(!this.HasProp("__OnSourceRemoved")){
                this.__OnSourceRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c7131ddd-ff22-5fb7-ada0-961e3b28917b}"),
                    PerceptionColorFrameSourceWatcher,
                    PerceptionColorFrameSourceRemovedEventArgs
                )
                this.__OnSourceRemovedToken := this.add_SourceRemoved(this.__OnSourceRemoved.iface)
            }
            return this.__OnSourceRemoved
        }
    }

    /**
     * Subscribes to the Stopped event. This event is fired when the IPerceptionColorFrameSourceWatcher has stopped listening for changes to the list of color frame sources.
     * @type {TypedEventHandler<PerceptionColorFrameSourceWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b3f5bf64-7fc0-5d8c-978c-a38d5b18a51d}"),
                    PerceptionColorFrameSourceWatcher,
                    IInspectable
                )
                this.__OnStoppedToken := this.add_Stopped(this.__OnStopped.iface)
            }
            return this.__OnStopped
        }
    }

    /**
     * Subscribes to the EnumerationCompleted event. This event is fired after the initial enumeration of known color frame sources is complete.
     * @type {TypedEventHandler<PerceptionColorFrameSourceWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b3f5bf64-7fc0-5d8c-978c-a38d5b18a51d}"),
                    PerceptionColorFrameSourceWatcher,
                    IInspectable
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSourceAddedToken")) {
            this.remove_SourceAdded(this.__OnSourceAddedToken)
            this.__OnSourceAdded.iface.Dispose()
        }

        if(this.HasProp("__OnSourceRemovedToken")) {
            this.remove_SourceRemoved(this.__OnSourceRemovedToken)
            this.__OnSourceRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnStoppedToken")) {
            this.remove_Stopped(this.__OnStoppedToken)
            this.__OnStopped.iface.Dispose()
        }

        if(this.HasProp("__OnEnumerationCompletedToken")) {
            this.remove_EnumerationCompleted(this.__OnEnumerationCompletedToken)
            this.__OnEnumerationCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionColorFrameSourceWatcher, PerceptionColorFrameSourceAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceAdded(handler) {
        if (!this.HasProp("__IPerceptionColorFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceWatcher := IPerceptionColorFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionColorFrameSourceWatcher.add_SourceAdded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceAdded(token) {
        if (!this.HasProp("__IPerceptionColorFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceWatcher := IPerceptionColorFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionColorFrameSourceWatcher.remove_SourceAdded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionColorFrameSourceWatcher, PerceptionColorFrameSourceRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceRemoved(handler) {
        if (!this.HasProp("__IPerceptionColorFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceWatcher := IPerceptionColorFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionColorFrameSourceWatcher.add_SourceRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceRemoved(token) {
        if (!this.HasProp("__IPerceptionColorFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceWatcher := IPerceptionColorFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionColorFrameSourceWatcher.remove_SourceRemoved(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionColorFrameSourceWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IPerceptionColorFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceWatcher := IPerceptionColorFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionColorFrameSourceWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IPerceptionColorFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceWatcher := IPerceptionColorFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionColorFrameSourceWatcher.remove_Stopped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionColorFrameSourceWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IPerceptionColorFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceWatcher := IPerceptionColorFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionColorFrameSourceWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IPerceptionColorFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceWatcher := IPerceptionColorFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionColorFrameSourceWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPerceptionColorFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceWatcher := IPerceptionColorFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionColorFrameSourceWatcher.get_Status()
    }

    /**
     * When this method is called, the color frame source watcher enumerates any existing color frame sources it has not already enumerated by firing a SourceAdded event for each one. An EnumerationCompleted event is fired when this enumeration is complete. The color frame source then starts watching for new color frame sources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesourcewatcher.start
     */
    Start() {
        if (!this.HasProp("__IPerceptionColorFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceWatcher := IPerceptionColorFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionColorFrameSourceWatcher.Start()
    }

    /**
     * When this method is called, the color frame source watcher stops looking for changes to the color frame source list. This operation is not immediate; the Stopped event will be triggered when the Stop operation is complete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesourcewatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IPerceptionColorFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSourceWatcher := IPerceptionColorFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionColorFrameSourceWatcher.Stop()
    }

;@endregion Instance Methods
}
