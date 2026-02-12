#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlNavigationCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [NavigationCompleted](iwebviewcontrol_navigationcompleted.md) and [FrameNavigationCompleted](iwebviewcontrol_framenavigationcompleted.md) events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnavigationcompletedeventargs
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlNavigationCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlNavigationCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlNavigationCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) of the [IWebViewControl](iwebviewcontrol.md) content.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnavigationcompletedeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets a value that indicates whether the navigation completed successfully.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnavigationcompletedeventargs.issuccess
     * @type {Boolean} 
     */
    IsSuccess {
        get => this.get_IsSuccess()
    }

    /**
     * If the navigation was unsuccessful, gets a value that indicates the reason.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnavigationcompletedeventargs.weberrorstatus
     * @type {Integer} 
     */
    WebErrorStatus {
        get => this.get_WebErrorStatus()
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
        if (!this.HasProp("__IWebViewControlNavigationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNavigationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNavigationCompletedEventArgs := IWebViewControlNavigationCompletedEventArgs(outPtr)
        }

        return this.__IWebViewControlNavigationCompletedEventArgs.get_Uri()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSuccess() {
        if (!this.HasProp("__IWebViewControlNavigationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNavigationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNavigationCompletedEventArgs := IWebViewControlNavigationCompletedEventArgs(outPtr)
        }

        return this.__IWebViewControlNavigationCompletedEventArgs.get_IsSuccess()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WebErrorStatus() {
        if (!this.HasProp("__IWebViewControlNavigationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNavigationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNavigationCompletedEventArgs := IWebViewControlNavigationCompletedEventArgs(outPtr)
        }

        return this.__IWebViewControlNavigationCompletedEventArgs.get_WebErrorStatus()
    }

;@endregion Instance Methods
}
