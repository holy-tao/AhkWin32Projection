#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a [RemoteSystemSessionWatcher.Updated](RemoteSystemSessionWatcher_updated.md) event that was raised, namely the remote session whose information was updated.
 * @remarks
 * This class is instantiated whenever the [RemoteSystemSessionWatcher.Updated](RemoteSystemSessionWatcher_updated.md) is raised, and it should be handled by the method(s) registered to this event.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionupdatedeventargs
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionUpdatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionUpdatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionUpdatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about the remote session that was updated.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionupdatedeventargs.sessioninfo
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
     * @returns {RemoteSystemSessionInfo} 
     */
    get_SessionInfo() {
        if (!this.HasProp("__IRemoteSystemSessionUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionUpdatedEventArgs := IRemoteSystemSessionUpdatedEventArgs(outPtr)
        }

        return this.__IRemoteSystemSessionUpdatedEventArgs.get_SessionInfo()
    }

;@endregion Instance Methods
}
