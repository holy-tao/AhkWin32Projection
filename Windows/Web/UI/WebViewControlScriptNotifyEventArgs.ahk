#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlScriptNotifyEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information for the [Windows.Web.UI.IWebViewControl.ScriptNotify](iwebviewcontrol_scriptnotify.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolscriptnotifyeventargs
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlScriptNotifyEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlScriptNotifyEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlScriptNotifyEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uri that originated the ScriptNotify.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolscriptnotifyeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets the string value passed to the app.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolscriptnotifyeventargs.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
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
        if (!this.HasProp("__IWebViewControlScriptNotifyEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlScriptNotifyEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlScriptNotifyEventArgs := IWebViewControlScriptNotifyEventArgs(outPtr)
        }

        return this.__IWebViewControlScriptNotifyEventArgs.get_Uri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IWebViewControlScriptNotifyEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlScriptNotifyEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlScriptNotifyEventArgs := IWebViewControlScriptNotifyEventArgs(outPtr)
        }

        return this.__IWebViewControlScriptNotifyEventArgs.get_Value()
    }

;@endregion Instance Methods
}
