#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAuthenticationAddAccountResult.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * The result of a web account provisioning operation, returned by the [WebAuthenticationCoreManager.AddAccountWithTransferTokenAsync](webauthenticationcoremanager_addaccountwithtransfertokenasync_94782791.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationaddaccountresult
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebAuthenticationAddAccountResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAuthenticationAddAccountResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAuthenticationAddAccountResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The [WebAuthenticationAddAccountResponse](webauthenticationaddaccountresponse.md) data for the [WebAuthenticationCoreManager.AddAccountWithTransferTokenAsync](webauthenticationcoremanager_addaccountwithtransfertokenasync_94782791.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationaddaccountresult.responsedata
     * @type {WebAuthenticationAddAccountResponse} 
     */
    ResponseData {
        get => this.get_ResponseData()
    }

    /**
     * The [WebAuthenticationAddAccountStatus](webauthenticationaddaccountstatus.md) of a web account provisioning operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationaddaccountresult.responsestatus
     * @type {Integer} 
     */
    ResponseStatus {
        get => this.get_ResponseStatus()
    }

    /**
     * The [WebProviderError](webprovidererror.md) returned by the web account provisioning operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationaddaccountresult.responseerror
     * @type {WebProviderError} 
     */
    ResponseError {
        get => this.get_ResponseError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WebAuthenticationAddAccountResponse} 
     */
    get_ResponseData() {
        if (!this.HasProp("__IWebAuthenticationAddAccountResult")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationAddAccountResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationAddAccountResult := IWebAuthenticationAddAccountResult(outPtr)
        }

        return this.__IWebAuthenticationAddAccountResult.get_ResponseData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResponseStatus() {
        if (!this.HasProp("__IWebAuthenticationAddAccountResult")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationAddAccountResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationAddAccountResult := IWebAuthenticationAddAccountResult(outPtr)
        }

        return this.__IWebAuthenticationAddAccountResult.get_ResponseStatus()
    }

    /**
     * 
     * @returns {WebProviderError} 
     */
    get_ResponseError() {
        if (!this.HasProp("__IWebAuthenticationAddAccountResult")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationAddAccountResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationAddAccountResult := IWebAuthenticationAddAccountResult(outPtr)
        }

        return this.__IWebAuthenticationAddAccountResult.get_ResponseError()
    }

;@endregion Instance Methods
}
