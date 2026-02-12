#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies whether to use online or offline map data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapservicedatausagepreference
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapServiceDataUsagePreference extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * @type {Integer (Int32)}
     */
    static OfflineMapDataOnly => 1
}
