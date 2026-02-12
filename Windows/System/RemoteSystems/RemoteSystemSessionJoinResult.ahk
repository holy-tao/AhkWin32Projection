#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionJoinResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of this device's attempt to join a remote session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionjoinresult
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionJoinResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionJoinResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionJoinResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Represents the success status of this device's attempt to join a remote session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionjoinresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the [RemoteSystemSession](RemoteSystemSession.md) object representing the session that was joined (if the join attempt was successful).
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionjoinresult.session
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
        if (!this.HasProp("__IRemoteSystemSessionJoinResult")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionJoinResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionJoinResult := IRemoteSystemSessionJoinResult(outPtr)
        }

        return this.__IRemoteSystemSessionJoinResult.get_Status()
    }

    /**
     * 
     * @returns {RemoteSystemSession} 
     */
    get_Session() {
        if (!this.HasProp("__IRemoteSystemSessionJoinResult")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionJoinResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionJoinResult := IRemoteSystemSessionJoinResult(outPtr)
        }

        return this.__IRemoteSystemSessionJoinResult.get_Session()
    }

;@endregion Instance Methods
}
