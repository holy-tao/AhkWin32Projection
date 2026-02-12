#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionParticipantWatcher.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\RemoteSystemSessionParticipantWatcher.ahk
#Include .\RemoteSystemSessionParticipantAddedEventArgs.ahk
#Include .\RemoteSystemSessionParticipantRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Handles the discovery and monitoring of remote session participants by raising the appropriate events.
 * @remarks
 * This class is instantiated when the [CreateParticipantWatcher](/uwp/api/windows.system.remotesystems.remotesystemsession.createparticipantwatcher) method is called on an instance of [RemoteSystemSession](RemoteSystemSession.md). Instances of this class each correspond to one instance of **RemoteSystemSession** (and therefore one remote session).
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionparticipantwatcher
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionParticipantWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionParticipantWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionParticipantWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the operational status of this participant watcher.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionparticipantwatcher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Raised when a new participant has been added to the remote session.
     * @type {TypedEventHandler<RemoteSystemSessionParticipantWatcher, RemoteSystemSessionParticipantAddedEventArgs>}
    */
    OnAdded {
        get {
            if(!this.HasProp("__OnAdded")){
                this.__OnAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7d42fff3-fd21-5e15-b21a-75e1bbcd13c7}"),
                    RemoteSystemSessionParticipantWatcher,
                    RemoteSystemSessionParticipantAddedEventArgs
                )
                this.__OnAddedToken := this.add_Added(this.__OnAdded.iface)
            }
            return this.__OnAdded
        }
    }

    /**
     * Raised when a participant in the session has been removed.
     * @type {TypedEventHandler<RemoteSystemSessionParticipantWatcher, RemoteSystemSessionParticipantRemovedEventArgs>}
    */
    OnRemoved {
        get {
            if(!this.HasProp("__OnRemoved")){
                this.__OnRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{73d7e8b3-7d44-50c8-afad-450de59fd0ae}"),
                    RemoteSystemSessionParticipantWatcher,
                    RemoteSystemSessionParticipantRemovedEventArgs
                )
                this.__OnRemovedToken := this.add_Removed(this.__OnRemoved.iface)
            }
            return this.__OnRemoved
        }
    }

    /**
     * Raised after the initial enumeration of participants has completed.
     * @remarks
     * An app may delay UI rendering for session participants until this point, so that the UI elements for many participant can be rendered at once. Participant discovery events can continue to be raised after this event.
     * @type {TypedEventHandler<RemoteSystemSessionParticipantWatcher, IInspectable>}
    */
    OnEnumerationCompleted {
        get {
            if(!this.HasProp("__OnEnumerationCompleted")){
                this.__OnEnumerationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d4cf5bda-cc7a-52ef-a256-c4b36163beec}"),
                    RemoteSystemSessionParticipantWatcher,
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

        super.__Delete()
    }

    /**
     * Starts watching for participants in the remote session. The discovery process runs until the [Stop](remotesystemsessionparticipantwatcher_stop_1201535524.md) method is called. A [RemoteSystemSessionParticipantWatcher](RemoteSystemSessionParticipantWatcher.md) object can have its **Start** method called again at a later time.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionparticipantwatcher.start
     */
    Start() {
        if (!this.HasProp("__IRemoteSystemSessionParticipantWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionParticipantWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionParticipantWatcher := IRemoteSystemSessionParticipantWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionParticipantWatcher.Start()
    }

    /**
     * Stops watching for discoverable session participants.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionparticipantwatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IRemoteSystemSessionParticipantWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionParticipantWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionParticipantWatcher := IRemoteSystemSessionParticipantWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionParticipantWatcher.Stop()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IRemoteSystemSessionParticipantWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionParticipantWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionParticipantWatcher := IRemoteSystemSessionParticipantWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionParticipantWatcher.get_Status()
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemSessionParticipantWatcher, RemoteSystemSessionParticipantAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Added(handler) {
        if (!this.HasProp("__IRemoteSystemSessionParticipantWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionParticipantWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionParticipantWatcher := IRemoteSystemSessionParticipantWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionParticipantWatcher.add_Added(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Added(token) {
        if (!this.HasProp("__IRemoteSystemSessionParticipantWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionParticipantWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionParticipantWatcher := IRemoteSystemSessionParticipantWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionParticipantWatcher.remove_Added(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemSessionParticipantWatcher, RemoteSystemSessionParticipantRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Removed(handler) {
        if (!this.HasProp("__IRemoteSystemSessionParticipantWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionParticipantWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionParticipantWatcher := IRemoteSystemSessionParticipantWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionParticipantWatcher.add_Removed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Removed(token) {
        if (!this.HasProp("__IRemoteSystemSessionParticipantWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionParticipantWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionParticipantWatcher := IRemoteSystemSessionParticipantWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionParticipantWatcher.remove_Removed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemSessionParticipantWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_EnumerationCompleted(handler) {
        if (!this.HasProp("__IRemoteSystemSessionParticipantWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionParticipantWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionParticipantWatcher := IRemoteSystemSessionParticipantWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionParticipantWatcher.add_EnumerationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_EnumerationCompleted(token) {
        if (!this.HasProp("__IRemoteSystemSessionParticipantWatcher")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionParticipantWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionParticipantWatcher := IRemoteSystemSessionParticipantWatcher(outPtr)
        }

        return this.__IRemoteSystemSessionParticipantWatcher.remove_EnumerationCompleted(token)
    }

;@endregion Instance Methods
}
