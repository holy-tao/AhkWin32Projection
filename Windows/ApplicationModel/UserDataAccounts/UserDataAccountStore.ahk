#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataAccountStore.ahk
#Include .\IUserDataAccountStore2.ahk
#Include .\IUserDataAccountStore3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\UserDataAccountStore.ahk
#Include .\UserDataAccountStoreChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a data store that contains user accounts.
 * @remarks
 * Call [RequestStoreAsync](userdataaccountmanager_requeststoreasync_1031356348.md) to get an instance of UserDataAccountStore.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountstore
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class UserDataAccountStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataAccountStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataAccountStore.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStoreChangedToken")) {
            this.remove_StoreChanged(this.__OnStoreChangedToken)
            this.__OnStoreChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Returns a collection of [UserDataAccount](userdataaccount.md) objects from the store based on the [UserDataAccountStoreAccessType](userdataaccountstoreaccesstype.md) value passed into [RequestStoreAsync](userdataaccountmanager_requeststoreasync_1031356348.md).
     * @returns {IAsyncOperation<IVectorView<UserDataAccount>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountstore.findaccountsasync
     */
    FindAccountsAsync() {
        if (!this.HasProp("__IUserDataAccountStore")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountStore := IUserDataAccountStore(outPtr)
        }

        return this.__IUserDataAccountStore.FindAccountsAsync()
    }

    /**
     * Asynchronously gets the specified account.
     * @param {HSTRING} id The [Id](userdataaccount_id.md) string identifying the account.
     * @returns {IAsyncOperation<UserDataAccount>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountstore.getaccountasync
     */
    GetAccountAsync(id) {
        if (!this.HasProp("__IUserDataAccountStore")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountStore := IUserDataAccountStore(outPtr)
        }

        return this.__IUserDataAccountStore.GetAccountAsync(id)
    }

    /**
     * Asynchronously creates a user data account, specifying a displayable user name and a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) that identifies the app in the Microsoft Store.
     * @param {HSTRING} userDisplayName A string containing the user name that is suitable for display.
     * @returns {IAsyncOperation<UserDataAccount>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountstore.createaccountasync
     */
    CreateAccountAsync(userDisplayName) {
        if (!this.HasProp("__IUserDataAccountStore")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountStore := IUserDataAccountStore(outPtr)
        }

        return this.__IUserDataAccountStore.CreateAccountAsync(userDisplayName)
    }

    /**
     * Asynchronously creates a user data account, specifying a displayable user name, a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) that identifies the app in the Microsoft Store, and the enterprise identity associated with the user account.
     * @param {HSTRING} userDisplayName A string containing the user name that is suitable for display.
     * @param {HSTRING} packageRelativeAppId The [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) that identifies the app in the Microsoft Store.
     * @returns {IAsyncOperation<UserDataAccount>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountstore.createaccountasync
     */
    CreateAccountWithPackageRelativeAppIdAsync(userDisplayName, packageRelativeAppId) {
        if (!this.HasProp("__IUserDataAccountStore2")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountStore2 := IUserDataAccountStore2(outPtr)
        }

        return this.__IUserDataAccountStore2.CreateAccountWithPackageRelativeAppIdAsync(userDisplayName, packageRelativeAppId)
    }

    /**
     * 
     * @param {TypedEventHandler<UserDataAccountStore, UserDataAccountStoreChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StoreChanged(handler) {
        if (!this.HasProp("__IUserDataAccountStore2")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountStore2 := IUserDataAccountStore2(outPtr)
        }

        return this.__IUserDataAccountStore2.add_StoreChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StoreChanged(token) {
        if (!this.HasProp("__IUserDataAccountStore2")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountStore2 := IUserDataAccountStore2(outPtr)
        }

        return this.__IUserDataAccountStore2.remove_StoreChanged(token)
    }

    /**
     * Asynchronously creates a user data account, specifying a displayable user name.
     * @param {HSTRING} userDisplayName A string containing the user name that is suitable for display.
     * @param {HSTRING} packageRelativeAppId 
     * @param {HSTRING} enterpriseId 
     * @returns {IAsyncOperation<UserDataAccount>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountstore.createaccountasync
     */
    CreateAccountWithPackageRelativeAppIdAndEnterpriseIdAsync(userDisplayName, packageRelativeAppId, enterpriseId) {
        if (!this.HasProp("__IUserDataAccountStore3")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountStore3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountStore3 := IUserDataAccountStore3(outPtr)
        }

        return this.__IUserDataAccountStore3.CreateAccountWithPackageRelativeAppIdAndEnterpriseIdAsync(userDisplayName, packageRelativeAppId, enterpriseId)
    }

;@endregion Instance Methods
}
