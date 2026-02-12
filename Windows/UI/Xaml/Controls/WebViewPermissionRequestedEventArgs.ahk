#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewPermissionRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [WebView.PermissionRequested](webview_permissionrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewpermissionrequestedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewPermissionRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewPermissionRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewPermissionRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [WebViewPermissionRequest](webviewpermissionrequest.md) object that contains information about the request.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewpermissionrequestedeventargs.permissionrequest
     * @type {WebViewPermissionRequest} 
     */
    PermissionRequest {
        get => this.get_PermissionRequest()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WebViewPermissionRequest} 
     */
    get_PermissionRequest() {
        if (!this.HasProp("__IWebViewPermissionRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewPermissionRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewPermissionRequestedEventArgs := IWebViewPermissionRequestedEventArgs(outPtr)
        }

        return this.__IWebViewPermissionRequestedEventArgs.get_PermissionRequest()
    }

;@endregion Instance Methods
}
