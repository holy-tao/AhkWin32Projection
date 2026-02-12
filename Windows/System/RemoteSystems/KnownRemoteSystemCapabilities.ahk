#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownRemoteSystemCapabilitiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the string names of different features of the Remote Systems platform. A remote system is either compatible or incompatible with each of the capabilities corresponding to the properties of this class.
 * @remarks
 * The [RemoteSystem.GetCapabilitySupportedAsync](remotesystem_getcapabilitysupportedasync_1130940389.md) method uses this class's property values to query for feature support on specified remote systems.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.knownremotesystemcapabilities
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class KnownRemoteSystemCapabilities extends IInspectable {
;@region Static Properties
    /**
     * Gets the canonical string name of the app service capability.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.knownremotesystemcapabilities.appservice
     * @type {HSTRING} 
     */
    static AppService {
        get => KnownRemoteSystemCapabilities.get_AppService()
    }

    /**
     * Gets the canonical string name of the launch URI capability.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.knownremotesystemcapabilities.launchuri
     * @type {HSTRING} 
     */
    static LaunchUri {
        get => KnownRemoteSystemCapabilities.get_LaunchUri()
    }

    /**
     * Gets the canonical string name of the remote session capability.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.knownremotesystemcapabilities.remotesession
     * @type {HSTRING} 
     */
    static RemoteSession {
        get => KnownRemoteSystemCapabilities.get_RemoteSession()
    }

    /**
     * Gets the canonical string name of the spatial entity capability.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.knownremotesystemcapabilities.spatialentity
     * @type {HSTRING} 
     */
    static SpatialEntity {
        get => KnownRemoteSystemCapabilities.get_SpatialEntity()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AppService() {
        if (!KnownRemoteSystemCapabilities.HasProp("__IKnownRemoteSystemCapabilitiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.KnownRemoteSystemCapabilities")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRemoteSystemCapabilitiesStatics.IID)
            KnownRemoteSystemCapabilities.__IKnownRemoteSystemCapabilitiesStatics := IKnownRemoteSystemCapabilitiesStatics(factoryPtr)
        }

        return KnownRemoteSystemCapabilities.__IKnownRemoteSystemCapabilitiesStatics.get_AppService()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_LaunchUri() {
        if (!KnownRemoteSystemCapabilities.HasProp("__IKnownRemoteSystemCapabilitiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.KnownRemoteSystemCapabilities")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRemoteSystemCapabilitiesStatics.IID)
            KnownRemoteSystemCapabilities.__IKnownRemoteSystemCapabilitiesStatics := IKnownRemoteSystemCapabilitiesStatics(factoryPtr)
        }

        return KnownRemoteSystemCapabilities.__IKnownRemoteSystemCapabilitiesStatics.get_LaunchUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RemoteSession() {
        if (!KnownRemoteSystemCapabilities.HasProp("__IKnownRemoteSystemCapabilitiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.KnownRemoteSystemCapabilities")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRemoteSystemCapabilitiesStatics.IID)
            KnownRemoteSystemCapabilities.__IKnownRemoteSystemCapabilitiesStatics := IKnownRemoteSystemCapabilitiesStatics(factoryPtr)
        }

        return KnownRemoteSystemCapabilities.__IKnownRemoteSystemCapabilitiesStatics.get_RemoteSession()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SpatialEntity() {
        if (!KnownRemoteSystemCapabilities.HasProp("__IKnownRemoteSystemCapabilitiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.KnownRemoteSystemCapabilities")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownRemoteSystemCapabilitiesStatics.IID)
            KnownRemoteSystemCapabilities.__IKnownRemoteSystemCapabilitiesStatics := IKnownRemoteSystemCapabilitiesStatics(factoryPtr)
        }

        return KnownRemoteSystemCapabilities.__IKnownRemoteSystemCapabilitiesStatics.get_SpatialEntity()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
