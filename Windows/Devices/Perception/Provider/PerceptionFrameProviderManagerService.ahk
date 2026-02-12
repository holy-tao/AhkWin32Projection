#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionFrameProviderManagerServiceStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Static methods for managing IPerceptionFrameProvider registration and unregistration, PerceptionFaceAuthenticationGroup registration and unregistration, PerceptionControlGroup registration and unregistration, PerceptionCorrelationGroup registration and unregistration, IPerceptionFrameProvider availablity, and publishing a new PerceptionFrame for an IPerceptionFrameProvider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeprovidermanagerservice
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class PerceptionFrameProviderManagerService extends IInspectable {
;@region Static Methods
    /**
     * Registers the PerceptionFrameProviderInfo in association with the given IPerceptionFrameProviderManager.
     * @remarks
     * This method enables the service to request the IPerceptionFrameProvider associated with the PerceptionFrameProviderInfo. The IPerceptionFrameProviderManager will be queried via IPerceptionFrameProviderManager::GetFrameProvider() to get the associated IPerceptionFrameProvider.
     * @param {IPerceptionFrameProviderManager} manager The manager which can provide the IPerceptionFrameProvider associated with the info.
     * @param {PerceptionFrameProviderInfo} frameProviderInfo The PerceptionFrameProviderInfo which identifies the available IPerceptionFrameProvider.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeprovidermanagerservice.registerframeproviderinfo
     */
    static RegisterFrameProviderInfo(manager, frameProviderInfo) {
        if (!PerceptionFrameProviderManagerService.HasProp("__IPerceptionFrameProviderManagerServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionFrameProviderManagerServiceStatics.IID)
            PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics := IPerceptionFrameProviderManagerServiceStatics(factoryPtr)
        }

        return PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics.RegisterFrameProviderInfo(manager, frameProviderInfo)
    }

    /**
     * Unregisters the PerceptionFrameProviderInfo in association with the given IPerceptionProviderManager.
     * @remarks
     * After this function returns, the service no longer calls the IPerceptionFrameProviderManager::GetFrameProvider() method with the provided PerceptionFrameProviderInfo. Unregistering a PerceptionFrameProviderInfo that is not registered, because it was never registered or because it's already unregistered, raises an InvalidArgumentException.
     * @param {IPerceptionFrameProviderManager} manager The manager which previously registered this info.
     * @param {PerceptionFrameProviderInfo} frameProviderInfo The PerceptionFrameProviderInfo which identifies the IPerceptionFrameProvider.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeprovidermanagerservice.unregisterframeproviderinfo
     */
    static UnregisterFrameProviderInfo(manager, frameProviderInfo) {
        if (!PerceptionFrameProviderManagerService.HasProp("__IPerceptionFrameProviderManagerServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionFrameProviderManagerServiceStatics.IID)
            PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics := IPerceptionFrameProviderManagerServiceStatics(factoryPtr)
        }

        return PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics.UnregisterFrameProviderInfo(manager, frameProviderInfo)
    }

    /**
     * Registers a PerceptionFaceAuthenticationGroup associated with the given IPerceptionProviderManager.
     * @param {IPerceptionFrameProviderManager} manager The manager that owns the lifetime of the group.
     * @param {PerceptionFaceAuthenticationGroup} faceAuthenticationGroup The group of IPerceptionFrameProvider(s) to atomically control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeprovidermanagerservice.registerfaceauthenticationgroup
     */
    static RegisterFaceAuthenticationGroup(manager, faceAuthenticationGroup) {
        if (!PerceptionFrameProviderManagerService.HasProp("__IPerceptionFrameProviderManagerServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionFrameProviderManagerServiceStatics.IID)
            PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics := IPerceptionFrameProviderManagerServiceStatics(factoryPtr)
        }

        return PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics.RegisterFaceAuthenticationGroup(manager, faceAuthenticationGroup)
    }

    /**
     * Unregisters a PerceptionFaceAuthenticationGroup in association with the given IPerceptionProviderManager.
     * @remarks
     * This stops the providers in the group from being requested to enter Face Authentication mode or being used for Face Authentication until it's registered again. The group or any subset of it may be registered again after being unregistered.
     * @param {IPerceptionFrameProviderManager} manager The manager that owns the lifetime of the group.
     * @param {PerceptionFaceAuthenticationGroup} faceAuthenticationGroup The PerceptionFaceAuthenticationGroup to unregister.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeprovidermanagerservice.unregisterfaceauthenticationgroup
     */
    static UnregisterFaceAuthenticationGroup(manager, faceAuthenticationGroup) {
        if (!PerceptionFrameProviderManagerService.HasProp("__IPerceptionFrameProviderManagerServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionFrameProviderManagerServiceStatics.IID)
            PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics := IPerceptionFrameProviderManagerServiceStatics(factoryPtr)
        }

        return PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics.UnregisterFaceAuthenticationGroup(manager, faceAuthenticationGroup)
    }

    /**
     * Registers a PerceptionControlGroup associated with the IPerceptionFrameProviderManager.
     * @remarks
     * The PerceptionControlGroup's ids used to create it can't appear in a PerceptionControlGroup which is already registered. Doing so raises an InvalidArgumentException.
     * 
     * The PerceptionControlGroup specifies which IPerceptionFrameProvider(s) will be arbitrated for control together when control is successfully requested by an app and revoked when control is revoked from the app.
     * 
     * When a PerceptionControlSession is acquired for a PerceptionControlGroup, that app may set properties on each provider in the group. Before the IPerceptionFrameProvider is registered in a control group, attempts to control it will fail and properties can't be set.
     * @param {IPerceptionFrameProviderManager} manager The manager that owns the lifetime of the group.
     * @param {PerceptionControlGroup} controlGroup The group of IPerceptionFrameProvider(s) to control atomically.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeprovidermanagerservice.registercontrolgroup
     */
    static RegisterControlGroup(manager, controlGroup) {
        if (!PerceptionFrameProviderManagerService.HasProp("__IPerceptionFrameProviderManagerServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionFrameProviderManagerServiceStatics.IID)
            PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics := IPerceptionFrameProviderManagerServiceStatics(factoryPtr)
        }

        return PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics.RegisterControlGroup(manager, controlGroup)
    }

    /**
     * Removes the registration of a previously registered PerceptionControlGroup.
     * @remarks
     * The service will no longer call IPerceptionFrameProviders::SetProperty() for any Frame provider in the group. After unregistering one control group, the members may be reregistered via the same or different control group(s).
     * @param {IPerceptionFrameProviderManager} manager The manager that owns the lifetime of the group.
     * @param {PerceptionControlGroup} controlGroup The group of IPerceptionFrameProvider(s) to prevent from being controlled.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeprovidermanagerservice.unregistercontrolgroup
     */
    static UnregisterControlGroup(manager, controlGroup) {
        if (!PerceptionFrameProviderManagerService.HasProp("__IPerceptionFrameProviderManagerServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionFrameProviderManagerServiceStatics.IID)
            PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics := IPerceptionFrameProviderManagerServiceStatics(factoryPtr)
        }

        return PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics.UnregisterControlGroup(manager, controlGroup)
    }

    /**
     * Registers a PerceptionCorrelationGroup associated with the IPerceptionFrameProviderManager.
     * @remarks
     * This method enables finding correlated intrinsics and mappings to project and unproject frames between two correlated IPerceptionFrameProviders. Providers that aren't directly correlated together will not be correlatable with each other. An InvalidArgumentException is raised if a provider is in more than one registered PerceptionCorrelationGroup.
     * @param {IPerceptionFrameProviderManager} manager The manager that owns the lifetime of the group.
     * @param {PerceptionCorrelationGroup} correlationGroup The group of PerceptionCorrelations(s) to control atomically.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeprovidermanagerservice.registercorrelationgroup
     */
    static RegisterCorrelationGroup(manager, correlationGroup) {
        if (!PerceptionFrameProviderManagerService.HasProp("__IPerceptionFrameProviderManagerServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionFrameProviderManagerServiceStatics.IID)
            PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics := IPerceptionFrameProviderManagerServiceStatics(factoryPtr)
        }

        return PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics.RegisterCorrelationGroup(manager, correlationGroup)
    }

    /**
     * Unregisters a PerceptionCorrelationGroup associated with the IPerceptionFrameProviderManager.
     * @remarks
     * The IPerceptionFrameProviders in the list no longer will have any correlation with each other. The group or any subset may be registered again after Unregistration completes.
     * @param {IPerceptionFrameProviderManager} manager The manager that owns the lifetime of the group.
     * @param {PerceptionCorrelationGroup} correlationGroup The PerceptionCorrelationGroup to unregister.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeprovidermanagerservice.unregistercorrelationgroup
     */
    static UnregisterCorrelationGroup(manager, correlationGroup) {
        if (!PerceptionFrameProviderManagerService.HasProp("__IPerceptionFrameProviderManagerServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionFrameProviderManagerServiceStatics.IID)
            PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics := IPerceptionFrameProviderManagerServiceStatics(factoryPtr)
        }

        return PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics.UnregisterCorrelationGroup(manager, correlationGroup)
    }

    /**
     * Sets whether or not the IPerceptionFrameProvider is available.
     * @remarks
     * Available providers are expected to be able to provide frames while unavailable providers aren't. Before calling this method, a provider is assumed to be available if registered.
     * @param {IPerceptionFrameProvider} provider The provider to set availability for.
     * @param {Boolean} available Whether or not the provider is available.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeprovidermanagerservice.updateavailabilityforprovider
     */
    static UpdateAvailabilityForProvider(provider, available) {
        if (!PerceptionFrameProviderManagerService.HasProp("__IPerceptionFrameProviderManagerServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionFrameProviderManagerServiceStatics.IID)
            PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics := IPerceptionFrameProviderManagerServiceStatics(factoryPtr)
        }

        return PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics.UpdateAvailabilityForProvider(provider, available)
    }

    /**
     * Sends the PerceptionFrame to the service to tell any apps listening for frames for the provided provider. Frames aren't expected to be published before IPerceptionFrameProvider::Start() is called or after IPerceptionFrameProvider::Stop() is called.
     * @param {IPerceptionFrameProvider} provider The IPerceptionFrameProvider which produced the frame.
     * @param {PerceptionFrame} frame_ The PerceptionFrame that was produced and should be sent to apps.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeprovidermanagerservice.publishframeforprovider
     */
    static PublishFrameForProvider(provider, frame_) {
        if (!PerceptionFrameProviderManagerService.HasProp("__IPerceptionFrameProviderManagerServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionFrameProviderManagerService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionFrameProviderManagerServiceStatics.IID)
            PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics := IPerceptionFrameProviderManagerServiceStatics(factoryPtr)
        }

        return PerceptionFrameProviderManagerService.__IPerceptionFrameProviderManagerServiceStatics.PublishFrameForProvider(provider, frame_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
