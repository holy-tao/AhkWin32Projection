#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that can be used with the [LicenseManager.RefreshLicensesAsync](licensemanager_refreshlicensesasync_1595883359.md) method to specify which app licenses to refresh on the current device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.licensemanagement.licenserefreshoption
 * @namespace Windows.ApplicationModel.Store.LicenseManagement
 * @version WindowsRuntime 1.4
 */
class LicenseRefreshOption extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RunningLicenses => 0

    /**
     * @type {Integer (Int32)}
     */
    static AllLicenses => 1
}
