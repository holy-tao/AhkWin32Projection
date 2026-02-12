#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemWatcher.ahk
#Include .\IRemoteSystemWatcher2.ahk
#Include .\IRemoteSystemWatcher3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\RemoteSystemWatcher.ahk
#Include .\RemoteSystemAddedEventArgs.ahk
#Include .\RemoteSystemUpdatedEventArgs.ahk
#Include .\RemoteSystemRemovedEventArgs.ahk
#Include .\RemoteSystemEnumerationCompletedEventArgs.ahk
#Include .\RemoteSystemWatcherErrorOccurredEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Watches for activity related to the discovery of remote systems and raises the appropriate events.
 * @remarks
 * This class is instantiated when the static method [CreateWatcher](remotesystem_createwatcher_1086025665.md) is called. Objects of this class begin watching activity when the [Start](remotesystemwatcher_start_1587696324.md) method is called and stop when [Stop](remotesystemwatcher_stop_1201535524.md) is called, when the app exits or is suspended by the system, or if an error occurs.
 * 
 * > [!IMPORTANT]
 * > You must confirm access to the remote system platform with a call to **[RemoteSystem.RequestAccessAsync](remotesystem_requestaccessasync_380675631.md)** before you instantiate this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemwatcher
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Represents the User that the RemoteSystemWatcher intends to see devices for.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemwatcher.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * The event that is raised when a new remote system (device) is discovered.
     * @type {TypedEventHandler<RemoteSystemWatcher, RemoteSystemAddedEventArgs>}
    */
    OnRemoteSystemAdded {
        get {
            if(!this.HasProp("__OnRemoteSystemAdded")){
                this.__OnRemoteSystemAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a9b98f4a-b63d-5d07-92bb-e2acb39455d1}"),
                    RemoteSystemWatcher,
                    RemoteSystemAddedEventArgs
                )
                this.__OnRemoteSystemAddedToken := this.add_RemoteSystemAdded(this.__OnRemoteSystemAdded.iface)
            }
            return this.__OnRemoteSystemAdded
        }
    }

    /**
     * Raised when a remote system (device) that was previously discovered in this discovery session changes from proximally connected to cloud connected, or the reverse. It is also raised when a remote system changes one of its monitored properties (see the properties of the [RemoteSystem](remotesystem.md) class).
     * @type {TypedEventHandler<RemoteSystemWatcher, RemoteSystemUpdatedEventArgs>}
    */
    OnRemoteSystemUpdated {
        get {
            if(!this.HasProp("__OnRemoteSystemUpdated")){
                this.__OnRemoteSystemUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{88f9d23f-8946-5a1e-8da1-82c66982a6d2}"),
                    RemoteSystemWatcher,
                    RemoteSystemUpdatedEventArgs
                )
                this.__OnRemoteSystemUpdatedToken := this.add_RemoteSystemUpdated(this.__OnRemoteSystemUpdated.iface)
            }
            return this.__OnRemoteSystemUpdated
        }
    }

    /**
     * The event that is raised when a previously discovered remote system (device) is no longer visible.
     * @remarks
     * This event is raised only after a remote system has stopped being discoverable over _all_ of the categories specified by the associated **RemoteSystemDiscoveryTypeFilter**.
     * @type {TypedEventHandler<RemoteSystemWatcher, RemoteSystemRemovedEventArgs>}
    */
    OnRemoteSystemRemoved {
        get {
            if(!this.HasProp("__OnRemoteSystemRemoved")){
                this.__OnRemoteSystemRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c290fb5a-3ed0-5858-af19-f85553cb96b8}"),
                    RemoteSystemWatcher,
                    RemoteSystemRemovedEventArgs
                )
                this.__OnRemoteSystemRemovedToken := this.add_RemoteSystemRemoved(this.__OnRemoteSystemRemoved.iface)
            }
            return this.__OnRemoteSystemRemoved
        }
    }

    /**
     * This event is raised when the initial remote system discovery process completes.
     * @remarks
     * This event is raised for different criteria depending on the discovery type, but in every case it is meant to signify the time when all available devices can be expected to have been discovered.
     * @type {TypedEventHandler<RemoteSystemWatcher, RemoteSystemEnumerationCompletedEventArgs>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{42ae9d52-fd0d-5411-8c8c-d676a09767e9}"),
                    RemoteSystemWatcher,
                    RemoteSystemEnumerationCompletedEventArgs
                )
                this.__OnEnumerationCompletedToken := this.add_EnumerationCompleted(this.__OnEnumerationCompleted.iface)
            }
            return this.__OnEnumerationCompleted
        }
    }

    /**
     * This event is raised when an error occurs during discovery. The discovery process will continue if possible. For example, if the error occurs with a value of **RemoteSystemWatcherError.InternetNotAvailable** (see **[RemoteSystemWatcherError](RemoteSystemWatcherError.md)**), proximal discovery will continue because the error applies only to cloud discovery (see **[RemoteSystemDiscoveryType](remotesystemdiscoverytype.md)**).
     * @remarks
     * The listener for this event should notify the user of the type of error that was encountered. See the **[RemoteSystemWatcherError](RemoteSystemWatcherError.md)** enum for details.
     * @type {TypedEventHandler<RemoteSystemWatcher, RemoteSystemWatcherErrorOccurredEventArgs>}
    */
    OnErrorOccurred {
        get {
            if(!this.HasProp("__OnErrorOccurred")){
                this.__OnErrorOccurred := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a4a023b4-567b-5d4b-a4c8-5ca4f886d3a3}"),
                    RemoteSystemWatcher,
                    RemoteSystemWatcherErrorOccurredEventArgs
                )
                this.__OnErrorOccurredToken := this.add_ErrorOccurred(this.__OnErrorOccurred.iface)
            }
            return this.__OnErrorOccurred
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRemoteSystemAddedToken")) {
            this.remove_RemoteSystemAdded(this.__OnRemoteSystemAddedToken)
            this.__OnRemoteSystemAdded.iface.Dispose()
        }

        if(this.HasProp("__OnRemoteSystemUpdatedToken")) {
            this.remove_RemoteSystemUpdated(this.__OnRemoteSystemUpdatedToken)
            this.__OnRemoteSystemUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnRemoteSystemRemovedToken")) {
            this.remove_RemoteSystemRemoved(this.__OnRemoteSystemRemovedToken)
            this.__OnRemoteSystemRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnEnumerationCompletedToken")) {
            this.remove_EnumerationCompleted(this.__OnEnumerationCompletedToken)
            this.__OnEnumerationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnErrorOccurredToken")) {
            this.remove_ErrorOccurred(this.__OnErrorOccurredToken)
            this.__OnErrorOccurred.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Starts watching for discoverable remote systems. The discovery process runs until the [Stop](remotesystemwatcher_stop_1201535524.md) method is called or an error occurs. A [RemoteSystemWatcher](remotesystemwatcher.md) object can have its **Start** method called again at a later time.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemwatcher.start
     */
    Start() {
        if (!this.HasProp("__IRemoteSystemWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher := IRemoteSystemWatcher(outPtr)
        }

        return this.__IRemoteSystemWatcher.Start()
    }

    /**
     * Stops watching for discoverable remote systems.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemwatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IRemoteSystemWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher := IRemoteSystemWatcher(outPtr)
        }

        return this.__IRemoteSystemWatcher.Stop()
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemWatcher, RemoteSystemAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RemoteSystemAdded(handler) {
        if (!this.HasProp("__IRemoteSystemWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher := IRemoteSystemWatcher(outPtr)
        }

        return this.__IRemoteSystemWatcher.add_RemoteSystemAdded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RemoteSystemAdded(token) {
        if (!this.HasProp("__IRemoteSystemWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher := IRemoteSystemWatcher(outPtr)
        }

        return this.__IRemoteSystemWatcher.remove_RemoteSystemAdded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemWatcher, RemoteSystemUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RemoteSystemUpdated(handler) {
        if (!this.HasProp("__IRemoteSystemWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher := IRemoteSystemWatcher(outPtr)
        }

        return this.__IRemoteSystemWatcher.add_RemoteSystemUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RemoteSystemUpdated(token) {
        if (!this.HasProp("__IRemoteSystemWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher := IRemoteSystemWatcher(outPtr)
        }

        return this.__IRemoteSystemWatcher.remove_RemoteSystemUpdated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemWatcher, RemoteSystemRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RemoteSystemRemoved(handler) {
        if (!this.HasProp("__IRemoteSystemWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher := IRemoteSystemWatcher(outPtr)
        }

        return this.__IRemoteSystemWatcher.add_RemoteSystemRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RemoteSystemRemoved(token) {
        if (!this.HasProp("__IRemoteSystemWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher := IRemoteSystemWatcher(outPtr)
        }

        return this.__IRemoteSystemWatcher.remove_RemoteSystemRemoved(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemWatcher, RemoteSystemEnumerationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IRemoteSystemWatcher2")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher2 := IRemoteSystemWatcher2(outPtr)
        }

        return this.__IRemoteSystemWatcher2.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IRemoteSystemWatcher2")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher2 := IRemoteSystemWatcher2(outPtr)
        }

        return this.__IRemoteSystemWatcher2.remove_EnumerationCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemWatcher, RemoteSystemWatcherErrorOccurredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ErrorOccurred(handler) {
        if (!this.HasProp("__IRemoteSystemWatcher2")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher2 := IRemoteSystemWatcher2(outPtr)
        }

        return this.__IRemoteSystemWatcher2.add_ErrorOccurred(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ErrorOccurred(token) {
        if (!this.HasProp("__IRemoteSystemWatcher2")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher2 := IRemoteSystemWatcher2(outPtr)
        }

        return this.__IRemoteSystemWatcher2.remove_ErrorOccurred(token)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IRemoteSystemWatcher3")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcher3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcher3 := IRemoteSystemWatcher3(outPtr)
        }

        return this.__IRemoteSystemWatcher3.get_User()
    }

;@endregion Instance Methods
}
