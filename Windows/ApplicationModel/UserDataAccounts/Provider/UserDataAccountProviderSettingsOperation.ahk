#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataAccountProviderSettingsOperation.ahk
#Include .\IUserDataAccountProviderOperation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the data for an account settings operation.
 * @remarks
 * The operating system invokes the settings action on the app that set up the account. If no app was used to set up the account, then the operating system shows a generic account settings dialog.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountprovidersettingsoperation
 * @namespace Windows.ApplicationModel.UserDataAccounts.Provider
 * @version WindowsRuntime 1.4
 */
class UserDataAccountProviderSettingsOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataAccountProviderSettingsOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataAccountProviderSettingsOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the user account ID for this settings operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountprovidersettingsoperation.userdataaccountid
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

    /**
     * Gets the type of this account operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountprovidersettingsoperation.kind
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
        if (!this.HasProp("__IUserDataAccountProviderSettingsOperation")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountProviderSettingsOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountProviderSettingsOperation := IUserDataAccountProviderSettingsOperation(outPtr)
        }

        return this.__IUserDataAccountProviderSettingsOperation.get_UserDataAccountId()
    }

    /**
     * Reports back to the calling app that the operation is complete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountprovidersettingsoperation.reportcompleted
     */
    ReportCompleted() {
        if (!this.HasProp("__IUserDataAccountProviderSettingsOperation")) {
            if ((queryResult := this.QueryInterface(IUserDataAccountProviderSettingsOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAccountProviderSettingsOperation := IUserDataAccountProviderSettingsOperation(outPtr)
        }

        return this.__IUserDataAccountProviderSettingsOperation.ReportCompleted()
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
