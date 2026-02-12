#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionJoinRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a remote device's request to join a session controlled by this device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionjoinrequest
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionJoinRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionJoinRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionJoinRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Describes a request by a remote device to join a remote session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionjoinrequest.participant
     * @type {RemoteSystemSessionParticipant} 
     */
    Participant {
        get => this.get_Participant()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RemoteSystemSessionParticipant} 
     */
    get_Participant() {
        if (!this.HasProp("__IRemoteSystemSessionJoinRequest")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionJoinRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionJoinRequest := IRemoteSystemSessionJoinRequest(outPtr)
        }

        return this.__IRemoteSystemSessionJoinRequest.get_Participant()
    }

    /**
     * Causes the app to accept the requesting device into the remote session it is controlling.
     * @remarks
     * When this method is called, the device in question (described by the [RemoteSystemSessionJoinRequest.Participant](RemoteSystemSessionJoinRequest_Participant.md) property) will receive back a [RemoteSystemSessionJoinResult](RemoteSystemSessionJoinResult.md) object with a reference to the remote session that it attempted to join.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionjoinrequest.accept
     */
    Accept() {
        if (!this.HasProp("__IRemoteSystemSessionJoinRequest")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionJoinRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionJoinRequest := IRemoteSystemSessionJoinRequest(outPtr)
        }

        return this.__IRemoteSystemSessionJoinRequest.Accept()
    }

;@endregion Instance Methods
}
