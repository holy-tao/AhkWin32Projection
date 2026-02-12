#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemSessionAddedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a [RemoteSystemSessionWatcher.Added](RemoteSystemSessionWatcher_added.md) event.
 * @remarks
 * This class is instantiated whenever the [RemoteSystemSessionWatcher.Added](RemoteSystemSessionWatcher_Added.md) event is raised, and its contents should be handled by the method(s) registered to this event.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionaddedeventargs
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemSessionAddedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemSessionAddedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemSessionAddedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about the remote session that has been discovered.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemsessionaddedeventargs.sessioninfo
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
        if (!this.HasProp("__IRemoteSystemSessionAddedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemSessionAddedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemSessionAddedEventArgs := IRemoteSystemSessionAddedEventArgs(outPtr)
        }

        return this.__IRemoteSystemSessionAddedEventArgs.get_SessionInfo()
    }

;@endregion Instance Methods
}
