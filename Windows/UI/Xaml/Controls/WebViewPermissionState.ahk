#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the state of a [WebView.PermissionRequested](webview_permissionrequested.md) event.
 * @remarks
 * This enumeration provides values for the [WebViewPermissionRequest.State](webviewpermissionrequest_state.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewpermissionstate
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewPermissionState extends Win32Enum{

    /**
     * The state of the permission request can't be determined.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * [WebViewPermissionRequest.Defer](webviewpermissionrequest_defer_1945301616.md) was called. The permission request is deferred.
     * @type {Integer (Int32)}
     */
    static Defer => 1

    /**
     * [WebViewPermissionRequest.Allow](webviewpermissionrequest_allow_1592747266.md) was called. The permission request is allowed.
     * @type {Integer (Int32)}
     */
    static Allow => 2

    /**
     * [WebViewPermissionRequest.Deny](webviewpermissionrequest_deny_445869776.md) was called. The permission request is denied.
     * @type {Integer (Int32)}
     */
    static Deny => 3
}
