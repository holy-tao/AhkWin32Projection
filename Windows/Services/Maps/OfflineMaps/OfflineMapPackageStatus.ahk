#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the status of a [OfflineMapPackage](offlinemappackage.md).
 * @remarks
 * You can download map packages for offline use by using the [RequestStartDownloadAsync](offlinemappackage_requeststartdownloadasync_735451469.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackagestatus
 * @namespace Windows.Services.Maps.OfflineMaps
 * @version WindowsRuntime 1.4
 */
class OfflineMapPackageStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NotDownloaded => 0

    /**
     * @type {Integer (Int32)}
     */
    static Downloading => 1

    /**
     * @type {Integer (Int32)}
     */
    static Downloaded => 2

    /**
     * @type {Integer (Int32)}
     */
    static Deleting => 3
}
