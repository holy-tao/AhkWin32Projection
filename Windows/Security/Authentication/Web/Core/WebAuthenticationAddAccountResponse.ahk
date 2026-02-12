#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAuthenticationAddAccountResponse.ahk
#Include .\IWebAuthenticationAddAccountResponseFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Contains the response data for an add account operation.
 * @remarks
 * This data is included in the [WebAuthenticationAddAccountResult](webauthenticationaddaccountresult.md) object that is returned by the [WebAuthenticationCoreManager.AddAccountWithTransferTokenAsync](webauthenticationcoremanager_addaccountwithtransfertokenasync_94782791.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationaddaccountresponse
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebAuthenticationAddAccountResponse extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAuthenticationAddAccountResponse

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAuthenticationAddAccountResponse.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * The constructor for the [WebAuthenticationAddAccountResponse](webauthenticationaddaccountresponse.md) class.
     * @param {WebAccount} webAccount_ 
     * @returns {WebAuthenticationAddAccountResponse} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationaddaccountresponse.#ctor
     */
    static CreateWithAccount(webAccount_) {
        if (!WebAuthenticationAddAccountResponse.HasProp("__IWebAuthenticationAddAccountResponseFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationAddAccountResponse")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationAddAccountResponseFactory.IID)
            WebAuthenticationAddAccountResponse.__IWebAuthenticationAddAccountResponseFactory := IWebAuthenticationAddAccountResponseFactory(factoryPtr)
        }

        return WebAuthenticationAddAccountResponse.__IWebAuthenticationAddAccountResponseFactory.CreateWithAccount(webAccount_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The [WebAccount](../windows.security.credentials/webaccount.md) object that contains the data to identify an account from a web account provider.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationaddaccountresponse.webaccount
     * @type {WebAccount} 
     */
    WebAccount {
        get => this.get_WebAccount()
    }

    /**
     * A dictionary of properties that represent the response data for an [AddAccountWithTransferTokenAsync](webauthenticationcoremanager_addaccountwithtransfertokenasync_94782791.md) operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationaddaccountresponse.properties
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Properties {
        get => this.get_Properties()
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
        if (!this.HasProp("__IWebAuthenticationAddAccountResponse")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationAddAccountResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationAddAccountResponse := IWebAuthenticationAddAccountResponse(outPtr)
        }

        return this.__IWebAuthenticationAddAccountResponse.get_WebAccount()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Properties() {
        if (!this.HasProp("__IWebAuthenticationAddAccountResponse")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationAddAccountResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationAddAccountResponse := IWebAuthenticationAddAccountResponse(outPtr)
        }

        return this.__IWebAuthenticationAddAccountResponse.get_Properties()
    }

;@endregion Instance Methods
}
