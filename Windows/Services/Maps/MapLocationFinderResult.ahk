#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapLocationFinderResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Returns the result of a [MapLocationFinder](maplocationfinder.md) query.
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
 * A MapLocationFinderResult is returned when you call the methods of the [MapLocationFinder](maplocationfinder.md) class.
 * 
 * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
 * 
 * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocationfinderresult
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapLocationFinderResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapLocationFinderResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapLocationFinderResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of locations found by a [MapLocationFinder](maplocationfinder.md) query.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocationfinderresult.locations
     * @type {IVectorView<MapLocation>} 
     */
    Locations {
        get => this.get_Locations()
    }

    /**
     * Gets the status of a [MapLocationFinder](maplocationfinder.md) query.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocationfinderresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<MapLocation>} 
     */
    get_Locations() {
        if (!this.HasProp("__IMapLocationFinderResult")) {
            if ((queryResult := this.QueryInterface(IMapLocationFinderResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapLocationFinderResult := IMapLocationFinderResult(outPtr)
        }

        return this.__IMapLocationFinderResult.get_Locations()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IMapLocationFinderResult")) {
            if ((queryResult := this.QueryInterface(IMapLocationFinderResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapLocationFinderResult := IMapLocationFinderResult(outPtr)
        }

        return this.__IMapLocationFinderResult.get_Status()
    }

;@endregion Instance Methods
}
