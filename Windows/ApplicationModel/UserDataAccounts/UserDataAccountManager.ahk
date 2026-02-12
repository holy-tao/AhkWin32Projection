#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataAccountManagerStatics2.ahk
#Include .\IUserDataAccountManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides APIs to interact with the user’s data accounts including those implemented by the operating system.
 * @remarks
 * Call static methods to display UI so that the user can perform tasks including adding and deleting accounts.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountmanager
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class UserDataAccountManager extends IInspectable {
;@region Static Methods
    /**
     * Gets the [UserDataAccountManagerForUser](userdataaccountmanagerforuser.md) object for the specified user.
     * @param {User} user_ The user account to use to get the [UserDataAccountManagerForUser](userdataaccountmanagerforuser.md) object.
     * @returns {UserDataAccountManagerForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountmanager.getforuser
     */
    static GetForUser(user_) {
        if (!UserDataAccountManager.HasProp("__IUserDataAccountManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataAccounts.UserDataAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataAccountManagerStatics2.IID)
            UserDataAccountManager.__IUserDataAccountManagerStatics2 := IUserDataAccountManagerStatics2(factoryPtr)
        }

        return UserDataAccountManager.__IUserDataAccountManagerStatics2.GetForUser(user_)
    }

    /**
     * Asynchronously returns the [UserDataAccountStore](userdataaccountstore.md) from the system.
     * @remarks
     * In order to gain access to the [UserDataAccountStore](userdataaccountstore.md), your app must declare at least one of the following capabilities:
     * 
     * 
     * + contacts
     * + appointments
     * + email
     * If none of these capabilities are declared, RequestStoreAsync will throw an **AccessDeniedException**.
     * 
     * If RequestStoreAsync returns **null** it means that the user has turned off access in their privacy settings.
     * @param {Integer} storeAccessType Specifies the access type, such as read-only for all accounts or read/write for the calling app's accounts.
     * @returns {IAsyncOperation<UserDataAccountStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountmanager.requeststoreasync
     */
    static RequestStoreAsync(storeAccessType) {
        if (!UserDataAccountManager.HasProp("__IUserDataAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataAccounts.UserDataAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataAccountManagerStatics.IID)
            UserDataAccountManager.__IUserDataAccountManagerStatics := IUserDataAccountManagerStatics(factoryPtr)
        }

        return UserDataAccountManager.__IUserDataAccountManagerStatics.RequestStoreAsync(storeAccessType)
    }

    /**
     * Shows the add account UI.
     * @param {Integer} contentKinds The type of user data content.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountmanager.showaddaccountasync
     */
    static ShowAddAccountAsync(contentKinds) {
        if (!UserDataAccountManager.HasProp("__IUserDataAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataAccounts.UserDataAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataAccountManagerStatics.IID)
            UserDataAccountManager.__IUserDataAccountManagerStatics := IUserDataAccountManagerStatics(factoryPtr)
        }

        return UserDataAccountManager.__IUserDataAccountManagerStatics.ShowAddAccountAsync(contentKinds)
    }

    /**
     * This method shows the account settings.
     * @param {HSTRING} id The user data account ID.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountmanager.showaccountsettingsasync
     */
    static ShowAccountSettingsAsync(id) {
        if (!UserDataAccountManager.HasProp("__IUserDataAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataAccounts.UserDataAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataAccountManagerStatics.IID)
            UserDataAccountManager.__IUserDataAccountManagerStatics := IUserDataAccountManagerStatics(factoryPtr)
        }

        return UserDataAccountManager.__IUserDataAccountManagerStatics.ShowAccountSettingsAsync(id)
    }

    /**
     * This method shows the resolve message for an account error.
     * @param {HSTRING} id The user data account ID.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountmanager.showaccounterrorresolverasync
     */
    static ShowAccountErrorResolverAsync(id) {
        if (!UserDataAccountManager.HasProp("__IUserDataAccountManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataAccounts.UserDataAccountManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataAccountManagerStatics.IID)
            UserDataAccountManager.__IUserDataAccountManagerStatics := IUserDataAccountManagerStatics(factoryPtr)
        }

        return UserDataAccountManager.__IUserDataAccountManagerStatics.ShowAccountErrorResolverAsync(id)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
