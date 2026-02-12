#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountProviderDeleteAccountOperation.ahk
#Include .\IWebAccountProviderOperation.ahk
#Include .\IWebAccountProviderBaseReportOperation.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a delete account operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderdeleteaccountoperation
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebAccountProviderDeleteAccountOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountProviderDeleteAccountOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountProviderDeleteAccountOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the web account to delete.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderdeleteaccountoperation.webaccount
     * @type {WebAccount} 
     */
    WebAccount {
        get => this.get_WebAccount()
    }

    /**
     * Gets the kind of web account provider operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderdeleteaccountoperation.kind
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
        if (!this.HasProp("__IWebAccountProviderDeleteAccountOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderDeleteAccountOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderDeleteAccountOperation := IWebAccountProviderDeleteAccountOperation(outPtr)
        }

        return this.__IWebAccountProviderDeleteAccountOperation.get_WebAccount()
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

    /**
     * Informs the activating app that the operation completed successfully.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderdeleteaccountoperation.reportcompleted
     */
    ReportCompleted() {
        if (!this.HasProp("__IWebAccountProviderBaseReportOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderBaseReportOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderBaseReportOperation := IWebAccountProviderBaseReportOperation(outPtr)
        }

        return this.__IWebAccountProviderBaseReportOperation.ReportCompleted()
    }

    /**
     * Informs the activating app that the operation encountered an error.
     * @param {WebProviderError} value The type of error encountered.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountproviderdeleteaccountoperation.reporterror
     */
    ReportError(value) {
        if (!this.HasProp("__IWebAccountProviderBaseReportOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderBaseReportOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderBaseReportOperation := IWebAccountProviderBaseReportOperation(outPtr)
        }

        return this.__IWebAccountProviderBaseReportOperation.ReportError(value)
    }

;@endregion Instance Methods
}
