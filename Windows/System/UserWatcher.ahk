#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserWatcher.ahk
#Include ..\Foundation\TypedEventHandler.ahk
#Include .\UserWatcher.ahk
#Include .\UserChangedEventArgs.ahk
#Include .\UserAuthenticationStatusChangingEventArgs.ahk
#Include ..\..\Guid.ahk
#Include ..\..\WinRTEventHandler.ahk

/**
 * Provides events that fire during enumeration of users, when the collection of users changes, or when a user's authentication status changes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userwatcher
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class UserWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of a user watcher.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userwatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Fires when a user is added to the collection of users returned by [User.FindAllAsync](/uwp/api/windows.system.user.findallasync).
     * @type {TypedEventHandler<UserWatcher, UserChangedEventArgs>}
    */
    OnAdded {
        get {
            if(!this.HasProp("__OnAdded")){
                this.__OnAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{eb9d0454-25db-5620-98b8-be4c5d0dbc67}"),
                    UserWatcher,
                    UserChangedEventArgs
                )
                this.__OnAddedToken := this.add_Added(this.__OnAdded.iface)
            }
            return this.__OnAdded
        }
    }

    /**
     * Fires when a user is removed from the collection of users returned by [User.FindAllAsync](/uwp/api/windows.system.user.findallasync).
     * @type {TypedEventHandler<UserWatcher, UserChangedEventArgs>}
    */
    OnRemoved {
        get {
            if(!this.HasProp("__OnRemoved")){
                this.__OnRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{eb9d0454-25db-5620-98b8-be4c5d0dbc67}"),
                    UserWatcher,
                    UserChangedEventArgs
                )
                this.__OnRemovedToken := this.add_Removed(this.__OnRemoved.iface)
            }
            return this.__OnRemoved
        }
    }

    /**
     * Fires when the data associated with a user has changed.
     * @type {TypedEventHandler<UserWatcher, UserChangedEventArgs>}
    */
    OnUpdated {
        get {
            if(!this.HasProp("__OnUpdated")){
                this.__OnUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{eb9d0454-25db-5620-98b8-be4c5d0dbc67}"),
                    UserWatcher,
                    UserChangedEventArgs
                )
                this.__OnUpdatedToken := this.add_Updated(this.__OnUpdated.iface)
            }
            return this.__OnUpdated
        }
    }

    /**
     * Fires when a user's authentication status has changed.
     * @type {TypedEventHandler<UserWatcher, UserChangedEventArgs>}
    */
    OnAuthenticationStatusChanged {
        get {
            if(!this.HasProp("__OnAuthenticationStatusChanged")){
                this.__OnAuthenticationStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{eb9d0454-25db-5620-98b8-be4c5d0dbc67}"),
                    UserWatcher,
                    UserChangedEventArgs
                )
                this.__OnAuthenticationStatusChangedToken := this.add_AuthenticationStatusChanged(this.__OnAuthenticationStatusChanged.iface)
            }
            return this.__OnAuthenticationStatusChanged
        }
    }

    /**
     * Fires when a user's authentication status is about to change.
     * @type {TypedEventHandler<UserWatcher, UserAuthenticationStatusChangingEventArgs>}
    */
    OnAuthenticationStatusChanging {
        get {
            if(!this.HasProp("__OnAuthenticationStatusChanging")){
                this.__OnAuthenticationStatusChanging := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9ec3d9d5-b413-51df-8c64-640e3356e351}"),
                    UserWatcher,
                    UserAuthenticationStatusChangingEventArgs
                )
                this.__OnAuthenticationStatusChangingToken := this.add_AuthenticationStatusChanging(this.__OnAuthenticationStatusChanging.iface)
            }
            return this.__OnAuthenticationStatusChanging
        }
    }

    /**
     * Fires when the initial pass of watcher events has been processed and the collection of users is complete.
     * @type {TypedEventHandler<UserWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f155e0ff-dbb5-5c34-ac0c-7e291e3300ab}"),
                    UserWatcher,
                    IInspectable
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
        }
    }

    /**
     * Fires when the user watcher has stopped.
     * @type {TypedEventHandler<UserWatcher, IInspectable>}
    */
    OnStopped {
        get {
            if(!this.HasProp("__OnStopped")){
                this.__OnStopped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f155e0ff-dbb5-5c34-ac0c-7e291e3300ab}"),
                    UserWatcher,
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

        if(this.HasProp("__OnUpdatedToken")) {
            this.remove_Updated(this.__OnUpdatedToken)
            this.__OnUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnAuthenticationStatusChangedToken")) {
            this.remove_AuthenticationStatusChanged(this.__OnAuthenticationStatusChangedToken)
            this.__OnAuthenticationStatusChanged.iface.Dispose()
        }

        if(this.HasProp("__OnAuthenticationStatusChangingToken")) {
            this.remove_AuthenticationStatusChanging(this.__OnAuthenticationStatusChangingToken)
            this.__OnAuthenticationStatusChanging.iface.Dispose()
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
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.get_Status()
    }

    /**
     * Starts the user watcher.
     * @remarks
     * You must add a handler for the [UserWatcher.Added](userwatcher_added.md) before event before calling Start.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userwatcher.start
     */
    Start() {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.Start()
    }

    /**
     * Stops the user watcher.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userwatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.Stop()
    }

    /**
     * 
     * @param {TypedEventHandler<UserWatcher, UserChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Added(handler) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.add_Added(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Added(token) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.remove_Added(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UserWatcher, UserChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Removed(handler) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.add_Removed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Removed(token) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.remove_Removed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UserWatcher, UserChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Updated(handler) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.add_Updated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Updated(token) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.remove_Updated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UserWatcher, UserChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AuthenticationStatusChanged(handler) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.add_AuthenticationStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AuthenticationStatusChanged(token) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.remove_AuthenticationStatusChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UserWatcher, UserAuthenticationStatusChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AuthenticationStatusChanging(handler) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.add_AuthenticationStatusChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AuthenticationStatusChanging(token) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.remove_AuthenticationStatusChanging(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UserWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UserWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.add_Stopped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Stopped(token) {
        if (!this.HasProp("__IUserWatcher")) {
            if ((queryResult := this.QueryInterface(IUserWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserWatcher := IUserWatcher(outPtr)
        }

        return this.__IUserWatcher.remove_Stopped(token)
    }

;@endregion Instance Methods
}
