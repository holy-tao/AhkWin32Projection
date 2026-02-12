#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlMoveFocusRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class contains information for the [Windows.Web.UI.Interop.WebViewControl.MoveFocusRequested](webviewcontrol_movefocusrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolmovefocusrequestedeventargs
 * @namespace Windows.Web.UI.Interop
 * @version WindowsRuntime 1.4
 */
class WebViewControlMoveFocusRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlMoveFocusRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlMoveFocusRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the move focus reason.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.interop.webviewcontrolmovefocusrequestedeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
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
    get_Reason() {
        if (!this.HasProp("__IWebViewControlMoveFocusRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlMoveFocusRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlMoveFocusRequestedEventArgs := IWebViewControlMoveFocusRequestedEventArgs(outPtr)
        }

        return this.__IWebViewControlMoveFocusRequestedEventArgs.get_Reason()
    }

;@endregion Instance Methods
}
