#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a [RemoteSystemSessionWatcher.Removed](RemoteSystemSessionWatcher_Removed.md) event that was raised, namely the remote session that has disappeared.
 * @remarks
 * This class is instantiated whenever the [RemoteSystemSessionWatcher.Removed](RemoteSystemSessionWatcher_Removed.md) is raised, and it should be handled by the method(s) registered to this event.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionremovedeventargs
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionRemovedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionRemovedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionRemovedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about the remote session that disappeared.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionremovedeventargs.sessioninfo
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
        if (!this.HasProp("__IRemoteSystemSessionRemovedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionRemovedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionRemovedEventArgs := IRemoteSystemSessionRemovedEventArgs(outPtr)
        }

        return this.__IRemoteSystemSessionRemovedEventArgs.get_SessionInfo()
    }

;@endregion Instance Methods
}
