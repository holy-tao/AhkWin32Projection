#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemDiscoveryTypeFilter.ahk
#Include .\IRemoteSystemDiscoveryTypeFilterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * An [IRemoteSystemFilter](iremotesystemfilter.md) that limits the set of discoverable remote systems by allowing only those of a specific discovery type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemdiscoverytypefilter
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemDiscoveryTypeFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemDiscoveryTypeFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemDiscoveryTypeFilter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes an instance of the [RemoteSystemDiscoveryTypeFilter](remotesystemdiscoverytypefilter.md) class.
     * @param {Integer} discoveryType The discovery type to target.
     * @returns {RemoteSystemDiscoveryTypeFilter} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemdiscoverytypefilter.#ctor
     */
    static Create(discoveryType) {
        if (!RemoteSystemDiscoveryTypeFilter.HasProp("__IRemoteSystemDiscoveryTypeFilterFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemDiscoveryTypeFilter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemDiscoveryTypeFilterFactory.IID)
            RemoteSystemDiscoveryTypeFilter.__IRemoteSystemDiscoveryTypeFilterFactory := IRemoteSystemDiscoveryTypeFilterFactory(factoryPtr)
        }

        return RemoteSystemDiscoveryTypeFilter.__IRemoteSystemDiscoveryTypeFilterFactory.Create(discoveryType)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The discovery type that the containing [RemoteSystemDiscoveryTypeFilter](remotesystemdiscoverytypefilter.md) object targets.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemdiscoverytypefilter.remotesystemdiscoverytype
     * @type {Integer} 
     */
    RemoteSystemDiscoveryType {
        get => this.get_RemoteSystemDiscoveryType()
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
    get_RemoteSystemDiscoveryType() {
        if (!this.HasProp("__IRemoteSystemDiscoveryTypeFilter")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemDiscoveryTypeFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemDiscoveryTypeFilter := IRemoteSystemDiscoveryTypeFilter(outPtr)
        }

        return this.__IRemoteSystemDiscoveryTypeFilter.get_RemoteSystemDiscoveryType()
    }

;@endregion Instance Methods
}
