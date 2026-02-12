#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountClientView.ahk
#Include .\IWebAccountClientViewFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the client view for a web account. Use this to control what information about an account from a provider is available to the client.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountclientview
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebAccountClientView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountClientView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountClientView.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [WebAccountClientView](webaccountclientview.md) class.
     * @param {Integer} viewType The client view type.
     * @param {Uri} applicationCallbackUri The callback URI that indicates the completion of the operation.
     * @returns {WebAccountClientView} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountclientview.#ctor
     */
    static Create(viewType, applicationCallbackUri) {
        if (!WebAccountClientView.HasProp("__IWebAccountClientViewFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountClientView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountClientViewFactory.IID)
            WebAccountClientView.__IWebAccountClientViewFactory := IWebAccountClientViewFactory(factoryPtr)
        }

        return WebAccountClientView.__IWebAccountClientViewFactory.Create(viewType, applicationCallbackUri)
    }

    /**
     * Creates a new instance of the [WebAccountClientView](webaccountclientview.md) class.
     * @param {Integer} viewType The client view type.
     * @param {Uri} applicationCallbackUri The callback URI that indicates the completion of the operation.
     * @param {HSTRING} accountPairwiseId The account pairwise Id.
     * @returns {WebAccountClientView} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountclientview.#ctor
     */
    static CreateWithPairwiseId(viewType, applicationCallbackUri, accountPairwiseId) {
        if (!WebAccountClientView.HasProp("__IWebAccountClientViewFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebAccountClientView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountClientViewFactory.IID)
            WebAccountClientView.__IWebAccountClientViewFactory := IWebAccountClientViewFactory(factoryPtr)
        }

        return WebAccountClientView.__IWebAccountClientViewFactory.CreateWithPairwiseId(viewType, applicationCallbackUri, accountPairwiseId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the app callback Uri.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountclientview.applicationcallbackuri
     * @type {Uri} 
     */
    ApplicationCallbackUri {
        get => this.get_ApplicationCallbackUri()
    }

    /**
     * Gets the type of web account client view.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountclientview.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the account pairwise Id.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountclientview.accountpairwiseid
     * @type {HSTRING} 
     */
    AccountPairwiseId {
        get => this.get_AccountPairwiseId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ApplicationCallbackUri() {
        if (!this.HasProp("__IWebAccountClientView")) {
            if ((queryResult := this.QueryInterface(IWebAccountClientView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountClientView := IWebAccountClientView(outPtr)
        }

        return this.__IWebAccountClientView.get_ApplicationCallbackUri()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IWebAccountClientView")) {
            if ((queryResult := this.QueryInterface(IWebAccountClientView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountClientView := IWebAccountClientView(outPtr)
        }

        return this.__IWebAccountClientView.get_Type()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccountPairwiseId() {
        if (!this.HasProp("__IWebAccountClientView")) {
            if ((queryResult := this.QueryInterface(IWebAccountClientView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountClientView := IWebAccountClientView(outPtr)
        }

        return this.__IWebAccountClientView.get_AccountPairwiseId()
    }

;@endregion Instance Methods
}
