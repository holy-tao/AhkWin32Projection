#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the app install states that are returned by the InstallState property of the [AppInstallStatus](appinstallstatus.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallstate
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class AppInstallState extends Win32Enum{

    /**
     * The app install is pending.
     * @type {Integer (Int32)}
     */
    static Pending => 0

    /**
     * The app install is starting.
     * @type {Integer (Int32)}
     */
    static Starting => 1

    /**
     * The license is being acquired for the app.
     * @type {Integer (Int32)}
     */
    static AcquiringLicense => 2

    /**
     * The app is being downloaded.
     * @type {Integer (Int32)}
     */
    static Downloading => 3

    /**
     * The app data is being restored.
     * @type {Integer (Int32)}
     */
    static RestoringData => 4

    /**
     * The app is in the process of being installed.
     * @type {Integer (Int32)}
     */
    static Installing => 5

    /**
     * The app install is complete.
     * @type {Integer (Int32)}
     */
    static Completed => 6

    /**
     * The app install is canceled.
     * @type {Integer (Int32)}
     */
    static Canceled => 7

    /**
     * The app install was paused.
     * @type {Integer (Int32)}
     */
    static Paused => 8

    /**
     * The app install encountered an error.
     * @type {Integer (Int32)}
     */
    static Error => 9

    /**
     * The app install was paused because the battery is low.
     * @type {Integer (Int32)}
     */
    static PausedLowBattery => 10

    /**
     * The app install was paused because the app package was large enough to trigger a prompt for the user to download the app over Wi-Fi.
     * @type {Integer (Int32)}
     */
    static PausedWiFiRecommended => 11

    /**
     * The app install was paused because the app package was large enough to require the user to download the app over Wi-Fi.
     * @type {Integer (Int32)}
     */
    static PausedWiFiRequired => 12

    /**
     * The app is ready to download.
     * @type {Integer (Int32)}
     */
    static ReadyToDownload => 13
}
