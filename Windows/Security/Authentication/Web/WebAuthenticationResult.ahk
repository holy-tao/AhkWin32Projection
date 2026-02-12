#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAuthenticationResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Indicates the result of the authentication operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationresult
 * @namespace Windows.Security.Authentication.Web
 * @version WindowsRuntime 1.4
 */
class WebAuthenticationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAuthenticationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAuthenticationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Contains the protocol data when the operation successfully completes.
     * @remarks
     * When the [WebAuthenticationOptions.UseTitle](webauthenticationoptions.md) option is used, this property contains the value of the webpage title. The ResponseData for HTTP GET and HTTP redirects includes the entire URL. For POST, the data is the entity body.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationresult.responsedata
     * @type {HSTRING} 
     */
    ResponseData {
        get => this.get_ResponseData()
    }

    /**
     * Contains the status of the asynchronous operation when it completes.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationresult.responsestatus
     * @type {Integer} 
     */
    ResponseStatus {
        get => this.get_ResponseStatus()
    }

    /**
     * Returns the HTTP error code when [ResponseStatus](webauthenticationresult_responsestatus.md) is equal to [WebAuthenticationStatus.ErrorHttp](webauthenticationstatus.md). This is only available if there is an error.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationresult.responseerrordetail
     * @type {Integer} 
     */
    ResponseErrorDetail {
        get => this.get_ResponseErrorDetail()
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
    get_ResponseData() {
        if (!this.HasProp("__IWebAuthenticationResult")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationResult := IWebAuthenticationResult(outPtr)
        }

        return this.__IWebAuthenticationResult.get_ResponseData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResponseStatus() {
        if (!this.HasProp("__IWebAuthenticationResult")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationResult := IWebAuthenticationResult(outPtr)
        }

        return this.__IWebAuthenticationResult.get_ResponseStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResponseErrorDetail() {
        if (!this.HasProp("__IWebAuthenticationResult")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationResult := IWebAuthenticationResult(outPtr)
        }

        return this.__IWebAuthenticationResult.get_ResponseErrorDetail()
    }

;@endregion Instance Methods
}
