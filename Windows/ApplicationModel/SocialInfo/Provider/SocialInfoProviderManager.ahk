#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocialInfoProviderManagerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides functionality for an app to use social media extensibility.
 * @remarks
 * This is a static class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialinfoprovidermanager
 * @namespace Windows.ApplicationModel.SocialInfo.Provider
 * @version WindowsRuntime 1.4
 */
class SocialInfoProviderManager extends IInspectable {
;@region Static Methods
    /**
     * Creates a new [SocialFeedUpdater](socialfeedupdater.md) object that can be used as a task.
     * @param {Integer} kind The type of the social media feed to create.
     * @param {Integer} mode_ Specifies append or replace mode.
     * @param {HSTRING} ownerRemoteId The ID that identifies the user on the provider's system.
     * @returns {IAsyncOperation<SocialFeedUpdater>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialinfoprovidermanager.createsocialfeedupdaterasync
     */
    static CreateSocialFeedUpdaterAsync(kind, mode_, ownerRemoteId) {
        if (!SocialInfoProviderManager.HasProp("__ISocialInfoProviderManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.SocialInfo.Provider.SocialInfoProviderManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISocialInfoProviderManagerStatics.IID)
            SocialInfoProviderManager.__ISocialInfoProviderManagerStatics := ISocialInfoProviderManagerStatics(factoryPtr)
        }

        return SocialInfoProviderManager.__ISocialInfoProviderManagerStatics.CreateSocialFeedUpdaterAsync(kind, mode_, ownerRemoteId)
    }

    /**
     * Creates a new [SocialDashboardItemUpdater](socialdashboarditemupdater.md) object that can be used as a task.
     * @param {HSTRING} ownerRemoteId The ID that identifies the user on the provider's system.
     * @returns {IAsyncOperation<SocialDashboardItemUpdater>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialinfoprovidermanager.createdashboarditemupdaterasync
     */
    static CreateDashboardItemUpdaterAsync(ownerRemoteId) {
        if (!SocialInfoProviderManager.HasProp("__ISocialInfoProviderManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.SocialInfo.Provider.SocialInfoProviderManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISocialInfoProviderManagerStatics.IID)
            SocialInfoProviderManager.__ISocialInfoProviderManagerStatics := ISocialInfoProviderManagerStatics(factoryPtr)
        }

        return SocialInfoProviderManager.__ISocialInfoProviderManagerStatics.CreateDashboardItemUpdaterAsync(ownerRemoteId)
    }

    /**
     * Updates the count value on the lock screen badge.
     * @param {HSTRING} itemRemoteId Identifies the contact on the provider's system.
     * @param {Integer} newCount The new count value to display on the badge.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialinfoprovidermanager.updatebadgecountvalue
     */
    static UpdateBadgeCountValue(itemRemoteId, newCount) {
        if (!SocialInfoProviderManager.HasProp("__ISocialInfoProviderManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.SocialInfo.Provider.SocialInfoProviderManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISocialInfoProviderManagerStatics.IID)
            SocialInfoProviderManager.__ISocialInfoProviderManagerStatics := ISocialInfoProviderManagerStatics(factoryPtr)
        }

        return SocialInfoProviderManager.__ISocialInfoProviderManagerStatics.UpdateBadgeCountValue(itemRemoteId, newCount)
    }

    /**
     * Alerts the system that new social media content is available from this app.
     * @param {HSTRING} contactRemoteId The ID that identifies the user on the provider's system.
     * @param {Integer} kind The type of the social media feed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialinfoprovidermanager.reportnewcontentavailable
     */
    static ReportNewContentAvailable(contactRemoteId, kind) {
        if (!SocialInfoProviderManager.HasProp("__ISocialInfoProviderManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.SocialInfo.Provider.SocialInfoProviderManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISocialInfoProviderManagerStatics.IID)
            SocialInfoProviderManager.__ISocialInfoProviderManagerStatics := ISocialInfoProviderManagerStatics(factoryPtr)
        }

        return SocialInfoProviderManager.__ISocialInfoProviderManagerStatics.ReportNewContentAvailable(contactRemoteId, kind)
    }

    /**
     * Provisions the app to use social media extensibility.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialinfoprovidermanager.provisionasync
     */
    static ProvisionAsync() {
        if (!SocialInfoProviderManager.HasProp("__ISocialInfoProviderManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.SocialInfo.Provider.SocialInfoProviderManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISocialInfoProviderManagerStatics.IID)
            SocialInfoProviderManager.__ISocialInfoProviderManagerStatics := ISocialInfoProviderManagerStatics(factoryPtr)
        }

        return SocialInfoProviderManager.__ISocialInfoProviderManagerStatics.ProvisionAsync()
    }

    /**
     * Deprovisions an app from using social media extensibility.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.socialinfo.provider.socialinfoprovidermanager.deprovisionasync
     */
    static DeprovisionAsync() {
        if (!SocialInfoProviderManager.HasProp("__ISocialInfoProviderManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.SocialInfo.Provider.SocialInfoProviderManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISocialInfoProviderManagerStatics.IID)
            SocialInfoProviderManager.__ISocialInfoProviderManagerStatics := ISocialInfoProviderManagerStatics(factoryPtr)
        }

        return SocialInfoProviderManager.__ISocialInfoProviderManagerStatics.DeprovisionAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
