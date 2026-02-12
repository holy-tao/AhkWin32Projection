#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapRouteDrivingOptions.ahk
#Include .\IMapRouteDrivingOptions2.ahk
#Include ..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Represents advanced routing options.
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
 * MapRouteDrivingOptions allows you to specify advanced routing options when using the [GetDrivingRouteAsync](maproutefinder_getdrivingrouteasync_1265171240.md) method.
 * 
 * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
 * 
 * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutedrivingoptions
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapRouteDrivingOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapRouteDrivingOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapRouteDrivingOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates the maximum number of alternative routes that are to be provided, if available.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutedrivingoptions.maxalternateroutecount
     * @type {Integer} 
     */
    MaxAlternateRouteCount {
        get => this.get_MaxAlternateRouteCount()
        set => this.put_MaxAlternateRouteCount(value)
    }

    /**
     * Gets or sets the preferred start direction of the route from the current location in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutedrivingoptions.initialheading
     * @type {IReference<Float>} 
     */
    InitialHeading {
        get => this.get_InitialHeading()
        set => this.put_InitialHeading(value)
    }

    /**
     * Gets or sets the optimization applied to the route(s).
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutedrivingoptions.routeoptimization
     * @type {Integer} 
     */
    RouteOptimization {
        get => this.get_RouteOptimization()
        set => this.put_RouteOptimization(value)
    }

    /**
     * Gets or sets the restriction applied to the route(s).
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutedrivingoptions.routerestrictions
     * @type {Integer} 
     */
    RouteRestrictions {
        get => this.get_RouteRestrictions()
        set => this.put_RouteRestrictions(value)
    }

    /**
     * Gets or sets the date and time of the departure on a route.
     * @remarks
     * This option is useful in cases where you want to compute a route with the traffic conditions that are typical for the specified day and time.
     * 
     * > [!NOTE]
     * > Map packages that you download for offline use don’t contain traffic information.  Therefore, all routes that are calculated while in offline mode have the same duration regardless of the value of this property.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutedrivingoptions.departuretime
     * @type {IReference<DateTime>} 
     */
    DepartureTime {
        get => this.get_DepartureTime()
        set => this.put_DepartureTime(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapRouteDrivingOptions](maproutedrivingoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteDrivingOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxAlternateRouteCount() {
        if (!this.HasProp("__IMapRouteDrivingOptions")) {
            if ((queryResult := this.QueryInterface(IMapRouteDrivingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteDrivingOptions := IMapRouteDrivingOptions(outPtr)
        }

        return this.__IMapRouteDrivingOptions.get_MaxAlternateRouteCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxAlternateRouteCount(value) {
        if (!this.HasProp("__IMapRouteDrivingOptions")) {
            if ((queryResult := this.QueryInterface(IMapRouteDrivingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteDrivingOptions := IMapRouteDrivingOptions(outPtr)
        }

        return this.__IMapRouteDrivingOptions.put_MaxAlternateRouteCount(value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_InitialHeading() {
        if (!this.HasProp("__IMapRouteDrivingOptions")) {
            if ((queryResult := this.QueryInterface(IMapRouteDrivingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteDrivingOptions := IMapRouteDrivingOptions(outPtr)
        }

        return this.__IMapRouteDrivingOptions.get_InitialHeading()
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_InitialHeading(value) {
        if (!this.HasProp("__IMapRouteDrivingOptions")) {
            if ((queryResult := this.QueryInterface(IMapRouteDrivingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteDrivingOptions := IMapRouteDrivingOptions(outPtr)
        }

        return this.__IMapRouteDrivingOptions.put_InitialHeading(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RouteOptimization() {
        if (!this.HasProp("__IMapRouteDrivingOptions")) {
            if ((queryResult := this.QueryInterface(IMapRouteDrivingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteDrivingOptions := IMapRouteDrivingOptions(outPtr)
        }

        return this.__IMapRouteDrivingOptions.get_RouteOptimization()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RouteOptimization(value) {
        if (!this.HasProp("__IMapRouteDrivingOptions")) {
            if ((queryResult := this.QueryInterface(IMapRouteDrivingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteDrivingOptions := IMapRouteDrivingOptions(outPtr)
        }

        return this.__IMapRouteDrivingOptions.put_RouteOptimization(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RouteRestrictions() {
        if (!this.HasProp("__IMapRouteDrivingOptions")) {
            if ((queryResult := this.QueryInterface(IMapRouteDrivingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteDrivingOptions := IMapRouteDrivingOptions(outPtr)
        }

        return this.__IMapRouteDrivingOptions.get_RouteRestrictions()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RouteRestrictions(value) {
        if (!this.HasProp("__IMapRouteDrivingOptions")) {
            if ((queryResult := this.QueryInterface(IMapRouteDrivingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteDrivingOptions := IMapRouteDrivingOptions(outPtr)
        }

        return this.__IMapRouteDrivingOptions.put_RouteRestrictions(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_DepartureTime() {
        if (!this.HasProp("__IMapRouteDrivingOptions2")) {
            if ((queryResult := this.QueryInterface(IMapRouteDrivingOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteDrivingOptions2 := IMapRouteDrivingOptions2(outPtr)
        }

        return this.__IMapRouteDrivingOptions2.get_DepartureTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_DepartureTime(value) {
        if (!this.HasProp("__IMapRouteDrivingOptions2")) {
            if ((queryResult := this.QueryInterface(IMapRouteDrivingOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteDrivingOptions2 := IMapRouteDrivingOptions2(outPtr)
        }

        return this.__IMapRouteDrivingOptions2.put_DepartureTime(value)
    }

;@endregion Instance Methods
}
