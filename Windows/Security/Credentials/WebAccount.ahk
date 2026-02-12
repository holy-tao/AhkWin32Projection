#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccount.ahk
#Include .\IWebAccount2.ahk
#Include .\IWebAccountFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Identifies an account from a web account provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccount
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class WebAccount extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccount

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccount.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [WebAccount](webaccount.md) class.
     * @param {WebAccountProvider} webAccountProvider_ The web account provider associated with the web account.
     * @param {HSTRING} userName The user name of the web account.
     * @param {Integer} state The state of the web account.
     * @returns {WebAccount} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccount.#ctor
     */
    static CreateWebAccount(webAccountProvider_, userName, state) {
        if (!WebAccount.HasProp("__IWebAccountFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.WebAccount")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountFactory.IID)
            WebAccount.__IWebAccountFactory := IWebAccountFactory(factoryPtr)
        }

        return WebAccount.__IWebAccountFactory.CreateWebAccount(webAccountProvider_, userName, state)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the web authentication provider for the account.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccount.webaccountprovider
     * @type {WebAccountProvider} 
     */
    WebAccountProvider {
        get => this.get_WebAccountProvider()
    }

    /**
     * Gets the username for the web account.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccount.username
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * Gets the connected state of the web account.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccount.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the Id of the web account.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccount.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the properties of the web account.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccount.properties
     * @type {IMapView<HSTRING, HSTRING>} 
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
     * @returns {WebAccountProvider} 
     */
    get_WebAccountProvider() {
        if (!this.HasProp("__IWebAccount")) {
            if ((queryResult := this.QueryInterface(IWebAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccount := IWebAccount(outPtr)
        }

        return this.__IWebAccount.get_WebAccountProvider()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        if (!this.HasProp("__IWebAccount")) {
            if ((queryResult := this.QueryInterface(IWebAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccount := IWebAccount(outPtr)
        }

        return this.__IWebAccount.get_UserName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IWebAccount")) {
            if ((queryResult := this.QueryInterface(IWebAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccount := IWebAccount(outPtr)
        }

        return this.__IWebAccount.get_State()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IWebAccount2")) {
            if ((queryResult := this.QueryInterface(IWebAccount2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccount2 := IWebAccount2(outPtr)
        }

        return this.__IWebAccount2.get_Id()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, HSTRING>} 
     */
    get_Properties() {
        if (!this.HasProp("__IWebAccount2")) {
            if ((queryResult := this.QueryInterface(IWebAccount2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccount2 := IWebAccount2(outPtr)
        }

        return this.__IWebAccount2.get_Properties()
    }

    /**
     * Gets the web account's picture asynchronously.
     * @remarks
     * > [!IMPORTANT]
     * > The word "desired" is misspelled in this method's parameter name.
     * 
     * This method should be called on the [WebAccount](webaccount.md) returned in [WebTokenRequestResult](/uwp/api/windows.security.authentication.web.core.webtokenrequestresult). Add (`UserPictureEnabled`, `True`) to the [WebTokenRequest.Properties](/uwp/api/windows.security.authentication.web.core.webtokenrequest.properties) while creating [WebTokenRequest](/uwp/api/windows.security.authentication.web.core.webtokenrequest) to acquire a token. Otherwise, the call may return a default profile picture.
     * @param {Integer} desizedSize The desired size of the web account picture.
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccount.getpictureasync
     */
    GetPictureAsync(desizedSize) {
        if (!this.HasProp("__IWebAccount2")) {
            if ((queryResult := this.QueryInterface(IWebAccount2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccount2 := IWebAccount2(outPtr)
        }

        return this.__IWebAccount2.GetPictureAsync(desizedSize)
    }

    /**
     * Signs the web account out asynchronously. This clears all cached tokens associated with the account, and tells the provider to invalidate any tokens associated with the account for this app.
     * @remarks
     * This method is app-specific and applies only to a single device. It will not remove the account from Windows or sign out the account on other devices.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccount.signoutasync
     */
    SignOutAsync() {
        if (!this.HasProp("__IWebAccount2")) {
            if ((queryResult := this.QueryInterface(IWebAccount2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccount2 := IWebAccount2(outPtr)
        }

        return this.__IWebAccount2.SignOutAsync()
    }

    /**
     * Signs the web account out asynchronously. This clears all cached tokens associated with the account, and tells the provider to invalidate any tokens associated with the account for this app.
     * @param {HSTRING} clientId 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccount.signoutasync
     */
    SignOutWithClientIdAsync(clientId) {
        if (!this.HasProp("__IWebAccount2")) {
            if ((queryResult := this.QueryInterface(IWebAccount2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccount2 := IWebAccount2(outPtr)
        }

        return this.__IWebAccount2.SignOutWithClientIdAsync(clientId)
    }

;@endregion Instance Methods
}
