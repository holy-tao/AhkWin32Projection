#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataAccountSystemAccessManagerStatics2.ahk
#Include .\IUserDataAccountSystemAccessManagerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the ability to display the system UI for managing sync relationships.
 * @remarks
 * This is a static class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.userdataaccountsystemaccessmanager
 * @namespace Windows.ApplicationModel.UserDataAccounts.SystemAccess
 * @version WindowsRuntime 1.4
 */
class UserDataAccountSystemAccessManager extends IInspectable {
;@region Static Methods
    /**
     * Asynchronously, and temporarily, replaces the default local account by using the specified account.
     * @remarks
     * The default local account is suppressed while the new account, referenced by *userDataAccountId*, is present on the device. When that new account is deleted, the local account pops back into the system.
     * @param {HSTRING} userDataAccountId The user ID of the account used to temporarily replace the default local account.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.userdataaccountsystemaccessmanager.suppresslocalaccountwithaccountasync
     */
    static SuppressLocalAccountWithAccountAsync(userDataAccountId) {
        if (!UserDataAccountSystemAccessManager.HasProp("__IUserDataAccountSystemAccessManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataAccounts.SystemAccess.UserDataAccountSystemAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataAccountSystemAccessManagerStatics2.IID)
            UserDataAccountSystemAccessManager.__IUserDataAccountSystemAccessManagerStatics2 := IUserDataAccountSystemAccessManagerStatics2(factoryPtr)
        }

        return UserDataAccountSystemAccessManager.__IUserDataAccountSystemAccessManagerStatics2.SuppressLocalAccountWithAccountAsync(userDataAccountId)
    }

    /**
     * > [!NOTE]
     * > This API is no longer supported and should not be called from your code. 
     * 
     * Asynchronously creates a device account using the specified [DeviceAccountConfiguration](deviceaccountconfiguration.md).
     * @param {DeviceAccountConfiguration} account The configuration to use when creating the account.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.userdataaccountsystemaccessmanager.createdeviceaccountasync
     */
    static CreateDeviceAccountAsync(account) {
        if (!UserDataAccountSystemAccessManager.HasProp("__IUserDataAccountSystemAccessManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataAccounts.SystemAccess.UserDataAccountSystemAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataAccountSystemAccessManagerStatics2.IID)
            UserDataAccountSystemAccessManager.__IUserDataAccountSystemAccessManagerStatics2 := IUserDataAccountSystemAccessManagerStatics2(factoryPtr)
        }

        return UserDataAccountSystemAccessManager.__IUserDataAccountSystemAccessManagerStatics2.CreateDeviceAccountAsync(account)
    }

    /**
     * > [!NOTE]
     * > This API is no longer supported and should not be called from your code. 
     * 
     * Asynchronously deletes the specified device account.
     * @param {HSTRING} accountId The ID of the device account to delete.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.userdataaccountsystemaccessmanager.deletedeviceaccountasync
     */
    static DeleteDeviceAccountAsync(accountId) {
        if (!UserDataAccountSystemAccessManager.HasProp("__IUserDataAccountSystemAccessManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataAccounts.SystemAccess.UserDataAccountSystemAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataAccountSystemAccessManagerStatics2.IID)
            UserDataAccountSystemAccessManager.__IUserDataAccountSystemAccessManagerStatics2 := IUserDataAccountSystemAccessManagerStatics2(factoryPtr)
        }

        return UserDataAccountSystemAccessManager.__IUserDataAccountSystemAccessManagerStatics2.DeleteDeviceAccountAsync(accountId)
    }

    /**
     * > [!NOTE]
     * > This API is no longer supported and should not be called from your code. 
     * 
     * Asynchronously gets the [DeviceAccountConfiguration](deviceaccountconfiguration.md) for the specified device account.
     * @param {HSTRING} accountId The ID for the device account.
     * @returns {IAsyncOperation<DeviceAccountConfiguration>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.userdataaccountsystemaccessmanager.getdeviceaccountconfigurationasync
     */
    static GetDeviceAccountConfigurationAsync(accountId) {
        if (!UserDataAccountSystemAccessManager.HasProp("__IUserDataAccountSystemAccessManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataAccounts.SystemAccess.UserDataAccountSystemAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataAccountSystemAccessManagerStatics2.IID)
            UserDataAccountSystemAccessManager.__IUserDataAccountSystemAccessManagerStatics2 := IUserDataAccountSystemAccessManagerStatics2(factoryPtr)
        }

        return UserDataAccountSystemAccessManager.__IUserDataAccountSystemAccessManagerStatics2.GetDeviceAccountConfigurationAsync(accountId)
    }

    /**
     * Asynchronously displays the system UI to manage the sync relationships for the specified accounts.
     * @param {IIterable<DeviceAccountConfiguration>} accounts The list of accounts to manage in the system UI.
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.userdataaccountsystemaccessmanager.addandshowdeviceaccountsasync
     */
    static AddAndShowDeviceAccountsAsync(accounts) {
        if (!UserDataAccountSystemAccessManager.HasProp("__IUserDataAccountSystemAccessManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataAccounts.SystemAccess.UserDataAccountSystemAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataAccountSystemAccessManagerStatics.IID)
            UserDataAccountSystemAccessManager.__IUserDataAccountSystemAccessManagerStatics := IUserDataAccountSystemAccessManagerStatics(factoryPtr)
        }

        return UserDataAccountSystemAccessManager.__IUserDataAccountSystemAccessManagerStatics.AddAndShowDeviceAccountsAsync(accounts)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
