#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the state of a [IWebViewControl.PermissionRequested](iwebviewcontrol_permissionrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolpermissionstate
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlPermissionState extends Win32Enum{

    /**
     * The state of the permission request can't be determined.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * [WebViewPermissionRequest.Defer](webviewcontrolpermissionrequest_defer_1945301616.md) was called. The permission request is deferred.
     * @type {Integer (Int32)}
     */
    static Defer => 1

    /**
     * [WebViewPermissionRequest.Allow](webviewcontrolpermissionrequest_allow_1592747266.md) was called. The permission request is allowed.
     * @type {Integer (Int32)}
     */
    static Allow => 2

    /**
     * [WebViewPermissionRequest.Deny](webviewcontrolpermissionrequest_deny_445869776.md) was called. The permission request is denied.
     * @type {Integer (Int32)}
     */
    static Deny => 3
}
