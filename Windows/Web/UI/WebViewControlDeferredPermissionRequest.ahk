#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlDeferredPermissionRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a deferred request for permissions in an [IWebViewControl](iwebviewcontrol.md).
 * @remarks
 * For more info, see the [IWebViewControl.PermissionRequested](iwebviewcontrol_permissionrequested.md) event.
 * 
 * When a [WebViewPermissionRequest](webviewcontrolpermissionrequest.md) is deferred, a **WebViewDeferredPermissionRequest** is created with the same Id and added to the [DeferredPermissionRequests](iwebviewcontrol_deferredpermissionrequests.md) collection. When you are ready to act on the request, call the [DeferredPermissionRequestById](iwebviewcontrol_getdeferredpermissionrequestbyid_614999640.md) method and pass the Id of the deferred request. After you retrieve the request, you can call the Allow method to grant the request, or call the Deny method to deny the request.
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontroldeferredpermissionrequest
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlDeferredPermissionRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlDeferredPermissionRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlDeferredPermissionRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for the permission request.
     * @remarks
     * When a [WebViewPermissionRequest](webviewcontrolpermissionrequest.md) is deferred, a **WebViewDeferredPermissionRequest** is created with the same Id and added to the [DeferredPermissionRequests](iwebviewcontrol_deferredpermissionrequests.md) collection. When you are ready to act on the request, call the [DeferredPermissionRequestById](iwebviewcontrol_getdeferredpermissionrequestbyid_614999640.md) method and pass the Id of the deferred request.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontroldeferredpermissionrequest.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) of the content where the permission request originated.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontroldeferredpermissionrequest.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets a value that indicates the type of permission that's requested.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontroldeferredpermissionrequest.permissiontype
     * @type {Integer} 
     */
    PermissionType {
        get => this.get_PermissionType()
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
        if (!this.HasProp("__IWebViewControlDeferredPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewControlDeferredPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlDeferredPermissionRequest := IWebViewControlDeferredPermissionRequest(outPtr)
        }

        return this.__IWebViewControlDeferredPermissionRequest.get_Id()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IWebViewControlDeferredPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewControlDeferredPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlDeferredPermissionRequest := IWebViewControlDeferredPermissionRequest(outPtr)
        }

        return this.__IWebViewControlDeferredPermissionRequest.get_Uri()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermissionType() {
        if (!this.HasProp("__IWebViewControlDeferredPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewControlDeferredPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlDeferredPermissionRequest := IWebViewControlDeferredPermissionRequest(outPtr)
        }

        return this.__IWebViewControlDeferredPermissionRequest.get_PermissionType()
    }

    /**
     * Grants the requested permission.
     * @remarks
     * When you allow the requested permission, subsequent calls to **Allow** or [Deny](webviewcontroldeferredpermissionrequest_deny_445869776.md) the permission request result in an error.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontroldeferredpermissionrequest.allow
     */
    Allow() {
        if (!this.HasProp("__IWebViewControlDeferredPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewControlDeferredPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlDeferredPermissionRequest := IWebViewControlDeferredPermissionRequest(outPtr)
        }

        return this.__IWebViewControlDeferredPermissionRequest.Allow()
    }

    /**
     * Denies the requested permission.
     * @remarks
     * When you allow the requested permission, subsequent calls to **Allow** or Deny the permission request result in an error.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontroldeferredpermissionrequest.deny
     */
    Deny() {
        if (!this.HasProp("__IWebViewControlDeferredPermissionRequest")) {
            if ((queryResult := this.QueryInterface(IWebViewControlDeferredPermissionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlDeferredPermissionRequest := IWebViewControlDeferredPermissionRequest(outPtr)
        }

        return this.__IWebViewControlDeferredPermissionRequest.Deny()
    }

;@endregion Instance Methods
}
