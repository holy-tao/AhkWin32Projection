#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionInvitationReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a [RemoteSystemSessionInvitationListener.InvitationReceived](RemoteSystemSessionInvitationListener_InvitationReceived.md) event, namely the associated [RemoteSystemSessionInvitation](RemoteSystemSessionInvitation.md) object.
 * @remarks
 * This class is instantiated whenever the [RemoteSystemSessionInvitationListener.InvitationReceived](RemoteSystemSessionInvitationListener_InvitationReceived.md) event is raised, and it should be handled by the method(s) registered to this event.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioninvitationreceivedeventargs
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionInvitationReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionInvitationReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionInvitationReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [RemoteSystemSessionInvitation](RemoteSystemSessionInvitation.md) object associated with the invitation received.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioninvitationreceivedeventargs.invitation
     * @type {RemoteSystemSessionInvitation} 
     */
    Invitation {
        get => this.get_Invitation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RemoteSystemSessionInvitation} 
     */
    get_Invitation() {
        if (!this.HasProp("__IRemoteSystemSessionInvitationReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionInvitationReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionInvitationReceivedEventArgs := IRemoteSystemSessionInvitationReceivedEventArgs(outPtr)
        }

        return this.__IRemoteSystemSessionInvitationReceivedEventArgs.get_Invitation()
    }

;@endregion Instance Methods
}
