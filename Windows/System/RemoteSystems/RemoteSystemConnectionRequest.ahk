#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemConnectionRequest.ahk
#Include .\IRemoteSystemConnectionRequest2.ahk
#Include .\IRemoteSystemConnectionRequest3.ahk
#Include .\IRemoteSystemConnectionRequestStatics2.ahk
#Include .\IRemoteSystemConnectionRequestFactory.ahk
#Include .\IRemoteSystemConnectionRequestStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an intent to communicate with a specific remote system (device).
 * @remarks
 * An instance of this class is constructed from a given [RemoteSystem](remotesystem.md) object. All of the remote system features, such as remote launch or remote app service connection, require the use of this object to determine which system (device) to connect to.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemconnectionrequest
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemConnectionRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemConnectionRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemConnectionRequest.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns a RemoteSystemConnectionRequest based on a [ConnectionToken](remotesystemconnectionrequest_connectiontoken.md).
     * @remarks
     * CreateFromConnectionToken requires the RemoteSystem capability on Windows, and it requires the RemoteSystem::RequestAccessAsync function to have been called previously. Calling without both of these permissions results in an exception.
     * @param {HSTRING} connectionToken The specific connection token for which the RemoteSystemConnectionRequest will be created with.
     * @returns {RemoteSystemConnectionRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemconnectionrequest.createfromconnectiontoken
     */
    static CreateFromConnectionToken(connectionToken) {
        if (!RemoteSystemConnectionRequest.HasProp("__IRemoteSystemConnectionRequestStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemConnectionRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemConnectionRequestStatics2.IID)
            RemoteSystemConnectionRequest.__IRemoteSystemConnectionRequestStatics2 := IRemoteSystemConnectionRequestStatics2(factoryPtr)
        }

        return RemoteSystemConnectionRequest.__IRemoteSystemConnectionRequestStatics2.CreateFromConnectionToken(connectionToken)
    }

    /**
     * Returns a RemoteSystemConnectionRequest based on a [ConnectionToken](remotesystemconnectionrequest_connectiontoken.md) and a specific [user](/uwp/api/windows.system.user).
     * @remarks
     * CreateFromConnectionTokenForUser requires the RemoteSystem capability on Windows, and it requires the RemoteSystem::RequestAccessAsync function to have been called previously. Calling without both of these permissions results in an exception.
     * @param {User} user_ The specific User for which the RemoteSystemConnectionRequest will be created for.
     * @param {HSTRING} connectionToken The specific connection token for which the RemoteSystemConnectionRequest will be created with.
     * @returns {RemoteSystemConnectionRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemconnectionrequest.createfromconnectiontokenforuser
     */
    static CreateFromConnectionTokenForUser(user_, connectionToken) {
        if (!RemoteSystemConnectionRequest.HasProp("__IRemoteSystemConnectionRequestStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemConnectionRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemConnectionRequestStatics2.IID)
            RemoteSystemConnectionRequest.__IRemoteSystemConnectionRequestStatics2 := IRemoteSystemConnectionRequestStatics2(factoryPtr)
        }

        return RemoteSystemConnectionRequest.__IRemoteSystemConnectionRequestStatics2.CreateFromConnectionTokenForUser(user_, connectionToken)
    }

    /**
     * Initializes an instance of the [RemoteSystemConnectionRequest](remotesystemconnectionrequest.md) class.
     * @param {RemoteSystem} remoteSystem_ The underlying remote system (device) for the resulting RemoteSystemConnectionRequest.
     * @returns {RemoteSystemConnectionRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemconnectionrequest.#ctor
     */
    static Create(remoteSystem_) {
        if (!RemoteSystemConnectionRequest.HasProp("__IRemoteSystemConnectionRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemConnectionRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemConnectionRequestFactory.IID)
            RemoteSystemConnectionRequest.__IRemoteSystemConnectionRequestFactory := IRemoteSystemConnectionRequestFactory(factoryPtr)
        }

        return RemoteSystemConnectionRequest.__IRemoteSystemConnectionRequestFactory.Create(remoteSystem_)
    }

    /**
     * Initializes a new instance of the RemoteSystemConnectionRequest class for a particular application on a remote system.
     * @param {RemoteSystemApp} remoteSystemApp_ The underlying remote application to attempt to connect to.
     * @returns {RemoteSystemConnectionRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemconnectionrequest.createforapp
     */
    static CreateForApp(remoteSystemApp_) {
        if (!RemoteSystemConnectionRequest.HasProp("__IRemoteSystemConnectionRequestStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemConnectionRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemConnectionRequestStatics.IID)
            RemoteSystemConnectionRequest.__IRemoteSystemConnectionRequestStatics := IRemoteSystemConnectionRequestStatics(factoryPtr)
        }

        return RemoteSystemConnectionRequest.__IRemoteSystemConnectionRequestStatics.CreateForApp(remoteSystemApp_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Represents the remote system (device) that the app intends to communicate with.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemconnectionrequest.remotesystem
     * @type {RemoteSystem} 
     */
    RemoteSystem {
        get => this.get_RemoteSystem()
    }

    /**
     * Represents the remote application that the app intends to communicate with.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemconnectionrequest.remotesystemapp
     * @type {RemoteSystemApp} 
     */
    RemoteSystemApp {
        get => this.get_RemoteSystemApp()
    }

    /**
     * Gets a token that persists connection info of a RemoteSystemConnectionRequest so that it can be connected back to later.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemconnectionrequest.connectiontoken
     * @type {HSTRING} 
     */
    ConnectionToken {
        get => this.get_ConnectionToken()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RemoteSystem} 
     */
    get_RemoteSystem() {
        if (!this.HasProp("__IRemoteSystemConnectionRequest")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemConnectionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemConnectionRequest := IRemoteSystemConnectionRequest(outPtr)
        }

        return this.__IRemoteSystemConnectionRequest.get_RemoteSystem()
    }

    /**
     * 
     * @returns {RemoteSystemApp} 
     */
    get_RemoteSystemApp() {
        if (!this.HasProp("__IRemoteSystemConnectionRequest2")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemConnectionRequest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemConnectionRequest2 := IRemoteSystemConnectionRequest2(outPtr)
        }

        return this.__IRemoteSystemConnectionRequest2.get_RemoteSystemApp()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConnectionToken() {
        if (!this.HasProp("__IRemoteSystemConnectionRequest3")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemConnectionRequest3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemConnectionRequest3 := IRemoteSystemConnectionRequest3(outPtr)
        }

        return this.__IRemoteSystemConnectionRequest3.get_ConnectionToken()
    }

;@endregion Instance Methods
}
