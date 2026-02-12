#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataAccountPartnerAccountInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents data about an account for partner service.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountpartneraccountinfo
 * @namespace Windows.ApplicationModel.UserDataAccounts.Provider
 * @version WindowsRuntime 1.4
 */
class UserDataAccountPartnerAccountInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataAccountPartnerAccountInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataAccountPartnerAccountInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the human readable display name for this user account.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountpartneraccountinfo.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the priority for the service that uses this kind of user account.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountpartneraccountinfo.priority
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
    }

    /**
     * Gets the type of this user account.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountpartneraccountinfo.accountkind
     * @type {Integer} 
     */
    AccountKind {
        get => this.get_AccountKind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IUserDataAccountPartnerAccountInfo")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountPartnerAccountInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountPartnerAccountInfo := IUserDataAccountPartnerAccountInfo(outPtr)
        }

        return this.__IUserDataAccountPartnerAccountInfo.get_DisplayName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        if (!this.HasProp("__IUserDataAccountPartnerAccountInfo")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountPartnerAccountInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountPartnerAccountInfo := IUserDataAccountPartnerAccountInfo(outPtr)
        }

        return this.__IUserDataAccountPartnerAccountInfo.get_Priority()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AccountKind() {
        if (!this.HasProp("__IUserDataAccountPartnerAccountInfo")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountPartnerAccountInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountPartnerAccountInfo := IUserDataAccountPartnerAccountInfo(outPtr)
        }

        return this.__IUserDataAccountPartnerAccountInfo.get_AccountKind()
    }

;@endregion Instance Methods
}
