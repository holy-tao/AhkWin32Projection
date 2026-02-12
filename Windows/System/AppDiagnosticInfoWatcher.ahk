#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppDiagnosticInfoWatcher.ahk
#Include ..\Foundation\TypedEventHandler.ahk
#Include .\AppDiagnosticInfoWatcher.ahk
#Include .\AppDiagnosticInfoWatcherEventArgs.ahk
#Include ..\..\Guid.ahk
#Include ..\..\WinRTEventHandler.ahk

/**
 * Allows you to monitor diagnostic information for an app and get notifications when an app is added or removed from the list of running apps.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfowatcher
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppDiagnosticInfoWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppDiagnosticInfoWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppDiagnosticInfoWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets this **AppDiagnosticInfoWatcher** status.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfowatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Event that fires when an app is added to the list of running apps.
     * @type {TypedEventHandler<AppDiagnosticInfoWatcher, AppDiagnosticInfoWatcherEventArgs>}
    */
    OnAdded {
        get {
            if(!this.HasProp("__OnAdded")){
                this.__OnAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c8c6f9f-d6bf-5566-b013-39c141e0ff8c}"),
                    AppDiagnosticInfoWatcher,
                    AppDiagnosticInfoWatcherEventArgs
                )
                this.__OnAddedToken := this.add_Added(this.__OnAdded.iface)
            }
            return this.__OnAdded
        }
    }

    /**
     * Fires when one of the apps has been removed from the list of running apps.
     * @type {TypedEventHandler<AppDiagnosticInfoWatcher, AppDiagnosticInfoWatcherEventArgs>}
    */
    OnRemoved {
        get {
            if(!this.HasProp("__OnRemoved")){
                this.__OnRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c8c6f9f-d6bf-5566-b013-39c141e0ff8c}"),
                    AppDiagnosticInfoWatcher,
                    AppDiagnosticInfoWatcherEventArgs
                )
                this.__OnRemovedToken := this.add_Removed(this.__OnRemoved.iface)
            }
            return this.__OnRemoved
        }
    }

    /**
     * Fires when the watcher has completed enumerating the list of running apps that are available to monitor.
     * @remarks
     * After enumeration is complete, the watcher will start reporting when apps are added or removed.
     * @type {TypedEventHandler<AppDiagnosticInfoWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{895dee2f-e0f2-5304-a40e-1c67a2c058aa}"),
                    AppDiagnosticInfoWatcher,
                    IInspectable
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
        }
    }

    /**
     * Event that fires when this **AppDiagnosticInfoWatcher** stops watching for changes.
     * @type {TypedEventHandler<AppDiagnosticInfoWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{895dee2f-e0f2-5304-a40e-1c67a2c058aa}"),
                    AppDiagnosticInfoWatcher,
                    IInspectable
                )
                this.__OnStoppedToken := this.add_Stopped(this.__OnStopped.iface)
            }
            return this.__OnStopped
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAddedToken")) {
            this.remove_Added(this.__OnAddedToken)
            this.__OnAdded.iface.Dispose()
        }

        if(this.HasProp("__OnRemovedToken")) {
            this.remove_Removed(this.__OnRemovedToken)
            this.__OnRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnEnumerationCompletedToken")) {
            this.remove_EnumerationCompleted(this.__OnEnumerationCompletedToken)
            this.__OnEnumerationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnStoppedToken")) {
            this.remove_Stopped(this.__OnStoppedToken)
            this.__OnStopped.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<AppDiagnosticInfoWatcher, AppDiagnosticInfoWatcherEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Added(handler) {
        if (!this.HasProp("__IAppDiagnosticInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfoWatcher := IAppDiagnosticInfoWatcher(outPtr)
        }

        return this.__IAppDiagnosticInfoWatcher.add_Added(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Added(token) {
        if (!this.HasProp("__IAppDiagnosticInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfoWatcher := IAppDiagnosticInfoWatcher(outPtr)
        }

        return this.__IAppDiagnosticInfoWatcher.remove_Added(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppDiagnosticInfoWatcher, AppDiagnosticInfoWatcherEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Removed(handler) {
        if (!this.HasProp("__IAppDiagnosticInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfoWatcher := IAppDiagnosticInfoWatcher(outPtr)
        }

        return this.__IAppDiagnosticInfoWatcher.add_Removed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Removed(token) {
        if (!this.HasProp("__IAppDiagnosticInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfoWatcher := IAppDiagnosticInfoWatcher(outPtr)
        }

        return this.__IAppDiagnosticInfoWatcher.remove_Removed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppDiagnosticInfoWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IAppDiagnosticInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfoWatcher := IAppDiagnosticInfoWatcher(outPtr)
        }

        return this.__IAppDiagnosticInfoWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IAppDiagnosticInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfoWatcher := IAppDiagnosticInfoWatcher(outPtr)
        }

        return this.__IAppDiagnosticInfoWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppDiagnosticInfoWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IAppDiagnosticInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfoWatcher := IAppDiagnosticInfoWatcher(outPtr)
        }

        return this.__IAppDiagnosticInfoWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IAppDiagnosticInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfoWatcher := IAppDiagnosticInfoWatcher(outPtr)
        }

        return this.__IAppDiagnosticInfoWatcher.remove_Stopped(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IAppDiagnosticInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfoWatcher := IAppDiagnosticInfoWatcher(outPtr)
        }

        return this.__IAppDiagnosticInfoWatcher.get_Status()
    }

    /**
     * Start firing events when the execution state changes, or apps change, within the list of running apps.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfowatcher.start
     */
    Start() {
        if (!this.HasProp("__IAppDiagnosticInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfoWatcher := IAppDiagnosticInfoWatcher(outPtr)
        }

        return this.__IAppDiagnosticInfoWatcher.Start()
    }

    /**
     * Stops firing events when the execution state changes, or apps change, within the list of running apps.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appdiagnosticinfowatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IAppDiagnosticInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppDiagnosticInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDiagnosticInfoWatcher := IAppDiagnosticInfoWatcher(outPtr)
        }

        return this.__IAppDiagnosticInfoWatcher.Stop()
    }

;@endregion Instance Methods
}
