#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [IWebViewControl.UnsupportedUriSchemeIdentified](iwebviewcontrol_unsupportedurischemeidentified.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolunsupportedurischemeidentifiedeventargs
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlUnsupportedUriSchemeIdentifiedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) of the content the [IWebViewControl](iwebviewcontrol.md) attempted to navigate to.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolunsupportedurischemeidentifiedeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for Handled prevents other handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolunsupportedurischemeidentifiedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
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
    get_Uri() {
        if (!this.HasProp("__IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs := IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs(outPtr)
        }

        return this.__IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs.get_Uri()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs := IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs(outPtr)
        }

        return this.__IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs := IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs(outPtr)
        }

        return this.__IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
