#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible results of a request to grant a free entitlement by using the [GetFreeDeviceEntitlementAsync](appinstallmanager_getfreedeviceentitlementasync_1427505322.md), [GetFreeUserEntitlementAsync](appinstallmanager_getfreeuserentitlementasync_107347343.md), or [GetFreeUserEntitlementForUserAsync](appinstallmanager_getfreeuserentitlementforuserasync_376670896.md) methods.
 * @remarks
 * The [GetEntitlementResult.Status](getentitlementresult_status.md) property returns one of the **GetEntitlementStatus** values.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.getentitlementstatus
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class GetEntitlementStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * @type {Integer (Int32)}
     */
    static NoStoreAccount => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetworkError => 2

    /**
     * @type {Integer (Int32)}
     */
    static ServerError => 3
}
