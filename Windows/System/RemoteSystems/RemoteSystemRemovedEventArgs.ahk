#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Gets information about a [RemoteSystemRemoved](remotesystemwatcher_remotesystemremoved.md) event, namely the [RemoteSystem](remotesystem.md) that was removed
 * @remarks
 * This class is instantiated whenever the [RemoteSystemRemoved](remotesystemwatcher_remotesystemremoved.md) event is raised (that is, whenever a previously discovered [RemoteSystem](remotesystem.md) is no longer discoverable), and it should be handled by the method(s) registered to this event.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemremovedeventargs
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemRemovedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemRemovedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemRemovedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The [RemoteSystem](remotesystem.md) object representing the device that was removed from the set of discoverable devices, causing the containing [RemoteSystemRemoved](remotesystemwatcher_remotesystemremoved.md) event to be raised.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemremovedeventargs.remotesystemid
     * @type {HSTRING} 
     */
    RemoteSystemId {
        get => this.get_RemoteSystemId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteSystemId() {
        if (!this.HasProp("__IRemoteSystemRemovedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemRemovedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemRemovedEventArgs := IRemoteSystemRemovedEventArgs(outPtr)
        }

        return this.__IRemoteSystemRemovedEventArgs.get_RemoteSystemId()
    }

;@endregion Instance Methods
}
