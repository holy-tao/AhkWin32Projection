#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlPermissionRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a request for permissions in a WebView.
 * @remarks
 * For more info, see the [IWebViewControl.PermissionRequested](C:\Users\misatran\Desktop\Clones\winrt-api\windows.web.ui\iwebviewcontrol_permissionrequested.md) event.
 * 
 * When you handle a permission request in an [IWebViewControl](iwebviewcontrol.md), you get a [WebViewControlPermissionRequest](webviewcontrolpermissionrequestedeventargs.md) object as the value of the [WebViewPermissionRequestedEventArgs.PermissionRequest](webviewcontrolpermissionrequestedeventargs_permissionrequest.md) property. You can call [Allow](webviewcontrolpermissionrequest_allow_1592747266.md) to grant the request, [Deny](webviewcontroldeferredpermissionrequest_deny_445869776.md) to deny the request, or [Defer](webviewcontrolpermissionrequest_defer_1945301616.md) to defer the request until a later time. For example, you might defer the request if you need to prompt the user for consent.
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolpermissionrequest
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlPermissionRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlPermissionRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlPermissionRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for the permission request.
     * @remarks
     * If you defer a permission request, save the Id to use later to retrieve the deferred request.
     * 
     * When a WebViewPermissionRequest is deferred, a WebViewDeferredPermissionRequest is created with the same **Id** and added to the [DeferredPermissionRequests](iwebviewcontrol_deferredpermissionrequests.md) collection. When you are ready to act on the request, call the [DeferredPermissionRequestById](iwebviewcontrol_getdeferredpermissionrequestbyid_614999640.md) method and pass the **Id** of the deferred request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolpermissionrequest.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) of the content where the permission request originated.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolpermissionrequest.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets a value that indicates the type of permission that's requested.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolpermissionrequest.permissiontype
     * @type {Integer} 
     */
    PermissionType {
        get => this.get_PermissionType()
    }

    /**
     * Gets the current state of the permission request.
     * @remarks
     * The default **State** value is **Unknown**. Calling the [Allow](webviewcontrolpermissionrequest_allow_1592747266.md), [Deny](webviewcontrolpermissionrequest_deny_445869776.md), or [Defer](webviewcontrolpermissionrequest_defer_1945301616.md) method sets the **State** property to the corresponding **WebViewPermissionState**.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolpermissionrequest.state
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
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IWebViewControlPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewControlPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlPermissionRequest := IWebViewControlPermissionRequest(outPtr)
        }

        return this.__IWebViewControlPermissionRequest.get_Id()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IWebViewControlPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewControlPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlPermissionRequest := IWebViewControlPermissionRequest(outPtr)
        }

        return this.__IWebViewControlPermissionRequest.get_Uri()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermissionType() {
        if (!this.HasProp("__IWebViewControlPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewControlPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlPermissionRequest := IWebViewControlPermissionRequest(outPtr)
        }

        return this.__IWebViewControlPermissionRequest.get_PermissionType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IWebViewControlPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewControlPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlPermissionRequest := IWebViewControlPermissionRequest(outPtr)
        }

        return this.__IWebViewControlPermissionRequest.get_State()
    }

    /**
     * Defers the permission request to be allowed or denied at a later time.
     * @remarks
     * When you defer a **WebViewPermissionRequest**, a new **WebViewDeferredPermissionRequest** is created with the same [Id](webviewcontrolpermissionrequest_id.md) and added to the [DeferredPermissionRequests](iwebviewcontrol_deferredpermissionrequests.md) collection. When you are ready to act on the request, call the [GetDeferredPermissionRequestById](iwebviewcontrol_getdeferredpermissionrequestbyid_614999640.md) method and pass the [Id](webviewcontrolpermissionrequest_id.md) of the deferred request. After you retrieve the request, you can call the [Allow](webviewcontrolpermissionrequest_allow_1592747266.md) method to grant the request, or call the [Deny](webviewcontrolpermissionrequest_deny_445869776.md) method to deny the request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolpermissionrequest.defer
     */
    Defer() {
        if (!this.HasProp("__IWebViewControlPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewControlPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlPermissionRequest := IWebViewControlPermissionRequest(outPtr)
        }

        return this.__IWebViewControlPermissionRequest.Defer()
    }

    /**
     * Grants the requested permission.
     * @remarks
     * When you allow the requested permission, subsequent calls to Allow, [Deny](webviewcontrolpermissionrequest_deny_445869776.md), or [Defer](webviewcontrolpermissionrequest_defer_1945301616.md) the permission request result in an error.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolpermissionrequest.allow
     */
    Allow() {
        if (!this.HasProp("__IWebViewControlPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewControlPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlPermissionRequest := IWebViewControlPermissionRequest(outPtr)
        }

        return this.__IWebViewControlPermissionRequest.Allow()
    }

    /**
     * Denies the requested permission.
     * @remarks
     * When you deny the requested permission, subsequent calls to [Allow](webviewcontrolpermissionrequest_allow_1592747266.md), Deny, or [Defer](webviewcontrolpermissionrequest_defer_1945301616.md) the permission request result in an error.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolpermissionrequest.deny
     */
    Deny() {
        if (!this.HasProp("__IWebViewControlPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewControlPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlPermissionRequest := IWebViewControlPermissionRequest(outPtr)
        }

        return this.__IWebViewControlPermissionRequest.Deny()
    }

;@endregion Instance Methods
}
