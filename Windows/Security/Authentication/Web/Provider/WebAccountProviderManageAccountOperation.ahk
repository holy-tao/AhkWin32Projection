#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountProviderManageAccountOperation.ahk
#Include .\IWebAccountProviderOperation.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a manage account operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidermanageaccountoperation
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebAccountProviderManageAccountOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountProviderManageAccountOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountProviderManageAccountOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the web account to manage.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidermanageaccountoperation.webaccount
     * @type {WebAccount} 
     */
    WebAccount {
        get => this.get_WebAccount()
    }

    /**
     * Gets the kind of web provider operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidermanageaccountoperation.kind
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
     * @returns {WebAccount} 
     */
    get_WebAccount() {
        if (!this.HasProp("__IWebAccountProviderManageAccountOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderManageAccountOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderManageAccountOperation := IWebAccountProviderManageAccountOperation(outPtr)
        }

        return this.__IWebAccountProviderManageAccountOperation.get_WebAccount()
    }

    /**
     * Informs the activating application that the operation completed successfully.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidermanageaccountoperation.reportcompleted
     */
    ReportCompleted() {
        if (!this.HasProp("__IWebAccountProviderManageAccountOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderManageAccountOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderManageAccountOperation := IWebAccountProviderManageAccountOperation(outPtr)
        }

        return this.__IWebAccountProviderManageAccountOperation.ReportCompleted()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IWebAccountProviderOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderOperation := IWebAccountProviderOperation(outPtr)
        }

        return this.__IWebAccountProviderOperation.get_Kind()
    }

;@endregion Instance Methods
}
