#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewPermissionRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a request for permissions in a [WebView](webview.md).
 * @remarks
 * For more info, see the [WebView.PermissionRequested](webview_permissionrequested.md) event.
 * 
 * When you handle a permission request in a [WebView](webview.md), you get a WebViewPermissionRequest object as the value of the [WebViewPermissionRequestedEventArgs.PermissionRequest](webviewpermissionrequestedeventargs_permissionrequest.md) property. You can call [Allow](webviewpermissionrequest_allow_1592747266.md) to grant the request, [Deny](webviewpermissionrequest_deny_445869776.md) to deny the request, or [Defer](webviewpermissionrequest_defer_1945301616.md) to defer the request until a later time. For example, you might defer the request if you need to prompt the user for consent.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewpermissionrequest
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewPermissionRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewPermissionRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewPermissionRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) of the content where the permission request originated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewpermissionrequest.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets a value that indicates the type of permission that's requested.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewpermissionrequest.permissiontype
     * @type {Integer} 
     */
    PermissionType {
        get => this.get_PermissionType()
    }

    /**
     * Gets the identifier for the permission request.
     * @remarks
     * If you defer a permission request, save the Id to use later to retrieve the deferred request.
     * 
     * When a [WebViewPermissionRequest](webviewpermissionrequest.md) is deferred, a [WebViewDeferredPermissionRequest](webviewdeferredpermissionrequest.md) is created with the same Id and added to the [DeferredPermissionRequests](webview_deferredpermissionrequests.md) collection. When you are ready to act on the request, call the [DeferredPermissionRequestById](webview_deferredpermissionrequestbyid_219166912.md) method and pass the [Id](webviewdeferredpermissionrequest_id.md) of the deferred request.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewpermissionrequest.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the current state of the permission request.
     * @remarks
     * The default State value is **Unknown**. Calling the [Allow](webviewpermissionrequest_allow_1592747266.md), [Deny](webviewpermissionrequest_deny_445869776.md), or [Defer](webviewpermissionrequest_defer_1945301616.md) method sets the State property to the corresponding [WebViewPermissionState](webviewpermissionstate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewpermissionrequest.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
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
        if (!this.HasProp("__IWebViewPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewPermissionRequest := IWebViewPermissionRequest(outPtr)
        }

        return this.__IWebViewPermissionRequest.get_Uri()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermissionType() {
        if (!this.HasProp("__IWebViewPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewPermissionRequest := IWebViewPermissionRequest(outPtr)
        }

        return this.__IWebViewPermissionRequest.get_PermissionType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IWebViewPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewPermissionRequest := IWebViewPermissionRequest(outPtr)
        }

        return this.__IWebViewPermissionRequest.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IWebViewPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewPermissionRequest := IWebViewPermissionRequest(outPtr)
        }

        return this.__IWebViewPermissionRequest.get_State()
    }

    /**
     * Defers the permission request to be allowed or denied at a later time.
     * @remarks
     * When you defer a [WebViewPermissionRequest](webviewpermissionrequest.md), a new [WebViewDeferredPermissionRequest](webviewdeferredpermissionrequest.md) is created with the same [Id](webviewpermissionrequest_id.md) and added to the [DeferredPermissionRequests](webview_deferredpermissionrequests.md) collection. When you are ready to act on the request, call the [DeferredPermissionRequestById](webview_deferredpermissionrequestbyid_219166912.md) method and pass the [Id](webviewdeferredpermissionrequest_id.md) of the deferred request. After you retrieve the request, you can call the [Allow](webviewdeferredpermissionrequest_allow_1592747266.md) method to grant the request, or call the [Deny](webviewdeferredpermissionrequest_deny_445869776.md) method to deny the request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewpermissionrequest.defer
     */
    Defer() {
        if (!this.HasProp("__IWebViewPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewPermissionRequest := IWebViewPermissionRequest(outPtr)
        }

        return this.__IWebViewPermissionRequest.Defer()
    }

    /**
     * Grants the requested permission.
     * @remarks
     * When you allow the requested permission, subsequent calls to Allow, [Deny](webviewpermissionrequest_deny_445869776.md), or [Defer](webviewpermissionrequest_defer_1945301616.md) the permission request result in an error.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewpermissionrequest.allow
     */
    Allow() {
        if (!this.HasProp("__IWebViewPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewPermissionRequest := IWebViewPermissionRequest(outPtr)
        }

        return this.__IWebViewPermissionRequest.Allow()
    }

    /**
     * Denies the requested permission.
     * @remarks
     * When you deny the requested permission, subsequent calls to [Allow](webviewpermissionrequest_allow_1592747266.md), Deny, or [Defer](webviewpermissionrequest_defer_1945301616.md) the permission request result in an error.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewpermissionrequest.deny
     */
    Deny() {
        if (!this.HasProp("__IWebViewPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewPermissionRequest := IWebViewPermissionRequest(outPtr)
        }

        return this.__IWebViewPermissionRequest.Deny()
    }

;@endregion Instance Methods
}
