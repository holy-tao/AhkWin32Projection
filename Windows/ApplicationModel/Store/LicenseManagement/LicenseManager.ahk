#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILicenseManagerStatics.ahk
#Include .\ILicenseManagerStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides members for managing license info for apps.
 * @remarks
 * > [!NOTE]
 * > This class requires the **storeLicenseManagement** [restricted capability](/windows/uwp/packaging/app-capability-declarations).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensemanager
 * @namespace Windows.ApplicationModel.Store.LicenseManagement
 * @version WindowsRuntime 1.4
 */
class LicenseManager extends IInspectable {
;@region Static Methods
    /**
     * Installs the specified app license.
     * @param {IBuffer} license The contents of the license to install.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensemanager.addlicenseasync
     */
    static AddLicenseAsync(license) {
        if (!LicenseManager.HasProp("__ILicenseManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.LicenseManagement.LicenseManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILicenseManagerStatics.IID)
            LicenseManager.__ILicenseManagerStatics := ILicenseManagerStatics(factoryPtr)
        }

        return LicenseManager.__ILicenseManagerStatics.AddLicenseAsync(license)
    }

    /**
     * Gets license entitlement info for the specified products.
     * @param {IIterable<HSTRING>} contentIds The content IDs of the products for which to get license entitlement info.
     * @param {IIterable<HSTRING>} keyIds The key IDs of the products for which to get license entitlement info.
     * @returns {IAsyncOperation<LicenseSatisfactionResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensemanager.getsatisfactioninfosasync
     */
    static GetSatisfactionInfosAsync(contentIds, keyIds) {
        if (!LicenseManager.HasProp("__ILicenseManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.LicenseManagement.LicenseManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILicenseManagerStatics.IID)
            LicenseManager.__ILicenseManagerStatics := ILicenseManagerStatics(factoryPtr)
        }

        return LicenseManager.__ILicenseManagerStatics.GetSatisfactionInfosAsync(contentIds, keyIds)
    }

    /**
     * Refreshes license info for app licenses on the current device.
     * @param {Integer} refreshOption A [LicenseRefreshOption](licenserefreshoption.md) that indicates whether to refresh all app licenses on the device or only the licenses for currently running apps.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licensemanager.refreshlicensesasync
     */
    static RefreshLicensesAsync(refreshOption) {
        if (!LicenseManager.HasProp("__ILicenseManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.LicenseManagement.LicenseManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILicenseManagerStatics2.IID)
            LicenseManager.__ILicenseManagerStatics2 := ILicenseManagerStatics2(factoryPtr)
        }

        return LicenseManager.__ILicenseManagerStatics2.RefreshLicensesAsync(refreshOption)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
