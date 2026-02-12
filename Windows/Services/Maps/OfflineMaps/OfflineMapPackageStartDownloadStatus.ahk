#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the status of an [OfflineMapPackageStartDownloadResult](offlinemappackagestartdownloadresult.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackagestartdownloadstatus
 * @namespace Windows.Services.Maps.OfflineMaps
 * @version WindowsRuntime 1.4
 */
class OfflineMapPackageStartDownloadStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * @type {Integer (Int32)}
     */
    static UnknownError => 1

    /**
     * @type {Integer (Int32)}
     */
    static InvalidCredentials => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeniedWithoutCapability => 3
}
