#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSession.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IRemoteSystemSessionStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\RemoteSystemSession.ahk
#Include .\RemoteSystemSessionDisconnectedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents and handles a remote session that can be shared between two or more connected devices. See Remarks for information on this feature.
 * @remarks
 * Remote System Sessions is a part of the broader Remote Systems feature set. It allows an app to establish a session object as an intermediate third party that two or more devices can continually communicate through, enabling a number of new cross-device scenarios such as remote app messaging.
 * 
 * A session that has been joined is represented by a [RemoteSystemSession](RemoteSystemSession.md) object. A session that is known about but has not been joined is represented by a [RemoteSystemSessionInfo](RemoteSystemSessionInfo.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsession
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSession.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes and returns a [RemoteSystemSessionWatcher](remotesystemsessionwatcher.md) object to monitor the presence of remote sessions.
     * @returns {RemoteSystemSessionWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsession.createwatcher
     */
    static CreateWatcher() {
        if (!RemoteSystemSession.HasProp("__IRemoteSystemSessionStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemSessionStatics.IID)
            RemoteSystemSession.__IRemoteSystemSessionStatics := IRemoteSystemSessionStatics(factoryPtr)
        }

        return RemoteSystemSession.__IRemoteSystemSessionStatics.CreateWatcher()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the unique identifier for this remote session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsession.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the public-facing name for this remote session, given by the controller of the session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsession.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the machine name of the device that is the controller of this remote session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsession.controllerdisplayname
     * @type {HSTRING} 
     */
    ControllerDisplayName {
        get => this.get_ControllerDisplayName()
    }

    /**
     * Raised when this device has been disconnected from this remote session.
     * @type {TypedEventHandler<RemoteSystemSession, RemoteSystemSessionDisconnectedEventArgs>}
    */
    OnDisconnected {
        get {
            if(!this.HasProp("__OnDisconnected")){
                this.__OnDisconnected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{fba14773-5038-511a-95a3-4ba45349100a}"),
                    RemoteSystemSession,
                    RemoteSystemSessionDisconnectedEventArgs
                )
                this.__OnDisconnectedToken := this.add_Disconnected(this.__OnDisconnected.iface)
            }
            return this.__OnDisconnected
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDisconnectedToken")) {
            this.remove_Disconnected(this.__OnDisconnectedToken)
            this.__OnDisconnected.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IRemoteSystemSession")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSession := IRemoteSystemSession(outPtr)
        }

        return this.__IRemoteSystemSession.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IRemoteSystemSession")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSession := IRemoteSystemSession(outPtr)
        }

        return this.__IRemoteSystemSession.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ControllerDisplayName() {
        if (!this.HasProp("__IRemoteSystemSession")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSession := IRemoteSystemSession(outPtr)
        }

        return this.__IRemoteSystemSession.get_ControllerDisplayName()
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemSession, RemoteSystemSessionDisconnectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Disconnected(handler) {
        if (!this.HasProp("__IRemoteSystemSession")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSession := IRemoteSystemSession(outPtr)
        }

        return this.__IRemoteSystemSession.add_Disconnected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Disconnected(token) {
        if (!this.HasProp("__IRemoteSystemSession")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSession := IRemoteSystemSession(outPtr)
        }

        return this.__IRemoteSystemSession.remove_Disconnected(token)
    }

    /**
     * Initializes a [RemoteSystemSessionParticipantWatcher](RemoteSystemSessionParticipantWatcher.md) to monitor the participants of this remote session.
     * @returns {RemoteSystemSessionParticipantWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsession.createparticipantwatcher
     */
    CreateParticipantWatcher() {
        if (!this.HasProp("__IRemoteSystemSession")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSession := IRemoteSystemSession(outPtr)
        }

        return this.__IRemoteSystemSession.CreateParticipantWatcher()
    }

    /**
     * Invites a given remote device to join this remote session.
     * @remarks
     * The device receiving the invitation will need to use a [RemoteSystemSessionInvitationListener](RemoteSystemSessionInvitationListener.md) to handle it.
     * @param {RemoteSystem} invitee The RemoteSystem object representing the system to which this invitation is being sent.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsession.sendinvitationasync
     */
    SendInvitationAsync(invitee) {
        if (!this.HasProp("__IRemoteSystemSession")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSession := IRemoteSystemSession(outPtr)
        }

        return this.__IRemoteSystemSession.SendInvitationAsync(invitee)
    }

    /**
     * Closes the session, disconnecting all participants.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsession.close
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
