#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataAccountProviderResolveErrorsOperation.ahk
#Include .\IUserDataAccountProviderOperation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the data for a "resolve errors" account operation.
 * @remarks
 * The operating system invokes the "resolve errors" action on the app that set up the account. If no app was used to set up the account, then the operating system shows a dialog that asks the user to re-enter their password for the account and optionally change mail server configuration.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountproviderresolveerrorsoperation
 * @namespace Windows.ApplicationModel.UserDataAccounts.Provider
 * @version WindowsRuntime 1.4
 */
class UserDataAccountProviderResolveErrorsOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataAccountProviderResolveErrorsOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataAccountProviderResolveErrorsOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the user account ID for this "resolve errors" operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountproviderresolveerrorsoperation.userdataaccountid
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

    /**
     * Gets the type of this account operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountproviderresolveerrorsoperation.kind
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
     * @returns {HSTRING} 
     */
    get_UserDataAccountId() {
        if (!this.HasProp("__IUserDataAccountProviderResolveErrorsOperation")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountProviderResolveErrorsOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountProviderResolveErrorsOperation := IUserDataAccountProviderResolveErrorsOperation(outPtr)
        }

        return this.__IUserDataAccountProviderResolveErrorsOperation.get_UserDataAccountId()
    }

    /**
     * Reports back to the calling app that the operation is complete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountproviderresolveerrorsoperation.reportcompleted
     */
    ReportCompleted() {
        if (!this.HasProp("__IUserDataAccountProviderResolveErrorsOperation")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountProviderResolveErrorsOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountProviderResolveErrorsOperation := IUserDataAccountProviderResolveErrorsOperation(outPtr)
        }

        return this.__IUserDataAccountProviderResolveErrorsOperation.ReportCompleted()
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
