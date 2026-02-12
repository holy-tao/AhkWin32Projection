#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that represent extended state info for a new or updated package that is in the download and installation queue for the current app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitemextendedstate
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreQueueItemExtendedState extends Win32Enum{

    /**
     * The download and install of the package is pending.
     * @type {Integer (Int32)}
     */
    static ActivePending => 0

    /**
     * The download and install of the package is starting.
     * @type {Integer (Int32)}
     */
    static ActiveStarting => 1

    /**
     * The package is acquiring a license.
     * @type {Integer (Int32)}
     */
    static ActiveAcquiringLicense => 2

    /**
     * The package is being downloaded.
     * @type {Integer (Int32)}
     */
    static ActiveDownloading => 3

    /**
     * The package is restoring data.
     * @type {Integer (Int32)}
     */
    static ActiveRestoringData => 4

    /**
     * The package is being installed.
     * @type {Integer (Int32)}
     */
    static ActiveInstalling => 5

    /**
     * The download and install of the package completed.
     * @type {Integer (Int32)}
     */
    static Completed => 6

    /**
     * The download or install of the package was canceled.
     * @type {Integer (Int32)}
     */
    static Canceled => 7

    /**
     * The download or install of the package was paused.
     * @type {Integer (Int32)}
     */
    static Paused => 8

    /**
     * The download or install of the package encountered an error.
     * @type {Integer (Int32)}
     */
    static Error => 9

    /**
     * The installation of the package was paused because the app is already using the related packages.
     * @type {Integer (Int32)}
     */
    static PausedPackagesInUse => 10

    /**
     * The download or install of the package was paused because of insufficient battery power.
     * @type {Integer (Int32)}
     */
    static PausedLowBattery => 11

    /**
     * The download of the package was paused because a Wi-Fi connection is recommended.
     * @type {Integer (Int32)}
     */
    static PausedWiFiRecommended => 12

    /**
     * The download of the package was paused because it requires a Wi-Fi connection.
     * @type {Integer (Int32)}
     */
    static PausedWiFiRequired => 13

    /**
     * The package is paused but ready to install.
     * @type {Integer (Int32)}
     */
    static PausedReadyToInstall => 14
}
