#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapServiceStatics.ahk
#Include .\IMapServiceStatics3.ahk
#Include .\IMapServiceStatics2.ahk
#Include .\IMapServiceStatics4.ahk
#Include ..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Communicates with the online map services.
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
 * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
 * 
 * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapservice
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapService extends IInspectable {
;@region Static Properties
    /**
     * [Deprecated - see Remarks.] Gets or sets the application ID and the authentication token required for use of the online mapping services.
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
     * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
     * 
     * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapservice.servicetoken
     * @type {HSTRING} 
     */
    static ServiceToken {
        get => MapService.get_ServiceToken()
        set => MapService.put_ServiceToken(value)
    }

    /**
     * Gets the data provider for the mapping services.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapservice.dataattributions
     * @type {HSTRING} 
     */
    static DataAttributions {
        get => MapService.get_DataAttributions()
    }

    /**
     * Gets the three digit country code used by the Map service, based on the ISO 3166-1 alpha-3 codes.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapservice.worldviewregioncode
     * @type {HSTRING} 
     */
    static WorldViewRegionCode {
        get => MapService.get_WorldViewRegionCode()
    }

    /**
     * Gets or sets an object that specifies whether to use offline or online map data.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapservice.datausagepreference
     * @type {Integer} 
     */
    static DataUsagePreference {
        get => MapService.get_DataUsagePreference()
        set => MapService.put_DataUsagePreference(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    static put_ServiceToken(value) {
        if (!MapService.HasProp("__IMapServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapServiceStatics.IID)
            MapService.__IMapServiceStatics := IMapServiceStatics(factoryPtr)
        }

        return MapService.__IMapServiceStatics.put_ServiceToken(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ServiceToken() {
        if (!MapService.HasProp("__IMapServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapServiceStatics.IID)
            MapService.__IMapServiceStatics := IMapServiceStatics(factoryPtr)
        }

        return MapService.__IMapServiceStatics.get_ServiceToken()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DataAttributions() {
        if (!MapService.HasProp("__IMapServiceStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapServiceStatics3.IID)
            MapService.__IMapServiceStatics3 := IMapServiceStatics3(factoryPtr)
        }

        return MapService.__IMapServiceStatics3.get_DataAttributions()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_WorldViewRegionCode() {
        if (!MapService.HasProp("__IMapServiceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapServiceStatics2.IID)
            MapService.__IMapServiceStatics2 := IMapServiceStatics2(factoryPtr)
        }

        return MapService.__IMapServiceStatics2.get_WorldViewRegionCode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    static put_DataUsagePreference(value) {
        if (!MapService.HasProp("__IMapServiceStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapServiceStatics4.IID)
            MapService.__IMapServiceStatics4 := IMapServiceStatics4(factoryPtr)
        }

        return MapService.__IMapServiceStatics4.put_DataUsagePreference(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_DataUsagePreference() {
        if (!MapService.HasProp("__IMapServiceStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapServiceStatics4.IID)
            MapService.__IMapServiceStatics4 := IMapServiceStatics4(factoryPtr)
        }

        return MapService.__IMapServiceStatics4.get_DataUsagePreference()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
