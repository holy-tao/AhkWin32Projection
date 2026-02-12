#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountProviderTokenObjects.ahk
#Include .\IWebAccountProviderTokenObjects2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides information about the trigger that started the web account provider task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidertriggerdetails
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebAccountProviderTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountProviderTokenObjects

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountProviderTokenObjects.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the web account provider operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidertriggerdetails.operation
     * @type {IWebAccountProviderOperation} 
     */
    Operation {
        get => this.get_Operation()
    }

    /**
     * Gets the user that issued this web account provider trigger (for use with multi-user-aware apps).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovidertriggerdetails.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IWebAccountProviderOperation} 
     */
    get_Operation() {
        if (!this.HasProp("__IWebAccountProviderTokenObjects")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderTokenObjects.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderTokenObjects := IWebAccountProviderTokenObjects(outPtr)
        }

        return this.__IWebAccountProviderTokenObjects.get_Operation()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IWebAccountProviderTokenObjects2")) {
            if ((queryResult := this.QueryInterface(IWebAccountProviderTokenObjects2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProviderTokenObjects2 := IWebAccountProviderTokenObjects2(outPtr)
        }

        return this.__IWebAccountProviderTokenObjects2.get_User()
    }

;@endregion Instance Methods
}
