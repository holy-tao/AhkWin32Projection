#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountInvokedArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [WebAccountCommandInvokedHandler](webaccountcommandinvokedhandler.md) delegate.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountinvokedargs
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class WebAccountInvokedArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountInvokedArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountInvokedArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the action for the web account in the accounts pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.webaccountinvokedargs.action
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
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
    get_Action() {
        if (!this.HasProp("__IWebAccountInvokedArgs")) {
            if ((queryResult := this.QueryInterface(IWebAccountInvokedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountInvokedArgs := IWebAccountInvokedArgs(outPtr)
        }

        return this.__IWebAccountInvokedArgs.get_Action()
    }

;@endregion Instance Methods
}
