#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionCreationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of an attempt by a [RemoteSystemSessionController](RemoteSystemSessionController.md) object to create a new remote session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioncreationresult
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionCreationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionCreationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionCreationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of a [RemoteSystemSessionController](RemoteSystemSessionController.md) object's attempt to create a remote session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioncreationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the [RemoteSystemSession](RemoteSystemSession.md) object related to this creation attempt.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioncreationresult.session
     * @type {RemoteSystemSession} 
     */
    Session {
        get => this.get_Session()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IRemoteSystemSessionCreationResult")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionCreationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionCreationResult := IRemoteSystemSessionCreationResult(outPtr)
        }

        return this.__IRemoteSystemSessionCreationResult.get_Status()
    }

    /**
     * 
     * @returns {RemoteSystemSession} 
     */
    get_Session() {
        if (!this.HasProp("__IRemoteSystemSessionCreationResult")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionCreationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionCreationResult := IRemoteSystemSessionCreationResult(outPtr)
        }

        return this.__IRemoteSystemSessionCreationResult.get_Session()
    }

;@endregion Instance Methods
}
