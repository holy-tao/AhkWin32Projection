#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemAuthorizationKindFilter.ahk
#Include .\IRemoteSystemAuthorizationKindFilterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * An [IRemoteSystemFilter](iremotesystemfilter.md) that alters the set of discoverable remote systems by allowing those of a specific authorization kind.
 * @remarks
 * In order to discover cross-user devices, the client device must both use the appropriate filter *and* be set to allow sharing with anonymous devices. Check this system-wide setting with the [RemoteSystem.isAuthorizationKindEnabled](RemoteSystem_isAuthorizationKindEnabled_756735636.md) method. If the client device is not set to allow anonymous sharing, prompt the user to change this setting in Settings > System > Shared experiences.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemauthorizationkindfilter
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemAuthorizationKindFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemAuthorizationKindFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemAuthorizationKindFilter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes an instance of the [RemoteSystemAuthorizationKindFilter](RemoteSystemAuthorizationKindFilter.md) class.
     * @param {Integer} remoteSystemAuthorizationKind_ The authorization kind to target.
     * @returns {RemoteSystemAuthorizationKindFilter} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemauthorizationkindfilter.#ctor
     */
    static Create(remoteSystemAuthorizationKind_) {
        if (!RemoteSystemAuthorizationKindFilter.HasProp("__IRemoteSystemAuthorizationKindFilterFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemAuthorizationKindFilter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemAuthorizationKindFilterFactory.IID)
            RemoteSystemAuthorizationKindFilter.__IRemoteSystemAuthorizationKindFilterFactory := IRemoteSystemAuthorizationKindFilterFactory(factoryPtr)
        }

        return RemoteSystemAuthorizationKindFilter.__IRemoteSystemAuthorizationKindFilterFactory.Create(remoteSystemAuthorizationKind_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The authorization kind setting that the containing [RemoteSystemAuthorizationKindFilter](RemoteSystemAuthorizationKindFilter.md) object targets.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemauthorizationkindfilter.remotesystemauthorizationkind
     * @type {Integer} 
     */
    RemoteSystemAuthorizationKind {
        get => this.get_RemoteSystemAuthorizationKind()
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
    get_RemoteSystemAuthorizationKind() {
        if (!this.HasProp("__IRemoteSystemAuthorizationKindFilter")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemAuthorizationKindFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemAuthorizationKindFilter := IRemoteSystemAuthorizationKindFilter(outPtr)
        }

        return this.__IRemoteSystemAuthorizationKindFilter.get_RemoteSystemAuthorizationKind()
    }

;@endregion Instance Methods
}
