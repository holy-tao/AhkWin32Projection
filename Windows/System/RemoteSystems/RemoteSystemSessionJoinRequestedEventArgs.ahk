#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionJoinRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about the [RemoteSystemSessionController.JoinRequested](RemoteSystemSessionController_JoinRequested.md) event that was raised.
 * @remarks
 * This class is instantiated whenever the [RemoteSystemSessionController.JoinRequested](RemoteSystemSessionController_JoinRequested.md) event is raised, and it should be handled by the method(s) registered to this event.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionjoinrequestedeventargs
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionJoinRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionJoinRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionJoinRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [RemoteSystemSessionJoinRequest](RemoteSystemSessionJoinRequest.md) that represents this incoming request.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionjoinrequestedeventargs.joinrequest
     * @type {RemoteSystemSessionJoinRequest} 
     */
    JoinRequest {
        get => this.get_JoinRequest()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RemoteSystemSessionJoinRequest} 
     */
    get_JoinRequest() {
        if (!this.HasProp("__IRemoteSystemSessionJoinRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionJoinRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionJoinRequestedEventArgs := IRemoteSystemSessionJoinRequestedEventArgs(outPtr)
        }

        return this.__IRemoteSystemSessionJoinRequestedEventArgs.get_JoinRequest()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionjoinrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IRemoteSystemSessionJoinRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionJoinRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionJoinRequestedEventArgs := IRemoteSystemSessionJoinRequestedEventArgs(outPtr)
        }

        return this.__IRemoteSystemSessionJoinRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
