#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Contains information about an event involving a [WebAccount](../windows.security.credentials/webaccount.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webaccounteventargs
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebAccountEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [WebAccount](../windows.security.credentials/webaccount.md) involved in the event.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webaccounteventargs.account
     * @type {WebAccount} 
     */
    Account {
        get => this.get_Account()
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
    get_Account() {
        if (!this.HasProp("__IWebAccountEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebAccountEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountEventArgs := IWebAccountEventArgs(outPtr)
        }

        return this.__IWebAccountEventArgs.get_Account()
    }

;@endregion Instance Methods
}
