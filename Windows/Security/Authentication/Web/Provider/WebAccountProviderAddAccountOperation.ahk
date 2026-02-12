#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountProviderAddAccountOperation.ahk
#Include .\IWebAccountProviderOperation.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents an add account operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovideraddaccountoperation
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebAccountProviderAddAccountOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountProviderAddAccountOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountProviderAddAccountOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the kind of web account provider operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovideraddaccountoperation.kind
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
     * Informs the activating app that the operation completed successfully.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovideraddaccountoperation.reportcompleted
     */
    ReportCompleted() {
        if (!this.HasProp("__IWebAccountProviderAddAccountOperation")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderAddAccountOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderAddAccountOperation := IWebAccountProviderAddAccountOperation(outPtr)
        }

        return this.__IWebAccountProviderAddAccountOperation.ReportCompleted()
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
