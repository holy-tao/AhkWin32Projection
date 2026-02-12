#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionInvitationListener.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\RemoteSystemSessionInvitationListener.ahk
#Include .\RemoteSystemSessionInvitationReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Contains the functionality for receiving and handling invitations to join remote sessions. This class begins listening for invitations when it is instantiated.
 * @remarks
 * > [!IMPORTANT]
 * > You must confirm access to the remote system platform with a call to **[RemoteSystem.RequestAccessAsync](remotesystem_requestaccessasync_380675631.md)** before you set up handler(s) for this class' event(s).
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessioninvitationlistener
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionInvitationListener extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionInvitationListener

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionInvitationListener.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes an instance of [RemoteSystemSessionInvitationListener](RemoteSystemSessionInvitationListener.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemSessionInvitationListener")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnInvitationReceivedToken")) {
            this.remove_InvitationReceived(this.__OnInvitationReceivedToken)
            this.__OnInvitationReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<RemoteSystemSessionInvitationListener, RemoteSystemSessionInvitationReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InvitationReceived(handler) {
        if (!this.HasProp("__IRemoteSystemSessionInvitationListener")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionInvitationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionInvitationListener := IRemoteSystemSessionInvitationListener(outPtr)
        }

        return this.__IRemoteSystemSessionInvitationListener.add_InvitationReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_InvitationReceived(token) {
        if (!this.HasProp("__IRemoteSystemSessionInvitationListener")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionInvitationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionInvitationListener := IRemoteSystemSessionInvitationListener(outPtr)
        }

        return this.__IRemoteSystemSessionInvitationListener.remove_InvitationReceived(token)
    }

;@endregion Instance Methods
}
