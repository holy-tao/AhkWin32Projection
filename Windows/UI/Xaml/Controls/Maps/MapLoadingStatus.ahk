#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the [LoadingStatus](mapcontrol_loadingstatus.md) of the [MapControl](mapcontrol.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maploadingstatus
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapLoadingStatus extends Win32Enum{

    /**
     * The map is loading.
     * @type {Integer (Int32)}
     */
    static Loading => 0

    /**
     * The map is loaded.
     * @type {Integer (Int32)}
     */
    static Loaded => 1

    /**
     * Map data is unavailable.
     * @type {Integer (Int32)}
     */
    static DataUnavailable => 2

    /**
     * Downloaded maps manager is unavailable
     * @type {Integer (Int32)}
     */
    static DownloadedMapsManagerUnavailable => 3
}
