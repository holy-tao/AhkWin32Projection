#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemKindFilter.ahk
#Include .\IRemoteSystemKindFilterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * An [IRemoteSystemFilter](iremotesystemfilter.md) that limits the set of discoverable remote systems by allowing only those of specific device types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemkindfilter
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemKindFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemKindFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemKindFilter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes an instance of the [RemoteSystemKindFilter](remotesystemkindfilter.md) class with a list of string representations of device types to target. These strings should conform to the values of the properties of the [RemoteSystemKinds](remotesystemkinds.md) class.
     * @param {IIterable<HSTRING>} remoteSystemKinds_ A list of string representations of the device types to target.
     * @returns {RemoteSystemKindFilter} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemkindfilter.#ctor
     */
    static Create(remoteSystemKinds_) {
        if (!RemoteSystemKindFilter.HasProp("__IRemoteSystemKindFilterFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemKindFilter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemKindFilterFactory.IID)
            RemoteSystemKindFilter.__IRemoteSystemKindFilterFactory := IRemoteSystemKindFilterFactory(factoryPtr)
        }

        return RemoteSystemKindFilter.__IRemoteSystemKindFilterFactory.Create(remoteSystemKinds_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * String representation(s) of the device type(s) that the containing [RemoteSystemKindFilter](remotesystemkindfilter.md) object targets.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemkindfilter.remotesystemkinds
     * @type {IVectorView<HSTRING>} 
     */
    RemoteSystemKinds {
        get => this.get_RemoteSystemKinds()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_RemoteSystemKinds() {
        if (!this.HasProp("__IRemoteSystemKindFilter")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemKindFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemKindFilter := IRemoteSystemKindFilter(outPtr)
        }

        return this.__IRemoteSystemKindFilter.get_RemoteSystemKinds()
    }

;@endregion Instance Methods
}
