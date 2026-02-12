#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionInfraredFrameSourceWatcher.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PerceptionInfraredFrameSourceWatcher.ahk
#Include .\PerceptionInfraredFrameSourceAddedEventArgs.ahk
#Include .\PerceptionInfraredFrameSourceRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Monitors changes to the list of infrared frame sources, and provides notifications when the list changes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesourcewatcher
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionInfraredFrameSourceWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionInfraredFrameSourceWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionInfraredFrameSourceWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the operational status of the infrared frame source watcher.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesourcewatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Subscribes to the SourceAdded event.
     * @remarks
     * When the Start method is called, this event is fired for every infrared frame source already known to the system, then the EnumerationCompleted event is fired. New infrared frame sources that are subsequently added will trigger additional SourceAdded events.
     * @type {TypedEventHandler<PerceptionInfraredFrameSourceWatcher, PerceptionInfraredFrameSourceAddedEventArgs>}
    */
    OnSourceAdded {
        get {
            if(!this.HasProp("__OnSourceAdded")){
                this.__OnSourceAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a8180cd1-c25b-5c7f-94dd-198423bb56d5}"),
                    PerceptionInfraredFrameSourceWatcher,
                    PerceptionInfraredFrameSourceAddedEventArgs
                )
                this.__OnSourceAddedToken := this.add_SourceAdded(this.__OnSourceAdded.iface)
            }
            return this.__OnSourceAdded
        }
    }

    /**
     * Subscribes to the SourceRemoved event. This event is fired once for every infrared frame source that is removed.
     * @type {TypedEventHandler<PerceptionInfraredFrameSourceWatcher, PerceptionInfraredFrameSourceRemovedEventArgs>}
    */
    OnSourceRemoved {
        get {
            if(!this.HasProp("__OnSourceRemoved")){
                this.__OnSourceRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2ca3a9b7-3348-5953-8d0d-ef8d78640b23}"),
                    PerceptionInfraredFrameSourceWatcher,
                    PerceptionInfraredFrameSourceRemovedEventArgs
                )
                this.__OnSourceRemovedToken := this.add_SourceRemoved(this.__OnSourceRemoved.iface)
            }
            return this.__OnSourceRemoved
        }
    }

    /**
     * Subscribes to the Stopped event. This event is fired when the IPerceptionColorFrameSourceWatcher has stopped listeningfor changes to the list of infrared frame sources.
     * @type {TypedEventHandler<PerceptionInfraredFrameSourceWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1555a628-3dff-5fd0-b10a-ca6adb2440c6}"),
                    PerceptionInfraredFrameSourceWatcher,
                    IInspectable
                )
                this.__OnStoppedToken := this.add_Stopped(this.__OnStopped.iface)
            }
            return this.__OnStopped
        }
    }

    /**
     * Subscribes to the EnumerationCompleted event. This event is fired after the initial enumeration of known infrared frame sources is complete.
     * @type {TypedEventHandler<PerceptionInfraredFrameSourceWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1555a628-3dff-5fd0-b10a-ca6adb2440c6}"),
                    PerceptionInfraredFrameSourceWatcher,
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
     * @param {TypedEventHandler<PerceptionInfraredFrameSourceWatcher, PerceptionInfraredFrameSourceAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceAdded(handler) {
        if (!this.HasProp("__IPerceptionInfraredFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceWatcher := IPerceptionInfraredFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceWatcher.add_SourceAdded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceAdded(token) {
        if (!this.HasProp("__IPerceptionInfraredFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceWatcher := IPerceptionInfraredFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceWatcher.remove_SourceAdded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSourceWatcher, PerceptionInfraredFrameSourceRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceRemoved(handler) {
        if (!this.HasProp("__IPerceptionInfraredFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceWatcher := IPerceptionInfraredFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceWatcher.add_SourceRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceRemoved(token) {
        if (!this.HasProp("__IPerceptionInfraredFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceWatcher := IPerceptionInfraredFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceWatcher.remove_SourceRemoved(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSourceWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IPerceptionInfraredFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceWatcher := IPerceptionInfraredFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IPerceptionInfraredFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceWatcher := IPerceptionInfraredFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceWatcher.remove_Stopped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSourceWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IPerceptionInfraredFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceWatcher := IPerceptionInfraredFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IPerceptionInfraredFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceWatcher := IPerceptionInfraredFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPerceptionInfraredFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceWatcher := IPerceptionInfraredFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceWatcher.get_Status()
    }

    /**
     * When this method is called, the infrared frame source watcher enumerates any existing infrared frame sources it has not already enumerated by firing a SourceAdded event for each one. An EnumerationCompleted event is fired when this enumeration is complete. The infrared frame source then starts watching for new infrared frame sources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesourcewatcher.start
     */
    Start() {
        if (!this.HasProp("__IPerceptionInfraredFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceWatcher := IPerceptionInfraredFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceWatcher.Start()
    }

    /**
     * When this method is called, the infrared frame source watcher stops looking for changes to the infrared frame source list. This operation is not immediate; the Stopped event will be triggered when the Stop operation is complete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesourcewatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IPerceptionInfraredFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSourceWatcher := IPerceptionInfraredFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionInfraredFrameSourceWatcher.Stop()
    }

;@endregion Instance Methods
}
