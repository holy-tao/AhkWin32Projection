#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionDisconnectedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a [RemoteSystemSession.Disconnected](RemoteSystemSession_Disconnected.md) event, namely the reason that this device was disconnected from the session.
 * @remarks
 * This class is instantiated whenever the [RemoteSystemSession.Disconnected](RemoteSystemSession_Disconnected.md) event is raised, and it should be handled by the method(s) registered to this event.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessiondisconnectedeventargs
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionDisconnectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionDisconnectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionDisconnectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the reason this device was disconnected from the session.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessiondisconnectedeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
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
    get_Reason() {
        if (!this.HasProp("__IRemoteSystemSessionDisconnectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionDisconnectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionDisconnectedEventArgs := IRemoteSystemSessionDisconnectedEventArgs(outPtr)
        }

        return this.__IRemoteSystemSessionDisconnectedEventArgs.get_Reason()
    }

;@endregion Instance Methods
}
