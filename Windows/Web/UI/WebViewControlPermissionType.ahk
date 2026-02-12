#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants the specify the type of permission requested in a [IWebViewControl](iwebviewcontrol.md).
 * @remarks
 * This enumeration provides values for the [WebViewPermissionRequest.PermissionType](webviewcontrolpermissionrequest_permissiontype.md) and [WebViewDeferredPermissionRequest.PermissionType](webviewcontroldeferredpermissionrequest_permissiontype.md) properties.
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolpermissiontype
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlPermissionType extends Win32Enum{

    /**
     * Permission is for geolocation.
     * @type {Integer (Int32)}
     */
    static Geolocation => 0

    /**
     * Permission is for unlimited **IndexedDB** data storage.
     * @type {Integer (Int32)}
     */
    static UnlimitedIndexedDBQuota => 1

    /**
     * Permission is for media.
     * @type {Integer (Int32)}
     */
    static Media => 2

    /**
     * Permission is for pointer lock.
     * @type {Integer (Int32)}
     */
    static PointerLock => 3

    /**
     * Permission is for web notifications.
     * @type {Integer (Int32)}
     */
    static WebNotifications => 4

    /**
     * Permission is for screen.
     * @type {Integer (Int32)}
     */
    static Screen => 5

    /**
     * Permission is for the ImmersiveView.
     * @type {Integer (Int32)}
     */
    static ImmersiveView => 6
}
