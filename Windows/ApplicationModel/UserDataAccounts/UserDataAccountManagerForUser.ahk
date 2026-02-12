#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataAccountManagerForUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a user data account manager for a specific user.
 * @remarks
 * Call the [UserDataAccountManager.GetForUser](userdataaccountmanager_getforuser_2058550280.md) method to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountmanagerforuser
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class UserDataAccountManagerForUser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataAccountManagerForUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataAccountManagerForUser.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [User](../windows.system/user.md) represented by this data account manager.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountmanagerforuser.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves a [UserDataAccountStore](userdataaccountstore.md) object that enables searching or retrieving user data accounts on the device.
     * @param {Integer} storeAccessType Specifies the type of read/write access requested.
     * @returns {IAsyncOperation<UserDataAccountStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountmanagerforuser.requeststoreasync
     */
    RequestStoreAsync(storeAccessType) {
        if (!this.HasProp("__IUserDataAccountManagerForUser")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountManagerForUser := IUserDataAccountManagerForUser(outPtr)
        }

        return this.__IUserDataAccountManagerForUser.RequestStoreAsync(storeAccessType)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IUserDataAccountManagerForUser")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountManagerForUser := IUserDataAccountManagerForUser(outPtr)
        }

        return this.__IUserDataAccountManagerForUser.get_User()
    }

;@endregion Instance Methods
}
