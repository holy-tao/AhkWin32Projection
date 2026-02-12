#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionInvitation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an invitation from a session participant to join their remote session.
 * @remarks
 * An instance of this class is contained in the [RemoteSystemSessionInvitationReceivedEventArgs](RemoteSystemSessionInvitationReceivedEventArgs.md) object that was passed in with the [RemoteSystemSessionInvitationListener.InvitationReceived](RemoteSystemSessionInvitationListener_InvitationReceived.md) event.
 * 
 * The device receiving an invitation will need to use a [RemoteSystemSessionInvitationListener](RemoteSystemSessionInvitationListener.md) to handle it.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioninvitation
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionInvitation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionInvitation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionInvitation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [RemoteSystem](RemoteSystem.md) object representing the device that sent the invitation.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioninvitation.sender
     * @type {RemoteSystem} 
     */
    Sender {
        get => this.get_Sender()
    }

    /**
     * Gets a [RemoteSystemSessionInfo](RemoteSystemSessionInfo.md) object representing the session to which this device was invited.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioninvitation.sessioninfo
     * @type {RemoteSystemSessionInfo} 
     */
    SessionInfo {
        get => this.get_SessionInfo()
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
    get_Sender() {
        if (!this.HasProp("__IRemoteSystemSessionInvitation")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionInvitation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionInvitation := IRemoteSystemSessionInvitation(outPtr)
        }

        return this.__IRemoteSystemSessionInvitation.get_Sender()
    }

    /**
     * 
     * @returns {RemoteSystemSessionInfo} 
     */
    get_SessionInfo() {
        if (!this.HasProp("__IRemoteSystemSessionInvitation")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionInvitation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionInvitation := IRemoteSystemSessionInvitation(outPtr)
        }

        return this.__IRemoteSystemSessionInvitation.get_SessionInfo()
    }

;@endregion Instance Methods
}
