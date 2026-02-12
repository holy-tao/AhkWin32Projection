#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionDepthFrameSourceWatcher.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PerceptionDepthFrameSourceWatcher.ahk
#Include .\PerceptionDepthFrameSourceAddedEventArgs.ahk
#Include .\PerceptionDepthFrameSourceRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Monitors changes to the list of depth frame sources, and provides notifications when the list changes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframesourcewatcher
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionDepthFrameSourceWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionDepthFrameSourceWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionDepthFrameSourceWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the operational status of the depth frame source watcher.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframesourcewatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Subscribes to the SourceAdded event.
     * @remarks
     * When the Start method is called, this event is fired for every depth frame source already known to the system, then the EnumerationCompleted event is fired. New depth frame sources that are subsequently added will trigger additional SourceAdded events.
     * @type {TypedEventHandler<PerceptionDepthFrameSourceWatcher, PerceptionDepthFrameSourceAddedEventArgs>}
    */
    OnSourceAdded {
        get {
            if(!this.HasProp("__OnSourceAdded")){
                this.__OnSourceAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a3c1e25f-3574-5a27-a791-16e1bcc424f4}"),
                    PerceptionDepthFrameSourceWatcher,
                    PerceptionDepthFrameSourceAddedEventArgs
                )
                this.__OnSourceAddedToken := this.add_SourceAdded(this.__OnSourceAdded.iface)
            }
            return this.__OnSourceAdded
        }
    }

    /**
     * Subscribes to the SourceRemoved event. This event is fired once for every depth frame source that is removed.
     * @type {TypedEventHandler<PerceptionDepthFrameSourceWatcher, PerceptionDepthFrameSourceRemovedEventArgs>}
    */
    OnSourceRemoved {
        get {
            if(!this.HasProp("__OnSourceRemoved")){
                this.__OnSourceRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5cf5faf7-0785-5589-a621-089d900412c8}"),
                    PerceptionDepthFrameSourceWatcher,
                    PerceptionDepthFrameSourceRemovedEventArgs
                )
                this.__OnSourceRemovedToken := this.add_SourceRemoved(this.__OnSourceRemoved.iface)
            }
            return this.__OnSourceRemoved
        }
    }

    /**
     * Subscribes to the Stopped event. This event is fired when the IPerceptionColorFrameSourceWatcher has stopped listening for changes to the list of depth frame sources.
     * @type {TypedEventHandler<PerceptionDepthFrameSourceWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c5efa976-d948-50c7-8555-664190f9a968}"),
                    PerceptionDepthFrameSourceWatcher,
                    IInspectable
                )
                this.__OnStoppedToken := this.add_Stopped(this.__OnStopped.iface)
            }
            return this.__OnStopped
        }
    }

    /**
     * Subscribes to the EnumerationCompleted event. This event is fired after the initial enumeration of known depth frame sources is complete.
     * @type {TypedEventHandler<PerceptionDepthFrameSourceWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c5efa976-d948-50c7-8555-664190f9a968}"),
                    PerceptionDepthFrameSourceWatcher,
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
     * @param {TypedEventHandler<PerceptionDepthFrameSourceWatcher, PerceptionDepthFrameSourceAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceAdded(handler) {
        if (!this.HasProp("__IPerceptionDepthFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameSourceWatcher := IPerceptionDepthFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionDepthFrameSourceWatcher.add_SourceAdded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceAdded(token) {
        if (!this.HasProp("__IPerceptionDepthFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameSourceWatcher := IPerceptionDepthFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionDepthFrameSourceWatcher.remove_SourceAdded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionDepthFrameSourceWatcher, PerceptionDepthFrameSourceRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceRemoved(handler) {
        if (!this.HasProp("__IPerceptionDepthFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameSourceWatcher := IPerceptionDepthFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionDepthFrameSourceWatcher.add_SourceRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceRemoved(token) {
        if (!this.HasProp("__IPerceptionDepthFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameSourceWatcher := IPerceptionDepthFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionDepthFrameSourceWatcher.remove_SourceRemoved(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionDepthFrameSourceWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IPerceptionDepthFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameSourceWatcher := IPerceptionDepthFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionDepthFrameSourceWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IPerceptionDepthFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameSourceWatcher := IPerceptionDepthFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionDepthFrameSourceWatcher.remove_Stopped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionDepthFrameSourceWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IPerceptionDepthFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameSourceWatcher := IPerceptionDepthFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionDepthFrameSourceWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IPerceptionDepthFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameSourceWatcher := IPerceptionDepthFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionDepthFrameSourceWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPerceptionDepthFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameSourceWatcher := IPerceptionDepthFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionDepthFrameSourceWatcher.get_Status()
    }

    /**
     * When this method is called, the depth frame source watcher enumerates any existing depth frame sources it has not already enumerated by firing a SourceAdded event for each one. An EnumerationCompleted event is fired when this enumeration is complete. The depth frame source then starts watching for new depth frame sources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframesourcewatcher.start
     */
    Start() {
        if (!this.HasProp("__IPerceptionDepthFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameSourceWatcher := IPerceptionDepthFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionDepthFrameSourceWatcher.Start()
    }

    /**
     * When this method is called, the depth frame source watcher stops looking for changes to the depth frame source list. This operation is not immediate; the Stopped event will be triggered when the Stop operation is complete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptiondepthframesourcewatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IPerceptionDepthFrameSourceWatcher")) {
            if ((queryResult := this.QueryInterface(IPerceptionDepthFrameSourceWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionDepthFrameSourceWatcher := IPerceptionDepthFrameSourceWatcher(outPtr)
        }

        return this.__IPerceptionDepthFrameSourceWatcher.Stop()
    }

;@endregion Instance Methods
}
