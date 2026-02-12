#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Displays the UI that lets users download maps for offline use, or update maps that were previously downloaded.
 * @remarks
 * > [!IMPORTANT]
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and Windows Maps platform APIs ([Windows.Services.Maps.*](../windows.services.maps/windows_services_maps.md)) are deprecated and may not be available in future versions of Windows. For more information, see [Resources for deprecated features](/windows/whats-new/deprecated-features-resources#windows-uwp-map-control-and-windows-maps-platform-apis).
 * 
 * > [!IMPORTANT]
 * > **Bing Maps for Enterprise service retirement**
 * >
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services from the [Windows.Services.Maps](windows_services_maps.md) namespaces rely on Bing Maps. Bing Maps for Enterprise is deprecated and will be retired, at which point the MapControl and services will no longer receive data.
 * >
 * > For more information, see the [Bing Maps Developer Center](https://www.bingmapsportal.com/) and [Bing Maps documentation](/bingmaps/getting-started/).
 * 
 * > [!NOTE]
 * > Offline map downloads stop whenever a [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) is used in any app that's running on the device.
 * 
 * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
 * 
 * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapmanager
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapManager extends IInspectable {
;@region Static Methods
    /**
     * Displays the UI that lets users download maps for offline use.
     * @remarks
     * > [!NOTE]
     * > Offline map downloads stop whenever a [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) is used in any app that's running on the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapmanager.showdownloadedmapsui
     */
    static ShowDownloadedMapsUI() {
        if (!MapManager.HasProp("__IMapManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapManagerStatics.IID)
            MapManager.__IMapManagerStatics := IMapManagerStatics(factoryPtr)
        }

        return MapManager.__IMapManagerStatics.ShowDownloadedMapsUI()
    }

    /**
     * Displays the UI that lets users update maps that were previously downloaded for offline use.
     * @remarks
     * See the remarks section of the [ShowDownloadedMapsUI](mapmanager_showdownloadedmapsui_1588128579.md) method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapmanager.showmapsupdateui
     */
    static ShowMapsUpdateUI() {
        if (!MapManager.HasProp("__IMapManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapManagerStatics.IID)
            MapManager.__IMapManagerStatics := IMapManagerStatics(factoryPtr)
        }

        return MapManager.__IMapManagerStatics.ShowMapsUpdateUI()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
