#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the status of a [OfflineMapPackageQueryResult](offlinemappackagequeryresult.md).
 * @remarks
 * You can query your system for map data by using the [FindPackagesAsync](offlinemappackage_findpackagesasync_1312242741.md), [FindPackagesInBoundingBoxAsync](offlinemappackage_findpackagesinboundingboxasync_121221617.md), and [FindPackagesInGeocircleAsync](offlinemappackage_findpackagesingeocircleasync_917543629.md) methods.
 * 
 * Use the [Status](offlinemappackagequeryresult_status.md) property of the resulting query result to obtain of the enumeration values described in this topic.
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackagequerystatus
 * @namespace Windows.Services.Maps.OfflineMaps
 * @version WindowsRuntime 1.4
 */
class OfflineMapPackageQueryStatus extends Win32Enum{

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
    static NetworkFailure => 3
}
