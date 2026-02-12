#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebProviderError.ahk
#Include .\IWebProviderErrorFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents an error from a web account provider.
 * @remarks
 * If you receive this error, it means Windows made contact with the provider, but the provider returned an error. Errors are specific to individual providers. For information on the error, consult the provider's documentation.
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webprovidererror
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebProviderError extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebProviderError

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebProviderError.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [WebProviderError](webprovidererror.md) class.
     * @param {Integer} errorCode The error code.
     * @param {HSTRING} errorMessage The error message.
     * @returns {WebProviderError} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webprovidererror.#ctor
     */
    static Create(errorCode, errorMessage) {
        if (!WebProviderError.HasProp("__IWebProviderErrorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebProviderError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebProviderErrorFactory.IID)
            WebProviderError.__IWebProviderErrorFactory := IWebProviderErrorFactory(factoryPtr)
        }

        return WebProviderError.__IWebProviderErrorFactory.Create(errorCode, errorMessage)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the error code.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webprovidererror.errorcode
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * Gets the error message.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webprovidererror.errormessage
     * @type {HSTRING} 
     */
    ErrorMessage {
        get => this.get_ErrorMessage()
    }

    /**
     * Gets the error properties.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webprovidererror.properties
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
     * @returns {Integer} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IWebProviderError")) {
            if ((queryResult := this.QueryInterface(IWebProviderError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderError := IWebProviderError(outPtr)
        }

        return this.__IWebProviderError.get_ErrorCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ErrorMessage() {
        if (!this.HasProp("__IWebProviderError")) {
            if ((queryResult := this.QueryInterface(IWebProviderError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderError := IWebProviderError(outPtr)
        }

        return this.__IWebProviderError.get_ErrorMessage()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Properties() {
        if (!this.HasProp("__IWebProviderError")) {
            if ((queryResult := this.QueryInterface(IWebProviderError.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderError := IWebProviderError(outPtr)
        }

        return this.__IWebProviderError.get_Properties()
    }

;@endregion Instance Methods
}
