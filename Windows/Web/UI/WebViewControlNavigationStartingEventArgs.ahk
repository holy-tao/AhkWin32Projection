#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlNavigationStartingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [NavigationStarting](iwebviewcontrol_navigationstarting.md) and [FrameNavigationStarting](iwebviewcontrol_framenavigationstarting.md) events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnavigationstartingeventargs
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlNavigationStartingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlNavigationStartingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlNavigationStartingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) of the content the [IWebViewControl](iwebviewcontrol.md) is loading.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnavigationstartingeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets or sets a value indicating whether to cancel the [IWebViewControl](iwebviewcontrol.md) navigation.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolnavigationstartingeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
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
        if (!this.HasProp("__IWebViewControlNavigationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNavigationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNavigationStartingEventArgs := IWebViewControlNavigationStartingEventArgs(outPtr)
        }

        return this.__IWebViewControlNavigationStartingEventArgs.get_Uri()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__IWebViewControlNavigationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNavigationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNavigationStartingEventArgs := IWebViewControlNavigationStartingEventArgs(outPtr)
        }

        return this.__IWebViewControlNavigationStartingEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__IWebViewControlNavigationStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlNavigationStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlNavigationStartingEventArgs := IWebViewControlNavigationStartingEventArgs(outPtr)
        }

        return this.__IWebViewControlNavigationStartingEventArgs.put_Cancel(value)
    }

;@endregion Instance Methods
}
