#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlDOMContentLoadedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [DOMContentLoaded](iwebviewcontrol_domcontentloaded.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontroldomcontentloadedeventargs
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlDOMContentLoadedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlDOMContentLoadedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlDOMContentLoadedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) of the content the IWebView is loading.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontroldomcontentloadedeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
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
        if (!this.HasProp("__IWebViewControlDOMContentLoadedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlDOMContentLoadedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlDOMContentLoadedEventArgs := IWebViewControlDOMContentLoadedEventArgs(outPtr)
        }

        return this.__IWebViewControlDOMContentLoadedEventArgs.get_Uri()
    }

;@endregion Instance Methods
}
