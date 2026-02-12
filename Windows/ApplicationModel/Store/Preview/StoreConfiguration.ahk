#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreConfigurationStatics2.ahk
#Include .\IStoreConfigurationStatics3.ahk
#Include .\IStoreConfigurationStatics5.ahk
#Include .\IStoreConfigurationStatics.ahk
#Include .\IStoreConfigurationStatics4.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines static methods and properties for accessing information about the device hardware and configuring information about the system, the mobile operator, and the active user account. These members are used in various Microsoft Store scenarios.
 * @remarks
 * > [!IMPORTANT]
 * > Access to this API is protected by a private capability that is restricted to apps that are developed by Microsoft.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class StoreConfiguration extends IInspectable {
;@region Static Properties
    /**
     * Gets or sets a value that indicates whether the Microsoft Store prompts the user before making a purchase.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.purchasepromptingpolicy
     * @type {IReference<Integer>} 
     */
    static PurchasePromptingPolicy {
        get => StoreConfiguration.get_PurchasePromptingPolicy()
        set => StoreConfiguration.put_PurchasePromptingPolicy(value)
    }

    /**
     * Gets hardware manufacturer information for the current device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.hardwaremanufacturerinfo
     * @type {StoreHardwareManufacturerInfo} 
     */
    static HardwareManufacturerInfo {
        get => StoreConfiguration.get_HardwareManufacturerInfo()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IReference<Integer>} 
     */
    static get_PurchasePromptingPolicy() {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics2.IID)
            StoreConfiguration.__IStoreConfigurationStatics2 := IStoreConfigurationStatics2(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics2.get_PurchasePromptingPolicy()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    static put_PurchasePromptingPolicy(value) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics2.IID)
            StoreConfiguration.__IStoreConfigurationStatics2 := IStoreConfigurationStatics2(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics2.put_PurchasePromptingPolicy(value)
    }

    /**
     * Determines whether the current user has a Microsoft Store account.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.hasstorewebaccount
     */
    static HasStoreWebAccount() {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics3.IID)
            StoreConfiguration.__IStoreConfigurationStatics3 := IStoreConfigurationStatics3(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics3.HasStoreWebAccount()
    }

    /**
     * Determines whether the specified user has a Microsoft Store account.
     * @param {User} user_ An object that identifies the user for which to query.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.hasstorewebaccountforuser
     */
    static HasStoreWebAccountForUser(user_) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics3.IID)
            StoreConfiguration.__IStoreConfigurationStatics3 := IStoreConfigurationStatics3(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics3.HasStoreWebAccountForUser(user_)
    }

    /**
     * Gets Microsoft Store log data for the current device.
     * @param {Integer} options A value that specifies options for the log data request.
     * @returns {IAsyncOperation<IRandomAccessStreamReference>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.getstorelogdataasync
     */
    static GetStoreLogDataAsync(options) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics3.IID)
            StoreConfiguration.__IStoreConfigurationStatics3 := IStoreConfigurationStatics3(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics3.GetStoreLogDataAsync(options)
    }

    /**
     * Sets the Store user account ID for the specified user so that other apps can query against this ID.
     * @param {User} user_ A [Windows.System.User](../windows.system/user.md) object that identifies the user whose Store user account ID you want to set.
     * @param {HSTRING} webAccountId The Store user account ID (typically obtained from the [WebAccount.Id](../windows.security.credentials/webaccount_id.md) property) to set for the specified user.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.setstorewebaccountidforuser
     */
    static SetStoreWebAccountIdForUser(user_, webAccountId) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics3.IID)
            StoreConfiguration.__IStoreConfigurationStatics3 := IStoreConfigurationStatics3(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics3.SetStoreWebAccountIdForUser(user_, webAccountId)
    }

    /**
     * Determines whether the specified user and user ID is also being used to sign in to the Microsoft Store on the device.
     * @param {User} user_ An object that identifies the user for which to query.
     * @param {HSTRING} webAccountId The user ID (typically obtained from the [WebAccount.Id](../windows.security.credentials/webaccount_id.md) property) to check.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.isstorewebaccountidforuser
     */
    static IsStoreWebAccountIdForUser(user_, webAccountId) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics3.IID)
            StoreConfiguration.__IStoreConfigurationStatics3 := IStoreConfigurationStatics3(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics3.IsStoreWebAccountIdForUser(user_, webAccountId)
    }

    /**
     * Gets a value that indicates whether the Windows Store prompts the specified user before making a purchase.
     * @param {User} user_ An object that identifies the user for which to query.
     * @returns {IReference<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.getpurchasepromptingpolicyforuser
     */
    static GetPurchasePromptingPolicyForUser(user_) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics3.IID)
            StoreConfiguration.__IStoreConfigurationStatics3 := IStoreConfigurationStatics3(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics3.GetPurchasePromptingPolicyForUser(user_)
    }

    /**
     * Sets a value that indicates whether the Microsoft Store prompts the user before making a purchase.
     * @param {User} user_ An object that identifies the user for which to perform this operation.
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.setpurchasepromptingpolicyforuser
     */
    static SetPurchasePromptingPolicyForUser(user_, value) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics3.IID)
            StoreConfiguration.__IStoreConfigurationStatics3 := IStoreConfigurationStatics3(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics3.SetPurchasePromptingPolicyForUser(user_, value)
    }

    /**
     * Determines whether apps can be pinned to the desktop on the current device.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.ispintodesktopsupported
     */
    static IsPinToDesktopSupported() {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics5")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics5.IID)
            StoreConfiguration.__IStoreConfigurationStatics5 := IStoreConfigurationStatics5(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics5.IsPinToDesktopSupported()
    }

    /**
     * Determines whether apps can be pinned to the taskbar on the current device.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.ispintotaskbarsupported
     */
    static IsPinToTaskbarSupported() {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics5")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics5.IID)
            StoreConfiguration.__IStoreConfigurationStatics5 := IStoreConfigurationStatics5(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics5.IsPinToTaskbarSupported()
    }

    /**
     * Determines whether apps can be pinned to the Start menu on the current device.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.ispintostartsupported
     */
    static IsPinToStartSupported() {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics5")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics5.IID)
            StoreConfiguration.__IStoreConfigurationStatics5 := IStoreConfigurationStatics5(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics5.IsPinToStartSupported()
    }

    /**
     * Pins the specified app to the desktop for the all users on the current device.
     * @param {HSTRING} appPackageFamilyName The package family name of the app to pin to the desktop.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.pintodesktop
     */
    static PinToDesktop(appPackageFamilyName) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics5")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics5.IID)
            StoreConfiguration.__IStoreConfigurationStatics5 := IStoreConfigurationStatics5(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics5.PinToDesktop(appPackageFamilyName)
    }

    /**
     * Pins the specified app to the desktop for the specified user on the current device.
     * @param {User} user_ The user for which the app will be pinned to the desktop.
     * @param {HSTRING} appPackageFamilyName The package family name of the app to pin to the desktop.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.pintodesktopforuser
     */
    static PinToDesktopForUser(user_, appPackageFamilyName) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics5")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics5.IID)
            StoreConfiguration.__IStoreConfigurationStatics5 := IStoreConfigurationStatics5(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics5.PinToDesktopForUser(user_, appPackageFamilyName)
    }

    /**
     * Configures miscellaneous system information for the device.
     * @param {HSTRING} catalogHardwareManufacturerId The ID of the hardware manufacturer.
     * @param {HSTRING} catalogStoreContentModifierId The ID of the Windows Store content modifier.
     * @param {DateTime} systemConfigurationExpiration The expiration date for the system configuration.
     * @param {HSTRING} catalogHardwareDescriptor A descriptor string that specifies the hardware components supported by the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.setsystemconfiguration
     */
    static SetSystemConfiguration(catalogHardwareManufacturerId, catalogStoreContentModifierId, systemConfigurationExpiration, catalogHardwareDescriptor) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics.IID)
            StoreConfiguration.__IStoreConfigurationStatics := IStoreConfigurationStatics(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics.SetSystemConfiguration(catalogHardwareManufacturerId, catalogStoreContentModifierId, systemConfigurationExpiration, catalogHardwareDescriptor)
    }

    /**
     * Configures mobile operator information for the device.
     * @param {HSTRING} mobileOperatorId The mobile operator ID.
     * @param {Integer} appDownloadLimitInMegabytes The maximum app download size defined by the mobile operator, in MB.
     * @param {Integer} updateDownloadLimitInMegabytes The maximum OS update download size defined by the mobile operator, in MB.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.setmobileoperatorconfiguration
     */
    static SetMobileOperatorConfiguration(mobileOperatorId, appDownloadLimitInMegabytes, updateDownloadLimitInMegabytes) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics.IID)
            StoreConfiguration.__IStoreConfigurationStatics := IStoreConfigurationStatics(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics.SetMobileOperatorConfiguration(mobileOperatorId, appDownloadLimitInMegabytes, updateDownloadLimitInMegabytes)
    }

    /**
     * Sets the Store user account ID for the current user who is signed in to the Store so that other apps can query against this ID.
     * @param {HSTRING} webAccountId The Store user account ID (typically obtained from the [WebAccount.Id](../windows.security.credentials/webaccount_id.md) property) to set for the user who is currently signed in to the Store.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.setstorewebaccountid
     */
    static SetStoreWebAccountId(webAccountId) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics.IID)
            StoreConfiguration.__IStoreConfigurationStatics := IStoreConfigurationStatics(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics.SetStoreWebAccountId(webAccountId)
    }

    /**
     * Determines whether the specified user ID is also being used to sign in to the Microsoft Store on the device.
     * @param {HSTRING} webAccountId The user ID (typically obtained from the [WebAccount.Id](../windows.security.credentials/webaccount_id.md) property) to check.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.isstorewebaccountid
     */
    static IsStoreWebAccountId(webAccountId) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics.IID)
            StoreConfiguration.__IStoreConfigurationStatics := IStoreConfigurationStatics(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics.IsStoreWebAccountId(webAccountId)
    }

    /**
     * 
     * @returns {StoreHardwareManufacturerInfo} 
     */
    static get_HardwareManufacturerInfo() {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics.IID)
            StoreConfiguration.__IStoreConfigurationStatics := IStoreConfigurationStatics(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics.get_HardwareManufacturerInfo()
    }

    /**
     * Given a list of hardware features, this method returns a modified list that contains only the hardware features that are supported on the current device.
     * @param {IIterable<Integer>} systemFeatures A list of [StoreSystemFeature](storesystemfeature.md) objects that represent the hardware features to be queried on the current device.
     * @returns {IAsyncOperation<IVectorView<Integer>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.filterunsupportedsystemfeaturesasync
     */
    static FilterUnsupportedSystemFeaturesAsync(systemFeatures) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics.IID)
            StoreConfiguration.__IStoreConfigurationStatics := IStoreConfigurationStatics(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics.FilterUnsupportedSystemFeaturesAsync(systemFeatures)
    }

    /**
     * Gets the Store user account ID for the current user who is signed in to the Store.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.getstorewebaccountid
     */
    static GetStoreWebAccountId() {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics4")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics4.IID)
            StoreConfiguration.__IStoreConfigurationStatics4 := IStoreConfigurationStatics4(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics4.GetStoreWebAccountId()
    }

    /**
     * Gets the Store user account ID for the specified user who is signed in to the Store.
     * @param {User} user_ A [Windows.System.User](../windows.system/user.md) object that identifies the user for which you want to retrieve the Store user account ID.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.getstorewebaccountidforuser
     */
    static GetStoreWebAccountIdForUser(user_) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics4")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics4.IID)
            StoreConfiguration.__IStoreConfigurationStatics4 := IStoreConfigurationStatics4(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics4.GetStoreWebAccountIdForUser(user_)
    }

    /**
     * Sets the Store user account ID for the current Azure AD user who is signed in to the Store so that other apps can query against this ID.
     * @param {HSTRING} webAccountId The Store user account ID (typically obtained from the [WebAccount.Id](../windows.security.credentials/webaccount_id.md) property) to set for the Azure AD user who is currently signed in to the Store.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.setenterprisestorewebaccountid
     */
    static SetEnterpriseStoreWebAccountId(webAccountId) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics4")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics4.IID)
            StoreConfiguration.__IStoreConfigurationStatics4 := IStoreConfigurationStatics4(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics4.SetEnterpriseStoreWebAccountId(webAccountId)
    }

    /**
     * Sets the Store user account ID for the specified Azure AD user so that other apps can query against this ID.
     * @param {User} user_ A [Windows.System.User](../windows.system/user.md) object that identifies the Azure AD user whose Store user account ID you want to set.
     * @param {HSTRING} webAccountId The Store user account ID (typically obtained from the [WebAccount.Id](../windows.security.credentials/webaccount_id.md) property) to set for the specified Azure AD user.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.setenterprisestorewebaccountidforuser
     */
    static SetEnterpriseStoreWebAccountIdForUser(user_, webAccountId) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics4")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics4.IID)
            StoreConfiguration.__IStoreConfigurationStatics4 := IStoreConfigurationStatics4(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics4.SetEnterpriseStoreWebAccountIdForUser(user_, webAccountId)
    }

    /**
     * Gets the Store user account ID for the current Azure AD user who is signed in to the Store.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.getenterprisestorewebaccountid
     */
    static GetEnterpriseStoreWebAccountId() {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics4")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics4.IID)
            StoreConfiguration.__IStoreConfigurationStatics4 := IStoreConfigurationStatics4(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics4.GetEnterpriseStoreWebAccountId()
    }

    /**
     * Gets the Store user account ID for the specified Azure AD user who is signed in to the Store.
     * @param {User} user_ A [Windows.System.User](../windows.system/user.md) object that identifies the Azure AD user for which you want to retrieve the user account ID.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.getenterprisestorewebaccountidforuser
     */
    static GetEnterpriseStoreWebAccountIdForUser(user_) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics4")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics4.IID)
            StoreConfiguration.__IStoreConfigurationStatics4 := IStoreConfigurationStatics4(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics4.GetEnterpriseStoreWebAccountIdForUser(user_)
    }

    /**
     * Determines whether the Microsoft Store for Business is enabled for the current user.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.shouldrestricttoenterprisestoreonly
     */
    static ShouldRestrictToEnterpriseStoreOnly() {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics4")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics4.IID)
            StoreConfiguration.__IStoreConfigurationStatics4 := IStoreConfigurationStatics4(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics4.ShouldRestrictToEnterpriseStoreOnly()
    }

    /**
     * Determines whether the Microsoft Store for Business is enabled for the specified user.
     * @param {User} user_ A [Windows.System.User](../windows.system/user.md) object that identifies the user for whom you want to determine whether the Microsoft Store for Business is enabled.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storeconfiguration.shouldrestricttoenterprisestoreonlyforuser
     */
    static ShouldRestrictToEnterpriseStoreOnlyForUser(user_) {
        if (!StoreConfiguration.HasProp("__IStoreConfigurationStatics4")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.StoreConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStoreConfigurationStatics4.IID)
            StoreConfiguration.__IStoreConfigurationStatics4 := IStoreConfigurationStatics4(factoryPtr)
        }

        return StoreConfiguration.__IStoreConfigurationStatics4.ShouldRestrictToEnterpriseStoreOnlyForUser(user_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
