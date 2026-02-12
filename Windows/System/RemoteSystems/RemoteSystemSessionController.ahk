#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionController.ahk
#Include .\IRemoteSystemSessionControllerFactory.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\RemoteSystemSessionController.ahk
#Include .\RemoteSystemSessionJoinRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Handles the creation and management of a new remote session for other devices to join.
 * @remarks
 * Every remote session has one participant that is the session's controller. Only the controller can specify options for the session, accept join requests from would-be participants, and remove participants from the session.
 * 
 * > [!IMPORTANT]
 * > You must confirm access to the remote system platform with a call to **[RemoteSystem.RequestAccessAsync](remotesystem_requestaccessasync_380675631.md)** before you instantiate this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioncontroller
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionController.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a [RemoteSystemSessionController](RemoteSystemSessionController.md) with a custom display name.
     * @param {HSTRING} displayName The public-facing name for this remote session. It should be simple and descriptive.
     * @returns {RemoteSystemSessionController} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioncontroller.#ctor
     */
    static CreateController(displayName) {
        if (!RemoteSystemSessionController.HasProp("__IRemoteSystemSessionControllerFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemSessionController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemSessionControllerFactory.IID)
            RemoteSystemSessionController.__IRemoteSystemSessionControllerFactory := IRemoteSystemSessionControllerFactory(factoryPtr)
        }

        return RemoteSystemSessionController.__IRemoteSystemSessionControllerFactory.CreateController(displayName)
    }

    /**
     * Initializes a [RemoteSystemSessionController](RemoteSystemSessionController.md) with a custom display name and specified options.
     * @param {HSTRING} displayName The public-facing name for this remote session. It should be simple and descriptive.
     * @param {RemoteSystemSessionOptions} options The [RemoteSystemSessionOptions](RemoteSystemSessionOptions.md) object specifying additional options for this remote session.
     * @returns {RemoteSystemSessionController} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioncontroller.#ctor
     */
    static CreateControllerWithSessionOptions(displayName, options) {
        if (!RemoteSystemSessionController.HasProp("__IRemoteSystemSessionControllerFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemSessionController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemSessionControllerFactory.IID)
            RemoteSystemSessionController.__IRemoteSystemSessionControllerFactory := IRemoteSystemSessionControllerFactory(factoryPtr)
        }

        return RemoteSystemSessionController.__IRemoteSystemSessionControllerFactory.CreateControllerWithSessionOptions(displayName, options)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnJoinRequestedToken")) {
            this.remove_JoinRequested(this.__OnJoinRequestedToken)
            this.__OnJoinRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemSessionController, RemoteSystemSessionJoinRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_JoinRequested(handler) {
        if (!this.HasProp("__IRemoteSystemSessionController")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionController := IRemoteSystemSessionController(outPtr)
        }

        return this.__IRemoteSystemSessionController.add_JoinRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_JoinRequested(token) {
        if (!this.HasProp("__IRemoteSystemSessionController")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionController := IRemoteSystemSessionController(outPtr)
        }

        return this.__IRemoteSystemSessionController.remove_JoinRequested(token)
    }

    /**
     * Removes a participant from the remote session.
     * @param {RemoteSystemSessionParticipant} pParticipant A [RemoteSystemSessionParticipant](RemoteSystemSessionParticipant.md) object corresponding to the participant being removed.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioncontroller.removeparticipantasync
     */
    RemoveParticipantAsync(pParticipant) {
        if (!this.HasProp("__IRemoteSystemSessionController")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionController := IRemoteSystemSessionController(outPtr)
        }

        return this.__IRemoteSystemSessionController.RemoveParticipantAsync(pParticipant)
    }

    /**
     * Asynchronously attempts to create a remote session.
     * @returns {IAsyncOperation<RemoteSystemSessionCreationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioncontroller.createsessionasync
     */
    CreateSessionAsync() {
        if (!this.HasProp("__IRemoteSystemSessionController")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionController := IRemoteSystemSessionController(outPtr)
        }

        return this.__IRemoteSystemSessionController.CreateSessionAsync()
    }

;@endregion Instance Methods
}
