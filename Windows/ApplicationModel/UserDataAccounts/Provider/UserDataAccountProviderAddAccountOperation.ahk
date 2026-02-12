#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataAccountProviderAddAccountOperation.ahk
#Include .\IUserDataAccountProviderOperation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the data for adding a new user account.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountprovideraddaccountoperation
 * @namespace Windows.ApplicationModel.UserDataAccounts.Provider
 * @version WindowsRuntime 1.4
 */
class UserDataAccountProviderAddAccountOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataAccountProviderAddAccountOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataAccountProviderAddAccountOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the types of content supported by the user account, such as email, contacts, and appointments.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountprovideraddaccountoperation.contentkinds
     * @type {Integer} 
     */
    ContentKinds {
        get => this.get_ContentKinds()
    }

    /**
     * Gets a list of [UserDataAccountPartnerAccountInfo](userdataaccountpartneraccountinfo.md) objects for this operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountprovideraddaccountoperation.partneraccountinfos
     * @type {IVectorView<UserDataAccountPartnerAccountInfo>} 
     */
    PartnerAccountInfos {
        get => this.get_PartnerAccountInfos()
    }

    /**
     * Gets the type of this account operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountprovideraddaccountoperation.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ContentKinds() {
        if (!this.HasProp("__IUserDataAccountProviderAddAccountOperation")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountProviderAddAccountOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountProviderAddAccountOperation := IUserDataAccountProviderAddAccountOperation(outPtr)
        }

        return this.__IUserDataAccountProviderAddAccountOperation.get_ContentKinds()
    }

    /**
     * 
     * @returns {IVectorView<UserDataAccountPartnerAccountInfo>} 
     */
    get_PartnerAccountInfos() {
        if (!this.HasProp("__IUserDataAccountProviderAddAccountOperation")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountProviderAddAccountOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountProviderAddAccountOperation := IUserDataAccountProviderAddAccountOperation(outPtr)
        }

        return this.__IUserDataAccountProviderAddAccountOperation.get_PartnerAccountInfos()
    }

    /**
     * Reports back to the calling app that the operation is complete.
     * @param {HSTRING} userDataAccountId The identifier for the user account upon which the operation completed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountprovideraddaccountoperation.reportcompleted
     */
    ReportCompleted(userDataAccountId) {
        if (!this.HasProp("__IUserDataAccountProviderAddAccountOperation")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountProviderAddAccountOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountProviderAddAccountOperation := IUserDataAccountProviderAddAccountOperation(outPtr)
        }

        return this.__IUserDataAccountProviderAddAccountOperation.ReportCompleted(userDataAccountId)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IUserDataAccountProviderOperation")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountProviderOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountProviderOperation := IUserDataAccountProviderOperation(outPtr)
        }

        return this.__IUserDataAccountProviderOperation.get_Kind()
    }

;@endregion Instance Methods
}
