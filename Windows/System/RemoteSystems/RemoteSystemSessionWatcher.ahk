#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionWatcher.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\RemoteSystemSessionWatcher.ahk
#Include .\RemoteSystemSessionAddedEventArgs.ahk
#Include .\RemoteSystemSessionUpdatedEventArgs.ahk
#Include .\RemoteSystemSessionRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Watches for activity related to the discovery of remote sessions and raises the appropriate events.
 * @remarks
 * This class is instantiated when the [RemoteSystemSession.CreateWatcher](RemoteSystemSession_CreateWatcher_1506431823.md) method is called.
 * 
 * > [!IMPORTANT]
 * > You must confirm access to the remote system platform with a call to **[RemoteSystem.RequestAccessAsync](remotesystem_requestaccessasync_380675631.md)** before you instantiate this class.
 * 
 * > [!IMPORTANT]
 * > The following conditions must be met in order for remote session discovery to work as intended:
 * > 1. Bluetooth must be turned on for both the client and host devices. Session discovery may work via LAN discovery, but it isn’t guaranteed (it depends on the network configuration).
 * > 2. In Windows Settings on the host device, the **Share across devices** setting under **System -> Shared Experiences** must be set to "Everyone nearby".
 * > 3. Client and host apps must have the same PackageFamilyName.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionwatcher
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the operational status of this remote session watcher.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionwatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Raised when a new remote session has been discovered by the [RemoteSystemSessionWatcher](RemoteSystemSessionWatcher.md).
     * @type {TypedEventHandler<RemoteSystemSessionWatcher, RemoteSystemSessionAddedEventArgs>}
    */
    OnAdded {
        get {
            if(!this.HasProp("__OnAdded")){
                this.__OnAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1b036c4f-6b8f-55d6-b6df-45e46a823b1d}"),
                    RemoteSystemSessionWatcher,
                    RemoteSystemSessionAddedEventArgs
                )
                this.__OnAddedToken := this.add_Added(this.__OnAdded.iface)
            }
            return this.__OnAdded
        }
    }

    /**
     * Raised when a previously discovered remote session has some part of its information updated.
     * @type {TypedEventHandler<RemoteSystemSessionWatcher, RemoteSystemSessionUpdatedEventArgs>}
    */
    OnUpdated {
        get {
            if(!this.HasProp("__OnUpdated")){
                this.__OnUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{040f48b7-0d41-5aa2-85e8-6311666f0324}"),
                    RemoteSystemSessionWatcher,
                    RemoteSystemSessionUpdatedEventArgs
                )
                this.__OnUpdatedToken := this.add_Updated(this.__OnUpdated.iface)
            }
            return this.__OnUpdated
        }
    }

    /**
     * Raised when a previously discovered remote session has disappeared.
     * @type {TypedEventHandler<RemoteSystemSessionWatcher, RemoteSystemSessionRemovedEventArgs>}
    */
    OnRemoved {
        get {
            if(!this.HasProp("__OnRemoved")){
                this.__OnRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1cbc54f0-0c9d-59cc-8055-5e017a317812}"),
                    RemoteSystemSessionWatcher,
                    RemoteSystemSessionRemovedEventArgs
                )
                this.__OnRemovedToken := this.add_Removed(this.__OnRemoved.iface)
            }
            return this.__OnRemoved
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

        if(this.HasProp("__OnUpdatedToken")) {
            this.remove_Updated(this.__OnUpdatedToken)
            this.__OnUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnRemovedToken")) {
            this.remove_Removed(this.__OnRemovedToken)
            this.__OnRemoved.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Starts watching for discoverable remote sessions. The discovery process runs until the [Stop](remotesystemsessionwatcher_stop_1201535524.md) method is called. A [RemoteSystemSessionWatcher](RemoteSystemSessionWatcher.md) object can have its **Start** method called again at a later time.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionwatcher.start
     */
    Start() {
        if (!this.HasProp("__IRemoteSystemSessionWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionWatcher := IRemoteSystemSessionWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionWatcher.Start()
    }

    /**
     * Stops watching for discoverable remote sessions.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionwatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IRemoteSystemSessionWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionWatcher := IRemoteSystemSessionWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionWatcher.Stop()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IRemoteSystemSessionWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionWatcher := IRemoteSystemSessionWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionWatcher.get_Status()
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemSessionWatcher, RemoteSystemSessionAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Added(handler) {
        if (!this.HasProp("__IRemoteSystemSessionWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionWatcher := IRemoteSystemSessionWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionWatcher.add_Added(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Added(token) {
        if (!this.HasProp("__IRemoteSystemSessionWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionWatcher := IRemoteSystemSessionWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionWatcher.remove_Added(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemSessionWatcher, RemoteSystemSessionUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Updated(handler) {
        if (!this.HasProp("__IRemoteSystemSessionWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionWatcher := IRemoteSystemSessionWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionWatcher.add_Updated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Updated(token) {
        if (!this.HasProp("__IRemoteSystemSessionWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionWatcher := IRemoteSystemSessionWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionWatcher.remove_Updated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemSessionWatcher, RemoteSystemSessionRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Removed(handler) {
        if (!this.HasProp("__IRemoteSystemSessionWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionWatcher := IRemoteSystemSessionWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionWatcher.add_Removed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Removed(token) {
        if (!this.HasProp("__IRemoteSystemSessionWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionWatcher := IRemoteSystemSessionWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionWatcher.remove_Removed(token)
    }

;@endregion Instance Methods
}
