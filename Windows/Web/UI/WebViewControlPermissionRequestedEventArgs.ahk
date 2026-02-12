#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlPermissionRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event data for the [IWebViewControl.PermissionRequested](iwebviewcontrol_permissionrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolpermissionrequestedeventargs
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlPermissionRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlPermissionRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlPermissionRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [WebViewControlPermissionRequest](webviewcontrolpermissionrequest.md) object that contains information about the request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolpermissionrequestedeventargs.permissionrequest
     * @type {WebViewControlPermissionRequest} 
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
     * @returns {WebViewControlPermissionRequest} 
     */
    get_PermissionRequest() {
        if (!this.HasProp("__IWebViewControlPermissionRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewControlPermissionRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlPermissionRequestedEventArgs := IWebViewControlPermissionRequestedEventArgs(outPtr)
        }

        return this.__IWebViewControlPermissionRequestedEventArgs.get_PermissionRequest()
    }

;@endregion Instance Methods
}
