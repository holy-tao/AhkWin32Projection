#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFindAllAccountsResult.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * This class represents the result of an account retrieval operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.findallaccountsresult
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class FindAllAccountsResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFindAllAccountsResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFindAllAccountsResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of retrieved web accounts (if the operation was successful).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.findallaccountsresult.accounts
     * @type {IVectorView<WebAccount>} 
     */
    Accounts {
        get => this.get_Accounts()
    }

    /**
     * Gets the status of the web account retrieval operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.findallaccountsresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the error, if one occurred, during the web account retrieval operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.findallaccountsresult.providererror
     * @type {WebProviderError} 
     */
    ProviderError {
        get => this.get_ProviderError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<WebAccount>} 
     */
    get_Accounts() {
        if (!this.HasProp("__IFindAllAccountsResult")) {
            if ((queryResult := this.QueryInterface(IFindAllAccountsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindAllAccountsResult := IFindAllAccountsResult(outPtr)
        }

        return this.__IFindAllAccountsResult.get_Accounts()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IFindAllAccountsResult")) {
            if ((queryResult := this.QueryInterface(IFindAllAccountsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindAllAccountsResult := IFindAllAccountsResult(outPtr)
        }

        return this.__IFindAllAccountsResult.get_Status()
    }

    /**
     * 
     * @returns {WebProviderError} 
     */
    get_ProviderError() {
        if (!this.HasProp("__IFindAllAccountsResult")) {
            if ((queryResult := this.QueryInterface(IFindAllAccountsResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFindAllAccountsResult := IFindAllAccountsResult(outPtr)
        }

        return this.__IFindAllAccountsResult.get_ProviderError()
    }

;@endregion Instance Methods
}
