#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemStatusTypeFilter.ahk
#Include .\IRemoteSystemStatusTypeFilterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * An [IRemoteSystemFilter](iremotesystemfilter.md) that limits the set of discoverable remote systems by allowing only those of a specific availability status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemstatustypefilter
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemStatusTypeFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemStatusTypeFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemStatusTypeFilter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes an instance of the [RemoteSystemStatusTypeFilter](remotesystemstatustypefilter.md) class.
     * @param {Integer} remoteSystemStatusType_ The status type to target.
     * @returns {RemoteSystemStatusTypeFilter} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemstatustypefilter.#ctor
     */
    static Create(remoteSystemStatusType_) {
        if (!RemoteSystemStatusTypeFilter.HasProp("__IRemoteSystemStatusTypeFilterFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemStatusTypeFilter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemStatusTypeFilterFactory.IID)
            RemoteSystemStatusTypeFilter.__IRemoteSystemStatusTypeFilterFactory := IRemoteSystemStatusTypeFilterFactory(factoryPtr)
        }

        return RemoteSystemStatusTypeFilter.__IRemoteSystemStatusTypeFilterFactory.Create(remoteSystemStatusType_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The status type that the containing [RemoteSystemStatusTypeFilter](remotesystemstatustypefilter.md) object targets.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemstatustypefilter.remotesystemstatustype
     * @type {Integer} 
     */
    RemoteSystemStatusType {
        get => this.get_RemoteSystemStatusType()
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
    get_RemoteSystemStatusType() {
        if (!this.HasProp("__IRemoteSystemStatusTypeFilter")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemStatusTypeFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemStatusTypeFilter := IRemoteSystemStatusTypeFilter(outPtr)
        }

        return this.__IRemoteSystemStatusTypeFilter.get_RemoteSystemStatusType()
    }

;@endregion Instance Methods
}
