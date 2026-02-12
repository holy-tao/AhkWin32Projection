#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewDeferredPermissionRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a deferred request for permissions in a [WebView](webview.md).
 * @remarks
 * For more info, see the [WebView.PermissionRequested](webview_permissionrequested.md) event.
 * 
 * When a [WebViewPermissionRequest](webviewpermissionrequest.md) is deferred, a WebViewDeferredPermissionRequest is created with the same [Id](webviewpermissionrequest_id.md) and added to the [DeferredPermissionRequests](webview_deferredpermissionrequests.md) collection. When you are ready to act on the request, call the [DeferredPermissionRequestById](webview_deferredpermissionrequestbyid_219166912.md) method and pass the [Id](webviewdeferredpermissionrequest_id.md) of the deferred request. After you retrieve the request, you can call the [Allow](webviewdeferredpermissionrequest_allow_1592747266.md) method to grant the request, or call the [Deny](webviewdeferredpermissionrequest_deny_445869776.md) method to deny the request.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewdeferredpermissionrequest
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewDeferredPermissionRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewDeferredPermissionRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewDeferredPermissionRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) of the content where the permission request originated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewdeferredpermissionrequest.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets a value that indicates the type of permission that's requested.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewdeferredpermissionrequest.permissiontype
     * @type {Integer} 
     */
    PermissionType {
        get => this.get_PermissionType()
    }

    /**
     * Gets the identifier for the permission request.
     * @remarks
     * When a [WebViewPermissionRequest](webviewpermissionrequest.md) is deferred, a [WebViewDeferredPermissionRequest](webviewdeferredpermissionrequest.md) is created with the same [Id](webviewpermissionrequest_id.md) and added to the [DeferredPermissionRequests](webview_deferredpermissionrequests.md) collection. When you are ready to act on the request, call the [DeferredPermissionRequestById](webview_deferredpermissionrequestbyid_219166912.md) method and pass the Id of the deferred request.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewdeferredpermissionrequest.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
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
        if (!this.HasProp("__IWebViewDeferredPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewDeferredPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewDeferredPermissionRequest := IWebViewDeferredPermissionRequest(outPtr)
        }

        return this.__IWebViewDeferredPermissionRequest.get_Uri()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermissionType() {
        if (!this.HasProp("__IWebViewDeferredPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewDeferredPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewDeferredPermissionRequest := IWebViewDeferredPermissionRequest(outPtr)
        }

        return this.__IWebViewDeferredPermissionRequest.get_PermissionType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IWebViewDeferredPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewDeferredPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewDeferredPermissionRequest := IWebViewDeferredPermissionRequest(outPtr)
        }

        return this.__IWebViewDeferredPermissionRequest.get_Id()
    }

    /**
     * Grants the requested permission.
     * @remarks
     * When you allow the requested permission, subsequent calls to Allow or [Deny](webviewdeferredpermissionrequest_deny_445869776.md) the permission request result in an error.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewdeferredpermissionrequest.allow
     */
    Allow() {
        if (!this.HasProp("__IWebViewDeferredPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewDeferredPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewDeferredPermissionRequest := IWebViewDeferredPermissionRequest(outPtr)
        }

        return this.__IWebViewDeferredPermissionRequest.Allow()
    }

    /**
     * Denies the requested permission.
     * @remarks
     * When you deny the requested permission, subsequent calls to [Allow](webviewdeferredpermissionrequest_allow_1592747266.md) or Deny the permission request result in an error.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewdeferredpermissionrequest.deny
     */
    Deny() {
        if (!this.HasProp("__IWebViewDeferredPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewDeferredPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewDeferredPermissionRequest := IWebViewDeferredPermissionRequest(outPtr)
        }

        return this.__IWebViewDeferredPermissionRequest.Deny()
    }

;@endregion Instance Methods
}
