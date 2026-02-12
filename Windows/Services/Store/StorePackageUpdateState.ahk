#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the state of a package download or installation request.
 * @remarks
 * To request the download or install of a package, use the [RequestDownloadAndInstallStorePackagesAsync](storecontext_requestdownloadandinstallstorepackagesasync_1733414901.md), [RequestDownloadAndInstallStorePackageUpdatesAsync](storecontext_requestdownloadandinstallstorepackageupdatesasync_1750789617.md), or [RequestDownloadStorePackageUpdatesAsync](storecontext_requestdownloadstorepackageupdatesasync_889669938.md) methods of the [StoreContext](storecontext.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackageupdatestate
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StorePackageUpdateState extends Win32Enum{

    /**
     * The download of the package updates has not started.
     * @type {Integer (Int32)}
     */
    static Pending => 0

    /**
     * The package updates are being downloaded.
     * @type {Integer (Int32)}
     */
    static Downloading => 1

    /**
     * The package updates are being deployed to the device.
     * @type {Integer (Int32)}
     */
    static Deploying => 2

    /**
     * The package updates have finished downloading or installing.
     * @type {Integer (Int32)}
     */
    static Completed => 3

    /**
     * The download or installation of the package updates was canceled.
     * @type {Integer (Int32)}
     */
    static Canceled => 4

    /**
     * An unknown error occurred.
     * @type {Integer (Int32)}
     */
    static OtherError => 5

    /**
     * The download or installation of the package updates did not succeed because the device does not have enough battery power.
     * @type {Integer (Int32)}
     */
    static ErrorLowBattery => 6

    /**
     * The download did not succeed because a Wi-Fi connection is recommended to download the package updates.
     * @type {Integer (Int32)}
     */
    static ErrorWiFiRecommended => 7

    /**
     * The download did not succeed because a Wi-Fi connection is required to download the package updates.
     * @type {Integer (Int32)}
     */
    static ErrorWiFiRequired => 8
}
