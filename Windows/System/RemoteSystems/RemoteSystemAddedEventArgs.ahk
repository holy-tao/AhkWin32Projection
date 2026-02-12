#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemAddedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Gets information about a [RemoteSystemAdded](remotesystemwatcher_remotesystemadded.md) event, namely the [RemoteSystem](remotesystem.md) that was added.
 * @remarks
 * This class is instantiated whenever the [RemoteSystemAdded](remotesystemwatcher_remotesystemadded.md) event is raised, and it should be handled by the method(s) registered to this event.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemaddedeventargs
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemAddedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemAddedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemAddedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The [RemoteSystem](remotesystem.md) object representing the device that was added to the set of discoverable devices, causing the containing [RemoteSystemAdded](remotesystemwatcher_remotesystemadded.md) event to be raised.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemaddedeventargs.remotesystem
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
        if (!this.HasProp("__IRemoteSystemAddedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemAddedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemAddedEventArgs := IRemoteSystemAddedEventArgs(outPtr)
        }

        return this.__IRemoteSystemAddedEventArgs.get_RemoteSystem()
    }

;@endregion Instance Methods
}
