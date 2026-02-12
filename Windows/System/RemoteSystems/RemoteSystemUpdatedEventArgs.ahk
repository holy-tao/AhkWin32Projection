#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Gets information about a [RemoteSystemUpdated](remotesystemwatcher_remotesystemupdated.md) event, namely the [RemoteSystem](remotesystem.md) that was updated.
 * @remarks
 * This class is instantiated whenever the [RemoteSystemUpdated](remotesystemwatcher_remotesystemupdated.md) event is raised (that is, whenever a previously discovered [RemoteSystem](remotesystem.md) has any of its properties changed), and it should be handled by the method(s) registered to this event.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemupdatedeventargs
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemUpdatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemUpdatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemUpdatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The [RemoteSystem](remotesystem.md) object representing the device in the set of discoverable devices whose properties were updated, causing the containing [RemoteSystemUpdated](remotesystemwatcher_remotesystemupdated.md) event to be raised.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemupdatedeventargs.remotesystem
     * @type {RemoteSystem} 
     */
    RemoteSystem {
        get => this.get_RemoteSystem()
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
    get_RemoteSystem() {
        if (!this.HasProp("__IRemoteSystemUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemUpdatedEventArgs := IRemoteSystemUpdatedEventArgs(outPtr)
        }

        return this.__IRemoteSystemUpdatedEventArgs.get_RemoteSystem()
    }

;@endregion Instance Methods
}
