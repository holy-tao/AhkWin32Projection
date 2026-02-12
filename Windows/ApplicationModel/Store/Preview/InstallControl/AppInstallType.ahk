#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the different app install types that are returned by the [InstallType](appinstallitem_installtype.md) property of the [AppInstallItem](appinstallitem.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalltype
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class AppInstallType extends Win32Enum{

    /**
     * The app is being installed.
     * @type {Integer (Int32)}
     */
    static Install => 0

    /**
     * The app is being updated.
     * @type {Integer (Int32)}
     */
    static Update => 1

    /**
     * The app installation is being repaired.
     * @type {Integer (Int32)}
     */
    static Repair => 2
}
