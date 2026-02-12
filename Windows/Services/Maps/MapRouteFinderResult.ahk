#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapRouteFinderResult.ahk
#Include .\IMapRouteFinderResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Returns the result of a [MapRouteFinder](maproutefinder.md) query.
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
 * A MapRouteFinderResult is returned when you call the methods of the [MapRouteFinder](maproutefinder.md) class.
 * 
 * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
 * 
 * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinderresult
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapRouteFinderResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapRouteFinderResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapRouteFinderResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the route found by a [MapRouteFinder](maproutefinder.md) query.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinderresult.route
     * @type {MapRoute} 
     */
    Route {
        get => this.get_Route()
    }

    /**
     * Gets the status of a [MapRouteFinder](maproutefinder.md) query.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinderresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets alternate routes between the same start and end points (if available).
     * @remarks
     * When [MaxAlternateRouteCount](maproutedrivingoptions_maxalternateroutecount.md) is set to 1 or greater, the [GetDrivingRouteAsync](maproutefinder_getdrivingrouteasync_1265171240.md) method will provide additional routes between the same start and end points (when available).
     * 
     * > [!NOTE]
     * > Some alternative routes may violate route restrictions. Use the [ViolatedRestrictions](maproute_violatedrestrictions.md) property to check for violations.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinderresult.alternateroutes
     * @type {IVectorView<MapRoute>} 
     */
    AlternateRoutes {
        get => this.get_AlternateRoutes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MapRoute} 
     */
    get_Route() {
        if (!this.HasProp("__IMapRouteFinderResult")) {
            if ((queryResult := this.QueryInterface(IMapRouteFinderResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteFinderResult := IMapRouteFinderResult(outPtr)
        }

        return this.__IMapRouteFinderResult.get_Route()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IMapRouteFinderResult")) {
            if ((queryResult := this.QueryInterface(IMapRouteFinderResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteFinderResult := IMapRouteFinderResult(outPtr)
        }

        return this.__IMapRouteFinderResult.get_Status()
    }

    /**
     * 
     * @returns {IVectorView<MapRoute>} 
     */
    get_AlternateRoutes() {
        if (!this.HasProp("__IMapRouteFinderResult2")) {
            if ((queryResult := this.QueryInterface(IMapRouteFinderResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteFinderResult2 := IMapRouteFinderResult2(outPtr)
        }

        return this.__IMapRouteFinderResult2.get_AlternateRoutes()
    }

;@endregion Instance Methods
}
