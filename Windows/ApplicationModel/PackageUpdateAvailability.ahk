#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * An enum that indicates if an application has an update, and if the update is required.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageupdateavailability
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageUpdateAvailability extends Win32Enum{

    /**
     * This value is returned when this function is called on a package that does not have an AppInstaller file association.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * This value is returned when no updates are available for the application.
     * @type {Integer (Int32)}
     */
    static NoUpdates => 1

    /**
     * This value is returned when an update for the application is available, and the update is not required.
     * @type {Integer (Int32)}
     */
    static Available => 2

    /**
     * This value is returned when an update for the application is available, and the update is required.
     * @type {Integer (Int32)}
     */
    static Required => 3

    /**
     * This value is returned when an error is encountered.
     * @type {Integer (Int32)}
     */
    static Error => 4
}
