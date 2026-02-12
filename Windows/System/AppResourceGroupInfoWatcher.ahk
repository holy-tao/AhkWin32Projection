#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppResourceGroupInfoWatcher.ahk
#Include ..\Foundation\TypedEventHandler.ahk
#Include .\AppResourceGroupInfoWatcher.ahk
#Include .\AppResourceGroupInfoWatcherEventArgs.ahk
#Include .\AppResourceGroupInfoWatcherExecutionStateChangedEventArgs.ahk
#Include ..\..\Guid.ahk
#Include ..\..\WinRTEventHandler.ahk

/**
 * Allows you to monitor the set of resource groups ([AppResourceGroupInfo](appresourcegroupinfo.md) objects) for an app, and get notifications when a resource group is added or removed.
 * @remarks
 * For example, a resource group is added when an out-of-process background task is activated; a resource group is removed when a background task completes.
 * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfowatcher
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppResourceGroupInfoWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppResourceGroupInfoWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppResourceGroupInfoWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets this **AppResourceGroupInfoWatcher** status.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfowatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Event that fires when a resource group is added.
     * @type {TypedEventHandler<AppResourceGroupInfoWatcher, AppResourceGroupInfoWatcherEventArgs>}
    */
    OnAdded {
        get {
            if(!this.HasProp("__OnAdded")){
                this.__OnAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a7e14bae-c778-5661-a41c-1ac3ac635f79}"),
                    AppResourceGroupInfoWatcher,
                    AppResourceGroupInfoWatcherEventArgs
                )
                this.__OnAddedToken := this.add_Added(this.__OnAdded.iface)
            }
            return this.__OnAdded
        }
    }

    /**
     * Fires when one of the resource groups has been removed from the list of [AppResourceGroupInfos](appresourcegroupinfo.md) in the package.
     * @type {TypedEventHandler<AppResourceGroupInfoWatcher, AppResourceGroupInfoWatcherEventArgs>}
    */
    OnRemoved {
        get {
            if(!this.HasProp("__OnRemoved")){
                this.__OnRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a7e14bae-c778-5661-a41c-1ac3ac635f79}"),
                    AppResourceGroupInfoWatcher,
                    AppResourceGroupInfoWatcherEventArgs
                )
                this.__OnRemovedToken := this.add_Removed(this.__OnRemoved.iface)
            }
            return this.__OnRemoved
        }
    }

    /**
     * Fires when the watcher has completed enumerating the resource groups that are available to monitor.
     * @remarks
     * After enumeration is complete, the watcher will start reporting when items are added or removed.
     * @type {TypedEventHandler<AppResourceGroupInfoWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e23a2901-197a-5867-8728-9c9db9498d76}"),
                    AppResourceGroupInfoWatcher,
                    IInspectable
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
        }
    }

    /**
     * Event that fires when this **AppResourceGroupInfoWatcher** stops watching for resource group changes.
     * @type {TypedEventHandler<AppResourceGroupInfoWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e23a2901-197a-5867-8728-9c9db9498d76}"),
                    AppResourceGroupInfoWatcher,
                    IInspectable
                )
                this.__OnStoppedToken := this.add_Stopped(this.__OnStopped.iface)
            }
            return this.__OnStopped
        }
    }

    /**
     * Event that fires when the execution state (running, suspending, an so on) for this group changes.
     * @type {TypedEventHandler<AppResourceGroupInfoWatcher, AppResourceGroupInfoWatcherExecutionStateChangedEventArgs>}
    */
    OnExecutionStateChanged {
        get {
            if(!this.HasProp("__OnExecutionStateChanged")){
                this.__OnExecutionStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{93f9724c-17f8-5df5-a6cf-2f0ab90c0a27}"),
                    AppResourceGroupInfoWatcher,
                    AppResourceGroupInfoWatcherExecutionStateChangedEventArgs
                )
                this.__OnExecutionStateChangedToken := this.add_ExecutionStateChanged(this.__OnExecutionStateChanged.iface)
            }
            return this.__OnExecutionStateChanged
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

        if(this.HasProp("__OnExecutionStateChangedToken")) {
            this.remove_ExecutionStateChanged(this.__OnExecutionStateChangedToken)
            this.__OnExecutionStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<AppResourceGroupInfoWatcher, AppResourceGroupInfoWatcherEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Added(handler) {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.add_Added(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Added(token) {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.remove_Added(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppResourceGroupInfoWatcher, AppResourceGroupInfoWatcherEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Removed(handler) {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.add_Removed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Removed(token) {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.remove_Removed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppResourceGroupInfoWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppResourceGroupInfoWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.remove_Stopped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppResourceGroupInfoWatcher, AppResourceGroupInfoWatcherExecutionStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ExecutionStateChanged(handler) {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.add_ExecutionStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ExecutionStateChanged(token) {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.remove_ExecutionStateChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.get_Status()
    }

    /**
     * Start firing events when the execution state changes, or resource groups change, within the set of resource groups for this app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfowatcher.start
     */
    Start() {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.Start()
    }

    /**
     * Stops firing events when the execution state changes, or resource groups change, within the set of resource groups for this app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfowatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IAppResourceGroupInfoWatcher")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcher := IAppResourceGroupInfoWatcher(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcher.Stop()
    }

;@endregion Instance Methods
}
